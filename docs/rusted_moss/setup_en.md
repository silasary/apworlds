# Rusted Moss for Archipelago Setup and Usage Guide

## Required Software
* Latest release of [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases). Currently tested/working on version 0.6.4
* A legal PC copy of Rusted Moss
   * Tested on version 3.98
   * Steam version is supported, itch.io version currently untested

## Installing the Archipelago Client for Rusted Moss
1. Install the [Rusted Moss Mod Manager](https://github.com/Harlem512/rm-mod-manager)
2. Install the Archipelago Client mod using the mod manager
3. Enable the Archipelago Client mod and restart the game

### If the latest version of the Archipelago Client mod is not available in the Rusted Moss Mod Manager follow these steps:
1. Install the [Rusted Moss Mod Manager](https://github.com/Harlem512/rm-mod-manager) (yes you still need it)
2. Download the latest version of the Archipelago Client mod from [here](https://github.com/dgrossmann144/RustedMossArchipelagoClient/releases/latest)
3. Extract the zip file and place the contents (the archipelago folder) in the `/AppData/Local/Rusted_Moss/mods/rmml` folder
4. Make sure the the mod is enabled in the Rusted Moss Mod Manager interface in game

## Generating and Hosting a Seed
* If you have not used Archipelago before, I highly recommend reading through the [Archipelago Setup Guide](https://archipelago.gg/tutorial/Archipelago/setup/en) to gain an understanding of how Archipelago works and to better understand the steps below
1. Download the `rusted_moss.apworld` and `RustedMoss.yaml` files from the latest [Rusted Moss Archipelago](https://github.com/dgrossmann144/Archipelago/releases) release
2. Put the `rusted_moss.apworld` file in the `/Archipelago/custom_worlds` folder where you installed Archipelago
3. Edit a copy of the `RustedMoss.yaml` to configure the slot name and game options. Descriptions of the options are contained within
4. Place the edited `RustedMoss.yaml` in the `/Archipelago/Players` folder
5. Run `ArchipelagoGenerate.exe` from the `/Archipelago` folder
6. Upload the `AP_#######.zip` file from `/Archipelago/output` to [Archipelago website](https://archipelago.gg/uploads) to host the game

## Joining an Archipelago Game in Rusted Moss
* Optional: backup your save files located in `/AppData/Local/Rusted_Moss`
1. Open Rusted Moss and start a new save file, the mod has primarily been tested on Speedrun mode, but Normal and Flexible should work as well
   * Maya and Ameli mode are unsupported
   * Using [Gimmick mod](https://github.com/Harlem512/rm-mod-database#gimmick) is supported (you must install and enable Gimmick manually)
2. Enter the slot name, password, and url for the hosted game and click connect
3. If the menu hangs on connecting, click cancel and make sure the connection info is correct