import datetime
import os
import pathlib
import re
import subprocess

import toml
import yaml

from common import parse_version, load_manifest
from worlds.apworld_manager._vendor.packaging.version import _Version

os.chdir(os.path.join(os.path.dirname(__file__), ".."))


class CustomTomlEncoder(toml.TomlPreserveCommentEncoder):
    def dump_inline_table(self, section):
        """Preserve inline table in its compact syntax instead of expanding
        into subsection.

        https://github.com/toml-lang/toml#user-content-inline-table
        """
        retval = ""
        if isinstance(section, dict):
            val_list = []
            for k, v in section.items():
                val = self.dump_inline_table(v)
                val_list.append(k + " = " + val)
            if not val_list:
                return "{}\n"
            retval += "{ " + ", ".join(val_list) + " }\n"
            return retval
        else:
            return str(self.dump_value(section))

    def dump_sections(self, o, sup):
        class _dict(dict, toml.decoder.InlineTableDict):
            pass

        for v, d in o.get('versions', {}).items():
            if not isinstance(d, toml.decoder.InlineTableDict):
                o['versions'][v] = _dict(d)
            pass
        return super().dump_sections(o, sup)

ejindex = pathlib.Path(os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", "Archipelago-index")))
if not ejindex.exists():
    subprocess.run(["git", "clone", "git@github.com:Eijebong/Archipelago-index.git"], cwd=os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
else:
    subprocess.run(["git", "pull"], cwd=ejindex)

outbound = {}

my_index = pathlib.Path(os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "index")))
files = [f.stem for f in my_index.glob("*")]

index = ejindex / "index"
for file in index.iterdir():
    ej_manifest = toml.loads(file.read_text())
    game = ej_manifest.get("name")
    if file.stem in files:
        remote = load_manifest((my_index / f"{file.stem}.yaml"))
        if ej_manifest.get("supported", False):
            remote["supported"] = True
            with open(my_index / f"{file.stem}.yaml", "w") as f:
                yaml.dump(remote, f)
            continue
        versions = ej_manifest.get("versions", {})
        r_ver = remote.get('versions', {})
        if not r_ver:
            continue
        max_ver = max(r_ver.values(), key=lambda x: datetime.datetime.fromisoformat(x.get('created_at', "2020-01-01T00:00:00Z")))
        parsed_world_version = parse_version(max_ver['world_version'].replace(file.stem, ""))
        if len(parsed_world_version.release) == 2:
            parsed_world_version._version = _Version(
                parsed_world_version._version.epoch,
                parsed_world_version._version.release + (0,),
                parsed_world_version._version.dev,
                parsed_world_version._version.pre,
                parsed_world_version._version.post,
                parsed_world_version._version.local,
            )
        verstr = str(parsed_world_version)
        if max_ver['version_simple'] in versions:
            continue
        if verstr in versions:
            continue
        if any(max_ver['download_url'] == v.get('url', ej_manifest.get("default_url", "").replace("{{version}}", k)) for k, v in versions.items()):
            continue


        ej_manifest["versions"][verstr] = {}
        url = ej_manifest.get("default_url", "").replace("{{version}}", verstr)
        if max_ver['download_url'] != url:
            ej_manifest["versions"][verstr]['url'] = max_ver['download_url']
        with open(file, "w") as f:
            toml.dump(ej_manifest, f, encoder=CustomTomlEncoder(preserve=True))
        print(f"Added {max_ver} to {file}")
        outbound[file.stem] = max_ver
    else:  # Eijebong has the world, but we don't
        default_url = ej_manifest.get("default_url")
        if not default_url:
            continue
        repo = re.match(r"^https://github.com/([\w-]+)/([\w-]+)/", default_url)
        if not repo:
            print(f"Skipping {game}, no github repo found")
            continue

        game_info = {"game": game, "github": repo.group(0)}
        latest_version = list(ej_manifest["versions"].keys())[-1]
        game_info.setdefault("versions", {})[latest_version] = {
            "source_url": default_url.replace("{{version}}", latest_version),
            "size": 0,
            "world_version": latest_version,
            "game": game,
        }
        with open(my_index / f"{file.stem}.yaml", "w") as f:
            yaml.dump(game_info, f)

for world, ver in outbound.items():
    verstr = str(parse_version(ver['world_version'].replace(world, "")))
    print(f"Added {verstr} to {world}")
    subprocess.run(['git', 'branch', '-f', f"{world}"], cwd=ejindex)
    subprocess.run(['git', 'checkout', f"{world}"], cwd=ejindex)
    subprocess.run(['git', 'add', f"index/{world}.toml"], cwd=ejindex)
    subprocess.run(['git', 'commit', '-m', f"Update {world} to {verstr}"], cwd=ejindex)
    subprocess.run(['git', 'checkout', 'main'], cwd=ejindex)
    pass
outbound = {}
# for file in my_index.iterdir():
#     manifest = yaml.safe_load(file.read_text())
#     e_file = ejindex / "index" / f"{file.stem}.toml"
#     if e_file.exists():
#         continue
#     r_ver = manifest.get('versions', {})
#     max_ver = max(r_ver.values(), key=lambda x: x['created_at'])['world_version']

#     simple = {
#         "name": manifest["game"],
#         "default_url": manifest["github"] + "/releases/download/{{version}}/" + f"{file.stem}.zip",
#         "versions": {
#             max_ver: {}
#         }
#     }
#     with open(e_file, 'w') as f:
#         toml.dump(simple, f, encoder=CustomTomlEncoder(preserve=True))
#     print(f"Added {max_ver} to {file}")
#     outbound[file.stem] = max_ver

