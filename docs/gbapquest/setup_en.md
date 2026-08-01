# GBAPQuest Randomizer Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [The GBAPQuest apworld](https://github.com/NewSoupVi/Archipelago/releases)
- [The GBAPQuest ROM](https://github.com/Meliacci/GBAPquest/releases/tag/v0.1.0)
Unlike most other ROM games, as this is an open implementation you *can* indeed just download this ROM. This is a *special case* due to me being the one distributing both the APworld and the GBA ROM.

## Generating and Patching a Game

1. Create your options file (YAML). You can make one on the
[GBAPQuest options page](../../../games/Mega%20Man%203/player-options) or via the Options Creator in your AP-Launcher.
2. Follow the general Archipelago instructions for [generating a game](../../Archipelago/setup/en#generating-a-game). This will generate an output file for you. Your patch file will have the `.apgbpq` file extension.
3. Open The Archipelago Launcher. If on windows it will be called `ArchipelagoLauncher.exe`
4. Select "Open Patch" and select your patch file.
5. If this is your first time patching, you will also be prompted to locate your vanilla GBAPQuest ROM.
6. A patched `.gba` file will be created in the same place as the patch file.
7. If it is you first time opening a patch with BizHawk Client, you will also be asked to locate `EmuHawk.exe` in your BizHawk installation.

## Connecting to a Server

### Setting up the Emulator

If you have just done this, you may be able to skip to [Connecting to the Archipelago Server](#Connecting-to-the-Archipelago-Server)

1. GBAPQuest uses Archipelago's BizHawk Client. If the client isn't still open from when you patched your game, you can re-open it from the launcher.
2. If it is not still open from having patched the ROM, Ensure you are running your Patched ROM in the BizHawk Emulator.
3. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing.
4. In the Lua Console window, go to `Script > Open Script…`. Once it asks you for the script file navigate to your Archipelago install folder and open `{Archipelago Root}/data/lua/connector_bizhawk_generic.lua`.
5. While Keeping Bizhawk and EmuHawk Open, they should continously look for eachother. Eventually the BizHawk Client window will indicate that it has connected and recognized GBAPQuest, and is running the GBAPQuest handler.

### Connecting to the Archipelago Server

1. Ensure you have (Set up your Emulator)[#Setting-up-the-Emulator] to run your GBAPQuest Patched ROM
2. To connect the client to the server, enter your room's address and port (e.g. `archipelago.gg:38281`) into the top text field of the client and click Connect.
3. Enter your Slot Name and Password When and If Asked by the Bizhawk Client.

If you want to Skip Step 3, consider using the Full Slotname, Password, Address and Port into the Top text field in it's Correct format (e.g. `Meliacci:None@archipelago:38281`).

You should now be able to receive and send items. You'll need to do these steps every time you want to reconnect.

If you want to Skip (Setting up your Emulator)[#Setting-up-the-Emulator] Every time you want to play, you may instead choose to Re-open your Patch File.