# Y2ROLL in Archipelago Multiworld Setup Guide

## Required Software
- [Y2ROLL (Steam)](https://store.steampowered.com/app/3459420/)
- Y2ROLL Archipelago Randomizer mod ([in the `Y2ROLL-mods.zip` from the GitHub Release](https://github.com/josephwhite/Y2ROLL-mods/releases/))
- [Godot Mod Loader v6.3.0](https://github.com/GodotModding/godot-mod-loader/releases/tag/v6.3.0)
- [Python 3.6+](https://www.python.org/)

## Optional Software
- Y2ROLL Mod Manager

## Instructions

### Installing the mod
1. Download the Y2ROLL Archipelago Randomizer mod (and other Y2ROLL mods). If downloading `Y2ROLL-mods.zip` from the GitHub Release, extract all to a folder.
2. Extract the `addons` folder from the Godot Mod Loader next to the Y2ROLL executable.
3. Open a terminal (bash/powershell) and navigate to the folder for the Y2ROLL mods.
4. Run the below command, replacing the <folder-placeholder> values.
   - `python patch_pck.py --pck "<path_to_Y2ROLL.pck>" --modloader-dir "<path_to_addons>" --game-dir "<path_to_game>" --mod-dir "<path_to_mod_folder>" --mod-dir "<path_to_mod_folder_2>"`
   - Replace `<path_to_Y2ROLL.pck>` with the path of your Y2ROLL's pck file.
   - Replace `<path_to_addons>` with the path to the `addons` folder from Step 2.
   - Replace `<path_to_game>` with the path of your Y2ROLL folder.
   - Replace `<path_to_mod_folder>` with the path to the `josephwhite-ArchipelagoRandomizer` mod folder.
   - For any other mods you want to install, add another `--mod-dir` flag and path to the mod folder for each mod.
   - Example: `python patch_pck.py --pck "C:\SteamLibrary\steamapps\common\Y2ROLL\Y2ROLL.pck" --modloader-dir "C:\SteamLibrary\steamapps\common\Y2ROLL\addons" --game-dir "C:\SteamLibrary\steamapps\common\Y2ROLL" --mod-dir "C:\repos\Y2ROLL-mods\josephwhite-ArchipelagoRandomizer" --mod-dir "C:\repos\Y2ROLL-mods\josephwhite-mod_manager" --mod-dir "C:\repos\Y2ROLL-mods\josephwhite-player_skins"`

## Connecting to the Archipelago server
Clicking the AP button in the corner of the campaign menu will open a menu for connecting to an Archipelago server.
Enter the info (host/port/name/password) to connect.

## FAQ/Common Issues

### How do gem checks work?
In Y2ROLL, the gems do not have unique identifiers to differentiate from each other in each level.
Gem checks do not correspond to individual gems, but rather a **count** of collected gems.
For example, collecting a single gem in 1-1: BEGINNINGS will send a check for "1-1: BEGINNINGS - Gem 1" regardless of which gem you collected in the level.
