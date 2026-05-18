# Spirit Island Randomizer Setup Guide

## Quick Links
- [Main Page](../../../../games/Spirit%20Island/info/en)
- [Options Page](../../../../games/Spirit%20Island/player-options)
- [SI-Modding GitHub](https://github.com/Wouter17/Spirit-Archipelago)

## Required Software

- Windows 10+
- [Spirit Island](https://store.steampowered.com/app/1236720/Spirit_Island/) for PC
- [SI Modding Client](https://github.com/Wouter17/Spirit-Archipelago/releases) (instructions below)

## Overview

*SI-Modding* is an Archipelago MultiWorld Client for Spirit Island. It works by using Harmony to inject custom code into the game at runtime, so none of the original game files need to be modified in any way.

When connecting to an Archipelago session using the in-game login screen, all modifications are automatically downloaded and applied.

From this point, the game will communicate with the Archipelago service directly to manage sending/receiving items.

## Spirit Island Modding Guide

### Install

1. Download and extract the contents of the latest [Spirit Island Modding Release](https://github.com/Wouter17/Spirit-Archipelago/releases) anywhere on your PC

2. Double-Click **si-modding-install.bat** follow the instructions.

Once *SI-Modding* is installed, you have successfully installed everything you need to play/participate in Archipelago MultiWorld games.

### Disable

To temporarily turn off *SI-Modding* and return to the original game, open **...\Spirit Island\BepInEx\config\SIModding.cfg** in a text editor like notepad and edit the following:

`DisableAllMods = true`

To re-enable, simply change the word **true** back to a **false**.

### Uninstall

To completely remove *SI-Modding*, navigate to your game's installation folder and run **si-modding-uninstall.bat**.

## Generate a MultiWorld Game

1. Visit the [Player Options](../../../../games/Spirit%20Island/player-options) page and configure the game-specific options to taste.

2. Export your yaml file and use it to generate a new randomized game.

*For instructions on how to generate an Archipelago game, refer to the [Archipelago Setup Guide](../../../../tutorial/Archipelago/setup/en)*

## Joining a MultiWorld Game

1. Launch the game

2. The top left of the main screen will show a window where you can enter the details for your Archipelago session.

![Sign-In Screen](https://i.imgur.com/AWDEwRe.png)

3. Sign-in with the server address, slot name, and password of the corresponding room you would like to join.
- Otherwise, if you just want to play the vanilla game without any modifications, you may press exit or ignore this window.

4. Upon successful connection to the Archipelago service, the interface will say you are connected and will display your cardplay and energy offsets, and the remaining goals.

## Playing Co-Op

- To play local multiplayer (or Parsec/"Steam Play Together"), simply add the additional player to your game session as you would in the base game.

- To play online multiplayer connect all players to the same slot before joining the lobby. Playing online whilst playing with different slots will most likely cause bugs with gaining powercards.
