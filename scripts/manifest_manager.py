import json
import pathlib

import yaml

index = pathlib.Path("index")


class IndexManager:
    def __init__(self) -> None:
        self.manifests_by_filename: dict[str, dict] = {}
        self.manifests_by_game: dict[str, dict] = {}
        self.files: list[pathlib.Path] = []

    def load_index(self) -> None:
        directory = index
        self.load_directory(directory)

    def load_directory(self, directory: pathlib.Path) -> None:
        for file in directory.iterdir():
            if file.is_dir():
                self.load_directory(file)
                continue
            if file.suffix not in (".json", ".yaml"):
                continue
            manifest = self.load_manifest(file)
            if not manifest:
                continue
            self.files.append(file)
            if game := manifest.get("game"):
                self.manifests_by_game[game] = manifest
            self.manifests_by_filename[file.stem] = manifest

    def load_manifest(self, file_path: pathlib.Path, github_url: str = "", default_flags=None) -> dict:
        try:
            if (file_path := file_path.with_suffix(".json")).exists():
                manifest = json.loads(file_path.read_text())
            elif (file_path := file_path.with_suffix(".yaml")).exists():
                manifest = yaml.safe_load(file_path.read_text())
            elif github_url:
                manifest = {"game": "", "github": github_url}
                if default_flags:
                    manifest["flags"] = default_flags
            else:
                manifest = {}
            manifest["_filename"] = str(file_path.absolute())
            return manifest
        except json.decoder.JSONDecodeError as e:
            print(f"Failed to parse {file_path}: {e}")
            try:
                manifest = yaml.safe_load(file_path.read_text())
                manifest["_filename"] = str(file_path.absolute())
                return manifest
            except yaml.YAMLError as e:
                print(f"Also failed to parse as YAML: {e}")
            raise


index_manager = IndexManager()
index_manager.load_index()


def load_manifest(file_path: pathlib.Path, github_url: str = "", default_flags=None) -> dict:
    if index_manager.manifests_by_filename.get(file_path.stem):
        return index_manager.manifests_by_filename[file_path.stem]
    return index_manager.load_manifest(file_path, github_url, default_flags)


def save_manifest(world: pathlib.Path, manifest: dict) -> None:
    _manifest = manifest.copy()
    path = _manifest.pop("_filename", None)
    if path:
        world = pathlib.Path(path)

    if world.suffix == ".yaml":
        world.write_text(yaml.dump(_manifest))
    else:
        world.write_text(json.dumps(_manifest, indent=2, sort_keys=True) + "\n")
