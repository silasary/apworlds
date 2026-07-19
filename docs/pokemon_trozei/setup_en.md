# Pokémon Trozei / Link Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- A European Pokémon Link ROM. The Archipelago community cannot provide this.
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) 2.10 or later (earlier versions are untested but likely usable)
  - **Note**: Windows users must run a prereq installer first, found at the above link.

### Configuring BizHawk

Once you have installed BizHawk, open `EmuHawk.exe` and change the following settings:

- Under `Config > Customize`, check the "Run in background" option to prevent disconnecting from the client while you're
tabbed out of EmuHawk.
- Open a `.nds` file in EmuHawk and go to `Config > Controllers…` to configure your inputs. If you can't click
`Controllers…`, load any `.nds` ROM first.
- Consider clearing keybinds in `Config > Hotkeys…` if you don't intend to use them. Select the keybind and press Esc to
clear it.

## Optional Software

- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker) + BizHawk w/ Universal Tracker
  - Check UT's channel and its threads on the discord server for more information and instructions

## Generating and Patching a Game

1. Create your options file (YAML). You can make one by editing the default YAML in
2. Follow the general Archipelago instructions for [generating a game](/tutorial/Archipelago/setup_en#generating-a-game).
This will generate an output file for you. Your patch file will have the `.applink` file extension.
3. Open `ArchipelagoLauncher.exe`
4. Select "Open Patch" on the left side and select your patch file.
5. If this is your first time patching, you will be prompted to locate your vanilla ROM.
6. A patched `.nds` file will be created in the same place as the patch file.
7. On your first time opening a patch with BizHawk Client, you will also be asked to locate `EmuHawk.exe` in your
BizHawk install.

This should now open a BizHawk Client window, Bizhawk and a Lua console. 
You can minimize the Lua console, it is required for the connection for the prior two

## Connecting to a Server

By default, opening a patch file will do steps 1-5 below for you automatically. Even so, keep them in your memory just
in case you have to close and reopen a window mid-game for some reason.

1. Pokemon Trozei uses Archipelago's BizHawk Client. If the client isn't still open from when you patched your game,
you can re-open it from the launcher.
2. Ensure EmuHawk is running the patched ROM.
3. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing.
4. In the Lua Console window, go to `Script > Open Script…`.
5. Navigate to your Archipelago install folder and open `data/lua/connector_bizhawk_generic.lua`.
6. The emulator and client will eventually connect to each other. The BizHawk Client window should indicate that it
connected and recognized Pokemon Trozei.
7. To connect the client to the server, enter your room's address and port (e.g. `archipelago.gg:38281`) into the
top text field of the client and click Connect.

You should now be able to receive and send items. You'll need to do these steps every time you want to reconnect. It is safe to make progress offline with a disconnected client; everything will re-sync when you reconnect. It is **not safe** to close the emulator before offline achieved locations have been sent to the server.
