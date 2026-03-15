# New Super Mario Bros Wii Randomizer Setup Guide

## Required Software

- [Archipelago V6.7.0](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [NSMBW World](https://github.com/Miiroun/Archipelago-NewSuperMarioBrosWii/releases/latest)
- [Dolphin emulator](https://dolphin-emu.org/download/)
- A legally acquired copy of New Super Mario Bros Wii rom (only USA rev2 currently supported)


## OBS
TO PLAY YOU NEED VERSION 6.7.0 of AP, this is not realeased at time of writing (2026-03-02) so you need to build from their source from their github.

## Setup
Download and install archipelago and Dolphin.
Download the apworld file from [NSMBW World](https://github.com/Miiroun/Archipelago-NewSuperMarioBrosWii/releases/latest), dubbelclick it and its installed.
Then create a player yaml file, either from template or launcher. OBS the ap client is bundled with launcher.
Inside the client press CONNECT and then enter your player name (from the yaml)
Press tracker to check which items you can collect. (If this is incorrect, please report as bug)

## How to play

Open the AP launcher and find NSMBW Client, press : and find create desktop shortcut. Open the shortcut to launch the Client, it will ask you to select your rom file and the autolaunch dolphin. 
When game booted select savefile 2 (only one tested) and start playing.
Make savestates in emulator, saving the game doesnt currently work.


## Tracker 
You can optionaly use a tracker to track avalible locations.
Simply download this [tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker) and put it into your custoom worlds folder (or dubble click it).
Make sure you have your <player>.yaml file still in the /players/ directory for the tracer to work. It is automaticaly booted up if you have it in your custom worlds folder and is integrated into the client.