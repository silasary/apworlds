# Freedom Planet 2 Archipelago Setup Guide

## Required Software

- Freedom Planet 2 from [Steam](https://store.steampowered.com/app/595500/Freedom_Planet_2/).
- BepInEx 5 from [GitHub](https://github.com/bepinex/bepinex/releases) (Requires the x86 version rather than the x64 version).
- FP2Lib from [GitHub](https://github.com/Kuborros/FP2Lib/releases).
- Freedom Planet 2 Archipelago Mod from [GitHub](https://github.com/Knuxfan24/Freedom-Planet-2-Archipelago/releases).

## Optional Software
- FreedomManager from [GitHub](https://github.com/Kuborros/FreedomManager/releases) (automates installation of BepInEx and FP2Lib).

## Installation Procedures

Firstly, install BepInEx and FP2Lib through one of the two methods below.

### BepInEx/FP2Lib Setup (Manual)

1. Install Freedom Planet 2 from Steam.

2. Install BepInEx by extracting the contents of the BepInEx ZIP archive to the game's root (likely to be `C:\Program Files (x86)\Steam\steamapps\common\Freedom Planet 2`).

3. Install FP2Lib by extracting the contents of the FP2Lib ZIP archive to the game's root (likely to be `C:\Program Files (x86)\Steam\steamapps\common\Freedom Planet 2`) and choose to merge it with the existing BepInEx folder.

3. Run the game once to generate BepInEx's configuration files.

### BepInEx/FP2Lib Setup (Freedom Manager)

1. Install Freedom Planet 2 from Steam.

2. Extract the `FreedomManager.exe` file from the Freedom Manager ZIP archive to the game's root (likely to be `C:\Program Files (x86)\Steam\steamapps\common\Freedom Planet 2`).

3. When prompted to update the BepInEx5 Unity Hook, click the Update button.

4. Close Freedom Manager and reopen it, then click the Update button when prompted to update FP2Lib.

5. Run the game once to generate BepInEx's configuration files.

### Mod Setup

1. Extract the contents of the Archipelago 7-Zip archive to the game's root (likely to be `C:\Program Files (x86)\Steam\steamapps\common\Freedom Planet 2`) and choose to merge it with the existing BepInEx folder (and mod_overrides folder if it already exists).

2. It is HEAVILY recommended to open the BepInEx configuration file (likely to be at `C:\Program Files (x86)\Steam\steamapps\common\Freedom Planet 2\BepInEx\config\BepInEx.cfg`) and turn the `Enabled` option under `[Logging.Console]` to `true`. It may also be worth setting the `LogLevels` option to `All`, but this is not strictly necessary.

## Joining a MultiWorld Game

Upon installing the required content, running the game and proceeding past the title screen will bring the player to a custom Connection Menu. Pressing up or down will move between the various options and pressing Enter (or the A button on a controller) when selecting one of the first three options will allow the player to type values in. Pressing the enter key when a text box is selected will exit the selection.
The first box should contain the URL for your Archiepalgo session. By default this contains an `archipelago.gg:` prefix.
The second box should contain the slotname specified in your player YAML file.
The third box is optional and should only be used if the game you are connecting to is password protected. In this scenario the password should be typed into this box.

> Note: The password box will display the password in plain text.

The fourth option selects your player character. Any modded characters installed that register a unique player slot with FP2Lib will also be selectable here. In addition, there is an option that will pick a random character for each stage.

Once your settings are set correctly, selecting the Connect button should allow the game to connect to the server and automatically transition to the Classic Mode world map.
If the connection fails, then the given reason will be printed to the BepInEx console.

## Configuration Options

After the first run, a configuration file will be placed int othe BepInEx config folder (likely to be `C:\Program Files (x86)\Steam\steamapps\common\Freedom Planet 2\BepInEx\config\`) under the name of `K24_FP2_Archipelago.cfg`. This file contains the following options:

Server Address: The last address the game connected to. This is updated automatically by the connection menu and realistically shouldn't need to be manually edited.

Slot Name: The last slot name the game connected to a multiworld server as. This is updated automatically by the connection menu and realistically shouldn't need to be manually edited.

Password: The password used by the last multiworld server the game connected to. This is updated automatically by the connection menu and realistically shouldn't need to be manually edited.

Character Index: The index of the character that was last used by the game. This is updated automatically by the connection menu and realistically shouldn't need to be manually edited.

Remote Players: An experimental option that allows Freedom Planet 2 players to see a representation of each other in their games if they're in the same stage as each other. Disabled by default as it hasn't received very much testing and may impact performance.

Chat Piping: Shows the Archipelago server's chat in the game, using the cutscene text boxes. This option has the following three different values:
0: Disabled.
1: Only display chat messages typed by other players. This is the default option.
2: Show every message that would appear in a text client (such as people connecting, hints and item recieves).

Shop Hints: Sends out item hints when either Milla's Shop or the Vinyl Shop is accessed. This option has the following three different values:
0: No hints will be sent out from the shop at all.
1: Only items that have the Progression flag will be hinted for.
2: All items will be hinted for, regards of type.

Trivia Trap Maximum Difficulty: Determines the highest difficulty the Trivia Trap can pick for its questions. This option has the following three different values:
0: Easy
1: Normal
2: Hard

DeathLink: Overrides the DeathLink value specified in the player YAML.

RingLink: Overrides the RingLink value specified in the player YAML.

TrapLink: Overrides the TrapLink value specified in the player YAML.