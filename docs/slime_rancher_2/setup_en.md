# Slime Rancher 2 Multiworld Setup Guide

## Required Software

- [Slime Rancher 2](https://store.steampowered.com/app/1657630/Slime_Rancher_2/) (Steam, version 1.1.0 or later)
- [BepInEx 6 (IL2CPP x64)](https://github.com/BepInEx/BepInEx/releases) — **must be the IL2CPP build, not the Mono build**
- [SlimeRancher2-AP mod](https://github.com/Rhelys/SlimeRancher2-AP/releases/latest) — the Archipelago integration mod

## Installation

### 1. Install BepInEx 6

1. Download the latest **BepInEx 6 IL2CPP x64** release (the file named something like
   `BepInEx_win-x64_6.x.x.zip`).
2. Extract the archive directly into your Slime Rancher 2 game folder
   (e.g. `C:\Program Files (x86)\Steam\steamapps\common\Slime Rancher 2`).
   After extraction you should see a `BepInEx` folder and `doorstop_config.ini` next to `SlimeRancher2.exe`.
3. Launch the game once and close it — BepInEx will generate its folder structure and the
   `BepInEx/interop/` DLLs it needs.

### 2. Install the SlimeRancher2-AP Mod

1. Download `SlimeRancher2-AP.zip` from the [latest release](https://github.com/Rhelys/SlimeRancher2-AP/releases/latest).
2. Extract the contents into:
   ```
   <SR2 game folder>/BepInEx/plugins/SlimeRancher2-AP/
   ```
   The folder should contain `SlimeRancher2-AP.dll` (and companion DLLs).
3. Launch the game to confirm BepInEx loads the mod — you should see a small connection panel
   accessible from the **Options** menu.

## Connecting to an Archipelago Server

1. Open Slime Rancher 2 and navigate to the **Options** menu (gear icon on the title screen).
2. Select the **Archipelago** tab (the AP logo in the category list on the left).
3. Enter your connection details:
   - **Host** — server address (e.g. `archipelago.gg`)
   - **Port** — server port (default `38281`)
   - **Slot Name** — your player name as set in your YAML options file
   - **Password** — leave blank if the room has no password
4. Click **Connect**.  The status line will show `Connected` when successful.
5. Start a **New Game** while connected — the save slot will be bound to your AP session
   and will auto-connect on future loads.

## Configuring Your YAML

Download a template YAML from the [Archipelago settings page](https://archipelago.gg) and
edit it to your liking.  Key options:

| Option | Description |
|---|---|
| `goal` | Win condition — `labyrinth_open`, `newbucks`, `prismacore_enter`, `prismacore_stabilize`, or `slimepedia` |
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
