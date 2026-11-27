# Freedom Planet 2

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a config file (but only if this is web hosted).

## What does randomisation do to this game?

This implementation shuffles Star Cards, Time Capsules, Brave Stones, Potions, Battlesphere Keys and Stage Unlocks into the Archipelago item pool and uses the map screen from the Classic Mode to allow the player to freely select stages to play, assuming they have them unlocked.

## What is the goal of Freedom Planet 2 when randomised?

The goal of this randomisation is to unlock and clear the true final boss in the Weapon's Core stage. To do this, the player needs to find 32 Star Cards and 13 Time Capsules as well as access to the various Bakunawa stages (if chapter unlocking is used in the player settings. If set to Open, then the Star Cards and Time Capsules are all that are required).

## What items and locations get shuffled?

48 Star Cards, 21 Time Capusles, 18 Battlesphere Keys, all of the Brave Stone and Potion items and some form of Stage Unlock set up will always be shuffled into the item pool. Depending on the player's settings, the form of Stage Unlock will vary between a set of eight Progressive Chapters, eight individually named chapter items corresponding to the various episodes in the normal Adventure Mode or an item for each individual stage. Locations will always include stage clears (including the Battlesphere Challenges), alongisde other locations depending on the player's settings. These locations consist of:

- Chests found within stages (with an optional logic lock in the form of Chest Tracer items).
- Items in Milla's Shop (with a default of 30 locations, each costing 1 Gold Gem).
- Items in the Vinyl Shop (with a default of 60 locations, each costing 100 Crystal Shards).
- A location for each unique enemy type.
- A location for each unique boss type.

Depending on the player settings, different types of filler items will be added or removed from the item pool, with various trap items also being optional inclusions.

## Is there a guide that lists where each of those things can be found in every level?

A list of the various enemy types can be found [here](https://github.com/Knuxfan24/Freedom-Planet-2-Archipelago/wiki/Enemies), with one for bosses being [here](https://github.com/Knuxfan24/Freedom-Planet-2-Archipelago/wiki/Bosses). Alternatively, [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker)'s map page will display which enemy and boss checks are present in each stage on its map of the stage select.

For chest locations, the Chest Tracer option will add arrows to the screen pointing in the direction of each chest in the stage.

## Which items can be in another player's world?

Any shuffled item can be in other players' worlds.

## What does another world's item look like in Freedom Planet 2?

By default, items for other games will appear as the Archipelago logo (with slightly altered versions for progression and trap items). The player can customise the appearance of these items by specifying custom sprites and shop descriptions, as detailed [here](https://github.com/Knuxfan24/Freedom-Planet-2-Archipelago/wiki/Custom).

## When the player receives an item, what happens?

Receiving an item will display a message indicating what item the player received and its finder. Only trap items will automatically activate, with Brave Stone trap items requiring the `trap_brave_stones` option to be enabled.

## How can I get started?

To get started playing Freedom Planet 2 in Archipelago, [go to the setup guide for this game](../../../tutorial/Freedom%20Planet%202/setup/en)