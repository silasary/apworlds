# Bendy and the Ink Machine Randomizer Setup Guide

## Required Software

- [Bendy and the Ink Machine](https://store.steampowered.com/app/622650/Bendy_and_the_Ink_Machine/)
- The [BATIM apworld](https://github.com/Lorecrafter703/Archipelago/releases), 
  if not bundled with your version of Archipelago
- Thunderstore Mod Manager

If installing manually:
- [Bendy and the Archipelago Machine](https://github.com/Lorecrafter703/BendyAndTheArchipelagoMachine/releases) mod
- [BepInEx](https://github.com/BepInEx/BepInEx/releases)

## Installation

### Thunderstore

1. In the Thunderstore Mod Manager, create a profile and select Bendy and the Ink Machine as the game
2. Go to "Get Mods" section and search for "Bendy and the Archipelago Machine"
3. Click on it to expand the listing, and click the Download button that appears
4. Click on "Start Modded" to open the mod

### Manual Install

1. Extract the BepInEx zip file into your game's root directory
2. Run the game once to complete the installation
3. Navigate to the config folder, and open up the BepInEx.cfg file
4. Locate the following options and set them to true
	- HideManagerGameObject in [Chainloader]
	- Enabled in [Logging.Console]
5. Extract the mod folder into the plugins folder of the BepInEx install
6. Opening the game should now also bring up a BepInEx console


## Joining a new MultiWorld

1. When the game opens up, you should see a new section in the top left to input connection information.
2. After filling in the required fields, you may click **Connect**.
3. On a successful connection, you should see the connection menu replaced with a count for received Bacon Soups,
and a toggle for deathlink. You should now be able to select **Begin**, and continue as normal.

**NOTE:** It is recommended to back up your save files before playing, as selecting a slot will
automatically override any data that was previously there.