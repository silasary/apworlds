# Ys Origin Setup Guide

## Requirements

- Windows 10 / 11
- **Ys Origin** (Steam), `yso_win.exe`, version **1.1.1.0**
- An [Archipelago](https://archipelago.gg) installation (to generate / host), or
  access to someone who hosts
- `ys_origin.apworld` from the project's **latest Release**
- The game-side client: [CleriaOre](https://github.com/4rtefakt/CleriaOre/releases/latest)
  (the mod loader) and its **Archipelago mod**,
  `ysorigin.archipelago-<version>.cleriamod` from
  [its latest release](https://github.com/4rtefakt/ys-origin-cleriacore-ap/releases/latest)

## 1. Install the apworld

Copy `ys_origin.apworld` into your Archipelago **`custom_worlds`** folder. The
Launcher's **Generate** will now list **Ys Origin**.

(Building it yourself from source: from the repo root,
`Compress-Archive -Path ys_origin -DestinationPath ys_origin.zip -Force` then
rename `ys_origin.zip` → `ys_origin.apworld`. The archive's top folder must be
`ys_origin`.)

## 2. Make your settings file (YAML)

Start from the `Ys-Origin.yaml` template in the Release (or the Launcher's
"Generate Template Options"). Set your **name** and options:

- `character`: `yunica` / `hugo` / `toal` — the seed is built for this character.
- `goal`: `defeat_darm` / `defeat_all_bosses`
- `statue_checks` / `blessing_checks` / `boss_checks` / `floor_checks`:
  `true` / `false` (default `true`)
- `room_checks`: `true` / `false` (default `false`; adds ~145 filler checks)

Put the yaml in Archipelago's `Players/` folder.

## 3. Generate and host

Use the Archipelago Launcher to **Generate**, then **Host** the resulting seed
(or upload it at [archipelago.gg/uploads](https://archipelago.gg/uploads)). Note
the room's **host / port**.

## 4. Install the client

Run `CleriaOre-Setup-<version>.exe`, then on its **Game** page press **Install
the loader** (CleriaOre finds the game through Steam). Double-click
`ysorigin.archipelago-<version>.cleriamod`: CleriaOre installs the mod and turns
it on. Uninstall with **Remove the loader**.

## 5. Connect

Start the game, press **F1** and open **Mods > Archipelago**. Enter the room's
**Server** (e.g. `archipelago.gg:12345`), your **Slot name** (the **name** from
your yaml) and the **Password** if there is one, then **Connect**. *Connect at
start* reconnects by itself next time. The same page is in CleriaOre's manager
(click the mod in its list).

Start a New Game with the seed's character, or load a save of that seed. The
overlay shows your connection and the items found and received; press
**`INSERT`** to toggle it and **F6** for the chat. Open chests / trigger checks
and play normally: the mod swaps in the randomized items and applies items sent
to you.

The older `dinput8.dll` client from the Releases still works (its settings are
in `yso_ap.cfg` next to `yso_win.exe`), but the CleriaOre mod is the recommended
one. Finish a run with the client it started on: their saves live in different
folders.

## Troubleshooting

- **No overlay / not connecting:** in CleriaOre, check that the loader is
  installed and **Archipelago** is on; on **F1 > Mods > Archipelago**, that the
  server and slot match the room and your yaml name. Log:
  `cleriaore\cleriaore.log` in the game folder.
- **Crashes on launch:** verify the game is **v1.1.1.0**.
- **Starting gear missing:** don't run any other external AP client alongside the
  mod — the mod is the client.
