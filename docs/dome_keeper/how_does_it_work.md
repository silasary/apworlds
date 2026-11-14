A detailed (enough, hopefully) of how the multiworld and mod works for Dome Keeper as of v1.4.x

# Relic hunt

## Items generation

Based on your options/selection, items are as followed :

- Every keeper upgrades once that would be originally bought in game
    * For the engineer, there's as many drill upgrades as checked in your options
    * Same thing for the assessor, for both sphere damage and duration
- Every primary gadget upgrades once that would be originally bought in game
- Every weapon upgrades that would be originally bought in game
- Layer unlocks if you use that progression system, based on the map size
- Extra iron, water or cobalt as selected in the options (by default 3 iron and 0 water/cobalt)
- Extra traps as selected in the options

A seed is also selected and used for map generation/anything that's randomised

## Locations generation

- 12 locations are archipelago upgrades
    * The first 2 of every branch (so 6 upgrades) are considered "sphere 1" and should be obtainable in the first colored layer
    * 3rd ones are considered "sphere 2"
    * 4th ones are considered "sphere 3"

Based on the map size, the amount of layers is generated :
- Small: 3 layers (2 layers unlock)
- Medium: 4 layers (3 layers unlock)
- Large: 6 layers (5 layers unlock)
- Huge: 7 layers (6 layers unlock)

Then :
- One cave is generated per layer (the one where you need to give 5 irons)
    * Those are called "Layer x - Cave"
    * Opens once you bring 5 irons
    * Uou can click then it and grab the item in the middle, as soon the item is taken, it must check that location
- One charm is generated per layer
    * Those are called "Layer x - Charm"
    * Bring 4 irons to open the door
    * Once the door is opened, a charm is dropped. Bring back the charm to the dome to check that location.
- Then, as many switches are needed to fill up the items amount. They are spread evenly between layers
    * 17 items not placed on a small map results in 6 switches in layer 1, 6 switches in layer 2, 5 switches in layer 3.

## Regions (also spheres)

They are simply cut by layers + with the archipelago upgrades:
- Layer 1 contains Layer 1 switches + Layer 1 cave + Layer 1 charm + the 6th first archipelago upgrades
- Layer 2 contains Layer 2 switches + Layer 2 cave + Layer 2 charm + the 3 next archipelago upgrades
- Layer 3 contains Layer 3 switches + Layer 3 cave + Layer 3 charm + the 3 next archipelago upgrades
- Layer 4 contains Layer 4 switches + Layer 4 cave + Layer 4 charm
- Layer 5 contains Layer 5 switches + Layer 5 cave + Layer 5 charm (and so on based on the amount of layers)...

## Item flags

- Drill upgrades, sphere damage, sphere lifetime and layer unlocks are considered as progression items
- Extra iron, water and cobalt are considered as filler
- Traps are considered as traps (duh)

## Mod features

- When the game loads your game :
    * Based on the seed, a path is selected for every splitted path in the tree (where you'd do a choice), it is done beforehand with the seed, which means rebooting will always give you the same "choice"
    * A water tile is added to the first colored layer to help getting water early for the upgrades
    * A tech tree is added with the 12 locations previously mentionned

- There's no exceptions to the location generation and checks, when a switch is clicked/cave is clicked/charm is given to dome, it must check that location unless it have been checked precedently
- Upgrades that are in the archipelago items list are not purchaseable and must have a cross on them

# Guild assignments

## Items

Based on your options/selection, items are as followed :

- 15 unlocks for assignments (considering there is 16 and you start with one  pre unlocked)
- 49 starting irons (but can be water or cobalt based on your options)

## Locations

On every assignment, there's 4 location checks :
- Fulfilled assignment on "Regular" difficulty
- Fulfilled assignment on "Challenge" difficulty (completes the Regular difficulty automatically if you skip Regular)
- 2 charms spreaded out in the caves, that you need to bring back to the dome just like in Relic Hunt

## Regions (also spheres)

They are simply cut by assignments : one assignment is one region with its location

## Item flags

- Assignment unlock are considered as progression
- Starting iron, water and cobalt are considered as filler

## Mod features

- When you get in the menu :
    * Assignments are locked until you get the item for it
    * One always starts unlocked, it's either random or you can pick it in the list
    * The checkbox marks if an assignment has be completed for the goal of the multiworld based on your options (if you selected the "must be challenge" tag or not)

You win the multiworld if the amount of assignments beaten with a checkmark gets to the number of assignments needed preselected

