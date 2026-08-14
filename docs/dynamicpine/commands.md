# Client commands

The Dynamic Pine hub client (`DynamicPineCommandProcessor` in
[context.py](../context.py)) exposes every GUI action as a command too, so the
hub is fully usable headless (`--nogui`):

| Command | Does |
|---|---|
| `/games` | Lists installed Dynamic Pine games, their configured ISO status, and every configured instance (running or stopped) with its PINE port. |
| `/launch <game> [instance] [patch_file]` | Launches the game's own registered client component (see `client_component` on `DynamicPineGame`). `instance` is the slot name you'll connect with - defaults to `"default"`. Also prepares that instance's PCSX2 config first (`ensure_instance_config`), even though PCSX2 itself isn't started here. `patch_file` is only needed for `launcher_options="patch"` games - the path to that seed's per-seed patch file, forwarded to the client exactly like double-clicking it would. |
| `/launch_pcsx2 <game> [instance]` | Launches (or attaches to) that instance's PCSX2 without its client. `game`/`instance` match `/launch`. Reports `InstanceAlreadyRunningError`/`NoPCSX2Executable`/`NoBiosConfigured`/`NoIsoConfigured` as an output message rather than crashing. |
| `/clear <game>` | Removes every stopped (not currently running) instance for a game, freeing their disk space/ports. Running instances are left untouched. |
| `/bios` | Shows the current shared BIOS folder status, then prompts to change it (native folder picker). |

`<game>` accepts an exact name, PS2 serial, or an unambiguous
case-insensitive substring of either - see `_match_game` in
[context.py](../context.py).

## Your own client's commands

If your game's own client wants a `/launch_pcsx2` command too (rather than
relying solely on the hub), see
[`DynamicPineCommandMixin`](api.md#client-command-helper) instead of
reimplementing this table's `/launch_pcsx2` behavior by hand.
