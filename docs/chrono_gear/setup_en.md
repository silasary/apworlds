# Chrono Gear Set Up Guide

## One Time Set Up

Each of the following steps only needs to be done once when you first set up the mod, or when the part relevant to 
that step is updated.

1. Currently, the self set up method for Godot Mod Loader does not work. Until either that is fixed or official mod
   support is added to Chrono Gear, there's no way to add the mod without decompiling the game and running it through
   the Godot editor.

2. See above.

3. The host of the multiworld will need to install the Chrono Gear AP World available at the releases page of the 
   [AP World's repo](https://github.com/Kalithar/ArchipelagoChronoGear). If you are playing the game, but not hosting, you do not need to install this.

## YAML File

You can get a YAML either from the releases page of the [AP World repo](https://github.com/Kalithar/ArchipelagoChronoGear), or by generating one yourself through
"Generate Template Options" in the Archipelago launcher (this method requires installing the AP World).

## Connecting to a Multiworld

To join a multiworld, create a new file with the Archipelago option enabled. If reconnecting to a multiworld, just
select the file you were using previously. Once you have a selected file, return to the title screen and select the
new Archipelago option that is there. Enter your connection information in the appropriate fields, leaving Password
blank if your server does not have one, and Connect. Once connected, you can start the game as normal.

## Game Information

### What is randomized?

You can receive Golden Gears, Laplus' Shackles, CDs, border arts, Threads of Time (split by shop and by page), level 
and world unlocks, and the Chrono Gear as items. Locations are checked when you normally receive any of these.

## FAQ

### I received items while I was offline, but I didn't get the pop up message for them once I opened the game

The game treats the file as loaded from the moment you select it on the file select screen, and I don't currently have
anything set up to treat the main menu as a different state. You did receive the items, but the pop up message is
hidden until you actually get into game.