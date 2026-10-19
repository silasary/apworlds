# The Magical Quest Starring Mickey Mouse: Multiworld Setup Guide

## Required software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.7 or newer.
- Software or hardware capable of loading and playing SNES ROM files. Recommended:
  - snes9x-nwa
  - Bizhawk
- The Magical Quest Starring Mickey Mouse APWorld.
- A "The Magical Quest Starring Mickey Mouse" US ROM from the original cartridge. You have to provide it.
  - MD5: ```649c377a7479c898b1933962c4badaad```
  The patched game is **2 MB** (the original is 1 MB). Your emulator or cartridge setup must be able to load a 2 MB LoROM image.

## How to play

1. Install Archipelago.
2. Place the .apworld in your Archipelago/custom_worlds folder, or double-click the .apworld to do so automatically.
3. Use ArchipelagoLauncher.exe to open the Launcher.
4. Create a YAML Options file. You can use the Options Creator in the Archipelago Launcher to do this.
5. Place your YAML Options file in the Players folder.
6. Use Generate in the Archipelago Launcher to generate your game.
7. Open your Archipelago/output folder, there should be a .zip file called something similar to "AP_123456789.zip".
8. Go to the website https://archipelago.gg/uploads and upload this .zip to create a new room.
9. Click on "Download Patch File...".
10. Use Open Patch in the Archipelago Launcher. Open this downloaded Patch File and your ROM.
11. It should create the neccesary ROM file to play and also open the SNI Client.
12. Connect the SNI Client to your Archipelago room.

## Emulator

- snes9x-nwa
  - Make sure to click on the Network Menu and check "Enable Emu Network Control".
- Bizhawk
  - Go to Tools -> Lua Console. Then Script -> Open Script and go to your Archipelago\SNI\lua folder and open Connector.lua.
  - If using Bizhawk, make sure you're using the SNI Client.

## Trackers

- Universal Tracker is supported.