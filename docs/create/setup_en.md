# Create Setup Guide

## Required Software

- [Archipelago 0.6.7](https://github.com/ArchipelagoMW/Archipelago/releases/latest) or newer
- [Dolphin Emulator](https://dolphin-emu.org/download/)
- A PAL Wii copy of Create, game ID `SECP69`
- [The Create `.apworld` file](https://github.com/mariokirby1703/Lumas-Archipelago/releases)
- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago) (Highly suggested for keeping track!)

This world is made for the PAL Wii version of the game. Other versions are not supported.

Universal Tracker does not need a separate Create integration for basic Archipelago tracking.
Make sure to have your own .yaml file in your Players folder inside the Archipelago folder (most likely: C:\ProgramData\Archipelago\Players)

## Installing the APWorld

1. Download and install Archipelago.
2. Download [`create.apworld`](https://github.com/mariokirby1703/Lumas-Archipelago/releases).
3. Double-click the `.apworld` file to install it into Archipelago's `custom_worlds` folder.
4. If the Archipelago Launcher was already open, close it and reopen it.
5. Open the Archipelago Launcher and check that `Create Client` appears in the launcher.

If Archipelago asks to install missing Python requirements, allow it. The client needs `Dolphin Memory Engine` in order to
connect to Dolphin.

## Creating a YAML

Create your player YAML with either:

- `Create Template Options` in the Archipelago Launcher
- The `Options Creator` in the Archipelago Launcher

Make sure the player name in the YAML is the name you want to use when connecting to the Archipelago server.

## Generating a Game

Generate the seed through the Archipelago Launcher or with Archipelago's normal generation tools.


## How to Play

1. Open Dolphin.
2. Start the PAL Wii version of Create.
3. **Always** play on Save Slot 3. Use a fresh save for each new seed. Deleting the save file before connecting is recommended.
4. Open `Create Client` from the Archipelago Launcher.
5. Connect to the Archipelago server using the address and port given by the host.
6. Enter the same player name that you used in your YAML.
7. Once the client says *Dolphin connected successfully.* and *Save Slot 3 connected.*, and you connected to the server, you can start playing.

Save Slot 3 is required. Locations may not send correctly and received items may not apply correctly on other save
slots.

## Client Notes

The client connects to a running Dolphin instance through Dolphin Memory Engine. It checks for the PAL game ID `SECP69`
before reading locations or writing received unlocks.

World and Object items unlock their corresponding content. Complete the Hub tutorial with the client connected so it can
observe all three parts. Clicking the Hub World challenge sends the Hub World Create Chain and Starting World Unlock checks.

AP-side Spark items are separate counter items for logic. With a positive Spark requirement, the client mirrors your received
AP Sparks into the in-game Total Sparks counter. The client log shows sent checks and received items.

If you run into any issues, please get in contact with me on the official Archipelago Discord's Create Thread in Future-Game-Design.
