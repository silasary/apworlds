# holo8 Setup Guide

## Required Software
-   The latest version of [holo8, downloaded from Steam](https://store.steampowered.com/app/3373960/holo8/)
-   holo8 Archipelago from the [ArchipelagoHolo8 Releases page](https://github.com/KitLemonfoot/ArchipelagoHolo8/releases/latest)
-   [BepInEx x64 5.4.23.x](https://github.com/BepInEx/BepInEx/releases)

## Recommended Installation Instructions

### Game Install
1. Navigate to holo8's local file directory. This can be found by right-clicking on the game in your Steam Library, selecting *Manage*, then selecting *Browse Local Files*.
2. Install BepInEx to your copy of holo8.
3. Install the contents of `Holo8_Patches.zip`to the BepInEx folder. You should have two folders in the BepInEx folder: `core` and `plugins`.
4. Run the game to generate BepInEx's and the mod's config data.

### Archipelago Connection
1. In the `ArchipelagoHolo8.cfg` file in the `BepInEx\config` folder, enter your Archipelago server's IP address, your slot name, and your server's password if any.
2. Start holo8. The game should connect to the server automatically during bootup.

Note: It is HIGHLY recommended to have the Archipelago Text Client open alongside your game, as there are currently no indicators when you receive an item.

Please read the README file on the [holo8 Archipelago GitHub](https://github.com/KitLemonfoot/ArchipelagoHolo8/blob/main/README.md) page for up-to-date installation instructions.

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

You can generate a YAML file by using the "Generate Template Options" function in the Archipelago client.
