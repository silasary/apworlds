"""
Metadata Extractor

WARNING:  This script executes untrusted apworlds, do not run this outside of a sandboxed environment.
"""
import importlib
import inspect
import pathlib
import sys
import warnings
import zipimport

import yaml
from common import NoWorldsFound, parse_version, update_yaml_from_github, repositories, get_or_add_github_repo
from worlds import AutoWorldRegister
from worlds.AutoWorld import World


WORLD_TYPES = AutoWorldRegister.world_types

def import_world(path, world_id: str):
    importer = zipimport.zipimporter(path)
    spec = importer.find_spec(world_id)
    assert spec, f"{path} is not a loadable module"
    mod = importlib.util.module_from_spec(spec)

    mod.__package__ = f"worlds.{mod.__package__}"

    mod.__name__ = f"worlds.{mod.__name__}"
    sys.modules[mod.__name__] = mod
    with warnings.catch_warnings():
        warnings.filterwarnings("ignore", message="__package__ != __spec__.parent")
        # Found no equivalent for < 3.10
        if hasattr(importer, "exec_module"):
            importer.exec_module(mod)
    return mod


for world in pathlib.Path("index").iterdir():
    AutoWorldRegister.world_types = WORLD_TYPES
    if world.is_dir():
        pass
    else:
        manifest = yaml.safe_load(world.read_text())
        github = manifest.get('github')
        license = manifest.get('license')

        if not license:
            repo = get_or_add_github_repo(github)
            manifest['license'] = repo.get_license()
            if manifest['license']:
                world.write_text(yaml.dump(manifest))

        do_analyze = not manifest.get('game')

        if not do_analyze:
            continue

        try:
            update_yaml_from_github(world, manifest, github)
        except NoWorldsFound:
            print(f"Failed to find {world} in {github}")
            continue
        versions = repositories.packages_by_id_version.get(world.stem)
        if not versions:
            print(f"No versions found for {world}")
            continue
        available_versions = []
        for version, v in versions.items():
            if not manifest.setdefault('versions', {}).get(version, {}).get('failed_to_load'):
                available_versions.append(v)
        if not available_versions:
            print(f"No good versions available for {world}")
            continue
        highest_remote_version = max(available_versions, key=lambda w: parse_version(w.world_version))
        path = repositories.download_remote_world(highest_remote_version, False)

        try:
            AutoWorldRegister.world_types = {}
            mod = import_world(path, world.stem)
            if not mod:
                print(f"Failed to load {world}")
                continue

            objects = {name: obj for name, obj in inspect.getmembers(mod) if isinstance(obj, type)}
            for name, obj in objects.items():
                if World in inspect.getmro(obj) and obj != World:
                    world_class = obj
                    break
            else:
                print(f"No worlds found in {world}")
                continue

            if not manifest.get('game'):
                manifest['game'] = world_class.game

            world.write_text(yaml.dump(manifest))

        except Exception as e:
            print(f"Error processing {world}: {e}")
            manifest['versions'].get(highest_remote_version.world_version, {})['failed_to_load'] = str(e)
            world.write_text(yaml.dump(manifest))
            continue

