import glob
import os
from pathlib import Path
from typing import Any
import pystache
import zipfile

from common import construct_metadata_release, repositories

with open("templates/downloads_template.mustache") as f:
    downloads_template = f.read()
with open("templates/index_template.mustache") as f:
    index_template = f.read()


def write_docs(world_stem: str, versions: list[dict[str, Any]], manifest: dict[str, Any]) -> None:
    lower_stem = world_stem.lower()
    os.makedirs(f"docs/{lower_stem}", exist_ok=True)

    updated = write_downloads(world_stem, versions, manifest, lower_stem)
    if not updated:
        return

    filenames = copy_documentation(world_stem, versions, manifest, lower_stem)
    print(f"Copied {len(filenames)} documentation files for {world_stem}: {', '.join(filenames)}")

    all_files = glob.glob(f"docs/{lower_stem}/*")
    expected_filenames = set(filenames) | {"downloads.md"}
    for filepath in all_files:
        filename = os.path.basename(filepath)
        if filename not in expected_filenames:
            os.remove(filepath)
            print(f"Removed outdated documentation file: {filepath}")

    pages = [Path(f).stem for f in filenames]

    setup_guides = [f for f in pages if f.startswith("setup")]
    game_info = f"en_{manifest.get('game','')}"
    if game_info not in pages:
        game_info = None

    other_files = sorted(set(pages) - set(setup_guides) - {game_info})

    index_output = pystache.render(
        index_template,
        {
            "world_stem": world_stem,
            "latest_version": versions[0],
            "game": manifest.get("game", ""),
            "manifest": manifest,
            "setup_guides": setup_guides,
            "game_info": game_info,
            "other_files": other_files,
            "has_other_files": len(other_files) > 0,
        },
    )
    index_md_path = f"docs/{lower_stem}/index.md"
    with open(index_md_path, "w", encoding="utf-8") as f:
        f.write(index_output)


def copy_documentation(world_stem: str, versions: list[dict[str, Any]], manifest: dict[str, Any], lower_stem: str) -> list[str]:
    release = construct_metadata_release(world_stem, manifest, versions[0])
    path = repositories.download_remote_world(release, False)
    filenames = []
    with zipfile.ZipFile(path, "r") as zf:
        directories = [f for f in zipfile.Path(zf).iterdir() if f.is_dir()]
        directories = [f for f in directories[0].iterdir() if f.is_dir()]
        docs = next((d for d in directories if d.stem == "docs"), None)
        if docs:
            for doc in docs.iterdir():
                doc_path = f"docs/{lower_stem}/{doc.name}"
                filenames.append(doc.name)
                if os.path.exists(doc_path):
                    with open(doc_path, "rb") as bf:
                        existing = bf.read()
                else:
                    existing = None
                with doc.open("rb") as bf:
                    new_content = bf.read()
                if existing == new_content:
                    continue
                with open(doc_path, "wb") as bf:
                    bf.write(new_content)
    return filenames


def write_downloads(world_stem: str, versions: list[dict[str, Any]], manifest: dict[str, Any], lower_stem: str) -> bool:
    output = pystache.render(
        downloads_template,
        {
            "world_stem": world_stem,
            "latest_version": versions[0],
            "game": manifest.get("game", ""),
            "manifest": manifest,
            "versions": versions,
        },
    )
    downloads_md_path = f"docs/{lower_stem}/downloads.md"
    if os.path.exists(downloads_md_path):
        with open(downloads_md_path, "r", encoding="utf-8") as f:
            existing = f.read()
    else:
        existing = None
    if existing == output:
        return False
    with open(downloads_md_path, "w", encoding="utf-8") as f:
        f.write(output)
    print(f"Wrote docs/{lower_stem}/downloads.md")
    return True
