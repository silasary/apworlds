import argparse
import os
import pathlib
from time import sleep

import yaml
from common import update_index_from_github, index
from worlds.apworld_manager.world_manager import RepositoryManager

if os.path.exists("queue.txt"):
    with open("queue.txt") as f:
        queue = [l.strip() for l in set(f.readlines()) if l.strip()]
else:
    queue = []

parser = argparse.ArgumentParser(description="Add worlds to the index")
parser.add_argument("url", nargs="*", help="URL to add to the index")
args = parser.parse_args()
if args.url:
    queue.extend(args.url)

failed = []

if not queue:
    with open("queue.txt", "w") as f:
        f.write("")

def save():
    with open("queue.txt", "w") as f:
        f.write("\n".join(queue))
    if failed:
        with open("failed.txt", "w") as f:
            f.write("\n".join(failed))

for url in queue.copy():
    repositories = RepositoryManager()
    github = url.strip()
    github = github.replace("/releases", "")
    manifests = update_index_from_github(None, None, github)
    for world, manifest in manifests.items():
        print(f"Added {world} from {github}")
    if not manifests:
        failed.append(github)

    print(f"Finished {github}")
    queue.remove(url)
    save()
    sleep(2)

for world in pathlib.Path('Archipelago', 'worlds').iterdir():
    if world.stem == 'apworld_manager':
        continue
    if world.is_dir():
        file = index / f"{world.stem}.yaml"
        if file.exists():
            with open(file) as f:
                manifest = yaml.safe_load(f)
            if 'supported' not in manifest:
                manifest['supported'] = True
                with open(file, 'w') as f:
                    yaml.safe_dump(manifest, f)
