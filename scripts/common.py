import datetime
import functools
import hashlib
import json
import os
import pathlib
import sys
from pathlib import Path
from typing import Any
import zipfile

import requests
import yaml
import bs4

os.chdir(os.path.join(os.path.dirname(__file__), ".."))

sys.path.append("Archipelago")
sys.path.append("Archipelago/lib")
import ModuleUpdate  # noqa: E402

ModuleUpdate.update(yes=True)

from worlds.Files import InvalidDataError  # noqa: E402
from worlds.apworld_manager.world_manager import ApWorldMetadata, GithubRepository, RemoteWorldSource, RepositoryManager, parse_version, Repository  # noqa: E402
from worlds.apworld_manager._vendor.packaging.version import InvalidVersion, Version  # noqa: E402
from worlds.apworld_manager.container import RepoWorldContainer  # noqa: E402

index = pathlib.Path("index")

repositories = RepositoryManager()

skip_config = yaml.safe_load(pathlib.Path("scripts", "skipped_filenames.yaml").read_text())
bad_names = skip_config.get("skipped_filenames", [])
bad_repos = skip_config.get("skipped_repos", [])


class NoWorldsFound(Exception):
    pass


@functools.cache
def latest_ap_release() -> datetime.datetime:
    repo = get_or_add_github_repo("https://github.com/ArchipelagoMW/Archipelago")
    repo.refresh()
    return max(datetime.datetime.fromisoformat(release["published_at"]) for release in repo.release_json)


def update_index_from_github(file_path: Path | None, manifest: dict, github_url: str | list, default_flags: dict | None = None) -> dict[str, dict]:
    world_id = ""
    manifests: dict[str, dict] = {}
    if isinstance(github_url, list):
        for url in github_url:
            manifests.update(update_index_from_github(file_path, manifest, url, default_flags))
        return manifests

    if github_url in bad_repos:
        print(f"Skipping known bad repo: {github_url}")
        return manifests

    if manifest and file_path:
        world_id = file_path.stem
        manifests[world_id] = manifest

    repo = get_or_add_github_repo(github_url)
    if isinstance(repo, GithubRepository):
        new_github_url = repo.html_url or repo.url
        if new_github_url and new_github_url != github_url:
            manifest_url = manifest.get("github", None)
            if isinstance(manifest_url, str):
                manifest["github"] = new_github_url
            elif isinstance(manifest_url, list):
                manifest["github"] = [new_github_url if u == github_url else u for u in manifest_url]

    for world in repo.worlds:
        repositories.all_known_package_ids.add(world.id)
        repositories.packages_by_id_version[world.id][world.world_version] = world

    if file_path and world_id not in repositories.all_known_package_ids:
        releases = []
        if not manifest.get("versions") or not repo.worlds:
            raise NoWorldsFound(f"{world_id}.apworld not found in {github_url}")
    elif file_path:
        releases = repositories.packages_by_id_version.get(world_id).values()
    else:
        releases = repo.worlds

    for release in releases:
        if release.id in bad_names:
            print(f"Skipping known bad world name: {release.id}")
            continue

        source_url = release.source_url
        if source_url and repo.url and source_url != repo.url:
            continue
        manifest = manifests.setdefault(release.id, None)
        if not manifest:
            file_path = index / f"{release.id}.json"
            manifest = load_manifest(file_path, github_url, default_flags)
            manifests[release.id] = manifest
        if manifest.get("supported", False):
            if datetime.datetime.fromisoformat(release.created_at) < latest_ap_release() - datetime.timedelta(days=365):
                if release.world_version in manifest.get("versions", {}):
                    del manifest["versions"][release.world_version]
                continue
        version_info: dict = manifest.setdefault("versions", {}).setdefault(release.world_version, {})
        revision = 1
        raw_version = release.world_version
        while version_info.get("size", 0) and version_info.get("size", 0) != release.data.get("size", 0):
            revision += 1
            release.data["metadata"]["world_version"] = f"{raw_version}r{revision}"
            version_info = manifest.setdefault("versions", {}).setdefault(release.world_version, {})
            if not version_info:
                print(f"{release.id} {release.world_version} was replaced in place")

        prefer_version_from_title = manifest.get("prefer_version_from_title", False)
        version_number = parse_version_from_release(release, raw_version, prefer_version_from_title)
        if revision > 1:
            version_number = Version(f"{version_number.base_version}r{revision}")

        version_info.update(
            {
                "title": release.data["metadata"].get("title", ""),
                "download_url": release.download_url,
                "source_url": release.source_url,
                "description": release.data["metadata"].get("description"),
                "html_url": release.data["metadata"].get("html_url"),
            }
        )
        if "prerelease" in release.data["metadata"]:
            version_info["prerelease"] = release.data["metadata"]["prerelease"]
        data = {  # only update these if they are not already set
            "size": release.data.get("size", 0),
            "tag": release.world_version,
            "world_version": str(version_number),
            "version_simple": version_number.base_version,
            "created_at": release.created_at,
        }
        for key in data:
            if key not in version_info:
                version_info[key] = data[key]

        if "lib_file" in manifest:
            lib_file = release.data.get("other_assets", {}).get(manifest["lib_file"])
            if lib_file:
                version_info["lib_file"] = lib_file["browser_download_url"]

        download_and_hash_manifest(manifest, default_flags, manifests, release)

    if not manifest:
        return manifests

    save_manifests(github_url, manifests)
    return manifests


