# Map Map - A Game About Maps Setup Guide

## Required software

- [Map Map - A Game About Maps](https://store.steampowered.com/app/2702260/) (Steam, Windows)
- [BepInEx 6 (bleeding edge), Unity IL2CPP, Windows x64](https://builds.bepinex.dev/projects/bepinex_be) —
  tested with build 788
- The latest Map Map Archipelago release (the mod zip and `mapmap.apworld`) from this project's GitHub releases page
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.7 or newer

## Installing the mod

1. **Install BepInEx.** Extract the BepInEx zip into the Map Map game folder (the folder containing `Map Map.exe`).
   In Steam: right-click the game → *Manage* → *Browse local files*.
2. **Run the game once** and wait at the main menu, then quit. The first launch with BepInEx is slow (it prepares
   files it needs); later launches are normal.
3. **Install the mod.** Extract the Map Map Archipelago zip into the same game folder. You should end up with
   `BepInEx\plugins\MapMapArchipelago\MapMapArchipelago.dll`.

## Generating a game

1. Put `mapmap.apworld` into your Archipelago install's `custom_worlds` folder (only needed by whoever generates).
2. Create your YAML. The easiest way is the Archipelago Launcher's *Generate Template Options*, then edit the
   `Map Map - A Game About Maps` template. An example is included in the release.
3. Generate and host as usual.

## Connecting

1. Start the game. An **Archipelago** panel appears on the main menu.
2. Enter the **Server** (for example `archipelago.gg:38281`), your **Slot name**, and the **Password** if the room
   has one, then click **Connect**.
3. Once it says *Connected*, click **New Game** for a new seed, or **Continue** to resume it.

**Connect before you load a save.** While connected, the mod uses a separate save file for that seed, so your normal
Map Map save is never touched. When you're not connected, the game uses your normal save as usual.

If the connection drops, the mod reconnects by itself and keeps track of any checks you made in the meantime.

## Hints and chat

Use the **Archipelago Text Client** from the Archipelago Launcher, connected to the same room.

## Troubleshooting

- The mod's log is in `BepInEx\LogOutput.log` in the game folder. Please include it with any bug report.
- Your connection settings are saved in `BepInEx\config\mapmap.archipelago.cfg`.
- Each seed's progress is stored next to the game's saves in `Map Map_Data\Savegame\MapMap\`
  (`savegame00_ap_<seed>_<slot>.sav` and `ap_state_<seed>_<slot>.json`).
