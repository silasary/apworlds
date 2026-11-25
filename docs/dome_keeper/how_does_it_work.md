A detailed (enough, hopefully) of how the multiworld and mod works for Dome Keeper as of v1.4.x

# Relic hunt

## Items generation

Based on your options/selection, items are as followed :

- Every keeper upgrades once that would be originally bought in game
    * For the engineer, there's as many drill upgrades as checked in your options
    * Same thing for the assessor, for both sphere damage and duration
- Every primary gadget upgrades once that would be originally bought in game
- Every weapon upgrades that would be originally bought in game
- Layer unlocks to be able to mine further in the game (separated by colored biomes)
- Extra iron, water or cobalt as selected in the options (by default 3 iron and 0 water/cobalt)
- Extra traps as selected in the options
- One key for each layer (so one key per chest)

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
    * You can click then it and grab the item in the middle, as soon the item is taken, it must check that location
- One treasure is generated per layer
    * Those are called "Layer x - Treasure"
    * Bring 4 irons to open the door
    * Once the door is opened, a treasure is dropped. Bring back the treasure to the dome to check that location.
- One chest is generated per layer
    * Those are called "Layer x - Chest"
    * Bring the associate key to open the door
    * Once the door is opened, a treasure is dropped. Bring back the treasure to the dome to check that location.
- Then, as many switches are needed to fill up the items amount. They are spread evenly between layers
    * 17 items not placed on a small map results in 6 switches in layer 1, 6 switches in layer 2, 5 switches in layer 3.

## Regions (also spheres)

They are simply cut by layers + with the archipelago upgrades:
- Layer 1 contains Layer 1 switches + Layer 1 cave + Layer 1 treasure + Layer 1 chest + the 6th first archipelago upgrades
- Layer 2 contains Layer 2 switches + Layer 2 cave + Layer 2 treasure + Layer 2 chest  + the 3 next archipelago upgrades
- Layer 3 contains Layer 3 switches + Layer 3 cave + Layer 3 treasure + Layer 3 chest  + the 3 next archipelago upgrades
- Layer 4 contains Layer 4 switches + Layer 4 cave + Layer 4 treasure + Layer 4 chest 
- Layer 5 contains Layer 5 switches + Layer 5 cave + Layer 5 treasure + Layer 5 chest  (and so on based on the amount of layers)...

## Item flags

- Drill upgrades, sphere damage, sphere lifetime and layer unlocks are considered as progression items
- Extra iron, water and cobalt are considered as filler
- Traps are considered as traps (duh)

## Mod features

- When the game loads your game :
    * Based on the seed, a path is selected for every splitted path in the tree (where you'd do a choice), it is done beforehand with the seed, which means rebooting will always give you the same "choice"
    * A water tile is added to the first colored layer to help getting water early for the upgrades
    * A tech tree is added with the 12 locations previously mentionned

- There's no exceptions to the location generation and checks, when a switch is clicked/cave is clicked/treasure is given to dome, it must check that location unless it have been checked precedently
- Upgrades that are in the archipelago items list are not purchaseable and must have a cross on them

# Guild assignments

## Items

Based on your options/selection, items are as followed :

- 15 unlocks for assignments (considering there is 16 and you start with one  pre unlocked)
- 49 starting irons (but can be water or cobalt based on your options)

(9 more assignments unlock if you do own the DLC)

## Locations

On every assignment, there's 4 location checks :
- Fulfilled assignment on "Regular" difficulty
- Fulfilled assignment on "Challenge" difficulty (completes the Regular difficulty automatically if you skip Regular)
- 2 treasures spreaded out in the caves, that you need to bring back to the dome just like in Relic Hunt

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

## Recommendations

- You can use the Mod Preview mod made by Kamikaze in the workshop to be able to preview what the cave looks like. It's mostly important for people when running assignments to not miss treasures
- If you run a sync, I advise to go for a Relic Hunt. Those are more shorter and fit more the pace of a one-time session. The map size has an impact on the game length, if your sync might last few hours, then take a huge map to have a slower pace (Dome Keeper runs are a bit short after all)
- If you run for an async then go for Guild Assignments. It's closer to the vanilla gameplay, there's no huge additions in the caves.