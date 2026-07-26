# Slime Rancher 2 Multiworld Setup Guide

## Required Software

- [Slime Rancher 2](https://store.steampowered.com/app/1657630/Slime_Rancher_2/) (Steam)
- BepInEx-Unity.IL2CPP x64, bleeding-edge build v755: [Windows and Linux][bepinex-win-linux],
  [MacOS][bepinex-macos]
- The `.apworld` file and the SlimeRancher2-AP mod, both from the
  [SlimeRancher2-AP GitHub releases page][sr2ap-releases]

## Installation

### 1. Install BepInEx

1. Download the BepInEx build for your OS from the links above.
2. Extract all of the BepInEx files into the game's root folder — the one containing the
   game's `.exe`. For Steam users, this is the folder that opens when you right-click
   Slime Rancher 2, select **Manage**, then **Browse local files**.
3. **Linux players only:** add `WINEDLLOVERRIDES="winhttp=n,b" %command%` to the game's Steam
   launch options. To do this, right-click Slime Rancher 2 in Steam, go to **Properties**, and
   enter it under **Launch Options** on the **General** tab. (Thanks to izzy for the
   troubleshooting on this!)
4. Launch the game once, then close it — this lets BepInEx generate its folder structure.

### 2. Install the SlimeRancher2-AP Mod

1. Download the mod archive from the [SlimeRancher2-AP releases page][sr2ap-releases].
2. Unzip the mod folder into `BepInEx/Plugins` inside your game folder.

## Connecting to an Archipelago Server

1. Open Slime Rancher 2 and go to **Settings**.  There should be an **Archipelago** menu option.
2. Enter your connection details (host, port, and slot name) and connect to the server.
   **You must connect before starting a new game** — connecting after the fact will not bind
   an existing save to your AP session.
3. Once connected, start a **New Game** in the slot of your choice and enjoy!

## Configuring Your YAML

Download a template YAML from the [Archipelago settings page](https://archipelago.gg) and
edit it to your liking.  Key options:

| Option | Description |
|---|---|
| `goal` | Win condition — `labyrinth_open`, `newbucks`, `prismacore`, or `slimepedia` |
| `randomize_pods` | Include Treasure Pods as location checks (default: on) |
| `randomize_gordos` | Include Gordo Slimes as location checks (default: on) |
| `randomize_map_nodes` | Include Map Data Nodes (default: on) |
| `randomize_slimepedia` | Include Slimepedia Slimes entries as location checks (default: off) |
| `randomize_slimepedia_resources` | Include Slimepedia Resources entries as location checks (default: off) |
| `randomize_research_drones` | Include Research Drones and their archive pages (default: off). Requires the Drone Archive Key item for archive checks. |
| `randomize_ghostly_drones` | Include Ghostly Drones (default: off) |
| `region_access_mode` | `vanilla` — gates work as normal (default); `locations` — gates are blocked until Region Access item received; `bundled` — same as locations, also grants zone teleporter blueprint on access |
| `conversation_checks` | Which rancher conversation gifts become location checks (`none` / `conditional` / `all`) |
| `death_link` | Dying sends a death to all DeathLink players (default: off) |

## Offline Play

The mod supports offline play.  If you lose your connection mid-session:

- Location checks are saved locally and flushed to the server when you reconnect.
- Item notifications from scouted data are shown even while offline.
- Your save slot binding persists — just re-open the game and the mod will reconnect automatically on load.

## Troubleshooting

**The Archipelago tab is not showing in Options**
: Confirm BepInEx loaded the mod by checking `BepInEx/LogOutput.log` for a line like
  `[Info   :   BepInEx] Loading SlimeRancher2-AP`.

**"Could not connect" error**
: Verify the host, port, and slot name are correct.  Ensure the server room is open and the
  game name is `Slime Rancher 2`.

**Items are not being received**
: Make sure you started a New Game *after* connecting — existing vanilla saves are not bound
  to an AP session.

**BepInEx is not loading**
: You must use the **IL2CPP x64** BepInEx build.  The Mono (BepInEx 5) build is not
  compatible with Slime Rancher 2.

[bepinex-win-linux]: https://builds.bepinex.dev/projects/bepinex_be/755/BepInEx-Unity.IL2CPP-win-x64-6.0.0-be.755%2B3fab71a.zip
[bepinex-macos]: https://builds.bepinex.dev/projects/bepinex_be/755/BepInEx-Unity.IL2CPP-macos-x64-6.0.0-be.755%2B3fab71a.zip
[sr2ap-releases]: https://github.com/Rhelys/SlimeRancher2-AP/releases