def cleanup_manifest(manifest):
    if "id" in manifest:
        del manifest["id"]
    if "metadata" in manifest:
        del manifest["metadata"]
    if "world" in manifest:
        del manifest["world"]
    if "_manifest_fields" in manifest:
        manifest["manifest_fields"] = manifest["_manifest_fields"]
        del manifest["_manifest_fields"]

    if "tags" in manifest:
        # common typo
        manifest["flags"] = manifest.get("flags", []) + manifest.pop("tags")
        del manifest["tags"]

    if isinstance(manifest.get("flags", []), dict):
        manifest["flags"] = [flag for flag, enabled in manifest["flags"].items() if enabled]
    elif isinstance(manifest.get("flags", []), str):
        manifest["flags"] = manifest["flags"].split(",")


def save_manifests(github_url, manifests):
    for name, manifest in manifests.items():
        cleanup_manifest(manifest)
        if github_url:
            check_manifest_has_github_url(manifest, github_url, name)

        file_path = index / f"{name}.yaml"
        if file_path.exists():
            file_path.unlink()
        file_path = index / f"{name}.json"
        save(file_path, manifest)


def download_and_hash_manifest(manifest: dict[str, Any], default_flags: dict | None, manifests: dict[str, dict], release: ApWorldMetadata) -> None:
    tag_version = release.world_version
    version_info = manifest["versions"][tag_version]
    should_download = "hash_sha256" not in version_info
    if "has_manifest" not in version_info:
        should_download = True
    if "manifest_fields" not in manifest:
        should_download = True

    if should_download:
        print(f"Downloading and hashing {release.download_url}")
        try:
            file = repositories.download_remote_world(release, False)
        except requests.exceptions.HTTPError as e:
            print(f"Failed to download {release.download_url}: {e}")
            if e.response.status_code == 404:
                if tag_version in manifest.get("versions", {}):
                    del manifest["versions"][tag_version]
                    return
            raise
        with open(file, "rb") as f:
            hash = hashlib.sha256(f.read()).hexdigest()
        version_info["hash_sha256"] = hash
        container = RepoWorldContainer(file)
        with zipfile.ZipFile(file, "r") as zf:
            directories = [f.name for f in zipfile.Path(zf).iterdir() if f.is_dir()]
            if len(directories) == 1 and directories[0] in file:
                module_name = directories[0]
                if module_name != release.id:
                    print(f"Module name {module_name} does not match expected {release.id}")
                    del manifests[release.id]
                    release.data["metadata"]["id"] = module_name
                    real_manifest = manifests.get(module_name, None) or load_manifest(index / f"{module_name}.json", "", default_flags)
                    if real_manifest.setdefault("versions", {}).get(tag_version):
                        return
                    real_manifest["versions"][tag_version] = manifest["versions"][tag_version]
                    manifest = real_manifest
                    if module_name not in manifests:
                        manifests[module_name] = real_manifest

        try:
            container.read()
            version_info["has_manifest"] = True
        except InvalidDataError:
            version_info["has_manifest"] = False
        manifest_data = container.get_manifest()
        for key in ("minimum_ap_version", "maximum_ap_version", "world_version"):
            if key in manifest_data:
                if key == "world_version":
                    embedded_version = parse_version(manifest_data[key])
                    version_info["version_simple"] = embedded_version.base_version
                    # Only replace the version if the interpreted version is wrong
                    if embedded_version.base_version.split(".")[:3] != parse_version(version_info["world_version"]).base_version.split(".")[:3]:
                        version_info[key] = manifest_data[key]
                else:
                    version_info[key] = manifest_data[key]

        if "tracker" in manifest_data:
            manifest["tracker"] = manifest_data["tracker"]
        if "flags" in manifest_data:
            manifest["flags"] = manifest_data["flags"]
        if "igdb_id" in manifest_data:
            manifest["igdb_id"] = manifest_data["igdb_id"]
        if "authors" in manifest_data:
            manifest["authors"] = manifest_data["authors"]
        manifest["manifest_fields"] = sorted(set(manifest_data.keys()) - {"compatible_version", "version", "game"})  # We only care about optional fields


