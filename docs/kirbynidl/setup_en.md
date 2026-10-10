# Kirby Nightmare in Dream Land Setup Guide

Kirby Nightmare in Dreamland uses the common Bizhawk client connector, and so setup should be familiar to any players of other GBA AP games. 

## Required Software
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [The Kirby Nightmare in Dream Land apworld](https://github.com/VizCount467/Kirby-NIDL-AP)
- Bizhawk emulator (version 2.7 or above)
- A US Kirby Nightmare in Dreamland ROM file

### Configuring Bizhawk
- If you're using BizHawk 2.7 or 2.8, go to Config > Customize. On the Advanced tab, switch the Lua Core from NLua+KopiLua to Lua+LuaInterface, then restart EmuHawk. (If you're using BizHawk 2.9, you can skip this step.)

## Generating and Patching a Game
1. Create your options file (YAML). You can make by using "Generate Template Options" in the Archipelago Options.
2. Follow the general Archipelago instructions for generating a game. This will generate an output file for you. Your patch file will have the .apknidl file extension.
Open ArchipelagoLauncher.exe
3. Select "Open Patch" in the Archipelago Launcher and select your patch file. Alternatively, drag the .apknidl patch onto the AP launcher window, or simply open the patch file file itself with the Archieplago program
4. If this is your first time patching, you will be prompted to select your unmodified US Kirby Nightmare in Dream Land ROM.
5. A patched .gba file will be created in the same place as the patch file.
6. On your first time opening a patch with BizHawk Client, you will also be asked to locate EmuHawk.exe in your BizHawk install.

## Connecting to a Server
By default, opening a patch file will do steps 1-5 below for you automatically. Even so, this is good info to know if your session is disrupted for whatever reason.

1. Kirby Nightmare in Dream Land uses Archipelago's BizHawk Client. If the client isn't still open from when you patched your game, you can re-open it from the launcher.
2. Ensure EmuHawk is running the patched ROM.
3. In EmuHawk, go to Tools > Lua Console. This window must stay open while playing.
4. In the Lua Console window, go to Script > Open Script….
5. Navigate to your Archipelago install folder and open data/lua/connector_bizhawk_generic.lua.
6. The emulator and client will eventually connect to each other. The BizHawk Client window should indicate that it connected and recognized Kirby Nightmare in Dream Land.
7. To connect the client to the server, enter your room's address and port (e.g. archipelago.gg:38281, localhost:38247) into the top text field of the client and click Connect. 
  - Connection should be established on the in-game title screen or startup menu before starting a file - certain systems *will* break otherwise.

You should now be able to receive and send items. You'll need to do these steps every time you want to reconnect. Kirby Nightmare in Dreamland relies on the AP connection to send and receive items -- you cannot obtain any items without a connection, nor will any locations you check be reflected in the multiworld. Thus, playing without a connection is completely useless, and may cause certain systems to break. 


