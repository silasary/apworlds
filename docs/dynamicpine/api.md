# API reference

Everything here is importable from `worlds.dynamicpine` directly (e.g.
`from worlds.dynamicpine import launch_pcsx2`) — see
[worlds/dynamicpine/\_\_init\_\_.py](../__init__.py)'s `__all__` for the
authoritative list. All of it is optional-dependency safe: guard every import
with `try/except ImportError` since Dynamic Pine may not be installed.

For a task-oriented walkthrough, see [Adding Dynamic Pine to your
apworld](adding_to_apworld.md). This page is the flat reference.

## Declaring support

### `DynamicPineGame`

Dataclass set as a `dynamic_pine` class attribute on your `World` subclass —
this is how the hub discovers installed games. See [Adding Dynamic Pine to
your apworld](adding_to_apworld.md#1-declare-support-on-your-world) for the
full example.

| Field | Type | Meaning |
|---|---|---|
| `game_ids` | `str \| tuple[str, ...]` | The game's PS2 serial(s) as PCSX2/PINE report them, e.g. `"SCUS-97615"`. Pass a tuple to accept multiple releases (regions, a patched re-release with its own serial) - a player only needs one configured. Normalized to a tuple in `__post_init__`; `game_ids[0]` is treated as canonical throughout - the folder name instances are grouped under, and the preferred key for new `game_files` entries. |
| `client_component` | `str \| None` | `display_name` of your game's client `Component` in the AP Launcher, used by the hub's "Launch Client" button. `None` hides that button (PCSX2 launching still works). |
| `memcard_name` | `str` | Per-instance memcard filename. Defaults to `"memcard.ps2"`. |
| `ini_overrides` | `dict[str, dict[str, str]]` | Extra `PCSX2.ini` settings, as `{section: {key: value}}` — see [PCSX2.ini settings](ini_settings.md). |
| `launcher_options` | `"simple" \| "full" \| "client" \| "patch"` | Hub button layout - see [Adding Dynamic Pine to your apworld](adding_to_apworld.md#1-declare-support-on-your-world). Defaults to `"full"`. |
| `patch_file_suffix` | `str \| None` | File extension (e.g. `".aprac2"`) of this game's per-seed patch file. Only meaningful with `launcher_options="patch"` - filters the hub's file picker. |

## Launching

### `launch_pcsx2(world_or_game, slot_name=None, iso=None) -> int | None`

Launches this game+slot instance's PCSX2 (with PINE enabled) if it isn't
already running, and returns the port to point your PINE connection at — or
`None` if this process wasn't launched through the Dynamic Pine hub, in which
case nothing was attempted and the caller should keep its current port.

- `world_or_game` — a `World` class, a game name, a PS2 serial, or a
  `DynamicPineGame` directly.
- `slot_name` — falls back to a fixed `"default"` instance if not given yet.
- `iso` — overrides the configured `game_files` ISO for this one launch; see
  [Launching PCSX2 against a patched
  ISO](adding_to_apworld.md#launching-pcsx2-against-a-patched-iso).

Raises (see [Exceptions](#exceptions)): `InstanceAlreadyRunningError`,
`NoPCSX2Executable`, `NoBiosConfigured`, `NoIsoConfigured`.

### `ensure_instance_config(world_or_game, slot_name=None) -> DynamicPineConfig | None`

Builds (or reuses) this instance's PINE-enabled config *without* launching
PCSX2, and records its port the same way `launch_pcsx2` does. Used internally
so "Launch Client" alone still gets a config/port immediately. Returns `None`
if `pcsx2_data_path` isn't configured.

### `get_pine_port(world_or_game, slot_name=None) -> int | None`

Pure lookup of the port recorded in this instance's ini - doesn't build
configs or launch anything. `None` if the instance has never been configured.
Use to reconnect to an already-running instance instead of calling
`launch_pcsx2` again.

### `get_pine_port_from_env() -> int | None`

The port set by the most recent `launch_pcsx2`/`ensure_instance_config` call
in this process (or an inherited ancestor, e.g. the hub). A fast-path only -
see [Picking up the port without a round
trip](adding_to_apworld.md#picking-up-the-port-without-a-round-trip-optional-fast-path).

## Discovery / lookup

### `discover_games() -> dict[str, tuple[type[World], DynamicPineGame]]`

Every installed world that declares Dynamic Pine support, keyed by game name.

### `resolve_game(world_or_game) -> tuple[str, DynamicPineGame]`

Accepts a `World` class, game name, PS2 serial, or `DynamicPineGame` directly
and returns `(display name, spec)`. Raises `ValueError` for unknown games.

### `get_iso_path(spec) -> Path | None`

The user's configured ISO for this game from `game_files`, or `None`.

### `get_bios_path() -> Path | None`

The user's configured shared BIOS folder, or `None`.

## Managing instances

### `list_instances(spec) -> list[InstanceInfo]`

Every instance ever configured for a game (running or stopped), each with
`instance_id`, `port`, and `running`. What the hub's "Instances:" line and
`/games` are built from.

### `list_running_instances(spec) -> list[InstanceInfo]`

The running subset of `list_instances`.

### `remove_instance(spec, instance_id) -> bool`

Deletes one stopped instance's whole datapath (ini, memcard, pid file, save
states). Raises `InstanceAlreadyRunningError` if it's still running - stop it
first. Returns `False` if there was nothing to remove.

### `clear_unused_instances(spec) -> list[str]`

Removes every stopped instance for a game in one call, leaving running ones
alone, and returns the removed instance IDs. What the hub's "Clear Unused"
button and `/clear` command use.

## Setup helpers

These back the hub's own prompts/settings screen - most integrations won't
need to call them directly.

- `prompt_for_iso(game_name, spec) -> Path | None` / `set_iso_path(spec, path)`
- `prompt_for_bios() -> Path | None` / `set_bios_path(path)`
- `dynamic_pine_settings()` — the raw `dynamic_pine_options` settings group
  from host.yaml.
- `launched_via_hub() -> bool` / `mark_launched_via_hub()` /
  `mark_pcsx2_already_launched()` / `pcsx2_already_launched_via_env() -> bool`
  — the env-var plumbing `launch_pcsx2` uses internally to know whether it's
  safe to manage PCSX2 in this process. Game clients don't normally call
  these directly.
- `mark_pending_auth(slot_name)` / `get_pending_auth() -> str | None` — records
  (and reads back) the slot name the hub's `/launch` was given, so a launched
  client can pre-fill its own `self.auth` instead of asking the player to
  retype the same name. See [Pre-filling the slot
  name](adding_to_apworld.md#pre-filling-the-slot-name-optional).

## Client command helper

### `DynamicPineCommandMixin`

Mix into your own `ClientCommandProcessor` to add a ready-made
`/launch_pcsx2` command. See [Adding Dynamic Pine to your
apworld](adding_to_apworld.md#shortcut-a-ready-made-launch_pcsx2-command).

## Exceptions

All subclass `RuntimeError`, raised only by `launch_pcsx2`
(`remove_instance` also raises `InstanceAlreadyRunningError`):

| Exception | Raised when |
|---|---|
| `InstanceAlreadyRunningError` | This exact game+slot instance already has a live Dynamic-Pine-launched PCSX2. Not usually a failure - fall back to `get_pine_port`. |
| `NoPCSX2Executable` | `pcsx2_path` isn't configured (or not found) under `dynamic_pine_options` in host.yaml. |
| `NoBiosConfigured` | No shared BIOS folder is configured (or found), and the user cancelled (or nothing could show) the locate-BIOS prompt. |
| `NoIsoConfigured` | No ISO is configured (or found) for the game, and the user cancelled (or nothing could show) the locate-ISO prompt - or an explicit `iso=` override doesn't exist on disk. |
