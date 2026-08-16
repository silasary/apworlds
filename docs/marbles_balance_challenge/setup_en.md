# Marbles! Balance Challenge Setup Guide

## Required Software

- [Archipelago 0.6.7](https://github.com/ArchipelagoMW/Archipelago/releases/latest) or newer
- [Dolphin Emulator](https://dolphin-emu.org/download/)
- A PAL copy of Marbles! Balance Challenge, game ID `RK6P18`
- [The Marbles! Balance Challenge `.apworld` file](https://github.com/mariokirby1703/Lumas-Archipelago/releases)
- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago) (Optionally)

This world is made for the PAL version of the game. Do not use Marble Saga: Kororinpa, the US version.

Universal Tracker does not need a separate Marbles! Balance Challenge integration for basic Archipelago tracking.
Make sure to have your own .yaml file in your Players folder inside the Archipelago folder (mostlikely: C:\ProgramData\Archipelago\Players)

## Installing the APWorld

1. Download and install Archipelago.
2. Download [`marbles_balance_challenge.apworld`](https://github.com/mariokirby1703/Lumas-Archipelago/releases).
3. Double-click the `.apworld` file to install it into Archipelago's `custom_worlds` folder.
4. If the Archipelago Launcher was already open, close it and reopen it.
5. Open the Archipelago Launcher and check that `Marbles! Balance Challenge Client` appears in the launcher.

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
2. Start the PAL version of Marbles! Balance Challenge.
3. **Always** play on Save Slot 3.
4. Open `Marbles! Balance Challenge Client` from the Archipelago Launcher.
5. Connect to the Archipelago server using the address and port given by the host.
6. Enter the same player name that you used in your YAML.
7. Once the client says *Dolphin is connected successfully*, and you connected to the server, you can start playing.

Save Slot 3 is required. Locations may not send correctly and received items may not apply correctly on other save
slots.

## Client Notes

The client connects to a running Dolphin instance through Dolphin Memory Engine. It checks for the PAL game ID `RK6P18`
before reading locations or writing received unlocks.

The client should not write received Green Gem, Kororin Capsule, Trophy, Anthony, or goal checks into the game's save
flags. Those are location checks. AP-side Green Gem and Stump Temple Piece items are counter items for logic, they will send
a specific item as found by yourself when you collected enough Stump Temple Pieces or Green Gems for their respective unlock.
