import os
import sys
import json
import pathlib
from time import sleep
import yaml
import datetime

from data import update_yaml_from_github


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
            if manifest.get('supported', False):
                continue

            github = manifest.get('github')
            stale = datetime.datetime.fromisoformat(last_checked.setdefault(world.stem, '2000-01-01T00:00:00+00:00')) < datetime.datetime.now(tz=datetime.UTC) - datetime.timedelta(days=3)
            if stale and github:
                update_yaml_from_github(world, manifest, github)
                last_checked[world.stem] = datetime.datetime.now(tz=datetime.UTC).isoformat()
                save_last_checked()
                sleep(2)
            versions = list(manifest.get('versions', {}).values())

            for version in versions:
                worlds.append({
                    "world": version['source_url'],
                    "size": version['size'],
                    "metadata": {
                        "game": manifest['game'],
                        "id": world.stem,
                        "world_version": version['world_version'],
                        "version_simple": version['version_simple'],
                        }
                    })

                # if not version.get('source_url'):
                #     print(f"Missing source_url for {world.stem} {version.get('world_version')}")
        except Exception as e:
            print(f"Error updating {world.stem}: {e}")

save_last_checked()

output = {"worlds": worlds}

with open("index.json", "w") as f:
    f.write(json.dumps(output, indent=2))
