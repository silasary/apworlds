import argparse
from collections import defaultdict
import datetime
import json
import os
import pathlib
import sys
import traceback

import yaml
from common import NoWorldsFound, parse_version, update_index_from_github, repositories, load_manifest, update_index_from_changelog
from write_docs import write_docs
from worlds.apworld_manager.world_manager import GithubRateLimitExceeded

parser = argparse.ArgumentParser()
parser.add_argument("--no-refresh", action="store_true", help="Don't refresh the GitHub repositories")
parser.add_argument("--add-unknown", action="store_true", help="Add unknown worlds from known repos to the index")
args = parser.parse_args()

worlds = []
meta = defaultdict(dict)
manifest_ready = defaultdict(bool)

last_checked = {}

if os.path.exists("last_checked.json"):
    with open("last_checked.json") as f:
        last_checked = json.load(f)


def save_last_checked():
    with open("last_checked.json", "w") as f:
        json.dump(last_checked, f, indent=0)


files = list(pathlib.Path("index").iterdir())
files.sort(key=lambda x: x.stem.lower())

for world in files:
    if world.is_dir():
        pass
    else:
        try:
            manifest = load_manifest(world)
            if not manifest:
                print(f"Unknown file type {world}")
                continue
            if manifest.get("ignore", False):
                continue
            github = manifest.get("github")
            changelog = manifest.get("changelog")
            stale = datetime.datetime.fromisoformat(last_checked.setdefault(world.stem, "2000-01-01T00:00:00+00:00")) < datetime.datetime.now(tz=datetime.UTC) - datetime.timedelta(hours=4)
            if stale and github and not args.no_refresh:
                update_index_from_github(world, manifest, github)
                last_checked[world.stem] = datetime.datetime.now(tz=datetime.UTC).isoformat()
                save_last_checked()
            if stale and changelog and not args.no_refresh:
                update_index_from_changelog(world, manifest, changelog)
                last_checked[world.stem] = datetime.datetime.now(tz=datetime.UTC).isoformat()
                save_last_checked()

            versions = list(manifest.get("versions", {}).values())
            versions.sort(key=lambda v: parse_version(v.get("world_version", "0.0.0")), reverse=True)
            meta[world.stem]["game"] = manifest.get("game", "")
            meta[world.stem]["description"] = manifest.get("description", "")
            manifest_ready[world.stem] = any(v.get("has_manifest", False) for v in versions)

            if tracker := manifest.get("tracker"):
                meta[world.stem]["tracker"] = tracker
            if manifest.get("upgrades_into"):
                meta[world.stem]["upgrades_into"] = manifest["upgrades_into"]
                if "unready" not in manifest.setdefault("flags", []):
                    manifest["flags"].append("unready")

            for version in versions:
                if version.get("ignore", False):
                    continue
                tag_str = version["world_version"]
                if tag_str.lower().startswith(world.stem):
                    tag_str = tag_str[len(world.stem) :].lstrip("-_")
                world_version = parse_version(tag_str)
                flags = manifest.get("flags", []).copy()
                if version.get("flags"):
                    flags.extend(version["flags"])
                metadata = {
                    "game": "",  # deprecated
                    "id": world.stem,
                    "world_version": str(world_version),
                    "tag_version": version["world_version"],
                    "created_at": version.get("created_at"),
                }
                if manifest.get("after_dark"):
                    flags.append("after_dark")
                if version.get("minimum_ap_version"):
                    metadata["minimum_ap_version"] = version["minimum_ap_version"]
                if version.get("maximum_ap_version"):
                    metadata["maximum_ap_version"] = version["maximum_ap_version"]
                if version.get("prerelease"):
                    flags.append("prerelease")
                if not version.get("has_manifest", True):  # Assume missing data means it has one
                    metadata.setdefault("maximum_ap_version", "0.6.99")

                if flags:
                    metadata["flags"] = flags

                entry = {
                    "world": version["download_url"],
                    "size": version["size"],
                    "hash_sha256": version.get("hash_sha256"),
                    # "source_url": version.get('source_url'),
                    "metadata": metadata,
                }
                if version.get("lib_file"):
                    entry["lib_file"] = version["lib_file"]

                worlds.append(entry)

                # if not version.get('source_url'):
                #     print(f"Missing source_url for {world.stem} {version.get('world_version')}")

            write_docs(world.stem, versions, manifest)
        except GithubRateLimitExceeded as e:
            print(f"GitHub rate limit exceeded: {e}")
            save_last_checked()
            sys.exit(1)
            break
        except NoWorldsFound as e:
            print(f"Error updating {world.stem}: {e}")
        except Exception as e:
            print(f"Error updating {world.stem}: {e}")
            traceback.print_exc()

save_last_checked()

output = {
    "index_version": 1,
    "worlds": worlds,
    "meta": meta,
}

with open("index.json", "w") as f:
    f.write(json.dumps(output, indent=2))

with open("report.json", "w") as f:
    report = {
        "total_repositories": len(repositories.repositories),
        "total_packages": len(repositories.all_known_package_ids),
        "total_versions": len(worlds),
        "manifest_ready": {k: v for k, v in manifest_ready.items()},
    }
    f.write(json.dumps(report, indent=2))

if args.add_unknown:
    for id in repositories.all_known_package_ids:
        manifest = pathlib.Path("index") / f"{id}.yaml"
        if not manifest.exists():
            version = list(repositories.packages_by_id_version[id].values())[0]
            manifest.write_text(yaml.dump({"game": "", "github": version.source_url}))
            print(f"Missing {manifest}")

print(f"Scanned {len(repositories.repositories)} repositories, found {len(repositories.all_known_package_ids)} packages with a total of {len(worlds)} versions")
print(f"{len([k for k, v in manifest_ready.items() if v])}/{len(manifest_ready)} worlds have a manifest.")
