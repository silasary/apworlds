import sys
import os

import yaml

os.chdir(os.path.join(os.path.dirname(__file__), ".."))

sys.path.append("Archipelago")
import Utils  # noqa
Utils.local_path.cached_path = os.path.dirname(os.path.abspath(Utils.__file__))
import ModuleUpdate
ModuleUpdate.update(yes=True)

from worlds.apworld_manager.world_manager import RepositoryManager

if os.path.exists("queue.txt"):
    with open("queue.txt") as f:
        queue = f.readlines()
else:
    queue = []

if not queue:
    print("Nothing to do")
    exit()

for repo in queue:
    repositories = RepositoryManager()
    github = repo.strip()
    if github.endswith('/releases'):
        github = github[:-9]
    repo = repositories.add_github_repository(github)
    repo.refresh()
    if not repo.worlds:
        print(f"Repository {github} has no worlds")
        continue

    for world in repo.all_known_package_ids:
        if os.path.exists(f"index/{world}.yaml"):
            continue
        with open(f"index/{world}.yaml", "w") as f:
            yaml.dump({"game": "", "github": github}, f)
        print(f"Added {world} from {github}")
    print(f"Finished {github}")
    queue.remove(repo)

with open("queue.txt", "w") as f:
    f.write("\n".join(queue))
