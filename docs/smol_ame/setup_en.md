# Smol Ame Archipelago Randomizer Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [The Smol Ame apworld](https://github.com/Sh1r0Yaksha/SmolAmeAPWorld/releases),
- [Smol Ame Archipelago Client Mod](https://github.com/Sh1r0Yaksha/SmolAmeArchipelagoMod/releases)

## Configuration Template

The template for setting options can be found here: [Template](/template.yaml)

## Client Mod Installation

For vanilla [Smol Ame](https://moocow-games.itch.io/smol-ame), download the *BepInEx_win_x86* version of BepinEx from its [Releases](https://github.com/BepInEx/BepInEx/releases) page. For [Continued Adventures](https://witcherchan.itch.io/smol-ame-continued-adventure), download the *BepInEx_win_x64 version*.

Extract its contents into the game directory and run the game once. This should create some directories inside the BepInEx directory.

Download the `SmolAmeArchipelagoMod.zip` file from [Releases](https://github.com/Sh1r0Yaksha/SmolAmeArchipelagoMod/releases) page and extract its content into the BepInEx/plugins directory The .dll files should be in a directory named BepInEx/plugins/SmolAmeArchipelagoMod.

Run the game, and the client should start.

## Running on Linux
Follow the same steps as the Windows version, and run the game through your preferred method (Wine/Steam). It should work flawlessly

## How to play

First, you need a room to connect to. For this, you or someone you know has to generate a game.  
This will not be explained here,
but you can check the [Archipelago Setup Guide](/tutorial/Archipelago/setup_en#generating-a-game).

You also need to have [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest) installed
and the [The Smol Ame apworld](https://github.com/NewSoupVi/Archipelago/releases) installed into Archipelago.

From here, connecting to your Smol Ame slot is easy. In the game, open the pause menu and scroll down to find the fields *Server*, *Port*, *Slot* and *Password*.

For an Archipelago server address like `archipelago.gg:12345`, enter `archipelago.gg` as the Server and `12345` as the Port. Slot is your username, and Password is whatever password you or your host set for the server.

Once all the fields are filled in, scroll down and select Connect. You should now be connected. A console text in the top-right corner displays details about your connection.