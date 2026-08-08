# Donkey Kong Country Returns (Wii)

## What is this game?

**Donkey Kong Country Returns (Wii)** is a 2.5D platformer developed by Retro Studios and originally released on the Wii.
You play as Donkey Kong, with Diddy Kong joining you as you make your way through the series of increasingly challenging
levels across several worlds.

The game combines traditional platforming with collectibles and alternate challenges. Most levels contain Puzzle Pieces
and Kong Letters to find, while completing a level normally, in Mirror Mode or in a Time Attack can provide additional rewards.

This Archipelago implementation randomizes these rewards across the multiworld. Instead of always receiving the reward
associated with the level you completed, completing a location can give you and item from another player's world.

The goal is to collect enough progression items from the multiworld to gain access to locations required to finish your game.

## What does randomization do to this game?

Locations are created for the various collectibles and challenges found throughout the game. Depending on your options,
these can include:

- Puzzle Pieces
- Puzzle Piece Sets
- Kong Letters
- Kong Letter Sets
- Level Clears
- Mirror Mode Level Clears
- Time Attack medals
- Rare Orbs
- Shop Keys
- Factory Buttons
- Squawks

Each enabled location is added to the Archipelago location pool and can contain an item belonging to any player in the
multiworld.

Mirror Mode and Time Attack locations can be enabled or disabled through their respective options.

## Mirror Mode

Mirror Mode locations are optional and can be enabled through the Mirror Mode option.

When enabled, completing a level in Mirror Mode provides an additional location for that level. Mirror Mode locations
require the appropriate Mirror Mode progression to access.

## Time Attacks

The **Time Attack Medals** option determines which of these medals are included in the location pool.

Individual medals can be selected directly, or you can use the random options to select medals automatically. Random
selections are made from the medals that were not already explicitly selected.

For example, selecting `Bronze` and `Gold` will include Bronze and Gold in Time Attack locations, but not Silver or Shiny Gold.

## What locations get shuffled?

The exact location pool depends on your selected options.

### Standard locations

These locations are available for the relevant levels:

- Puzzle Pieces
- Puzzle Piece Sets
- Kong Letters
- Kong Letter Sets
- Level Clears

### Optional locations

The following locations can be enabled or disabled through options:

- Mirror Mode Level Clears
- Time Attack Bronze medals
- Time Attack Silver medals
- Time Attack Gold medals
- Time Attack Shiny Gold medals
- Shop Keys

The Time Attack medal options are evaluated when the world is generated, so the location pool reflects the medals selected
for that particular seed.

## What is the goal?

The goal is to progress through the worlds and levels while collecting items from the multiworld.

Completing levels and finding collectibles gives you the access to randomized Archipelago items. These items may unlock
additional levels or other progression required to reach the end of the game.

Your exact route through the game will depend on which items you receive and which locations are accessible.

## How can i get started?

To play **Donkey Kong Country Returns (Wii)** in Archipelago, follow the setup guide for this game and configure the
available player options before generating your game.