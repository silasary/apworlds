# Pikmin 1

## What does randomization do to this game?

All ship parts are shuffled to different locations

## What items and locations get shuffled?

All locations containing a ship part therefore have a total of 30 randomized locations. It is possible to activate more options in the YAML to have more locations which can go up to a maximum of 330

## What is the goal of Pikmin 1 when randomized?

The goal is to recover Captain Olimar's 30 ship parts.

## Which items can be in another player's world?

Any of the items which can be shuffled may also be placed into another player's world.

## What does another world's item look like in Pikmin 1 ?

There is no in-game display of a specific 3D model of an object from another archipelago player

## When the player receives an item, what happens?

If the player is not during the day in one of the 5 zones of the game or is not on the zone selection map the synchronization is suspended and otherwise the object received try to apply as soon as possible and if impossible for X reason it remains on hold until it becomes possible

## How are Pikmin locations detected?

When the Pikmin locations option is enabled, each location is named after a color and a threshold
(for example "Red Pikmin: 10"). It is checked as soon as the number of Pikmin of that color
**following Captain Olimar** (his current squad) reaches the threshold.

- Only Pikmin in Olimar's squad count: Pikmin left in the Onion, working (carrying, building,
  fighting), idle or scattered are not counted.
- Example: with a Red interval of 5, "Red Pikmin: 10" is checked the moment 10 Red Pikmin follow
  Olimar at the same time.
- The squad is limited to 100 Pikmin, all colors combined.
- Yellow Pikmin locations require 1 ship part and Blue Pikmin locations require 5 ship parts in logic.

## Commands

- /debughint - Toggle debug logging for hint-related messages.
- /debugdays - Toggle debug logging for day cycle messages.
- /debugpbonus - Toggle debug logging for Pikmin bonus item messages.
- /debuglanguage - Show the language currently detected by the client.
- /debugtext - Follow the pointer chain to the on-screen text and compare with the known PAL address.
- /debugsave - Show whether the client considers a save file to be loaded.
- /debugdump - Dump every debug info at once, to attach when reporting a bug.
- /debugwrites - Toggle logging of every RAM write made by the client.
- /nowrites - Toggle blocking of every RAM write made by the client (diagnostic only).