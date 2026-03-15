# Sonic Riders Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- Dolphin Emulator, recommended 2409 version of higher.
- An NTSC Rom for Sonic Riders for Gamecube. The Archipelago community cannot provide this.
- A copy of Python Dolphin Memory Engine. This should be provided with your Archipelago installation and therefore you should not need to source this.

The Sonic Riders Archipelago does *not* support modified versions of Sonic Riders, such as Sonic Riders Tournament Edition.

### Configuring Game

You will need to keep "Emulated Memory Size Override" off to prevent Archipelago from crashing.

Inside the Dolphin emulator:
- Click "Options" > "Configuration". The settings window opens up.
- Select "Advanced"
- Make sure "Enable Emulated Memory Size Override" is unchecked.

## Optional Software
- Universal Tracker: This game aims to support universal tracker allowing you to know what checks are available in game.

## Generating a Game
1. Create your options file (YAML). Refer to the generated file for information regarding the options. 
	If you want the latest template, open the Archipelago Launcher and click 'Generate Templates'
2. Follow the general Archipelago instructions for [generating a game](../../Archipelago/setup/en#generating-a-game).
   This will generate an output file.
   
# Launching the game
1. Open Dolphin emulator. 
2. Open the Sonic Riders rom.
3. Open the Archipelago launcher
4. Select 'Sonic Riders Client' in Archipelago Launcher.
5. Enter your credentials and connect to the server.
6. Make a new save.
7.  Play!

You must remain with client running whenever playing the game to receive checks and other items.
You should now be able to receive and send items. You'll need to do these steps every time you want to reconnect.

For more information, read the [player guide](./en_Sonic%20Riders.md).
