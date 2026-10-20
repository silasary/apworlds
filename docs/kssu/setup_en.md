# Kirby Super Star Ultra Randomizer Setup Guide

## Important
As we are using BizHawk, this guide is only applicable to Windows and Linux systems. This APWorld is still in development, so expect bugs! 
If you find a bug, please report it to the #future-game-design thread for this game!

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- BizHawk: [Bizhawk Releases from TASVideos](https://tasvideos.org/BizHawk/ReleaseHistory)
  - Version 2.11.1 is recommended
    - **Important**: If you decide to play on 2.10 or lower, then you need to **disable AutoSaveRam**
       at `Config > Customize... > Advanced`. Else, your save data will be lost upon closing the emulator.
  - Detailed installation instructions for BizHawk can be found at the above link.
  - Windows users must run the prerequisite installer first, which can also be found at the above link.
- A .nds file for the USA version of Kirby Super Star Ultra
- The built-in BizHawk client within the Archipelago software, which can be found 
  [here](https://github.com/ArchipelagoMW/Archipelago/releases)

## Configuring your YAML file

### What is a YAML file, and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should generate your game. 
Each player of a multiworld will provide their own YAML file. 
This setup allows each player to enjoy an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

Install the download .apworld file with the Archipelago Launcher. In the launcher, click "Generate Template Options" to generate a template YAML.
You can make a copy of this template, and edit it to configure your settings.

## Joining a MultiWorld Game

### Obtain your NDS patch file

When you join a multiworld game, you will be asked to provide your YAML file to whoever is hosting. Once that is done,
the host will provide you with either a link to download your data file, or with a zip file containing everyone's data
files. Your data file should have a `.apkssu` extension. 

Double-click on your `.apkssu` file to start your client and start the ROM patch process. Once the process is finished, 
the client and the emulator will be started automatically, if you associated the extension to the client as recommended.
If the extension isn't associated', select the BizHawk client or the Archipelago Launcher as the program to open the 
`.apkssu` file with.

### Connect client to emulator

Once both the client and the emulator are started, you must connect them, if this is not done automatically. Within the 
emulator click on the "Tools" menu and select "Lua Console". Click the folder button or press Ctrl+O to open a Lua 
script.

Navigate to your Archipelago install folder and open `data/lua/connector_bizhawk_generic.lua`.

### Connect to the Multiserver

To connect the client to the multiserver simply put `slotname:password@<address>:<port>` on the textfield on top and 
press enter or `Connect`. 
If the server does not have a password, put `None` as the password.
An alternative way to connect is typing `/connect <address>:<port> [password]` into the bottom text field and then 
typing your slot name when prompted.
