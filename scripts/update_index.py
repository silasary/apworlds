import os
import json
import pathlib
import yaml
import datetime
import argparse

from common import parse_version, update_yaml_from_github

parser = argparse.ArgumentParser()
parser.add_argument("--no-refresh", action='store_true', help="Don't refresh the GitHub repositories")
args = parser.parse_args()

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
            github = manifest.get('github')
            stale = datetime.datetime.fromisoformat(last_checked.setdefault(world.stem, '2000-01-01T00:00:00+00:00')) < datetime.datetime.now(tz=datetime.UTC) - datetime.timedelta(hours=1)
            if stale and github and not args.no_refresh:
                update_yaml_from_github(world, manifest, github)
                last_checked[world.stem] = datetime.datetime.now(tz=datetime.UTC).isoformat()
                save_last_checked()
            versions = list(manifest.get('versions', {}).values())

            for version in versions:
                tag_str = version['world_version']
                if tag_str.lower().startswith(world.stem):
                    tag_str = tag_str[len(world.stem):].lstrip("-_")
                world_version = parse_version(tag_str)
                worlds.append({
                    "world": version['download_url'],
                    "size": version['size'],
                    # "source_url": version.get('source_url'),
                    "metadata": {
                        "game": manifest['game'],
                        "id": world.stem,
                        "world_version": str(world_version),
                        "tag_version": version['world_version'],
                        "created_at": version.get('created_at'),
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
