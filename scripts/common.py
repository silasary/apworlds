import datetime
import functools
import hashlib
import json
import os
import pathlib
import sys
from pathlib import Path
from time import sleep

import yaml


os.chdir(os.path.join(os.path.dirname(__file__), ".."))

sys.path.append("Archipelago")
import Utils  # noqa

Utils.local_path.cached_path = os.path.dirname(os.path.abspath(Utils.__file__))
import ModuleUpdate

ModuleUpdate.update(yes=True)

from worlds.Files import InvalidDataError
from worlds.apworld_manager.world_manager import RepositoryManager, parse_version
from worlds.apworld_manager._vendor.packaging.version import InvalidVersion, Version

try:
    from worlds.Files import APWorldContainer
except ImportError:
    from worlds.apworld_manager._vendor.world_container import APWorldContainer

index = pathlib.Path("index")

repositories = RepositoryManager()

class NoWorldsFound(Exception):
    pass

@functools.cache
def latest_ap_release() -> datetime.datetime:
    repo = get_or_add_github_repo("https://github.com/ArchipelagoMW/Archipelago")
    repo.refresh()
    return max(datetime.datetime.fromisoformat(release['published_at']) for release in repo.release_json)


def update_index_from_github(file_path: Path | None, manifest: dict, github_url: str | list) -> dict[str, dict]:
    if isinstance(github_url, list):
        for url in github_url:
            update_index_from_github(file_path, manifest, url)
        return
    world_id = ''
    manifests = {}
    if manifest:
        world_id = file_path.stem
        manifests[world_id] = manifest

    repo = get_or_add_github_repo(github_url)
    for world in repo.worlds:
        repositories.all_known_package_ids.add(world.id)
        repositories.packages_by_id_version[world.id][world.world_version] = world

    if file_path and world_id not in repositories.all_known_package_ids:
        raise NoWorldsFound(f"{world_id}.apworld not found in {github_url}")
    if file_path:
        releases = repositories.packages_by_id_version.get(world_id).values()
    else:
        releases = repo.worlds
    for release in releases:
        source_url = release.source_url
        if source_url and repo.url and source_url != repo.url:
            continue
        manifest = manifests.setdefault(release.id, None)
        if not manifest:
            file_path = index / f"{release.id}.json"
            manifest = load_manifest(file_path, github_url)
            manifests[release.id] = manifest
        if manifest.get('supported', False):
            if datetime.datetime.fromisoformat(release.created_at) < latest_ap_release():
                if release.world_version in manifest.get('versions', {}):
                    del manifest['versions'][release.world_version]
                continue
        version_info: dict = manifest.setdefault('versions', {}).setdefault(release.world_version, {})
        revision = 1
        raw_version = release.world_version
        while version_info.get('size', 0) and version_info.get('size', 0) != release.data.get('size', 0):
            revision += 1
            release.data['metadata']['world_version'] = f"{raw_version}r{revision}"
            version_info = manifest.setdefault('versions', {}).setdefault(release.world_version, {})
            if not version_info:
                print(f"{release.id} {release.world_version} was replaced in place")

        try:
            version_number = parse_version(release.data['metadata']['title'].replace(release.id, ''))
        except InvalidVersion:
            version_number = None
        if version_number is None or version_number.base_version == '0.0.0':
            version_number = parse_version(raw_version.replace(release.id, ''))
        if revision > 1:
            version_number = Version(f"{version_number.base_version}r{revision}")

        version_info.update({
            'title': release.data['metadata'].get('title', ''),
            'download_url': release.download_url,
            'source_url': release.source_url,
        })
        data = {  # only update these if they are not already set
            'size': release.data.get('size', 0),
            'tag': release.world_version,
            "world_version": str(version_number),
            'version_simple': version_number.base_version,
            'created_at': release.created_at,
        }
        for key in data:
            if key not in version_info:
                version_info[key] = data[key]

        if 'hash_sha256' not in manifest['versions'][release.world_version]:
            print(f"Downloading and hashing {release.download_url}")
            file = repositories.download_remote_world(release, False)
            with open(file, 'rb') as f:
                hash = hashlib.sha256(f.read()).hexdigest()
            manifest['versions'][release.world_version]['hash_sha256'] = hash
            container = APWorldContainer(file)
            try:
                container.read()
            except InvalidDataError:
                pass
            manifest_data = container.get_manifest()
            for key in ("minimum_ap_version", "maximum_ap_version"):
                if key in manifest_data:
                    manifest['versions'][release.world_version][key] = manifest_data[key]

    if manifest is None:
        return manifests

    if 'id' in manifest:
        del manifest['id']
    if 'metadata' in manifest:
        del manifest['metadata']
    if 'world' in manifest:
        del manifest['world']

    for name, manifest in manifests.items():
        file_path = index / f"{name}.yaml"
        if file_path.exists():
            file_path.unlink()
        file_path = index / f"{name}.json"
        file_path.write_text(json.dumps(manifest, indent=2, sort_keys=True))
    return manifests

def load_manifest(file_path: pathlib.Path, github_url: str = None) -> dict | None:
    if (file_path := file_path.with_suffix('.json')).exists():
        manifest = json.loads(file_path.read_text())
    elif (file_path := file_path.with_suffix('.yaml')).exists():
        manifest = yaml.safe_load(file_path.read_text())
    elif github_url:
        manifest = {"game": "", "github": github_url}
    else:
        manifest = None
    return manifest

def get_or_add_github_repo(github_url):
    if isinstance(github_url, list):
        print("Github URL is a list, using the first one")
        github_url = github_url[0]
    for added in repositories.repositories:
        if added.url == github_url:
            repo = added
            break
    else:
        repo = repositories.add_github_repository(github_url)
        repo.refresh()
    return repo

# def parse_version(version: str) -> Version:
#     try:
#         return Version(version)
#     except InvalidVersion as e:
#         simple = re.search(VERSION_PATTERN, version, re.VERBOSE | re.IGNORECASE)
#         if simple:
#             return Version(simple.group(0))
#         return Version(f"0.0.0+{version}")
