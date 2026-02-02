# Nodebuster for Archipelago Setup Guide

## Required Software

* [Nodebuster (Steam)](https://store.steampowered.com/app/3107330)
    * Windows
* [Godot 4.x Mod Loader](https://github.com/GodotModding/godot-mod-loader/releases) v7.0.1 or later
    * We use this version for the [patch](https://github.com/GodotModding/godot-mod-loader/pull/533) that provides compatibility to Nodebuster.
* [Nodebuster Archipelago Mod](https://github.com/josephwhite/Emerlads-Nodebuster_AP_Mod/releases)

## Optional Software

* [Emerald Nodebuster QOL Mod](https://github.com/Emerald836/Emerlad-Nodebuster-QOL-Mod/releases)
    * Includes a speed scale option.

## Installation

### Installing Mod Loader and Mod

1. Extract the `addons` folder from the Mod Loader ZIP file and put it in your Nodebuster files right next to the executable `Nodebuster.exe`.
    * This can be found by right-clicking on your Nodebuster game in Steam and clicking browse local files.
2. Go back to Steam and go to the properties window by right-clicking your Nodebuster game and clicking properties.
3. After the window opens find launch options and put `--script addons/mod_loader/mod_loader_setup.gd` in the launch options field. Then open Nodebuster once.
4. After you opened the game, go back to the properties window and remove what we put in the launch options field.
5. Go back to the Nodebuster local files, and create a folder named `mods`.
6. Insert the ZIP file of the Archipelago mod into the `mods` folder.
    * Do not unzip the mod file as the mod loader requires it to be zipped.
    * You may also insert [any other mods](#optional-software) at this point.
7. Start Nodebuster once more and the game should ask you to restart.
8. Click `yes`. After restarting the game, the mod will be installed.

### What to do if the Mod Loader doesn't install correctly

This can happen due to either installing the wrong version of the mod loader or the launch options field wasn't filled correctly.

* Check the launch options field in the properties window of the game in Steam. If the launch options are still `--script addons/mod_loader/mod_loader_setup.gd`, remove it and try starting the game again.
* Make sure you downloaded v7.0.1+ of the Godot 4.x Mod Loader or later.
    * More information on the Godot Mod Loader can be found on their [Wiki](https://wiki.godotmodding.com).

## Configuring your YAML File

### What is a YAML and why do I need one?

An YAML file is the way that you provide your player options to Archipelago.
See the [basic multiworld setup guide](/tutorial/Archipelago/setup/en) here on the Archipelago website to learn more.

### Where do I get a YAML?

You can either download it from the [mod release page](https://github.com/josephwhite/Emerlads-Nodebuster_AP_Mod/releases).
Or you can generate a template with the Archipelago Launcher after installing the APWorld.

## Joining an Archipelago Game in Nodebuster

1. Start the game after installing all the necessary mods.
    * In the main menu, you should see a `Connect` button instead of the `new game` and `continue` buttons.
2. Click said `Connect` button.
3. Input the correct information in the correct fields (ie. "archipelago:12345" in the address field).
4. Click `Connect` and wait a tiny bit.
    * If it takes more then a min to connect then check your input fields to make sure everything is correct.
5. After the game connects to archipelago, it will take you straight to the upgrade tree scene.
    * If you have a save file that was already connected to the server address you are using, it will instead ask if you want to use the aforementioned save file.
6. Enjoy!


## Hints and other commands

While playing in a multiworld, you can interact with the server using various commands listed in the 
[commands guide](/tutorial/Archipelago/commands/en). You can use the Archipelago Text Client to do this,
which is included in the latest release of the [Archipelago software](https://github.com/ArchipelagoMW/Archipelago/releases/latest).
