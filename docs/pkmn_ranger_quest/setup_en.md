# Setup Guide for Pokémon Ranger (Quest) in Archipelago

## Important

As we are using BizHawk, this guide is only applicable to Windows and Linux systems. 
This APWorld is still in development, so expect bugs! 
If you find one, please report it in the channel of this game!

## Required Software

- BizHawk: [Bizhawk Releases from TASVideos](https://tasvideos.org/BizHawk/ReleaseHistory)
  - Version 2.10 is recommended; 2.11 is known to have issues with some Nintendo DS games
  - **Important**: Upon opening the emulator for the first time, go to `Config > Customize... > Advanced` 
    and **disable** `AutoSaveRam`. Else, save data might not be properly saved.
  - Detailed installation instructions for BizHawk can be found at the above link.
  - Windows users must run the prerequisite installer first, which can also be found at the above link.
- The built-in BizHawk client within the Archipelago software, which can be found 
  [here](https://github.com/ArchipelagoMW/Archipelago/releases)
- An unmodified .nds ROM file for Pokémon Ranger (any language). The Archipelago community cannot provide this.

## Joining a MultiWorld Game

Once the multiworld has been generated and is running (either on Archipelago.gg, locally on your PC, 
or on a custom server), you can connect to your slot:
- Open the Archipelago Launcher and select "BizHawk Client". A new window will pop up that lets you put in your 
  connection details at the top in order to connect to the multiworld (don't forget to click `Connect`).
- After that, open your Pokémon Ranger ROM in BizHawk.
  - If you haven't opened that ROM in BizHawk before but have an already completed save file 
    (either from playing on another emulator or dumped from the cartridge), you can import that into BizHawk:
    - Click `File > Save Ram > Flush Save Ram` in BizHawk.
    - Close BizHawk.
    - In `<BizHawk installation folder>/NDS/SaveRAM/`, replace the newly generated `Pokemon Ranger (...).SaveRAM`
      save file with your completed save file.
    - Reopen BizHawk
- Click `Tools > Lua Console` in BizHawk, which will make a new window titled `Lua Console` pop up. If you have played 
  other AP games in BizHawk before, then click `File > Recent Scripts > .../connector_bizhawk_generic.lua` 
  in that new window. Otherwise, click `Script > Open Script...` and choose
  `<Archipelago installation>/data/lua/connector_bizhawk_generic.lua`.

Once the Lua Console says `Client connected` and the BizHawk Client (text) window says that you joined the multiworld, 
you're ready to play.
