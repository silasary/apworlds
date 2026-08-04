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
2. After filling in the required fields, you may click **Begin**.
3. On a successful connection, you will be able to choose a save file. (You may need to click Begin a second time)
   - NOTE: Whichever save file you connect to first will be the save you must use every time you connect in the future.
4. After choosing a save file, you will be able to continue to chapter select, and begin playing.