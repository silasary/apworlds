# Final Fantasy XIII-2 Start Guide

## Prerequisites

As well as Archipelago and the AP World, you will also require:

- Nova Chrystalia (v2 beta) {link}
  - A mod management tool for the FF13 trilogy games
- Final Fantasy XIII-2 Randomizer tool {link}
  - To generate the necessary modpack from the AP seed file

## Understanding generation options



### Historia Crux randomisation

`shuffle_historia_crux`

If enabled, causes the Historia Crux to be randomised. This acts as an "Entrance Randomiser", causing you to start in a random area, and for some gates to lead you to areas they would not normally.

It is generally recommend to also enable Battle/Boss randomisation in the post-generation options when using this flag, as otherwise encounters in the area you start with may be unwinnable.

`fixed_crux_start`

To ease some of the issues with battle scaling, and to provide some more early game familiarity, you can choose the following options to fix the starting location(s) even when the Historia Crux is randomised.

`allow_dlc_locations`

By enabling this option, the 3 DLC locations will be added to the Historia Crux randomisation pool. Currently these locations contain no checks, but also adds 3 additional starting locations that will be unlocked from the beginning of the seed.

Enabling this option requires the "DLC Restoration" mod to be present within Nova Chrysalia for post-generation to function.

### Item randomisation options

`allow_dlc_items`

Add items from the DLC into the pool. 

Enabling this option requires the "DLC Restoration" mod to be present within Nova Chrysalia for post-generation to function.

`fully_remote_items`

Enabling this option will cause AP to place excluded/junk locations rather than
post-generation.


## After generating a game

Take the file and use the FF13-2 randomizer with ap import

(Screenshot)

### Local / post-generation settings

(details tbd)