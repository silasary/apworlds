import argparse
import datetime
import json
import os
import pathlib

import yaml
from common import parse_version, update_yaml_from_github, repositories

parser = argparse.ArgumentParser()
parser.add_argument("--no-refresh", action='store_true', help="Don't refresh the GitHub repositories")
parser.add_argument("--add-unknown", action='store_true', help="Add unknown worlds from known repos to the index")
args = parser.parse_args()

worlds = []

last_checked = {}

if os.path.exists('last_checked.json'):
    with open('last_checked.json') as f:
        last_checked = json.load(f)

def save_last_checked():
    with open('last_checked.json', 'w') as f:
        json.dump(last_checked, f, indent=0)

files = list(pathlib.Path("index").iterdir())
files.sort(key=lambda x: x.stem.lower())
for world in files:
    if world.is_dir():
        pass
    else:
        try:
            manifest = yaml.safe_load(world.read_text())
            if manifest.get('ignore', False):
                continue
            github = manifest.get('github')
            stale = datetime.datetime.fromisoformat(last_checked.setdefault(world.stem, '2000-01-01T00:00:00+00:00')) < datetime.datetime.now(tz=datetime.UTC) - datetime.timedelta(hours=1)
            if stale and github and not args.no_refresh:
                update_yaml_from_github(world, manifest, github)
                last_checked[world.stem] = datetime.datetime.now(tz=datetime.UTC).isoformat()
                save_last_checked()
            versions = list(manifest.get('versions', {}).values())

            for version in versions:
                if version.get('ignore', False):
                    continue
                tag_str = version['world_version']
                if tag_str.lower().startswith(world.stem):
                    tag_str = tag_str[len(world.stem):].lstrip("-_")
                world_version = parse_version(tag_str)
                metadata = {
                        "game": manifest.get('game', ''),
                        "id": world.stem,
                        "world_version": str(world_version),
                        "tag_version": version['world_version'],
                        "created_at": version.get('created_at'),
                        }
                if manifest.get('after_dark'):
                    metadata['after_dark'] = True
                worlds.append({
                    "world": version['download_url'],
                    "size": version['size'],
                    "hash_sha256": version.get('hash_sha256'),
                    # "source_url": version.get('source_url'),
                    "metadata": metadata
                    })

                # if not version.get('source_url'):
                #     print(f"Missing source_url for {world.stem} {version.get('world_version')}")
        except Exception as e:
            print(f"Error updating {world.stem}: {e}")

save_last_checked()

output = {"worlds": worlds}

with open("index.json", "w") as f:
    f.write(json.dumps(output, indent=2))

if args.add_unknown:
    for id in repositories.all_known_package_ids:
        manifest = pathlib.Path("index") / f"{id}.yaml"
        if not manifest.exists():
            version = list(repositories.packages_by_id_version[id].values())[0]
            manifest.write_text(yaml.dump({"game": "", "github": version.source_url}))
            print(f"Missing {manifest}")

print(f'Scanned {len(repositories.repositories)} repositories, found {len(repositories.all_known_package_ids)} packages with a total of {len(worlds)} versions')
