import os
from time import sleep

import yaml

from common import parse_version, update_yaml_from_github


from worlds.apworld_manager.world_manager import RepositoryManager

if os.path.exists("queue.txt"):
    with open("queue.txt") as f:
        queue = [l.strip() for l in set(f.readlines()) if l.strip()]
else:
    queue = []

if not queue:
    print("Nothing to do")
    with open("queue.txt", "w") as f:
        f.write("")
    exit()

def save():
    with open("queue.txt", "w") as f:
        f.write("\n".join(queue))

for url in queue.copy():
    repositories = RepositoryManager()
    github = url.strip()
    manifests = update_yaml_from_github(None, None, github)
    for world, manifest in manifests.items():
        print(f"Added {world} from {github}")

    print(f"Finished {github}")
    queue.remove(url)
    save()
    sleep(2)
