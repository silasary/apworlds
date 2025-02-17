import os
import sys
import json
import pathlib
from time import sleep
import yaml
import datetime

os.chdir(os.path.join(os.path.dirname(__file__), ".."))

sys.path.append("Archipelago")
import Utils  # noqa
Utils.local_path.cached_path = os.path.dirname(os.path.abspath(Utils.__file__))
import ModuleUpdate
ModuleUpdate.update(yes=True)

from worlds.apworld_manager.world_manager import RepositoryManager

worlds = []

last_checked = {}

if os.path.exists('last_checked.json'):
    with open('last_checked.json') as f:
        last_checked = json.load(f)

def save_last_checked():
    with open('last_checked.json', 'w') as f:
        json.dump(last_checked, f, indent=0)


for world in pathlib.Path("index").iterdir():
    if world.is_dir():
        pass
        # manifest = {}
        # manifest_file = directory / "archipelago.json"
        # if manifest_file.exists():
        #     manifest = json.loads(manifest_file.read_text())
    else:
        try:
            manifest = yaml.safe_load(world.read_text())
            worlds.append(manifest)
            stale = datetime.datetime.fromisoformat(last_checked.setdefault(world.stem, '2000-01-01T00:00:00+00:00')) < datetime.datetime.now(tz=datetime.UTC) - datetime.timedelta(days=1)
            if not stale:
                continue
            print(manifest)
            github = manifest.get('github')
            if github:
                repositories = RepositoryManager()
                repo = repositories.add_github_repository(github)
                repositories.refresh()
                if not repo.worlds:
                    save_last_checked()
                    sleep(60)
                    repositories.refresh()
                if world.stem not in repositories.all_known_package_ids:
                    raise Exception(f"Repository {world.stem} not found in {github}")
                releases = repositories.packages_by_id_version.get(world.stem)
                highest_remote_version = sorted(releases.values(), key=lambda x: x.version_tuple)[-1]
                manifest.setdefault('metadata', {})['world_version'] = highest_remote_version.world_version
                manifest['metadata']['id'] = world.stem
                manifest['world'] = highest_remote_version.source_url
                if not manifest['metadata'].get('game'):
                    manifest['metadata']['game'] = manifest.get('game', '')

                world.write_text(yaml.dump(manifest))
                last_checked[world.stem] = datetime.datetime.now(tz=datetime.UTC).isoformat()
                sleep(2)
        except Exception as e:
            print(f"Error updating {world.stem}: {e}")

save_last_checked()

output = {"worlds": worlds}

with open("index.json", "w") as f:
    f.write(json.dumps(output, indent=2))
