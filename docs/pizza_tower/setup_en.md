# Pizza Tower Randomizer Setup Guide

## Required Software
- [Pizza Tower](https://store.steampowered.com/app/2231450/Pizza_Tower/) (obviously)
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- One of the following:
    - [Pizza Oven](https://gamebanana.com/tools/12625), a Pizza Tower mod manager
    - [Delta Patcher](https://github.com/marco-calautti/DeltaPatcher), or some other way to apply `.xdelta` patches

## Mod Installation

First, let's get the mod installed.

### I'm using Pizza Oven!
1. Install and set up Pizza Oven according to its "Setup" section on its Gamebanana page.
2. Head on over to the [Pizza Tower Archipelago mod page](https://gamebanana.com/mods/598236), scroll down to the most recent release, and click "Pizza Oven 1-Click Install".
3. On the prompt that appears in Pizza Oven, click "Yes".
4. Once the mod installs, click on the mod in Pizza Oven and then click "Launch".

### I'm using Delta Patcher!
1. Head on over to the [Pizza Tower Archipelago mod page](https://gamebanana.com/mods/598236), scroll down to the most recent release, and click "Manual Download".
2. Open Delta Patcher. You'll need to give it two files:
    - The first file, "Original file", will be Pizza Tower's `data.win`. This can be found by right-clicking Pizza Tower in your Steam library, then clicking on Manage -> Browse local files.
    - The second file, "XDelta patch", will be the `.xdelta` file in the `.zip` folder you downloaded earlier. Extract it and place it into the "XDelta patch" field.
3. Click "Apply patch". If everything went as expected, you'll get a pop-up saying "Patch successfully applied!", and launching Pizza Tower from Steam will open it with the Archipelago mod installed.

## Text Client Installation
1. Download and install Archipelago (if you haven't done so already).
2. Head on over to the [Pizza Tower Archipelago GitHub release page](https://github.com/unsafetyskizzers/Archipelago/releases) and download `pizza_tower.apworld`.
3. Open Archipelago and navigate to `Install APWorld`. Clicking `Open` will give you a file prompt where you will select the `.apworld` file you download earlier.
4. Restart Archipelago and navigate to `Pizza Tower Client`. Clicking `Open` will open the integration's text client, which you will use next to join a Multiworld.

## Joining a MultiWorld
1. Open the game and select the file on the main menu (the character you selected in your YAML will automatically be loaded).
2. In the text client, in the `Server` text field, input the Multiworld's server IP address and port (for example, `archipelago.gg:8080`) and click `Connect`.
3. Enter the slot name chosen in your YAML file into the bottom text field and press Enter on your keyboard (if prompted, do the same thing with the server password).

If all the info is correct, the game will start a new save file automatically. This save file can be returned to later if you connect to the same room.
