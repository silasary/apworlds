# Mega Man 7 Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.7 or later
- A Megaman VII (USA) ROM
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) with SNES support

## Installing the APWorld

Download `mm7.apworld` from the latest Mega Man 7 Archipelago release.

Open `ArchipelagoLauncher.exe` and select `Install APWorld`, then choose `mm7.apworld`.

Alternatively, on Windows, you may be able to install the APWorld by double-clicking the `mm7.apworld` file or dragging it onto the Archipelago Launcher.

After installation, Mega Man 7 should appear as an available game when generating a seed.

## Configuring BizHawk

Once you have installed BizHawk, open `EmuHawk.exe` and change the following settings:

- Under `Config > Customize`, check the "Run in background" option to prevent disconnecting from the client while you're tabbed out of EmuHawk.
- Open a SNES ROM in EmuHawk and go to `Config > Controllers...` to configure your inputs. If you can't click `Controllers...`, load any SNES ROM first.
- Consider clearing keybinds in `Config > Hotkeys...` if you don't intend to use them. Select the keybind and press Esc to clear it.

## Generating and Patching a Game

1. Create your options file (YAML). You can make one on the [Mega Man 7 options page](../../../games/Mega%20Man%207/player-options).
2. Follow the general Archipelago instructions for [generating a game](/tutorial/Archipelago/setup_en#generating-a-game). This will generate an output file for you. Your patch file will have the `.apmm7` file extension.
3. Open `ArchipelagoLauncher.exe`.
4. Select "Open Patch" on the left side and select your patch file.
5. If this is your first time patching, you will be prompted to locate your vanilla Mega Man 7 ROM.
6. A patched `.sfc` file will be created in the same place as the patch file.
7. On your first time opening a patch with the SNES Client, you may also be asked to locate `EmuHawk.exe` in your BizHawk install.

## Connecting to a Server

By default, opening a patch file will do some of the steps below for you automatically. Even so, keep them in mind in case you have to close and reopen a window mid-game.

1. Mega Man 7 uses Archipelago's SNES/SNI Client. If the client isn't still open from when you patched your game, you can re-open it from the launcher.
2. Ensure EmuHawk is running the patched ROM.
3. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing.
4. In the Lua Console window, go to `Script > Open Script...`.
5. Navigate to your Archipelago install folder and open `data/lua/Connector.lua`.
6. The emulator and client will eventually connect to each other. The SNES Client window should indicate that it connected and recognized Mega Man 7.
7. To connect the client to the server, enter your room's address and port, such as `archipelago.gg:38281`, into the top text field of the client and click Connect.

You should now be able to receive and send items.

You'll need to follow these connection steps again whenever the emulator or client is restarted.

It is safe to temporarily lose the server connection while the patched ROM remains running. Checks and received items will synchronize again after reconnecting.

The vanilla Mega Man 7 password system does not preserve Archipelago items, location checks, or randomized progression. Use emulator save states if you need to close the emulator and resume the same game later.