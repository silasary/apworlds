# Setup Guide for Kirby Air Ride Archipelago

Welcome to Kirby Air Ride Archipelago! This guide will help you set up the game and play your first multiworld.
If you're playing Kirby Air Ride, you must follow a few simple steps to get started.

- [Setup Guide for Kirby Air Ride Archipelago](#setup-guide-for-kirby-air-ride-archipelago)
  - [Requirements](#requirements)
  - [Setting Up a YAML](#setting-up-a-yaml)
  - [Save files](#save-files)
  - [Items file](#items-file)
  - [Connecting to a Room](#connecting-to-a-room)
  - [Troubleshooting](#troubleshooting)

## Requirements

You'll need the following components to be able to play Kirby Air Ride:
* Install [Dolphin Emulator](https://dolphin-emu.org/download/). **We recommend using the latest release.**
    * Linux users can use the flatpak package
    [available on Flathub](https://flathub.org/apps/org.DolphinEmu.dolphin-emu).
* A Kirby Air Ride ISO (GKYE01) (North American version, NTSC-U), probably named "Kirby Air Ride (USA).iso"
  * CRC32: f1a3e7a2
  * MD5: bd936616ba7f998d8d0a1eb3f553b634
  * SHA-1: b57132b1d0990264c271a1ad2168aa75b93b2f92
* The Archipelago launcher
  * https://github.com/ArchipelagoMW/Archipelago/releases/latest
* The Kirby Air Ride APWorld
  * https://github.com/DeDeDeK/KARchipelago/releases/latest
  * download the `kirby_air_ride.apworld` and `kirby_air_ride.yaml` files from the "Assets" section
  * place the `kirby_air_ride.apworld` file into your `custom_worlds` folder in your Archipelago installation folder

## Setting Up a YAML

All players playing Kirby Air Ride must provide the room host with a YAML file containing the settings for their world. 

If you are running this on the web host (this will not be on the official website), you can visit the [Kirby Air Ride options page](/games/Kirby%20Air%20Ride/player-options) to generate a YAML with your desired options. Click the export button to save your yaml file. 

Alternatively, you can manually edit the `kirby_air_ride.yaml` template YAML from the [releases page](https://github.com/DeDeDeK/KARchipelago/releases/latest), or you can run "Generate Template Options" from the Archipelago Launcher, and then edit the Kirby Air Ride yaml file in your `Players/` directory. The yaml file will contain descriptions of each option and what they affect in the game. 

Once you're happy with your settings, provide the room host with your YAML file and proceed to the next step.

## Save files

**Every new multiworld you join should be done with a fresh Kirby Air Ride save file!** This is very important, as if you
have a completed save file and connect to a multiworld with it, you will complete your game immediately. 

Unfortunately, Kirby Air Ride only has one save slot in-game. But no worries if you want to keep your save - Dolphin can export save files that can be re-loaded later.

To make sure you have a fresh save file:

* In Dolphin, go to `Tools -> Memory Card Manager`
* If you have Kirby Air Ride data in this menu, click on it and click `Export as` if you wish to keep the save file for later, or `Delete` if you wish to wipe the save

## Items file

**Similarly, every multiworld you join should be done with a fresh `kirby_air_ride_items.json` file!** This is created by the client automatically when first connecting to a server, and is located in the root of your archipelago install folder. It is needed by the client to keep track of items properly. You should never need to look at the contents or edit it manually. 

**IMPORTANT:**

This file will need to be renamed, moved, or deleted before joining a new multiworld server (just as with your save file), and always needs to have the same name as above. Ideally, every world you join with a certain save file will also always be tied to the corresponding items file. 

If your items file gets deleted or moved, the client will create a new one with the appropriate data from the server (items received, etc.) 


## Connecting to a Room

The multiworld host will provide you a link to your room or the server name and port number.

Once you're ready, follow these steps to connect to the room:
1. Open Dolphin and use it to open the Kirby Air Ride ISO.
2. Start `ArchipelagoLauncher.exe` (without `.exe` on Linux) and choose `Kirby Air Ride Client`, which will open the text client. If Dolphin is not already open, or you have yet to start a new file, you will be prompted to do so.
  * Once you've opened the ISO in Dolphin, the client should say "Dolphin connected successfully.".
3. Connect to the room by entering the server name and port number at the top and pressing `Connect`. For rooms hosted
on the website, this will be `archipelago.gg:<port>`, where `<port>` is the port number. If a game is hosted from the
`ArchipelagoServer.exe` (without `.exe` on Linux), the port number will default to `38281` but may be changed in the
`host.yaml`.
  * You will be prompted to enter your slot name, which is the name you selected when creating your yaml. Type that in and press enter.
4. You are now connected and ready to play!

## Troubleshooting

* Ensure you are running the same version of Archipelago on which the multiworld was generated.
* Ensure you are running the latest version of the apworld if possible. 
* Ensure `kirby_air_ride.apworld` is in your Archipelago installation's `custom_worlds` folder.
  * make sure you have restarted the launcher if you moved the .apworld into the `custom_worlds` folder
* Try deleting your `kirby_air_ride_items.json` file in your ap folder, and restart the client. 
* Ensure that you do not have any Dolphin cheats or codes enabled. Some cheats or codes can unexpectedly interfere with emulation and make troubleshooting errors difficult. Some gecko or action replay codes may work, but they may also break the game state that archipelago depends on to function.
* Ensure that `Enable Emulated Memory Size Override` in Dolphin (under `Options` > `Configuration` > `Advanced`) is **disabled**.
* Ensure the `Fallback Region` in Dolphin (under `Options` > `Configuration` > `General`) is set to `NTSC-U`.
* If you run with a custom GC boot menu, you'll need to skip it by going to `Options` > `Configuration` > `GameCube` and checking `Skip Main Menu`.
