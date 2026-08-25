# SEUM: Speedrunners from Hell — Setup Guide

## Required software

- [SEUM: Speedrunners from Hell](https://store.steampowered.com/app/457960/SEUM_Speedrunners_from_Hell/) (Linux or Windows build)
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) (to generate/host the multiworld)

## Installing the client mod

1. Install [BepInEx 5.4.x](https://github.com/BepInEx/BepInEx/releases) into the game folder
   (the folder containing `Seum.x86_64` on Linux, or `Seum.exe` on Windows).
2. Copy the mod DLLs (`SeumArchipelago.dll`, `Archipelago.MultiClient.Net.dll`,
   `Newtonsoft.Json.dll`) into `BepInEx/plugins/seum-archipelago/`.
3. On Linux, set the Steam launch options for the game to:
   `./run_bepinex.sh %command%`
   (On Windows with BepInEx 5, the game loads BepInEx automatically via winhttp.dll.)
4. On Linux, the game refuses to stay running when launched outside Steam
   (`SteamAPI_RestartAppIfNecessary`). Drop a `steam_appid.txt` containing `457960`
   next to the executable to bypass that, then either launch via Steam with the
   launch option `"<path to game>/run_bepinex.sh" %command%` or run
   `./run_bepinex.sh ./Seum.x86_64` from the game folder directly.
5. Launch the game once to generate `BepInEx/config/dev.seum.archipelago.cfg`, then edit it:

```ini
[Archipelago]
Host = localhost:38281   # or archipelago.gg:PORT
SlotName = YourName      # must match your YAML player name
Password =               # server password, if any
Enabled = true           # false = vanilla behaviour
```

## Generating a multiworld

1. Place the `seum` world folder (or `seum.apworld`) into the `worlds/` directory of your
   Archipelago installation.
2. Create a player YAML (via the launcher's template generator) with:

```yaml
name: YourName
game: SEUM Speedrunners from Hell
SEUM Speedrunners from Hell:
  beer_check: true     # add a check per level for finding its hidden beer can
  gold_check: false    # add a check per level for beating its gold (uber skull) time
```

3. Generate the multiworld and host it with Archipelago.

## Playing

- While `Enabled = true`, the mod uses its own save file
  (`SeumData-ap-<SlotName>.sav` in `~/.config/unity3d/Pine Studio/Seum/` on Linux,
  `%USERPROFILE%\AppData\LocalLow\Pine Studio\Seum\` on Windows).
  Your vanilla save is untouched. On the first AP launch the game will ask you to
  create a profile name again — that's the fresh AP save.
- All 91 campaign levels except F1-1 Labyrinth start locked. Locked levels show a
  lock icon on the bottom level bar and the "locked" animation when you try them.
- Receiving a `... Unlock` item unlocks that level immediately.
- Checks:
  - Beating a level's silver time sends a `... Silver` check. (The game itself
    only counts a level as completed at silver time or better — slower finishes
    get "TOO SLOW" and send no check.)
  - Finding the hidden beer can in a level sends a `... Beer` check (disable
    with `beer_check: false`).
  - Claiming the peak flag in the 16 levels that have one sends a `... Peak` check.
  - With `gold_check` enabled, beating a level's gold time sends a `... Gold` check.
  - Progress already in the AP save is re-sent automatically on reconnect.
- Boss and taunt doors keep their vanilla requirements (8 skulls / 8 taunts of the
  floor) on top of the unlock item — the randomizer logic accounts for this.
- Beat **F9-1 S(A)TAN** to send the goal.
- Connection status is shown in the top-left corner; recent item sends (yours and
  other players') scroll by at the bottom center of the screen.
