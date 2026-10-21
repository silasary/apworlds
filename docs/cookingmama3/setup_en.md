# Cooking Mama 3 Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- A US Copy of Cooking Mama 3. The Archipelago Community cannot provide this.
  - hash: `36406ED5497799060624E09622BC09D7`
  - other versions are not currently supported
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) 2.10 or later

### Configuring BizHawk

Once you have installed BizHawk, open `EmuHawk.exe` and change the following settings:

- Under `Config > Customize`, check the "Run in background" option to prevent disconnecting from the client while you're
tabbed out of EmuHawk.
- Open a `.nds` file in EmuHawk and go to `Config > Controllers…` to configure your inputs. If you can't click
`Controllers…`, load any `.nds` ROM first.
  - IMPORTANT: ensure that the Microphone button is bound to something easily accessible. This defaults to M. When held, this button provides white noise to the game.
- Consider clearing keybinds in `Config > Hotkeys…` if you don't intend to use them. Select the keybind and press Esc to
clear it.

## Optional Software

- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker)

## Generating and Loading a Game

1. Create your options file (YAML).
2. Follow the general Archipelago instructions for [generating a game](/tutorial/Archipelago/setup_en#generating-a-game).
This will generate an output file for you.

## Connecting to a Server

1. Cooking Mama 3 uses Archipelago's BizHawk Client. You can open this using the Archipelago Launcher, or by using the direct executable in the Archipelago folder.
2. Ensure EmuHawk is open and running the vanilla US ROM.
3. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing.
4. In the Lua Console window, go to `Script > Open Script…`.
5. Navigate to your Archipelago install folder and open `data/lua/connector_bizhawk_generic.lua`.
6. The emulator and client will eventually connect to each other. The BizHawk Client window should indicate that it
connected and recognized the game.
7. To connect the client to the server, enter your room's address and port (e.g. `archipelago.gg:38281`) into the
top text field of the client and click Connect. Input your slot name to connect.

You should now be able to receive and send items. You'll need to do these steps every time you want to reconnect.
