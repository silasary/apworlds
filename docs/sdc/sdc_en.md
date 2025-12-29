# Sonic Dreams Collection Setup Guide

## Required Software
- The latest version of [Sonic Dreams Collection](https://hedgehog.exposed/)
- Sonic Dreams Collection Archipelago from the [ArchipelagoSDC Releases page](https://github.com/KitLemonfoot/ArchipelagoSDC/releases/latest)
- [BepInEx x86 5.4.23.2](https://github.com/BepInEx/BepInEx/releases/tag/v5.4.23.2) (the game will NOT work with BepInEx 6)

## Recommended Installation Instructions

### Game Install
1. Install a x86 version of BepInEx 5.4.23.2 to a fresh copy of Sonic Dreams Collection. Do not run the game yet.
2. Install the contents of `SDC_Patches.zip` to the BepInEx folder. You should have three folders in the BepInEx folder: `config`, `core`, and `plugins`.
3. Run the game to generate BepInEx's config data. If the mod installed properly, you should be unable to start any of the games.

### Archipelago Connection
1. Click the Twitter icon on the top right of the main menu. If the mod installed properly, you should see a "Connect to Archipelago?" window.
2. Enter your Archipelago server's IP and your slot name in the following windows, then click OK. 
3. The game should connect automatically; you can begin playing when you and/or your group are ready.

Note: It is HIGHLY recommended to have the Archipelago Text Client open alongside your game, as there are currently no indicators when you receive an item.

Please read the README file on the [Sonic Dreams Collection Archipelago GitHub](https://github.com/KitLemonfoot/ArchipelagoSDC/blob/main/README.md) page for up-to-date installation instructions.

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

You can generate a YAML file by using the "Generate Template Options" function in the Archipelago client.
