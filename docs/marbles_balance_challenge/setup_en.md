# Marbles! Balance Challenge Setup Guide

## Required Software

- Archipelago 0.6.7 or newer
- Dolphin Emulator
- A PAL copy of Marbles! Balance Challenge, game ID `RK6P18`
- The Marbles! Balance Challenge `.apworld` file
- Dolphin Memory Engine support for the Archipelago client
- Universal Tracker, optional

This world is made for the PAL version of the game. Do not use Marble Saga: Kororinpa, the US version.

Universal Tracker does not need a separate Marbles! Balance Challenge integration for basic Archipelago tracking. It can
use the generated Archipelago data like other worlds, but this release does not include a custom game-specific tracker
layout.

## Installing the APWorld

1. Download and install Archipelago.
2. Download `marbles_balance_challenge.apworld`.
3. Double-click the `.apworld` file to install it into Archipelago's `custom_worlds` folder.
4. If the Archipelago Launcher was already open, close it and reopen it.
5. Open the Archipelago Launcher and check that `Marbles! Balance Challenge Client` appears in the launcher.

If Archipelago asks to install missing Python requirements, allow it. The client needs Dolphin Memory Engine in order to
connect to Dolphin.

## Creating a YAML

Create your player YAML with either:

- `Create Template Options` in the Archipelago Launcher
- The Options Page in the Archipelago Launcher

Make sure the player name in the YAML is the name you want to use when connecting to the Archipelago server.

## Generating a Game

Generate the seed through the Archipelago Launcher or with Archipelago's normal generation tools.


## How to Play

1. Open Dolphin.
2. Start the PAL version of Marbles! Balance Challenge.
3. Make sure Save Slot 3 is erased or empty before starting your AP save.
4. Always play on Save Slot 3.
5. Open `Marbles! Balance Challenge Client` from the Archipelago Launcher.
6. Connect to the Archipelago server using the address and port given by the host.
7. Enter the same player name that you used in your YAML.
8. Once the client says Dolphin is connected successfully, start playing.

Save Slot 3 is required. Locations may not send correctly and received items may not apply correctly on other save
slots.

## Client Notes

The client connects to a running Dolphin instance through Dolphin Memory Engine. It checks for the PAL game ID `RK6P18`
before reading locations or writing received unlocks.

The client should not write received Green Gem, Kororin Capsule, Trophy, Anthony, or goal checks into the game's save
flags. Those are location checks. AP-side Green Gem and Stump Temple Piece items are counter items for logic.

If Split Vehicle World Access is disabled, Submarine and Rocket Ship are not AP items and world unlocks control access
for Ocean Treasure and Space Station. If Split Vehicle World Access is enabled, the matching vehicle item and world
unlock are both required on Easy and Normal.
