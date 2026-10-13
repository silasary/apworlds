# Setup Guide for Pokémon Black and White: Archipelago

## Important

As we are using BizHawk, this guide is only applicable to Windows and Linux systems. 
This APWorld is still in development, so expect bugs! 
If you find one, please report it in the channel of this game on the Archipelago Discord server!

## Required Software

- BizHawk: [Bizhawk Releases from TASVideos](https://tasvideos.org/BizHawk/ReleaseHistory)
  - Version 2.11.1 is recommended
    - 2.11 doesn't work with this game
    - **Important**: If you decide to play on 2.10 or lower, then you need to **disable AutoSaveRam**
       at `Config > Customize... > Advanced`. Else, your save data will be lost upon closing the emulator.
  - Detailed installation instructions for BizHawk can be found at the above link.
  - Windows users must run the prerequisite installer first, which can also be found at the above link.
- The built-in BizHawk client within the Archipelago software, which can be found 
  [here](https://github.com/ArchipelagoMW/Archipelago/releases)
- A .nds ROM file for the english versions of Pokémon Black and White
  - The english versions are the same for USA and Europe
  - The Archipelago community cannot provide them

## Optional Software

- Universal Tracker + BizHawk w/ Universal Tracker
  - Check UT's channel and its threads on the discord server for more information and instructions
- [The Poptracker pack for this game](https://github.com/Radis7Noir/pokemon-bw-ap-tracker/releases),
  to be used with [Poptracker](https://github.com/black-sliver/PopTracker/releases)
- The QoL Lua script and various plugins
  - Check the unofficial mods thread in this game's channel

## Joining a MultiWorld Game

### Obtain your NDS patch file

When you join a multiworld game, you will be asked to provide your YAML file to whoever is hosting. Once that is done,
the host will provide you with either a link to download your patch file, or with a zip file containing everyone's
patch files. 
Your patch file should have a `.apblack`, `.apwhite`, or `.apbw` extension. 

Double-click on your patch file to start your client and start the ROM patch process. 
If your PC asks you which program to open the patch file with, select the Archipelago Launcher (and **not BizHawk**).
Once the process is finished, the client and the emulator will be started automatically, 
if not set otherwise in the `host.yaml`. 
Alternatively, you can open the AP Launcher, select `Open Patch`, and then select your patch file to start the client
and the emulator.

### Connect client to emulator

Once both the client and the emulator are started, you must connect them, if this is not done automatically.
Otherwise, within the emulator, click on the "Tools" menu and select "Lua Console". Click the folder button or press 
Ctrl+O to open a Lua script.
Navigate to your Archipelago install folder and open `data/lua/connector_bizhawk_generic.lua`.

### Connect to the Multiserver

To connect the client to the multiserver, simply put `<address>:<port>` on the textfield on top, 
press enter or `Connect`, and type your player and password when/if prompted. 
An alternative way to connect is typing `/connect <address>:<port> [password]` into the bottom text field and then 
typing your slot name (if prompted).
