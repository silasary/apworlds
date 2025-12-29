# Hammerwatch

## Where is the settings page?

The [player settings page for this game](../player-settings) contains all the options you need to configure and export 
a config file.

## What does randomization do to this game?

The locations of items have been shuffled around. Logic is in place to ensure the game can always be completed, 
however the player may have to travel to areas in a different order they would normally have to in a vanilla game.

## What is the goal of Hammerwatch when randomized?

There are a few goals that can be chosen in your YAML:
* Defeat all the bosses (Queen, Knight, Lich, Worldfire) in the Castle Hammerwatch campaign
* Defeat Worldfire and collect 12 strange planks, then escape with your life in the Castle Hammerwatch campaign
* Defeat all the bosses (Dune Sharks, Krilith, Sha'Rand) in the Temple of the Sun campaign
* Unlock and complete the Pyramid of fear in the Temple of the Sun campaign
* Collect a certain number of strange planks in either campaign

## What items and locations get randomized?

All pickups/valuables can be randomized, except for minor treasure (coin piles, pots, crates, and bushes), which can be shuffled locally. Recovery items 
(apples, mana crystals, etc.) and bonus chests are by default not randomized due to the sheer number of junk items added 
to the pool, but this behavior can be toggled in the YAML.
Items from peg puzzles, random temple secrets, and major enemies (minibosses, towers, and some bosses) can also be included in the pool.
Buttons can also be randomized, meaning that button effects can be found as items in the multiworld and pressing a button can send a check.

In the Temple of the Sun campaign the frying pan, pumps lever, and pickaxe can be split into fragments. This requires 
you to collect all the fragments to get the full item. This makes it so you potentially have to explore more of the 
multiworld to progress more in your own game. This feature can be configured in the YAML.

Hammerwatch in vanilla already implements some item randomization, and these rules are taken into account when
determining which locations can have items.

## What does another world's item look like in Hammerwatch?

An item belonging to another player's world will have a sprite resembling the Archipelago logo. Depending on the type of
item it will have a different sprite to help let you know if a particularly difficult check may be worth it or not.
When picked up the item it represents will automatically be sent to the other player.

## When the player receives an item, what happens?

When the player receives an item it appears at their feet, and they immediately pick it up if they can. If the item is a
chest it is automatically broken open on delivery.

## If I'm at full health/mana how does the server know that I found a recovery item if I can't pick it up?

Items that can't be picked up can be walked on to notify the server that you have found the item. 
This prevents you from having to damage yourself or use a skill in order to collect the check so that you can potentially get 
hint points!

## What are big bronze keys?

Big bronze keys are custom items created for the Castle Hammerwatch campaign. When picked up they act as 3 bronze keys.
They exist as an option to reduce the massive amount of required progression items in the item pool and to make
receiving bronze keys feel more meaningful.

## Client commands

A few commands have been added to the client to help prevent softlocks or to provide QoL. To run a command, enter it in
the in-game chat with its arguments and hit enter. Surrounding an argument with quotes ("") will include any spaces in
the argument. The current commands are:

/help: lists all commands and their usages

/tp [level_code] [start_id]: teleports you to the specified start node, or to the level start with only the level code. With no arguments teleports to where you started the game

/flag <flag_name\> [true/false]: sets the value of the given flag, with only 1 argument returns the value of the flag instead

/deathlink: toggles deathlink on/off

## How many checks does each option add?

| Option                   | Castle    | Temple     |
|--------------------------|-----------|------------|
| Base                     | ~375      | ~190       |
| Bonus Chests             | 227       | 75         |
| Bonus Keys               | 18        | 2          |
| Randomize Peg Puzzles*   | 7 puzzles | 10 puzzles |
| Randomize Secrets        | 0         | 20         |
| Randomize Enemy Loot     | ~54       | ~39        |
| Randomize Recovery Items | 452       | 105        |
| Buttonsanity*            | 170       | 67         |
| Buttoninsanity*          | 301       | 102        |
| Shopsanity               | 70-77     | "          |

*Some notes:

The Randomize Peg Puzzles option adds 0-4 locations per puzzle, with an average of around 2 per puzzle

The Buttonsanity rows in the table include peg puzzle buttons, which aren't randomized if Randomize Peg Puzzles is off