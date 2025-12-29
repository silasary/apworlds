# Armored Core Setup Guide

## Required Software
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases). Please use version 0.4.4 or later for integrated
BizHawk support.
- Armored Core .bin rom.
- The MD5 hash of the rom I used is 34A3F5EA63AC6A6E9753E5FD38425D7E
- Make sure to launch a "New Game" for each seed you play.
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) 2.7 or later. Other emulators are not supported.
- The latest `armoredcore.apworld` file. You can find this on the [Releases page](https://github.com/JustinMarshall98/Armored-Core-PSX-Archipelago/releases). Put this in your `Archipelago/lib/worlds` folder.

### Configuring BizHawk

Once you have installed BizHawk, open `EmuHawk.exe` and change the following settings:

- If you're using BizHawk 2.7 or 2.8, go to `Config > Customize`. On the Advanced tab, switch the Lua Core from
`NLua+KopiLua` to `Lua+LuaInterface`, then restart EmuHawk. (If you're using BizHawk 2.9, you can skip this step.)
- Under `Config > Customize`, check the "Run in background" option to prevent disconnecting from the client while you're
tabbed out of EmuHawk.
- Open any Playstation 1 game in EmuHawk and go to `Config > Controllers…` to configure your inputs. If you can't click
`Controllers…`, it's because you need to load a game first.
- Consider clearing keybinds in `Config > Hotkeys…` if you don't intend to use them. Select the keybind and press Esc to
clear it.

## Generating a Game

1. Create your options file (YAML). After installing the `armoredcore.apworld` file, you can generate a template within the Archipelago Launcher by clicking `Generate Template Settings`.
2. Follow the general Archipelago instructions for [generating a game](https://archipelago.gg/tutorial/Archipelago/setup/en#generating-a-game).
3. Open `ArchipelagoLauncher.exe`
4. Select "BizHawk Client" in the right-side column. On your first time opening BizHawk Client, you will also be asked to
locate `EmuHawk.exe` in your BizHawk install.

## Connecting to a Server

1. If EmuHawk didn't launch automatically, open it manually.
2. Open your Armored Core .bin file in EmuHawk.
3. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing. Be careful to avoid clicking "TAStudio" below it in the menu, as this is known to delete your savefile.
5. In the Lua Console window, go to `Script > Open Script…`.
6. Navigate to your Archipelago install folder and open `data/lua/connector_bizhawk_generic.lua`.
7. The emulator and client will eventually connect to each other. The BizHawk Client window should indicate that it
connected and recognized Armored Core (it should do so once the title screen is reached at the earliest).
8. To connect the client to the server, enter your room's address and port (e.g. `archipelago.gg:38281`) into the
top text field of the client and click Connect.

You should now be able to receive and send items. You'll need to do these steps every time you want to reconnect.
It is possible to make progress offline if you're already loaded into a mission when you drop your connection,
but the mission menu restructuring code requires a connection to the Archipelago Bizhawk Client.
The shop menu when Shopsanity is on also requires a connection to the Bizhawk Client to function properly,
you may notice oddities with Part names and descriptions if your connection is lost.
Reconnecting to the server after completing a mission will still send its check out.

## Notes and Limitations

1. As mentioned above, the mission menu and shop restructuring code require a connection to the client and a connection to the server.
2. Checks are sent and received only in the Raven's Nest menu.
3. Missions that are not unlocked yet currently appear in the mission list as Dummy00.
This mission is the Raven Test, you won't get anything for completing it again.
4. The Missions Menu / Shop Menu (when shopsanity is on) sometimes need a moment to structure themselves properly, hover over it for a second
before entering or exit and re-enter to get the properly constructed mission selection options.
Failing to do so for the Mission Menu can rarely result in a crash.
5. When Shopsanity is on, Hidden Parts can be obtained either by someone sending the part to you or picking it up in the level its in.
Once the Hidden Part appears in the shop as a check to be sold however, it will no longer appear in its normal level anymore.