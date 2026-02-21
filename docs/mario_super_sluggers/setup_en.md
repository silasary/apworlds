# Mario Super Sluggers Randomizer Setup Guide

## Required Software
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [The Mario Super Sluggers APWorld](https://github.com/MarioManTAW/Archipelago/releases)
- [Dolphin Emulator](https://dolphin-emu.org/download/)
- A dumped North American copy of Mario Super Sluggers in any format Dolphin can read

## Optional Software
- [Mario Super Sluggers Tracker](https://github.com/MarioManTAW/MarioSuperSluggersAPTracker/releases/)
  - Requires [PopTracker](https://github.com/black-sliver/PopTracker/releases/)

## How to play

First, you need a room to connect to. For this, you or someone you know has to generate a game. This will not be
explained here, but you can check the [Archipelago Setup Guide](https://archipelago.gg/tutorial/Archipelago/setup_en).

Unlike most randomizers, Mario Super Sluggers AP doesn't need you to patch your rom beforehand. Everything is done at
runtime.
- Open the Mario Super Sluggers Client from Archipelago Launcher.
- Open Dolphin and launch the game.
  - **Important!** Do not load into a save file that already has Challenge Mode save data, as this will send checks
    prematurely.
  - **Important!** Do not press "New" on the Challenge Mode starting screen before you are connected to the host.
- Write your host connection info in the box at the top of the client and press enter.
- Write your slot/player name into the box at the bottom and press enter. If needed, enter the room password.
- Once you are connected, enter Challenge Mode and start a new game.
- When reconnecting, it is fine to reuse the same save file but both the game and client need to be closed between
sessions.

## Troubleshooting

There are failsafes in place to ensure the game does not softlock by choosing an impossible mission. If an issue with
missions does pop up, however, you can use the `/reset_mission` command in the client to select a random safe mission.
