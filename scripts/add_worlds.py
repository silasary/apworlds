import sys
import os
from time import sleep

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
        queue = [l.strip() for l in f.readlines() if l.strip()]
else:
    queue = []

if not queue:
    print("Nothing to do")
    exit()

def save():
    with open("queue.txt", "w") as f:
        f.write("\n".join(queue))
i = 0

for url in queue.copy():
    if not url.strip():
        queue.remove(url)
        save()
        sleep(30)
        continue
    repositories = RepositoryManager()
    github = url.strip()
    if github.endswith('/releases'):
        github = github[:-9]
    repo = repositories.add_github_repository(github)
    repositories.refresh()
    if not repo.worlds:
        print(f"Repository {github} has no worlds")
        queue.remove(url)
        sleep(30)
        continue

    for world in repositories.all_known_package_ids:
        if os.path.exists(f"index/{world}.yaml"):
            continue
        manifest = {"game": "", "github": github}
        releases = repositories.packages_by_id_version.get(world)
        highest_remote_version = sorted(releases.values(), key=lambda x: x.version_tuple)[-1]
        manifest.setdefault('metadata', {})['world_version'] = highest_remote_version.world_version
        manifest['metadata']['id'] = world
        manifest['world'] = highest_remote_version.source_url
        if not manifest['metadata'].get('game'):
            manifest['metadata']['game'] = manifest.get('game', '')

        with open(f"index/{world}.yaml", "w") as f:
            yaml.dump(manifest, f)
        print(f"Added {world} from {github}")
    print(f"Finished {github}")
    queue.remove(url)
    save()
    i += 1
    if i > 10:
        print("Done for now")
        break
    sleep(30)