def update_index_from_changelog(file_path: Path | None, manifest: dict, changelog: str) -> dict[str, dict]:
    manifests: dict[str, dict] = {}
    world_id = file_path.stem if file_path else ""
    if manifest and world_id:
        manifests[world_id] = manifest
    response = requests.get(changelog)
    response.raise_for_status()
    soup = bs4.BeautifulSoup(response.text, "html.parser")
    links = soup.find_all("a", href=True)
    worlds = [link for link in links if link["href"].endswith(".apworld")]
    for world_link in worlds:
        apworld_url = world_link["href"]
        world_id = pathlib.Path(apworld_url).stem
        manifest = manifests.setdefault(world_id, {})
        versions = manifest.setdefault("versions", {})
        # The tag is one directory up from the .apworld file
        tag = pathlib.Path(apworld_url).parent.name
        v = parse_version(tag)
        version_str = str(v)
        if version_str not in versions:
            versions[version_str] = {
                "download_url": apworld_url,
                "world_version": version_str,
                "source_url": changelog,
                "size": 0,
                "tag": tag,
                "created_at": datetime.datetime.now(tz=datetime.UTC).isoformat(),
            }

        release = construct_metadata_release(world_id, manifest, versions[version_str])
        download_and_hash_manifest(manifest, None, manifests, release)

    save_manifests(None, manifests)
    return manifests


def construct_metadata_release(world_id, manifest, version):
    return ApWorldMetadata(
        RemoteWorldSource.REMOTE,
        {
            "metadata": {
                "id": world_id,
                "world_version": version["world_version"],
                "title": "",
                "size": 0,
            },
            "source_url": manifest.get("source_url"),
            "world": version.get("download_url"),
            "hash_sha256": version.get("hash_sha256"),
        },
    )


def check_manifest_has_github_url(manifest, github_url, name):
    if github_url not in manifest.get("github", []):
        versions = [v for v in manifest.get("versions", {}).values()]
        versions.sort(key=lambda v: parse_version(v.get("world_version", "0.0.0")), reverse=True)
        source_url = versions[0].get("source_url").replace("https://api.github.com/repos", "https://github.com") if versions else None
        if source_url and source_url == github_url:
            print(f"Adding {source_url} to {name} manifest")
            if isinstance(manifest.get("github", []), str):
                if manifest["github"].startswith("https://api.github.com/repos"):
                    manifest["github"] = manifest["github"].replace("https://api.github.com/repos", "https://github.com")
                if manifest["github"].lower() == source_url.lower():
                    return

                manifest["github"] = [manifest["github"]]
            manifest.setdefault("github", []).append(source_url)
    if isinstance(manifest.get("github", []), list):
        if len(manifest["github"]) != len(set(manifest["github"])):
            manifest["github"] = list(set(manifest["github"]))
        if len(manifest["github"]) == 1:
            manifest["github"] = manifest["github"][0]


def parse_version_from_release(release: dict, raw_version: str, prefer_version_from_title: bool) -> Version:
    if prefer_version_from_title:
        try:
            version_number = parse_version(release.data["metadata"]["title"].replace(release.id, ""))
        except InvalidVersion:
            version_number = None
        if version_number is None or version_number.base_version == "0.0.0":
            version_number = parse_version(raw_version.replace(release.id, ""))
    else:
        try:
            version_number = parse_version(raw_version.replace(release.id, ""))
        except InvalidVersion:
            version_number = None
        try:
            if version_number is None or version_number.base_version == "0.0.0":
                version_number = parse_version(release.data["metadata"]["title"].replace(release.id, ""))
        except InvalidVersion:
            if version_number is None:
                version_number = Version("0.0.0")
    return version_number


def load_manifest(file_path: pathlib.Path, github_url: str = "", default_flags=None) -> dict:
    try:
        if (file_path := file_path.with_suffix(".json")).exists():
            manifest = json.loads(file_path.read_text())
        elif (file_path := file_path.with_suffix(".yaml")).exists():
            manifest = yaml.safe_load(file_path.read_text())
        elif github_url:
            manifest = {"game": "", "github": github_url}
            if default_flags:
                manifest["flags"] = default_flags
        else:
            manifest = {}
        return manifest
    except json.decoder.JSONDecodeError as e:
        print(f"Failed to parse {file_path}: {e}")
        try:
            manifest = yaml.safe_load(file_path.read_text())
            return manifest
        except yaml.YAMLError as e:
            print(f"Also failed to parse as YAML: {e}")
        raise


def get_or_add_github_repo(github_url) -> GithubRepository | Repository:
    if isinstance(github_url, list):
        print("Github URL is a list, using the first one")
        github_url = github_url[0]
    for added in repositories.repositories:
        if isinstance(added, GithubRepository) and (github_url in [added.url, added.url.replace("https://api.github.com/repos", "https://github.com")] or github_url.lower() == added.url.lower()):
            repo = added
            break
    else:
        repo = repositories.add_repo(github_url)
        repo.refresh()
    return repo


def save(world: pathlib.Path, manifest: dict):
    if world.suffix == ".yaml":
        world.write_text(yaml.dump(manifest))
    else:
        world.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")


# def parse_version(version: str) -> Version:
#     try:
#         return Version(version)
#     except InvalidVersion as e:
#         simple = re.search(VERSION_PATTERN, version, re.VERBOSE | re.IGNORECASE)
#         if simple:
#             return Version(simple.group(0))
#         return Version(f"0.0.0+{version}")
