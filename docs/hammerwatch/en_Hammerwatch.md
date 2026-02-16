# Hammerwatch

## What does randomization do to this game?

The following items are randomized in the multiworld:

* Keys, Mirrors, and Ore (bonus keys are optional)
* Strange Planks
* Rune Keys
* The pickaxe, shovel, and frying pan
* Chests (bonus chests are optional)
* Vendor Coins
* Ankhs
* Potions
* Diamonds
* Stat Upgrades (Health, Mana, Damage, Defense)
* Easter egg items (Sonic rings, Serious Sam health pickup)

The following items can additionally be randomized in the multiworld:

* Recovery items (healing/mana recovery items)
* Items in randomized secrets (in the Temple campaign)
* Items from random peg puzzles
* Major enemy loot (minibosses, towers, and some bosses)
* Button effects
* Shop upgrades

The following things can be shuffled locally, some with options for more control over how they are shuffled:

* Minor treasure (coin piles, pots, crates, and bushes)
* Enemies (excluding bosses)
* Gate types (excludes bonus gates)
* Shop locations
* Shop upgrades
* Level exits

In the Temple of the Sun campaign the frying pan, pumps lever, and pickaxe can be split into fragments. This requires 
you to collect all the fragments to get the full item. This makes it so you potentially have to explore more of the 
multiworld to progress more in your own game. This feature can be configured in the YAML.

Hammerwatch in vanilla already implements some item randomization, and these rules are taken into account when
determining which locations can have items.

## What is the goal of Hammerwatch when randomized?

There are a few goals that can be chosen in your YAML:
* Defeat all the bosses (Queen, Knight, Lich, Worldfire) in the Castle Hammerwatch campaign
* Defeat Worldfire and collect 12 strange planks, then escape with your life in the Castle Hammerwatch campaign
* Defeat all the bosses (Dune Sharks, Krilith, Sha'Rand) in the Temple of the Sun campaign
* Unlock and complete the Pyramid of Fear in the Temple of the Sun campaign
* Collect a certain number of strange planks in either campaign

## What does another world's item look like in Hammerwatch?

Items belonging to other players will have a Hammerwatch sprite matched to the name of the item, or a sprite resembling 
the Archipelago logo if a match is not found.
For example an item name containg the word Ruby may have the sprite of a red diamond, and an item named Power Bomb may
have the sprite of a bomb. 
These items will also have a translucent Archipelago logo displayed behind the item to help differentiate them from your
own items.

How items are matched can be adjusted by modifying the ap_item_matching.json file in the archipelago-assets folder
after installing the mod.

## When the player receives an item, what happens?

When the player receives an item it appears at their feet, and they immediately pick it up if they can. If the item is a
chest it is automatically broken open on delivery. If the item is a button effect or a shop upgrade the effects are
applied immediately when received.

## If I'm at full health/mana how does the server know that I found a recovery item if I can't pick it up?

Items that can't be picked up can be walked on to notify the server that you have found the item. 
This prevents you from having to damage yourself or use a skill in order to collect the location!

## Custom items

Some options add custom items to the item pool:

Big bronze keys can be enabled for the Castle Hammerwatch campaign. When picked up they are worth 3 bronze keys.
They exist as an option to reduce the massive amount of required progression items in the item pool and to make
receiving bronze keys feel more meaningful.

Floor master keys will be for a specific level, and can be used to unlock all gates on that level without being consumed.
This serves as another way to reduce the total number of progression items and can make logic more interesting.

The hammer is an item that is required to destroy breakable walls.

Tool fragments (pickaxe, pumps lever, frying pan, and hammer) are pieces of their respective tool, collecting all of
them will grant the full tool. The current number of hammer fragments can be seen at the top of the screen
(no number means the full hammer has been obtained). The  quantities of the other fragments can be seen overlayed where
the tool icon would normally be seen while on the map screen.

Traps are items that take the appearance of chests, but when broken open will contain a surprise!

Custom sprites exist for a handful of other custom items:

* Button effects - appear as a downwards facing blue arrow
* Boss runes - appear as a miniature red glowing version of the rune it represents
* Shop upgrades - appear as a square with the upgrade category's shop icon

## Client options

There are a number of options that can be toggled in the options menu in game:

Deathlink: lets you toggle Deathlink regardless of what was set in the player's YAML

Explore Speed: by pressing a rebindable key, you can greatly increase your speed to make level traversal quicker. This 
ability goes on cooldown for 5 seconds after the player attacks, takes damage, or is targeted by an enemy

Explore Speed Ping: plays a sound when you can turn on Explore Speed

Fragile Breakables: makes it so fragile objects such as pots, grass, or chests break open upon collision with a player,
accelerating looting

AP Chat Mirroring: mirrors in-game chat to the Archipelago server and vice versa

Shop Item Hinting: when Shopsanity is on, will send hints to the server for any progression items in a shop after
closing it

TrapLink: when anybody with TrapLink on receives a trap, everyone else with TrapLink enabled will receive a copy of that
trap.
Traps belonging to other games will attempt to be interpreted by Hammerwatch as one of its own traps

## Client commands

A few commands have been added to the client to help prevent softlocks or to provide quality of life. To run a command,
enter it in the in-game chat with its arguments and hit enter. Surrounding an argument with quotes ("") will include any
spaces in the argument. The current commands are:

/help: lists all commands and their usages

/tp \[level_code] \[start_id]: teleports you to the specified start node, or to the level start with only the level code.
With no arguments teleports to where you started the game

/flag <flag_name\> \[true/false]: sets the value of the given flag, with only 1 argument returns the value of the flag
instead.
Used primarily to debug or to fix issues if a flag or event isn't triggered correctly

/deathlink: toggles deathlink on/off. Note this also can be toggled in the options menu

## The port on the server changed, what do I do??

If the server's port has changed, you can force load a save by doing the following:

1. Connect to the archipelago server with the new port
2. Navigate to the Single button for singleplayer or the Multiplayer > Local/Host buttons for multiplayer like you would start a new save
3. Click the Load button at the bottom and select your save file
4. You should now be loaded in! If you save, the next time you play you should be able to continue using the Resume button

## How many checks does each option add?

| Option                   | Castle        | Temple       |
|--------------------------|---------------|--------------|
| Base                     | ~375          | ~190         |
| Bonus Chests             | 227           | 75           |
| Bonus Keys               | 18            | 2            |
| Randomize Peg Puzzles*   | 7 puzzles     | 10 puzzles   |
| Randomize Secrets        | 0             | 20           |
| Randomize Enemy Loot     | ~54 (122 max) | ~39 (98 max) |
| Randomize Recovery Items | 452           | 105          |
| Buttonsanity*            | 170           | 67           |
| Buttoninsanity*          | 301           | 102          |
| Shopsanity               | 70-77         | 70-77        |

*Some notes:

The Randomize Peg Puzzles option adds 0-4 locations per puzzle, with an average of around 2 per puzzle

The Buttonsanity rows in the table include peg puzzle buttons, which aren't randomized if Randomize Peg Puzzles is off