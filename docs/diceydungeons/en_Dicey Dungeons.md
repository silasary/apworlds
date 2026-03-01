# Dicey Dungeons

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a
config file.

## What does randomization do to this game?

Your pool of items (equipment) which you can acquire throughout your runs has been turned into AP items, which are added back into your pool when you receive the item. NOTE: Items gained will only be added to the pool for future runs, not your current run.

## What characters are supported?

The Warrior is the only character supported by this mod. Other characters are present, but playing their Episodes will not benefit you.

## What is the goal of Dicey Dungeons when randomized?

The game is Completed once you have beaten all 6 episodes for the Warrior.

## What items and locations get shuffled?

All items in the item pool will get shuffled, and will only be re-added when the item is received. Locations will be (if configured) chests, shops, trades, and Level ups.

## Which items can be in another player's world?

Any of the items which can be shuffled may also be placed into another player's world.

## What does another world's item look like in Dicey Dungeons?

An item belonging to another world will show up as a Gray equipment box, featuring the item's name, its owner in the multiworld, and some flavor text about how important it (probably) is.

## When the player receives an item, what happens?

Your Client will report receiving the item, and the item will be added to future episode generation, but your current run will not be affected in any way.

## Why aren't my items appearing?

You may be wondering where your equipment is, if you've received some from the multiworld but keep getting filler in your chests / shops. All of the following prevent you from receiving real equipment:

1. You have not started a new Episode run since receiving that equipment. Runs generated when starting an episode are locked in with their items, so any new AP items you receive cannot load in until the next time you start a run.
1. You have remaining AP location checks for that spot. If you set checks_per_chest higher than 1, every chest will continue filling with AP location checks on future runs until you are out. The same goes for shops and trades.
1. You have not received enough equipment for a location to be populated. Equipment is filled in to applicable places, roughly, from the start of the episode on. So if you receive real equipment from a Floor 1 chest, but filler in Floor 2 chest, this is why.
1. The equipment you have received is not applicable in the locations you are checking. All equipment are locked to only be received in certain episodes, and certain types of locations (chests/shops/trades), based on their appearances in the base game. So if you receive filler from a Floor 1 chest, but your Floor 2 shop fills with a real piece of equipment, this is why. Or, if your Episode 1 is barren of equipment, but Episode 6 populates with some, this is why. The data can be viewed [here](../data/game_data.py)

## I can't launch the game "Game launcher error: Executable not found"

The setting for your Dicey Dungeons install folder is probably not correct. Check the path with client command `/install_folder`. 

If the folder is incorrect, please correct it in the "diceydungeons_options" section of your host.yaml file (in your Archipelago install), then restart the Client.