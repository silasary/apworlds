# New Super Mario Bros Wii Randomizer Setup Guide

## Required Software

- [Archipelago V0.6.7](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [NSMBW World](https://github.com/Miiroun/Archipelago-NewSuperMarioBrosWii/releases/latest)
- [Dolphin emulator](https://dolphin-emu.org/download/)
- A legally acquired copy of a New Super Mario Bros Wii (all editions should be supported)


## OBS
TO PLAY YOU NEED VERSION 0.6.7 of AP, this is not released at the time of writing (2026-03-24) so you will need to download the release candidate.

## Setup
Download and install archipelago and Dolphin.
Download the apworld file from [NSMBW World](https://github.com/Miiroun/Archipelago-NewSuperMarioBrosWii/releases/latest), doubleclick it and it's installed.
Then create a player yaml file, either from template or launcher. OBS the ap client is bundled with launcher.
Inside the client press CONNECT and then enter your player name (from the yaml)
Press tracker to check which items you can collect. (If this is incorrect, please report as a bug)

## How to play

Open the AP launcher and find NSMBW Client, open it.
This will create an option in host.yaml, change the file path to the path of your game and reboot the client.
When game booted select savefile 2 (only one tested) and start playing.
Make savestates in emulator, saving the game doesn't currently work.


## Tracker 
You can optionally use a tracker to track available locations.
Simply download this [tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker) and put it into your custom worlds folder (or double click it).
Make sure you have your <player>.yaml file still in the /players/ directory for the tracker to work. It is automatically booted up if you have it in your custom worlds folder and is integrated into the client.
