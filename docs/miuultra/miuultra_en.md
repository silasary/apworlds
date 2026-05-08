# Marble It Up! Ultra Setup Guide

## Required Software
-   The latest version of [Marble It Up! Ultra, downloaded from Steam](https://store.steampowered.com/app/864060/Marble_It_Up_Ultra/)
-   Marble It Up! Ultra Archipelago from the [ArchipelagoMIUU Releases page](https://github.com/KitLemonfoot/ArchipelagoMIUU/releases)
-   [BepInEx x64 5.4.23.x](https://github.com/BepInEx/BepInEx/releases)

## Recommended Installation Instructions

### Game Install
1. Navigate to Marble It Up! Ultra's local file directory. This can be found by right-clicking on the game in your Steam Library, selecting *Manage*, then selecting *Browse Local Files*.
2. Install BepInEx to your copy of Marble It Up! Ultra. The guide to do so can be found [in their User Guide](https://docs.bepinex.dev/articles/user_guide/installation/index.html).
3. Install the contents of `MIUU_Patches.zip`to the BepInEx folder. You should have two folders in the BepInEx folder: `core` and `plugins`.
4. Run the game to generate BepInEx's and the mod's config data.

### Archipelago Connection
1. In the `ArchipelagoMIUU.cfg` file in the `BepInEx\config` folder, enter your Archipelago server's IP address, your slot name, and your server's password if any.
	- You may also override your YAML's Death Link and Death Link Amnesty settings in this file if you wish .
2. Start Marble It Up! Ultra. The game should connect to the server automatically during bootup.
3. Your Archipelago server IP should be displayed in the top right corner of the main menu if the connection was successful.

Please read the README file on the [Marble It Up! Ultra Archipelago GitHub](https://github.com/KitLemonfoot/) page for up-to-date installation instructions.

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

You can generate a YAML file by using the "Generate Template Options" function in the Archipelago client.
