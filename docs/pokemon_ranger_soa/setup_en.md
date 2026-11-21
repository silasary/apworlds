# Pokémon Ranger: Shadows of Almia Setup Guide

It's possible to play the randomizer aspects seperate from Archipelago. 
This will still require Archipelago installed to randomize. As long as the right settings are used the rom is then playable freely on any device.

## Required Software

- [Archipelago](https://archipelago.gg/tutorial/Archipelago/setup_en#installing-the-archipelago-software)
- An American Pokémon Ranger: Shadows of Almia ROM. The Archipelago community cannot provide this.
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) 2.10 or later (earlier versions are untested but likely usable)
  - **Note**: Windows users must run a prereq installer first, found at the above link.


To install this apworld, after installing Archipelago, double click the apworld or place it in custom_worlds in the source directory

### Configuring BizHawk

Once you have installed BizHawk, open `EmuHawk.exe` and change the following settings:

- Under `Config > Customize`, check the "Run in background" option to prevent disconnecting from the client while you're
tabbed out of EmuHawk.
- Open a `.nds` file in EmuHawk and go to `Config > Controllers…` to configure your inputs. If you can't click
`Controllers…`, load any `.nds` ROM first.
- Consider clearing keybinds in `Config > Hotkeys…` if you don't intend to use them. Select the keybind and press Esc to
clear it.

## Generating and Patching a Game

1. Create the default options file ([YAML](https://archipelago.gg/tutorial/Archipelago/advanced_settings_en))
   2. Open `ArchipelagoLauncher.exe`
   3. search and click "Generate Template Options".
   4. Copy it to the "Players" directory and edit it to your liking.
3. Follow the general Archipelago instructions for [generating a game](https://archipelago.gg/tutorial/Archipelago/setup_en#generating-a-game).
   4. Create a YAML
   5. This will generate an zip file for you. 
   5. Your patch file is inside with the `.apprsoa` file extension. 
   6. Extract it.
4. Open `ArchipelagoLauncher.exe`
5. Select "Open Patch" on the left side and select your patch file.
   6. **WARNING** for full game randomization this step will take minutes.
6. If this is your first time patching, you will be prompted to locate your vanilla ROM.
7. A patched `.nds` file will be created in the same place as the patch file.
8. On your first time opening a patch with BizHawk Client, you will also be asked to locate `EmuHawk.exe` in your
BizHawk install.

This should now open a BizHawk Client window, Bizhawk and a Lua console. 
You can minimize the Lua console, it is required for the connection for the prior two

If you have generated a randomizer only patch, you can stop here and put in your preferred device.

## Connecting to a Server

By default, opening a patch file will do steps 1-5 below for you automatically. Even so, keep them in your memory just
in case you have to close and reopen a window mid-game for some reason.

1. Pokemon Ranger uses Archipelago's BizHawk Client. If the client isn't still open from when you patched your game,
you can re-open it from the launcher.
2. Ensure EmuHawk is running the patched ROM.
3. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing.
4. In the Lua Console window, go to `Script > Open Script…`.
5. Navigate to your Archipelago install folder and open `data/lua/connector_bizhawk_generic.lua`.
6. The emulator and client will eventually connect to each other. The BizHawk Client window should indicate that it
connected and recognized Pokemon Trozei.
7. To connect the client to the server, enter your room's address and port (e.g. `archipelago.gg:38281`) into the
top text field of the client and click Connect.

You should now be able to receive and send items. You'll need to do these steps every time you want to reconnect. 
It is safe to make progress offline with a disconnected client; 
everything will re-sync when you reconnect. 
It is **not safe** to close the emulator before offline achieved locations 
have been sent to the server.