# Horse Riding Classic Setup Guide

## Required software

- Horse Riding Classic on Steam (Windows, x64).
- [BepInEx 5.4.23.x, `BepInEx_win_x64`](https://github.com/BepInEx/BepInEx/releases).
- The Horse Riding Classic Archipelago plugin release zip.

There is **no separate client to run.** The Archipelago connection is built into
the plugin, so the game connects to the room by itself.

## Installing

1. Find the game folder: in Steam, right click the game, then
   Manage -> Browse local files.
2. Extract BepInEx into that folder, so `winhttp.dll` sits next to
   `Horse Riding Classic.exe`. Launch the game once and quit, which creates the
   `BepInEx/` subfolders.
3. Extract the plugin zip into the same game folder. It is laid out to merge, so
   the plugin lands in `BepInEx/plugins/`.

## Connecting

Launch the game and press **F1** to open the Archipelago panel. Fill in the
server address, port, slot name and password, then Connect.

Credentials can also be pre-filled without launching the game, by editing
`BepInEx/config/com.barretglass.hrc.archipelago.cfg` after the first run.

You must connect before starting or continuing a game. Your save file is chosen
by the room you are connected to, so the mod does not know which file to load
until it has connected at least once.

## Save files

**Your vanilla save is never touched.** Modded saves live in their own folder
under `%USERPROFILE%\AppData\LocalLow\Juice Cube\Horse Riding Classic\AP\`, one
folder per seed and slot.

Practical consequences:

- Reconnecting to the same room always resumes the same save, even if the
  host has moved it to a different address or port.
- Connecting to a *different* seed or slot returns you to the main menu and
  starts that run fresh. Your other run is kept, not deleted; reconnect to that
  room later and it resumes.
- If you lose connection mid-game you can keep playing. Checks are recorded
  locally and sent when you reconnect.

## Configuring your yaml

Generate a template from the Archipelago launcher, or on the website's options
page. The settings worth knowing:

| Option | Default | Notes |
|---|---|---|
| `goal_condition` | `apples_received` | What opens the grate. |
| `apple_goal_requirement` | 80 | Used by both goal conditions. |
| `include_horses` | false | Only applies in `apples_collected` mode. |
| `desert_access` | 20 | Apples received to open each area gate. |
| `farm_access` | 40 | |
| `city_access` | 60 | |
| `factory_access` | 80 | |

The access thresholds count apples **received from the multiworld**, not apples
you collect.

Two things generation will refuse, because they cannot be satisfied:

- Any access threshold above `apple_goal_requirement`, in any seed. This is the
  easy mistake: lowering the goal to 40 and leaving `city_access` at its default
  of 60.
- **In a solo seed only**, an access threshold above what this world alone can
  supply before that gate. On the default thresholds that limit is 22, 42, 64
  and 87 for desert, farm, city and factory. The error message names the number.

The second one does not apply in a multiworld, because your apples are placed in
other players' worlds as often as your own, so nothing about your own map limits
how many you can receive. A setting that is refused solo is often perfectly fine
once there is a second game in the room.

If you are generating a **solo** seed at the defaults, note that
`factory_access` sits exactly on its ceiling there, which means all 80 apples
have to be placed before the factory. It generates, but it is the tightest
configuration in the game. Lowering `factory_access` to around 70 gives fill
plenty of room without changing how the run feels.
