# Creeper World 4 Setup Guide

## Requirements

- Creeper World 4 (Steam, Windows)
- BepInEx 6 (IL2CPP, win-x64) - exact tested build linked in the mod's README
- Archipelago 0.6.7 or newer, if you are the one generating the multiworld
- The CW4Archipelago release zip and cw4.apworld from the mod's releases page.
  **Take both from the same release** - the mod and the apworld share one version
  number and are built as a pair. Mixing them is not blocked, but the mod will
  warn you in-game when it notices.

## Installation

1. Install BepInEx: unzip the BepInEx 6 IL2CPP x64 archive into the Creeper
   World 4 install folder (the one containing CW4.exe).
2. Launch the game once and wait for the main menu, then quit. The first
   launch takes noticeably longer - BepInEx is generating interop assemblies.
3. Unzip the CW4Archipelago release zip into the same game folder. It adds
   BepInEx/plugins/CW4Archipelago/.
4. Launch the game. The main menu now shows the Archipelago connect panel.

## Joining a MultiWorld game

1. Enter the server address and port (e.g. archipelago.gg:38281), your slot
   name, and the room password (if any) in the in-game panel.
2. Press Connect. Mission availability updates to match your received items.

Turn on AutoConnect in `BepInEx/config/com.droha.cw4archipelago.cfg` (or from the
panel) and the mod will connect on its own at the main menu, and reconnect when
you return there - which also re-sends anything you checked while offline.

## Uninstalling

Delete winhttp.dll, doorstop_config.ini, .doorstop_version, changelog.txt,
and the BepInEx and dotnet folders from the game directory.

**One extra step for your saves.** So that a save from one seed can never appear
in another, the mod treats
`Documents/My Games/creeperworld4/saves/farsite` as slot-specific: connecting to
a different slot moves the current contents into
`Documents/My Games/creeperworld4/archipelago/save-archive/<slot>/` and restores
that slot's set. Your original pre-mod campaign saves are archived under the key
`vanilla`.

So if you uninstall while a slot is active, move the contents of
`archipelago/save-archive/vanilla/` back into `saves/farsite/`. Nothing is ever
deleted, but the archive folder is the only place to look for saves that seem to
have vanished. Campaign progress (mcs.dat) is not touched at all.
