# HoloCure Randomizer Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [The HoloCure apworld](https://github.com/PippleCultist/HoloCureArchipelagoMod/releases), 
  if not bundled with your version of Archipelago

## How to play

First, you need a room to connect to. For this, you or someone you know has to generate a game.  
This will not be explained here,
but you can check the [Archipelago Setup Guide](/tutorial/Archipelago/setup_en#generating-a-game).

You also need to have [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest) installed
and the [The HoloCure apworld](https://github.com/PippleCultist/HoloCureArchipelagoMod/releases) installed into Archipelago.

From here, connecting to your HoloCure slot is easy. There are two scenarios.

### Webhost Room

If your room is hosted on a WebHost (e.g. [archipelago.gg](https://archipelago.gg)),
you should get the link and port (e.g. archipelago.gg:38281).
Then you launch HoloCure, and a separate window named HoloCure Archipelago Mod will open. 
There will be a window in the GUI named Connect, and you should put the address in the field named IP. For Player Name, you put the assigned player name that was set in the YAML file. Password is only required if the apworld is set to require one.

### Locally hosted room

If your room does not have a WebHost room page available, you can launch HoloCure manually.  

Usually the address will be in the format of localhost:port number. Copy this into the IP field. The rest of the steps are the same as the Webhost Room.