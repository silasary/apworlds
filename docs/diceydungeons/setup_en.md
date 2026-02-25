# Dicey Dungeons Randomizer Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [Dicey Dungeons](https://store.steampowered.com/app/861540/Dicey_Dungeons/)
- [The Dicey Dungeons apworld](https://github.com/Fylcoast/AP_diceydungeons/releases), 
  if not bundled with your version of Archipelago

## How to play

First, you need a room to connect to. For this, you or someone you know has to generate a game.  
This will not be explained here,
but you can check the [Archipelago Setup Guide](/tutorial/Archipelago/setup_en#generating-a-game).

Download Dicey Dungeons (current patch).

Launch the Dicey Dungeons Client from Archipelago, add the URL:Port and your slot name, and Connect.

Your Dicey Dungeons installation path needs to be configured with client command `/install_location [install location]`.
If you installed into the default Steam installation location on your C: drive, you can skip this.

If your installation path has spaces in it, which is very likely, you will have to wrap the [install location] in quotes. For example:

`/install_location "C:\Program Files (x86)\Steam\steamapps\common\Dicey Dungeons"`

You then need to patch your local installation with client command `/patch`.

Finally, launch the game with `/dicey`, and you're off and running!

## Helpful commands

- `!missing Completed` will show you which episodes still need to be beaten.

