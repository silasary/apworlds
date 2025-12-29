# Spyro the Dragon - Setup Guide

## Required Software
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases). Please use version 0.6.1 or later for integrated
BizHawk support.
- Legally obtained Spyro the Dragon (USA) ISO or BIN/CUE.
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) 2.7 to 2.9.1. Bizhawk version 2.10 or other emulators are **not** supported.
- The latest `spyro.apworld` file. You can find this on the [Releases page](https://github.com/gamefreq0/Archipelago/releases/latest). Put this in your `Archipelago/custom_worlds` folder.

## Configuring BizHawk
Once you have installed BizHawk, open `EmuHawk.exe` and change the following settings:

- If you're using BizHawk 2.7 or 2.8, go to `Config > Customize`. On the Advanced tab, switch the Lua Core from
`NLua+KopiLua` to `Lua+LuaInterface`, then restart EmuHawk. (If you're using BizHawk 2.9, you can skip this step.)
- Under `Config > Customize`, check the "Run in background" option to prevent disconnecting from the client while you're
tabbed out of EmuHawk.
- Under `Config > Preferred Cores > PSX`, select NymaShock.
- Open any PlayStation game in EmuHawk and go to `Config > Controllers…` to configure your inputs. If you can't click
`Controllers…`, it's because you need to load a game first.
- Consider clearing keybinds in `Config > Hotkeys…` if you don't intend to use them. Select the keybind and press Esc to
clear it.

## Generating a Game

1. Create your options file (YAML). After installing the `spyro.apworld` file, you can generate a template within the Archipelago Launcher by clicking `Generate Template Settings`.
2. Follow the general Archipelago instructions for [generating a game](https://archipelago.gg/tutorial/Archipelago/setup/en#generating-a-game).
3. Open `ArchipelagoLauncher.exe`
4. Select "BizHawk Client" in the right-side column. On your first time opening BizHawk Client, you will also be asked to
locate `EmuHawk.exe` in your BizHawk install.

## Connecting to a Server

1. If EmuHawk didn't launch automatically, open it manually.
2. Open your Spyro the Dragon (USA) ISO or CUE file in EmuHawk. Don't start a new game from the menu until the client is connected to both BizHawk and the server.
3. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing. Be careful to avoid clicking "TAStudio" below it in the menu, as this is known to delete your savefile.
4. In the Lua Console window, go to `Script > Open Script…`.
5. Navigate to your Archipelago install folder and open `data/lua/connector_bizhawk_generic.lua`.
6. The emulator and client will eventually connect to each other. The BizHawk Client window should indicate that it
connected and recognized Spyro the Dragon.
7. To connect the client to the server, enter your room's address and port (e.g. `archipelago.gg:38281`) into the
top text field of the client and click Connect.

You should now be able to receive and send items. You'll need to do these steps every time you want to reconnect.
