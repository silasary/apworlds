# Final Fantasy Crystal Chronicles

## What is this game?

Players take on the role of adventurers who travel in a caravan gathering mystical fuel (Myrrh) for crystals which protect the world's settlements from the destructive Miasma. The single-player campaign has the player escort the vessel carrying the crystal's energy, defending it from enemies and solving puzzles to progress. Multiplayer, which uses Game Boy Advance units connected using the console's link cable, has up to four players protecting the vessel.


Ported to Archipelago, this World provides the following:
- Items, Food, Magicite, Artifacts
- Chest Locations
- Shop Rando (No checks included yet but just a extra setting currently)
- Dolphin automatic integration (No Support For Bizhawk)

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export
a config file.

## What does randomization do to this game?

The items in every dungeon chest are shuffled into the multiworld, for each of the three cycles a dungeon can be on.
Options can also lock every dungeon behind a key, shuffle which dungeon each world-map spot leads to, change the
elements the Miasma Streams ask for, and shuffle shop stock and prices.

## What is the goal?

Depending on the Victory Goal option, either collect a Myrrh drop from all 13 dungeons' trees, or defeat the final boss
at Mount Vellenge and reach the credits.

## What items and locations get shuffled?

Locations are the dungeon chests, counted separately for each cycle a chest can be opened in. Optionally, reaching a
dungeon's second and third cycle and the start of each new year are checks too.

Items are artifacts, spell rings, magicite, materials, food, recipes and phoenix downs, plus stage keys, progressive
artifacts and progressive equipment when those options are on, and traps.

## What does another world's item look like in this game?

A chest holding another player's item gives an "AP Item" when opened.

## When the player receives an item, what happens?

The client puts the item into the game while you are in a dungeon (items that arrive elsewhere wait until you
enter one): artifacts and stage keys go to your artifact list, progressive equipment upgrades what you have
equipped, traps take effect, and everything else goes in your bag. If the bag is full, the item waits until there is
room.

A chest's check is sent when you open it, so keep the client connected while playing. Chests can be opened again on
a later visit in the same cycle if a check was missed.

## Stage Keys

With the Stage Keys option, every dungeon except River Belle Path needs its key
to enter. The element menus on the world map work without the key, and without
having cleared the stage first: walk to a stage such as Selepation Cave, press A,
and pick "Change element". So the element a Miasma Stream asks for this year
can always be picked up on your side of it, whichever keys you have.

## Progressive Equipment

With the Progressive Equipment option, the item pool gets 6 each of 
Progressive Weapon, Progressive Armor and Progressive Tribal Gear (shield,
gauntlets, helm or belt, depending on your tribe). Each one upgrades the piece
you have equipped to the next one for your tribe, for example a Lilty's lance
goes Partisan, Sonic Lance, Titan Lance, Halberd, Gungnir, Longinus. The new
piece replaces the old one, so it takes no bag space. Open your menu or move to
another area for its stats to apply. If you have something stronger equipped,
the new piece goes in your bag instead.

## The Jegon River

From Year 5 the Jegon River dries up, and the ferry to the Plains of Fum
(and so Rebena Plains and the Abyss) stops until the river is refilled. To
refill it, go to Veo Lu Sluice and cast Life on its six pumpflowers. Otherwise
it only fills again in Year 8.

The logic makes sure you can always do this:
- Everything across the river is only in logic once you have the
  **Ring of Life** and can reach Veo Lu Sluice, so the ring is never placed
  where the dry river could cut you off from it.
- With Shuffle Loading Zones, Veo Lu Sluice always stays on this side of the
  river (Tipa Peninsula, Iron Mine Downs, Vale of Alfitaria or Veo Lu).

## Chests with extra requirements

- **Conall Curach chests 12 and 21** are behind the log bridge, which is blown
  up with bombs in Daemon's Court. They are only in logic once Daemon's Court
  can be reached.
- **Rebena Te Ra chests 6 and 9** need painful timing to reach alone (Mog has to
  cast the spell for you). They only hold filler items unless the
  "Rebena Te Ra Timed Chests" option is on.

## Credis / Shoutouts
PaulSRC
- Created the awesome title and AP client logos

Zcanann
- Working hard on the decomp project gave us many insights on how things worked

ACluelessBull, Scionceon
- Other AMAZING devs who have looked into the game and spent HOURS of time collecting research notes / ideas

And of course, the amazing community! 
- For all the spend hours sending bug reports / ideas and just great overall research notes :)
