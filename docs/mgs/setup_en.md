# Metal Gear Solid Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) the 2.9.1 version is recommended.
- A legally obtained Metal Gear Solid ROM file (Disc 1 and Disc 2). The Archipelago community cannot provide this.

## Generating a Multi-disk Bundle

Use BizHawk to generate a Multi-disk bundle from the two ROM files.
1. Navigate to your BizHawk install directory and launch `EmuHawk.exe` (or `EmuHawkMono.sh` on Linux).
2. Launch the Multi-disk Bundler tool.
3. Browse for a location to save the multi-disk bundle
4. Ensure the 'System' setting is set to `PSX`.
5. Browse for the `.cue` file of Disc 1
6. Browse for the `.cue` file of Disc 2
7. Save the multi-disk bundle

You can now open and run this multi-disk bundle as if it were a single ROM.

## Swapping disks in a Multi-disk Bundle

When Metal Gear Solid tells you to switch to Disc 2:

1. Launch the Virtual Pad tool from BizHawk (Tools > Virtual Pad)
2. Select `Open Tray` (Game text should inform you to press Start after inserting Disc 2)
3. Move the Disk Index slider from 0 to 1
4. Deselect `Open Tray`
5. Select `Close Tray`
6. Press the 'start' button on your controller

The game should continue as normal.

## Generating a Game

1. Create your options YAML file. One can be created on the [Metal Gear Solid options page](../../../games/Metal%20Gear%20Solid/player-options).
2. Follow the general Archipelago guide to [generating a game](/tutorial/Archipelago/setup_en#generating-a-game). This will create an output file.
3. Follow the general Archipelago guide to [hosting a game](/tutorial/Archipelago/setup_en#hosting-an-archipelago-server)

## Configuring BizHawk

1. Navigate to your BizHawk install directory and launch `EmuHawk.exe` (or `EmuHawkMono.sh` on Linux).
2. Launch the Lua Console (Tools > Lua Console)
3. In the Lua Console, open the 'connector_bizhawk_generic.lua' script, located in the 'Lua' folder in your BizHawk install directory. (Script > Open Script...)
5. In the BizHawk window, open the Metal Gear Solid mutli-disc bundle you created. (File > Open ROM...)

You are now ready to connect to BizHawk to the BizHawk Client.

## Connecting to a Server

6. Navigate to your Archipelago install directory and launch `ArchipelagoLauncher.exe` (or the `Archipelago.AppImage` on Linux)
7. Search for, and open, the `BizHawk Client`
8. Enter the server infomation at the top of the BizHawk Client and select `Connect`
9. The BizHawk Client should now be connected to both BizHawk and the Archipelago server and will prompt to 'Enter slot name:'
10. Enter the name of your slot in the text box at the bottom of the BizHawk Client and press the enter key (the name was set in the options YAML file).

It is normal for the BizHawk Client to state 'No handler was found for this game.' while BizHawk is first loading the ROM and the 'PS' logo is on screen. It should eventually note 'Running handler for Metal Gear Solid' once the game's data is loaded into memory. If you connect the BizHawk Client to an Archipelago server before connecting it to BizHawk, the BizHawk Client will note 'Awaiting connection to BizHawk before authenticating' and you will only be prompted for the Slot name after BizHawk is setup and connected to the BizHawk Client.

## Saved Games and New Games

When first connecting to an Archipelago server, the Metal Gear Solid Archipelago mod will look for a file named `mgs_archipelago_save.json` in the 'mgs' folder located in the 'worlds' folder of the Archipelago install directory. If no save file is found, a new one will be created. The player can save their Metal Gear Solid progress by calling Mei Ling and selecting the 'SAVE' option as normal. The player's current progress in Archipelago is saved in real-time as the player checks locations and receives items. The player can disconnect from the Archipelago server and close all open programs after saving.

When loading a saved game, launch all programs and connect to the Archipelago server as described above. The BizHawk Client should note that a Metal Gear Solid save file has been loaded and not that a new one has been created. The player can now load their saved game in Metal Gear Solid as normal and find all their items and progress as they left it.

When starting a new run, the old `mgs_archipelago_save.json` file should be deleted, moved, or renamed to prevent the Metal Gear Solid Archipelago mod from loading previous save data.

Using and loading save states can cause items to be lost forever and/or locations to be checked erroneously and is not recommended. The mod tracks the player's inventory counts and adjusts the save file in real-time. Loading a save state where the player's in-game inventory is different than what is in the Archipelago mod save file will cause undefined behaviour.
