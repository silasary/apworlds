# Mega Man ZX Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.7 or later.
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) 2.10 or later, with its NDS core (melonDS).
  The world is tested with BizHawk 2.11.
- Your own Mega Man ZX (USA) ROM, game code `ARZE`. The Archipelago community cannot provide it.
- Optional: [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases) and the
  [Mega Man ZX tracker pack](https://github.com/Nekusen/MegaManZX-Tracker/releases) (`mmzx_tracker.zip`).
  Keep the pack zipped. UT asks for it the first time it opens the map tab.
  You can also set its path in `host.yaml`, key `ut_pack_path` under `mmzx_settings`.

## Configuring BizHawk

Once you have installed BizHawk, open `EmuHawk.exe` and change the following settings:

- Go to `Config > Customize`. On the Advanced tab, turn `AutoSaveRAM` off.
- Under `Config > Customize`, check "Run in background".

## Generating and Patching a Game

1. Copy `mmzx.apworld` into the `custom_worlds` folder of your Archipelago install, or double-click it.
2. Create your options file (YAML). Use the Archipelago Launcher's "Generate Template Options" and edit
   `Mega Man ZX.yaml`.
3. Follow the general Archipelago instructions for
   [generating a game](https://archipelago.gg/tutorial/Archipelago/setup/en#on-your-local-installation).
   Your patch file ends in `.apmmzx` and sits inside the output zip.
4. Open `ArchipelagoLauncher.exe`, select "Open Patch" and pick your `.apmmzx` file.
5. The first time, the launcher asks for your Mega Man ZX (USA) ROM. It is checked against the known USA hash.
6. A patched `.nds` file is created next to the patch file. It is your copy of the game and must not be shared.
7. The first time, the BizHawk Client also asks where `EmuHawk.exe` is.

## Connecting to a Server

Opening the patch file normally does steps 1 to 5 for you. Keep them in mind in case you have to reconnect.

1. Mega Man ZX uses Archipelago's BizHawk Client. If it is not open, start it from the launcher.
2. Make sure EmuHawk is running the patched `.nds`.
3. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing.
4. In the Lua Console, go to `Script > Open Script...`.
5. Open `data/lua/connector_bizhawk_generic.lua` from your Archipelago install folder.
6. The client window should say it connected and recognised Mega Man ZX. The slot name is read from the ROM.
7. Enter your room's address and port (for example `archipelago.gg:38281`) in the top field and click Connect.

The client must stay connected while you play. It grants every item, accepts the mission of each area you enter and
handles teleports. If the connection drops, reconnect: your checks and items are restored from the game and the
server.

## Troubleshooting

- "No handler was found for this game": update BizHawk to 2.10 or later, or check that the loaded `.nds` is the
  patched one. A vanilla ROM is rejected; open the `.apmmzx` first.
- New Game played the intro instead of starting at your Transerver: check the game you opened is the one generated
  with `.apmmzx`, and make sure you're connected to the client.
- The game does not save or loads an old save: turn `AutoSaveRAM` off (see above) and restart EmuHawk.
- You cannot get out of a room or a shutter stays closed: use "Go to Transerver" from the pause menu or
  `/mmzx_teleport`. If it still doesn't work, try to hit on "Abort Mission" in any Transerver"
- The tracker's map tab is empty: give Universal Tracker the `mmzx_tracker.zip` pack, still zipped.
- Items you received do not show up: they are applied only in gameplay, not in menus or cutscenes.
  If the client is disconnected, reconnect.
