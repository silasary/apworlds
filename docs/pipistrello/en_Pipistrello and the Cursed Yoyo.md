# Pipistrello and the Cursed Yoyo

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need 
to configure and export a config file.

## What does randomization do to this game?

The randomizer is still in early alpha, so only South Plaza and Faria (including the mini-dungeon and dungeon)
are randomized.
Items and rewards are randomized and replaced with location checks.

The goal is to reach North Plaza via the sewers. In addition to hitting the 2 levers, you must also:

- Obtain the Faria Mega-Battery
- Defeat the Slime Tycoon in SlimeCorp Excavation Site

You can also pick from several levels of logic difficulty.
Make sure you read the description of the difficulty setting in the options yaml before selecting a difficulty above
Normal.

## What items get shuffled?

By default, the following items are in the item pool:
- Abilities
- Badges
  - Badges are progressive. The first item will be the base badge, and the second item will be the refined badge.
- BP shards
- Charged moves
- Mega-Batteries
- Petal containers
- Special moves
- Special items (e.g. Staff ID for the Faria dungeon)
- Upgrades

Money bags are given as filler items.

## What locations get shuffled?

By default, the following locations are enabled:
- Badges
- BP shards
- Combat rewards (only required ones)
- Diamonds
- Musical notes rewards
- Petal containers
- Quest rewards
- Taxi phone interactions

Additionally, the following options can be enabled:

- Moneysanity - Adds standalone money bags and money bags from optional combat encounters as location checks
  - Note: Money bags from combats/quests/etc are always enabled as locations, regardless of this setting

The upgrade tree and badge refinements *are not* currently randomized.

## What does another world's item look like in Pipistrello and the Cursed Yoyo?

Items from other worlds show up as Archipelago sprites in the game world, with corresponding Archipelago icons for map
pins. If the location was originally a money bag, the sprite and map pin will be green instead.

When you collect another world's item, you will get a message showing the item name and recipient.

## When the player receives an item, what happens?

The item is instantly granted to you, and a message appears on the bottom of the screen showing the item name and sender.
