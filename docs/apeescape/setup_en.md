# Ape Escape - Setup Guide

## Required Software
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases). Please use version 0.6.1 or later for integrated
BizHawk support.
- Ape Escape (USA) ISO or BIN/CUE. Either an original black label version or the Greatest Hits version should work.
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) 2.7 to 2.9.1. Bizhawk version 2.10 or other emulators are **not** supported.
- The latest `apeescape.apworld` file. You can find this on the [Releases page](https://github.com/Thedragon005/Archipelago-Ape-Escape/releases/latest). Put this in your `Archipelago/custom_worlds` folder.

## Configuring BizHawk
Once you have installed BizHawk, open `EmuHawk.exe` and change the following settings:

- If you're using BizHawk 2.7 or 2.8, go to `Config > Customize`. On the Advanced tab, switch the Lua Core from
`NLua+KopiLua` to `Lua+LuaInterface`, then restart EmuHawk. (If you're using BizHawk 2.9, you can skip this step.)
- Under `Config > Customize`, check the "Run in background" option to prevent disconnecting from the client while you're
tabbed out of EmuHawk.
- Under `Config > Preferred Cores > PSX`, select NymaShock.
- Open any PlayStation game in EmuHawk and go to `Config > Controllers…` to configure your inputs. If you can't click
`Controllers…`, it's because you need to load a game first.
- Ape Escape is very particular about its analog setup: go to `PSX > Settings` and select `Sync Settings`. Change Virtual
Port 1 to Dual Analog to help prevent deadzone issues.
You may need to invert Sensitivity for the up/down axis to -100%.
This can be found under Analog Controls through `Config > Controllers…`.
Depending on your controller, you may also want to tweak the Deadzone. Something like 6% is recommended for a DualShock 4.
- Consider clearing keybinds in `Config > Hotkeys…` if you don't intend to use them. Select the keybind and press Esc to
clear it.

## Generating a Game

1. Create your options file (YAML). After installing the `apeescape.apworld` file, you can generate a template within the Archipelago Launcher by clicking `Generate Template Settings`.
2. Follow the general Archipelago instructions for [generating a game](https://archipelago.gg/tutorial/Archipelago/setup/en#generating-a-game).
3. Open `ArchipelagoLauncher.exe`
4. Select "BizHawk Client" in the right-side column. On your first time opening BizHawk Client, you will also be asked to
locate `EmuHawk.exe` in your BizHawk install.

## Connecting to a Server

1. If EmuHawk didn't launch automatically, open it manually.
2. Open your Ape Escape (USA) ISO or CUE file in EmuHawk.
3. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing. Be careful to avoid clicking "TAStudio" below it in the menu, as this is known to delete your savefile.
4. In the Lua Console window, go to `Script > Open Script…`.
5. Navigate to your Archipelago install folder and open `data/lua/connector_bizhawk_generic.lua`.
6. The emulator and client will eventually connect to each other. The BizHawk Client window should indicate that it
connected and recognized Ape Escape.
7. To connect the client to the server, enter your room's address and port (e.g. `archipelago.gg:38281`) into the
top text field of the client and click Connect.

You should now be able to receive and send items. You'll need to do these steps every time you want to reconnect.

## Ending a session
- Ape Escape does not automatically save your progress. When you're done playing, either save your game to a virtual
memory card in the save station (recommended) or make a savestate to resume later. When reconnecting later, Archipelago
will send you any items you received while disconnected.
