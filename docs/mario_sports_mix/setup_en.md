# Mario Sports Mix Setup Guide

## Required Software
* [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) (0.6.7 or newer)
* [Latest version of this APWorld](https://github.com/ElectroStarz/ArchipelagoMSM/releases)
* [Dolphin Emulator](https://dolphin-emu.org/download/?ref=btn)
* Your copy of Mario Sports Mix (NTSC-J (Japanese) isn't supported)


## How to install
### Archipelago
1) Download the [latest version of Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
2) Download the [latest version of this APWorld](https://github.com/ElectroStarz/ArchipelagoMSM/releases) and put it in
your custom_worlds folder, or click Install APWorld in the Archipelago Launcher and select the APWorld you downloaded.

### Dolphin
1) [Dump your version of Mario Sports Mix](https://wii.hacks.guide/dump-games) (Requires [modded Wii / vWii](https://wii.hacks.guide/get-started))
2) Put the dump into a folder and set it as a game folder in Dolphin (Config → Paths)

### Mac Setup
For Mac devices, Dolphin requires a special signing. See [here](https://github.com/aldelaro5/dolphin-memory-engine/blob/master/README.md#macos-code-signing)
for more detail and setup. You will need [this file](https://github.com/aldelaro5/dolphin-memory-engine/blob/master/Tools/MacSetup.sh).

### Notes
* Select a save file before connecting to a room
* Make sure to read the bugs!

## Common Mistake
"I can't find the Mario Sports Mix Client or the Mario Sports Mix tab in the Options Creator?" Make sure to restart your
AP Launcher every time you install a custom world with the AP Launcher open!

## Creating a yaml file
### What is a yaml and why do I need one?
A yaml file tells Archipelago how it should generate your game. It may have certain options that can effect your game
like what difficulties are enabled, your goal condition, etc.

### How do I create one?
There are 2 ways of creating your yaml file. The 1st is the recommended way, while the 2nd is the less popular. 
1) Open the Archipelago Launcher and open the Options Creator. Find 'Mario Sports Mix' on the left and select your
options.
2) Open the Archipelago Launcher and click open on 'Generate Template Options'. Navigate to the Archipelago Folder and
open the Players folder, then Templates. Look for 'Mario Sports Mix.yaml' and you can manually edit your yaml using 
notepad.

## Connecting to a multiworld
Upon launching the Mario Sports Mix Client you will see an address bar. You can get the address and port from the room
host, it should look something like "archipelago.gg:65414". Then you can press connect and type in your slot name (and 
password if needed) and that's it!

## Auto Open
If you open your host.yaml and find the Mario Sports Mix settings, you should find 3 options. Auto Open, Game Path and
Dolphin Path. For auto open to work, you must set your Game Path (Which should look something like this:
"E:\Dolphin Games\Mario Sports Mix.iso") and your Dolphin Path (Something like this:
"C:\Users\elect\Downloads\Dolphin Emulator\Dolphin-x64\Dolphin.exe"). 

Once you open the client (If Dolphin isn't already open), you should see Mario Sports Mix automatically open with the
Roster Fix automatically applied! (See [here](https://github.com/ElectroStarz/ArchipelagoMSM/blob/main/worlds/mario_sports_mix/docs/bugs.md)
for more info on the Roster Bug)

## Still Having Trouble?
* Read the [information doc](https://github.com/ElectroStarz/ArchipelagoMSM/blob/main/worlds/mario_sports_mix/docs/en_Mario%20Sports%20Mix.md)!
* Read the [known bugs](https://github.com/ElectroStarz/ArchipelagoMSM/blob/main/worlds/mario_sports_mix/docs/bugs.md)!
* Ask your question in the [Mario Sports Mix Thread](https://discord.com/channels/731205301247803413/1485699253450833942)
in the [Archipelago Discord Server](https://discord.gg/archipelago)!
