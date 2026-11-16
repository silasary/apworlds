# Map Map - A Game About Maps

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export
a config file.

## What does randomization do to this game?

The 20 islands can be played in any order. Instead of the story moving you from island to island, each island is
unlocked by receiving its **Island** item, and travelling there from the world map starts it in story mode. Each
island remembers its own progress, so you can leave partway through and come back later.

Tools and abilities (Shovel, Dividers, Camera, Build Tool, Telescope, Compass, Sextant and Glide) are also items
rather than story rewards. Stickers and pencils are shuffled in as filler.

## What items can I receive?

- **Island 2 – Island 20**: unlocks that island on the world map. Island 1 is unlocked from the start.
- **Shovel**: needed to dig up buried treasure and for treasure missions.
- **Build Tool**: needed on the swamp islands (Islands 12–16) for their bridges.
- **Camera**: needed for Island 10's story after its first mission set.
- **Glide**: needed for the Floor Is Lava challenges on Islands 14–20.
- **Dividers** and **Telescope**: never strictly required, but in logic for later islands by default
  (the *Helpful Tool Logic* option).
- **Compass** and **Sextant**: useful, never required.
- **Sticker**, **Pencil**: cosmetic.
- **Ink Blot**: does nothing.

## What is considered a location check?

- Completing each mission (68).
- Earning a 3-star rating on a mission (61, optional).
- Digging up each buried treasure (40, optional). Treasures give the check instead of their normal sticker or pencil.
- Completing each Floor Is Lava challenge (18, optional).
- Discovering each island's landmark (12).

## What is the goal?

Chosen in your options:

- **Island 20** (default): enter the Raven King's Treasure Cave on Island 20, which plays the ending.
- **Islands completed**: complete every mission on a chosen number of islands.
- **All three stars**: earn a 3-star rating on every mission that has one.

## Death Link

Optional (`death_link`). Drowning counts as a death and is sent to everyone else with Death Link. When someone else
dies, the island you're on reloads and you're put back at its starting point. Your progress is kept, but anything
you were measuring is interrupted.

## What does another world's item look like in Map Map?

Checks happen in-game as usual; a small message in the top-right corner tells you what you sent and to whom. Buried
treasure shows an Archipelago picture instead of the sticker it would normally contain.

## When the player receives an item, what happens?

A message appears in the top-right corner and the item takes effect immediately: a new island appears on the world
map, a tool appears in your tool wheel, and so on.
