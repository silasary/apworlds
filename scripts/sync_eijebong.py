import os
import pathlib
import re
import subprocess

import toml
import yaml

from common import parse_version

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
    manifest = toml.loads(file.read_text())
    game = manifest.get("name")
    if file.stem in files:
        remote = yaml.safe_load((my_index / f"{file.stem}.yaml").read_text())
        if manifest.get("supported", False):
            remote["supported"] = True
            with open(my_index / f"{file.stem}.yaml", "w") as f:
                yaml.dump(remote, f)
            continue
        versions = manifest.get("versions", {})
        r_ver = remote.get('versions', {})
        max_ver = max(versions.keys(), key=lambda x: x['created_at'])
        if max_ver in versions:
            continue

        manifest["versions"][max_ver] = {}
        with open(file, "w") as f:
            toml.dump(manifest, f, encoder=CustomTomlEncoder(preserve=True))
        print(f"Added {max_ver} to {file}")
        outbound[file.stem] = max_ver
    else:
        default_url = manifest.get("default_url")
        if not default_url:
            continue
        repo = re.match(r"^https://github.com/([\w-]+)/([\w-]+)/", default_url)
        if not repo:
            print(f"Skipping {game}, no github repo found")
            continue

        game_info = {"game": game, "github": repo.group(0)}
        latest_version = list(manifest["versions"].keys())[-1]
        game_info.setdefault("versions", {})[latest_version] = {
            "source_url": default_url.replace("{{version}}", latest_version),
            "size": 0,
            "world_version": latest_version,
            "game": game,
        }
        with open(my_index / f"{file.stem}.yaml", "w") as f:
            yaml.dump(game_info, f)

for file in my_index.iterdir():
    manifest = yaml.safe_load(file.read_text())
    e_file = ejindex / "index" / f"{file.stem}.toml"
    if e_file.exists():
        continue
    r_ver = manifest.get('versions', {})
    max_ver = max(r_ver.keys(), key=lambda x: x['created_at'])

    simple = {
        "name": manifest["game"],
        "default_url": manifest["github"] + "/releases/download/{{version}}/" + f"{file.stem}.zip",
        "versions": {
            max_ver: {}
        }
    }
    with open(e_file, 'w') as f:
        toml.dump(simple, f, encoder=CustomTomlEncoder(preserve=True))
    print(f"Added {max_ver} to {file}")
    outbound[file.stem] = max_ver

