# Ys Origin Setup Guide

## Requirements

- Windows 10 / 11
- **Ys Origin** (Steam), `yso_win.exe`, version **1.1.1.0**
- An [Archipelago](https://archipelago.gg) installation (to generate / host), or
  access to someone who hosts
- Two files from the project's **latest Release**: `ys_origin.apworld` and
  `dinput8.dll`

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

## 4. Install the mod

Copy `dinput8.dll` into your **Ys Origin** folder (next to `yso_win.exe`),
e.g. `...\Steam\steamapps\common\Ys Origin\`. Uninstall by deleting it.

## 5. Connect

Launch the game once and quit — the mod writes **`yso_ap.cfg`** next to the exe.
Edit it:

```ini
host=archipelago.gg
port=12345
slot=YourName
password=
```

`slot` is the **name** from your yaml. Relaunch the game and load a save (or New
Game). The top-right overlay shows your connection, current room, and items;
press **`INSERT`** to toggle it. Open chests / trigger checks and play normally —
the mod swaps in the randomized items and applies items sent to you.

## Troubleshooting

- **No overlay / not connecting:** confirm `dinput8.dll` sits next to
  `yso_win.exe`, and that `yso_ap.cfg` host/port/slot match the room and your
  yaml name. Log: `%TEMP%\yso_ap_mod.log`.
- **Crashes on launch:** verify the game is **v1.1.1.0** and you're using the
  `dinput8.dll` from the matching Release.
- **Starting gear missing:** don't run any other external AP client alongside the
  mod — the mod is the client.
