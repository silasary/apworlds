# Setup Guide for Spyro 2 Archipelago

## Playing a Game with Spyro 2

### Required Software

Important: At this time, Mac is not supported, since I do not have access to a device to test.
Want to help with testing for Mac support? Feel free to reach out!

- One of the following supported emulators:
  - [Duckstation](https://www.duckstation.org) - Detailed installation instructions for Duckstation can be found at [this link](https://github.com/ArsonAssassin/Archipelago.Core/wiki/How-to-start-playing-a-game-using-this-library). This option has been tested more for Spyro 2 by the community. Linux users will need the **Windows Portable** option.
  - [Bizhawk](https://tasvideos.org/BizHawk/ReleaseHistory) - Tested on versions 2.9.1 and 2.10; with less recent versions of Archipelago, you may need less recent versions.
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) version 0.6.1 or later.
- The [Spyro 2 Archipelago .apworld](https://github.com/Uroogla/S2AP/releases). If you are playing on Duckstation, you also need the Client (within the s2ap .zip file).
- A legal US Spyro 2: Ripto's Rage ROM.  We cannot help with this step.

Linux Duckstation users will need a recent version of Wine (tested with Winetricks version 20260125-1.1).

### Create a Config (.yaml) File

#### What is a config file and why do I need one?

See the guide on setting up a basic YAML at the Archipelago setup guide: [Basic Multiworld Setup Guide](https://archipelago.gg/tutorial/Archipelago/setup_en)

This also includes instructions on generating and hosting the file.  The "On your local installation" instructions
are particularly important.

#### Where do I get a config file?

Run `ArchipelagoLauncher.exe`.  You can run Generate Template Options, copy `Spyro 2.yaml`, fill it out, and place
it in the `players` folder. On newer versions of Archipelago, you can choose Options Creator for a more visual
approach.

### Generate and host your world

Run `ArchipelagoGenerate.exe` (or select Generate from the launcher) to build a world from the YAML files in your `players` folder.  This places
a `.zip` file in the `output` folder.

You may upload this to [the Archipelago website](https://archipelago.gg/uploads) or host the game locally with
`ArchipelagoHost.exe`. It's generally recommended to use the website.

### Setting Up Spyro 2 for Archipelago

Please follow the options below corresponding to your choice of emulator. Linux users, please note the amended instructions given below.

#### For Duckstation:

1. Download the s2ap .zip file and spyro2.apworld from the GitHub page linked above.
2. Double click the apworld to install to your Archipelago installation.
3. Extract the S2AP .zip file and note where S2AP.Desktop.exe is.
4. Open Duckstation and load into Spyro 2: Ripto's Rage.
5. In Duckstation, navigate to Settings > Game Properties > Console and select "Interpreter" under "Execution Mode".
6. Start a new game (or if continuing an existing seed, load into that save file).
7. Open S2AP.Desktop.exe, the Spyro 2 client.  You will likely want to do so as an administrator.
8. In the top left of the Spyro 2 client, click the "burger" menu to open the settings page.
9. Enter your host, slot, and optionally your password.
10. Click Connect.
11. Start playing!

#### For BizHawk:

1. Download spyro2.apworld from the GitHub page linked above. You do not need the s2ap .zip file.
2. Double click the apworld to install to your Archipelago installation.
4. Open Bizhawk and load into Spyro 2: Ripto's Rage.
5. If you're using BizHawk 2.7 or 2.8, go to Config > Customize. On the Advanced tab, switch the Lua Core from NLua+KopiLua to Lua+LuaInterface, then restart EmuHawk.
6. Under Config > Customize, check the "Run in background" option to prevent disconnecting from the client while you're tabbed out of the emulator.
7. Under Config > Preferred Cores > PSX, select NymaShock.
8. Within the Archipelago Launcher, select BizHawk Client.
9. In EmuHawk, go to Tools > Lua Console. This window must stay open while playing. Be careful to avoid clicking "TAStudio" below it in the menu, as this is known to delete your savefile.
10. In the Lua Console window, go to Script > Open Script.
11. Navigate to your Archipelago install folder and open data/lua/connector_bizhawk_generic.lua. The emulator and client will eventually connect to each other. The BizHawk Client window should indicate that it connected and recognized Spyro 2.
12. To connect the client to the server, enter your room's address and port (e.g. archipelago.gg:38281) into the top text field of the client and click Connect.
13. Enter your slot name when prompted.
14. Start a new game (or if continuing an existing seed, load into that save file).
15. Start playing!

#### Linux

For Duckstation:

Duckstation requires the **Windows portable** version of Duckstation, as well as Wine (tested successfully on Winetricks version 20260125-1.1).  Keep all relevant directories (such as your bios files and the client) within the same Wine prefix. Otherwise, setup matches the Windows version.

For BizHawk:

BizHawk works as a standalone option on Linux, meaning it does not require Wine.

### Optional Setup

There is a [Poptracker](https://poptracker.github.io) package for this game, which can help you identify which checks are available.
It can be found at https://github.com/routhken/Spyro_2_tracker/releases.

[Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases) is partially supported as well, but you may encounter
issues if you randomize your yaml settings file.