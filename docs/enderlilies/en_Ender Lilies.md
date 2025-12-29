# Ender lilies

## What does randomization do to this game?

Spirits, souls, trinkets and lore pieces which the player would normally acquire throughout the game have been moved 
around. 
Their placements ensure that the game is beatable, but because of the item shuffle the player may need to access 
certain areas before, or later than, they would in the vanilla game.
The only exception is the Curio which remains at its original pedestal. 
Thus, reaching ending C always requires having the seven stone tablets.

The cost to equip the trinkets and upgrades the spirits can also be randomized, providing an excuse to the player to 
test different loadout. 

The randomizer also provides the possibility to start the game in any of the rooms containing a save point.
This results in more than thirty possible starting locations.

It also provides an entrance randomizer option. 
Every room entrances and exists ensure that transitions are two ways so you can go back and forth.

The player can also custom the lower/higher bound of the chapter and its progression criteria. 


## What is the goal of this game when randomized?

The player can choose among four goals: the first three being achieving ending A, B or C and the last possibility of 
being achieving any of them.


## What "items" can you unlock?

* Spirits
* Trinkets
* Stagnant/furious/ancient souls
* Lore piece

Note that the player always starts with a spirit. 
The type of the starting spirit (Umbral knight, main or any) and the amount of use (vanilla or infinite) are options 
that can be changed in the player YAML. 


## Where can I find items? (i.e., what is a "check")

As in the vanilla game, defeating a spirit and collecting a shiny (i.e., where you normally find lore pieces, souls or 
trinkets) will give the player an item. 
As stated previously, the only exception is the pedestal holding the Curio. 

In the vanilla game, defeating a main spirit provides three items upon defeat.
In the randomizer, only one item is provided per spirit defeated. 


## What non-randomized changes are there compared to the vanilla game?

Seven trinkets that were created for the game but not made available in the vanilla experience can be added to the 
item pool. 

Since main spirit no longer provide three items and that more trinket are available, the player has an option to 
define what items will be removed from the item pool to ensure that the number of items is consistent with the number 
of "checks"/locations.


## Which of my items can be in another player's world?

All the items can be in another world except for the Curio.
The player also has an option to force each Stone Tablets to be in one of the main regions of its own world. 


## What does another world's item look like in Ender lilies?

Before collecting the item, there is no visual difference between an item belonging to the player world versus the 
other worlds.
However, when an item from another world is collected, an ingame message will appear to provide the name of the item 
and the name of the world it belongs to. 


## Other changes

Since it is possible to start with a spirit that cannot break things (e.g., barrels and doors), all breakable will be 
already broken until the player grab a spirit that can break things. 


## Basic thing to know for logic

Some basic maneuver tricks are assumed to be known by the player. 
In the following, we described those.

Silva can be used to gain height using fully charged attack. 
Two of these can be performed for maximum height from a single Silva use.

Main Spirit use resets after using a double jump or an upgraded dodge. 
With this knowledge it is possible to use Silva six times to gain more height or distance.

Sinner goes slightly further than upgraded dodge. 
The distance is increased through leveling it up.

Flops are very powerful before getting wings (i.e., upgraded dodge). 
Logic expects flops so be expected to faceplant a lot. 
They can also be canceled with an airstall. 
A flop is performed by doing a dive immediately after jumping. 
This gives more distance than a stand jump or dive.

Airstalls are performed to reset momentum and cancel flops, typically to grab a nearby ledge. 
Most spirits can cancel flops but airstalls allow for more time to adjust players hand movement. 
Main spirits, Headless and Test Subject can be used to perform an airstall


## Fancy techniques that are not considered in logic

Ulv blasts can help to increase distance. 
The fall animation can be canceled with a double jump, a dodge or the parry ring.

Switching loadouts (i.e., weapon sets) cancels the fall timer from certain weapons like Silva and Eleine, which makes 
it possible to reach certain places that wouldn't normally be possible to get.




