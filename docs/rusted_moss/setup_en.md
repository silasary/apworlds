# Rusted Moss for Archipelago Setup and Usage Guide

## Required Software
* Latest release of [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases). Currently tested/working on version 0.5.1
* A legal PC copy of Rusted Moss
   * Tested on version 1.76
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
1. Open Rusted Moss and start a new save file, the mod has primarily been tested on Speedrun mode, but Normal and Flexible should mostly work as well
   * Maya and Ameli mode are unsupported
2. The game will appear to have gone back to the main menu, this is expected
3. A new file named f_save_#.archipelago.save will have been created in the save data folder `/AppData/Local/Rusted_Moss`
   * These file names are 0 indexed, so the first save file is f_save_0, and the last (sixth) save file is f_save_5
4. Open the file and edit the url, port, slotName, and slotPassword fields with your connection info
5. Attempt to create the file in the same slot again, the game should load after waiting on the menu screen for a little while while the connection is established
   * If you are booted back to the main menu again, check your connection info again, or view the log file in the `/AppData/Local/Rusted_Moss/mods` folder
