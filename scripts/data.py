import os
import re
from pathlib import Path
import pathlib
import sys
import yaml
from packaging.version import Version, VERSION_PATTERN, InvalidVersion


from time import sleep

os.chdir(os.path.join(os.path.dirname(__file__), ".."))

sys.path.append("Archipelago")
import Utils  # noqa
Utils.local_path.cached_path = os.path.dirname(os.path.abspath(Utils.__file__))
import ModuleUpdate
ModuleUpdate.update(yes=True)

from worlds.apworld_manager.world_manager import RepositoryManager

index = pathlib.Path("index")

repositories = RepositoryManager()

def update_yaml_from_github(yaml_path: Path | None, manifest: dict, github_url: str) -> dict[str, dict]:
    world_id = ''
    manifests = {}
    if manifest:
        world_id = yaml_path.stem
        manifests[world_id] = manifest

    for added in repositories.repositories:
        if added.url == github_url:
            repo = added
            break
    else:
        repo = repositories.add_github_repository(github_url)
        repo.refresh()
    if not repo.worlds:
        print(f"Repository {github_url} has no worlds, retrying in 60 seconds")
        sleep(10)
        repo.refresh()
    for world in repo.worlds:
        repositories.all_known_package_ids.add(world.id)
        repositories.packages_by_id_version[world.id][world.world_version] = world

    if yaml_path and world_id not in repositories.all_known_package_ids:
        raise Exception(f"Repository {world_id} not found in {github_url}")
    releases = repositories.packages_by_id_version.get(world_id)
    for release in releases.values():
        manifest = manifests.setdefault(world_id, None)
        manifest.setdefault('versions', {})[release.world_version] = {
            'source_url': release.source_url,
            'size': release.data.get('size', 0),
            'world_version': release.world_version,
            'version_simple': ".".join(str(item) for item in release.version_tuple),
            'game': release.name or manifest.setdefault('game', ''),
        }
    if 'id' in manifest:
        del manifest['id']
    if 'metadata' in manifest:
        del manifest['metadata']
    if 'world' in manifest:
        del manifest['world']

    for name, manifest in manifests.items():
        yaml_path = index / f"{name}.yaml"
        yaml_path.write_text(yaml.dump(manifest))
    return manifests

def parse_version(version: str) -> Version:
    try:
        return Version(version)
    except InvalidVersion as e:
        simple = re.search(VERSION_PATTERN, version, re.VERBOSE | re.IGNORECASE)
        if simple:
            return Version(simple.group(0))
        return Version(f"0.0.0+{version}")
