# Marble It Up! Ultra Setup Guide

## Required Software
-   The latest version of [Marble It Up! Ultra, downloaded from Steam](https://store.steampowered.com/app/864060/Marble_It_Up_Ultra/)
-   Marble It Up! Ultra Archipelago from the [ArchipelagoMIUU Releases page](https://github.com/KitLemonfoot/ArchipelagoMIUU/releases)
-   MIUU Mod Loader from [thearst3rd's Releases page](https://codeberg.org/thearst3rd/miuu-mod-loader/releases/latest)
-   MIUU Console Unlocker from [thearst3rd's Releases page](https://codeberg.org/thearst3rd/miuu-console-unlocker/releases/latest)

## Recommended Installation Instructions

### Game Install
1. Navigate to Marble It Up! Ultra's local file directory. This can be found by right-clicking on the game in your Steam Library, selecting *Manage*, then selecting *Browse Local Files*.
2. Install [MIUU Mod Loader](https://codeberg.org/thearst3rd/miuu-mod-loader) to your copy of Marble It Up! Ultra if it's not already installed.
3. Install [MIUU Console Unlocker](https://codeberg.org/thearst3rd/miuu-console-unlocker) if it's not already installed.
4. Extract the contents of `ArchipelagoMIUU_vX.Y.Z.zip` to the `Mods` folder.

### Archipelago Connection
1. Start Marble It Up! Ultra and press `~` to access the in-game console.
2. In the console, use the `apConnect` command to connect to the archipelago server.
3. Your Archipelago server IP should be displayed in the top right corner of the main menu if the connection was successful.
4. **Optional**: Use the `apOverrideDl` and `apOverrideDlAmnesty` commands to override the YAML's Death Link settings. Examples:
	- `apOverrideDl 0` or `apOverrideDl 1` to forcably disable or enable Death Link
	- `apOverrideDlAmnesty 10` to forcably set the Death Link amnesty to 10 deaths (for when Death Link is enabled)
	- `apOverride -1` and `apOverrideDlAmnesty -1` to disable the overrides (it will use the values in the YAML)

Please read the README file on the [Marble It Up! Ultra Archipelago GitHub](https://github.com/KitLemonfoot/) page for up-to-date installation instructions.

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

You can generate a YAML file by using the "Generate Template Options" function in the Archipelago client.
