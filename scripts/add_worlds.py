import argparse
import os
import pathlib
import re
from time import sleep
import requests
import csv

import common
import yaml
from common import get_or_add_github_repo, update_index_from_github, index
from worlds.apworld_manager.world_manager import RepositoryManager

REPO_REGEX = r"(https://github\.com/[a-zA-Z0-9_-]+/[a-zA-Z0-9_-]+)"

if os.path.exists("queue.txt"):
    with open("queue.txt") as f:
        queue = [line.strip() for line in set(f.readlines()) if line.strip()]
else:
    queue = []

parser = argparse.ArgumentParser(description="Add worlds to the index")
parser.add_argument("--dark", default=False, action="store_true", help="Add worlds as After Dark")
parser.add_argument("--unready", default=False, action="store_true", help="Add worlds as Unready")
parser.add_argument("--ready", default=False, action="store_true", help="Unflag things as Unready")
parser.add_argument("--scan-forks", default=False, action="store_true", help="Scan forks for worlds")
parser.add_argument("--spreadsheet", default=False, action="store_true", help="Add worlds from the spreadsheet")
parser.add_argument("--allow-uppercase", default=False, action="store_true", help="Allow uppercase letters in filenames")
parser.add_argument("url", nargs="*", help="URL to add to the index")
args = parser.parse_args()
if args.url:
    queue.extend(args.url)

failed: list[str] = []
ad_games: list[str] = []

if args.scan_forks:
    parents = ["https://github.com/ArchipelagoMW/Archipelago"]
    while parents:
        parent = parents.pop(0)
        repo = get_or_add_github_repo(parent)

        page = 1
        forks = repo.fetch(repo.url + "/forks?per_page=100&page=" + str(page))
        while forks:
            for fork in forks:
                queue.append(fork["html_url"])
                if fork["html_url"] not in parents:
                    parents.append(fork["html_url"])
            page += 1
            forks = repo.fetch(repo.url + "/forks?per_page=100&page=" + str(page))

if args.spreadsheet:
    all_rows = []
    tabs = [58422002, 857819707]
    for gid in tabs:
        SPREADSHEET_URL = f"https://docs.google.com/spreadsheets/d/1iuzDTOAvdoNe8Ne8i461qGNucg5OuEoF-Ikqs8aUQZw/export?gid={gid}&format=csv"
        response = requests.get(SPREADSHEET_URL)
        response.raise_for_status()
        rows = response.text.splitlines()
        while rows[0].split(",")[0] != "Game":
            rows.pop(0)
        parsed = csv.DictReader(rows)
        all_rows.extend(parsed)
    for row in all_rows:
        if wheretofind := (row.get("Where can you get the APWorld and Client?", "").strip() or row.get("Where can you get the APWorld or program?", "").strip()):
            repolinks = re.findall(REPO_REGEX, wheretofind)
            queue.extend(repolinks)

        if "After Dark" in row["Notes"] and row["Game"].strip() != "ULTRAKILL":  # ULTRAKILL is not an After Dark game
            ad_games.append(row["Game"].strip())

if not queue:
    with open("queue.txt", "w") as f:
        f.write("")


def save():
    with open("queue.txt", "w") as f:
        f.write("\n".join(queue))
    if failed:
        with open("failed.txt", "w") as f:
            f.write("\n".join(failed))


default_flags = {}
if args.dark:
    default_flags["after_dark"] = True
if args.unready:
    default_flags["unready"] = True

queue = list(set(queue))
for url in queue.copy():
    repositories = RepositoryManager()
    github = url.strip()
    github = github.split("/releases", 1)[0]
    manifests = update_index_from_github(None, {}, github_url=github, default_flags=default_flags)
    for world, manifest in manifests.items():
        # if not args.allow_uppercase and not world.islower():
        #     print(f"Skipping {world} due to uppercase letters in filename")
        #     continue
        print(f"Added {world} from {github}")
        if manifest.get("game") in ad_games and "after_dark" not in manifest.setdefault("flags", []):
            manifest["flags"].append("after_dark")
            common.save(world=pathlib.Path("index", world + ".json"), manifest=manifest)
        if args.ready and "unready" in manifest.get("flags", []):
            manifest["flags"].remove("unready")
            common.save(world=pathlib.Path("index", world + ".json"), manifest=manifest)
    if not manifests:
        failed.append(github)

    print(f"Finished {github}")
    queue.remove(url)
    save()
    sleep(2)

for world in pathlib.Path("Archipelago", "worlds").iterdir():
    if world.stem == "apworld_manager":
        continue
    if world.is_dir():
        file = index / f"{world.stem}.yaml"
        if file.exists():
            with open(file) as f:
                manifest = yaml.safe_load(f)
            if "supported" not in manifest:
                manifest["supported"] = True
                with open(file, "w") as f:
                    yaml.safe_dump(manifest, f)
