# Final Fantasy Crystal Chronicles

## What is this game?

Players take on the role of adventurers who travel in a caravan gathering mystical fuel (Myrrh) for crystals which protect the world's settlements from the destructive Miasma. The single-player campaign has the player escort the vessel carrying the crystal's energy, defending it from enemies and solving puzzles to progress. Multiplayer, which uses Game Boy Advance units connected using the console's link cable, has up to four players protecting the vessel.


Ported to Archipelago, this World provides the following:
- Items, Food, Magicite, Artifacts
- Chest Locations
- Shop slots as checks (Shop Checks), or shuffled shop stock and prices
- Dolphin automatic integration (No Support For Bizhawk)

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export
a config file.

## What does randomization do to this game?

The items in every dungeon chest are shuffled into the multiworld, for each of the three cycles a dungeon can be on.
Options can also lock every dungeon behind a key, shuffle which dungeon each world-map spot leads to, change the
elements the Miasma Streams ask for, and shuffle shop stock and prices. With all options enabled, there are over 1000 checks!

## What is the goal?

Depending on the Victory Goal option, either collect a Myrrh drop from all 13 dungeons' trees, defeat the final boss
at Mount Vellenge and reach the credits, or complete the Monster Hunt (see below).

## What items and locations get shuffled?

Locations are the dungeon chests, counted separately for each cycle a chest can be opened in. Optionally, reaching a
dungeon's second and third cycle, the start of each new year, defeating enemies (Monster Hunt Checks) and buying
from the towns' shops (Shop Checks) are checks too.

Items are artifacts, spell rings, magicite, materials, food, recipes and phoenix downs, plus stage keys, progressive
artifacts and progressive equipment when those options are on, and traps.

## What does another world's item look like in this game?

A chest holding another player's item gives an "AP Item" when opened.

## Gold chests

With **Chest Color Matches Contents** (on by default), a chest holding a
progression or useful item, for you or for another player, is gold, and a
chest holding filler looks normal. A chest can hold something different in 
each cycle, so its color can change from one cycle to the next.

## When the player receives an item, what happens?

The client puts the item into the game while you are in a dungeon (items that arrive elsewhere wait until you
enter one): artifacts and stage keys go to your artifact list, progressive equipment upgrades what you have
equipped, traps take effect, and everything else goes in your bag. If the bag is full, the item waits until there is
room unless you change the options in the yaml.

A chest's check is sent when you open it, so keep the client connected while playing. Chests can be opened again on
a later visit in the same cycle if a check was missed.

## Items dropped at your feet

With **Items Dropped At Your Feet**, received items are put on the ground in
front of you instead of in your bag, so you only pick up what you want and
the bag doesn't fill up by itself. Materials, food, recipes, magicite and
Phoenix Downs are dropped. Progressive Equipment always goes in your bag . 
Artifacts, stage keys and Spell Rings  still go straight to you unless you 
enable Keep picked-up artifacts.

An item counts as received as soon as it is on the ground. Items are only
given inside a dungeon or a town, one at a time. Items left on the ground are 
gone once you leave the area. If you missed one, use `/resend` in the client 
to drop the last item again, or `/resend <item name>` for any item you have received.

## Keep picked-up artifacts

Normally an artifact picked up in a dungeon only lasts until the end of the
dungeon, where you keep one of them. With **Keep Picked-Up Artifacts**, every
artifact you pick up goes straight into your artifact list and is kept. The
end-of-dungeon screen then only offers its bonus items.

Together with **Items Dropped At Your Feet**, artifacts you receive are also
dropped at your feet (stage keys and Spell Rings still go straight to you),
and `/resend <artifact name>` can drop one again.

## Stage Keys

With the Stage Keys option, every dungeon except River Belle Path needs its key
to enter. The element menus on the world map work without the key, and without
having cleared the stage first: walk to a stage such as Selepation Cave, press A,
and pick "Change element". So the element a Miasma Stream asks for this year
can always be picked up on your side of it, whichever keys you have.

## Hotspot Elements

The elemental pools (hotspots) inside dungeons set the chalice's element,
which is what the Miasma Streams ask for. The Hotspot Elements option changes
what each pool gives, and it changes every year:

- **Match Miasma Streams** - each year, the dungeons on each side of the
  streams share out the elements its streams ask for that year: first the
  streams leading on, then the ones leading back. This pairs well with
  Randomize Miasma Streams and Shuffle Loading Zones, where it keeps a year
  from leaving you without the element you need.
- **Shuffled** - every dungeon gives random elements each year. Seeds are only
  kept if every year can still be finished.

A dungeon always gives as many different elements as it usually does (River
Belle Path two, the Mine of Cathuriges one), and its pools keep their pattern:
River Belle Path's water, wind and water pools become, say, fire, water and
fire. Its name bubble on the world map shows the same elements.

With either setting, the world map's "Change element" menus change with the
years too. The stops on each side of the streams share out that year's
elements for its streams, on and back, so between them they offer every
one. With Match Miasma Streams, a dungeon on its own stop gives the same
elements its menu offers. A stop keeps its number of choices (two at River Belle Path, Goblin
Wall, Tida and Moschet Manor, one at the others), and its menu text names
the elements it offers. With Stage Keys the menus work without the key,
so the element for the streams around you is always on offer at the stops
on your side.

The element icons in a dungeon's name bubble on the world map follow the
year's elements. The pools themselves keep their usual colour, so check the
chalice after touching one. Lynari Desert's Unknown pool always gives
Unknown. The pack's hotspot map icons show the usual elements.

## Progressive Equipment

With the Progressive Equipment option, the item pool gets 6 each of 
Progressive Weapon, Progressive Armor and Progressive Tribal Gear (shield,
gauntlets, helm or belt, depending on your tribe). Each one puts the next
piece for your tribe in your bag, for example a Lilty's lance goes Partisan,
Sonic Lance, Titan Lance, Halberd, Gungnir, Longinus. Equip it from the menu.
It needs a free bag slot: with a full bag, it (and any items after it) arrives
once you make room.

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

## Mount Kilanda

Mount Kilanda is only reached by boat, and the boats offer it in different
years: the Jegon River pier from Year 4 (and again once the river is
refilled), Port Tipa only while the river is dry, and Leuda from Year 5.
The logic expects you to get there from the Jegon River pier, so Mount
Kilanda is in logic from Year 4 once you can reach Iron Mine Downs. With
Stage Keys, the boatmen won't take you without the Mount Kilanda Key.

## Playing fewer cycles

Each dungeon has three cycles: the first visit is Cycle 1, and every visit
after you clear it is Cycle 2 and then Cycle 3. With **Progression Cycles**
set to 1 or 2, only those cycles can hold progression and useful items.
Chests in later cycles are still checks but only hold filler, so you never
need to play them. You still revisit dungeons for Myrrh each year, but the
later-cycle chests can be skipped.

## Progressive Artifact Order

With Progressive Artifacts on, **Progressive Artifact Order** picks which
artifacts come first: Strength, Magic or Defense first (handy for a fighter,
a mage or a tank), the game's own order, or a random order. Every artifact
still arrives in the end. To start with a few already, add Progressive
Artifacts to your `start_inventory`.

## Magicite and the bonus

- **Magicite Needs Its Ring:** Fire, Blizzard, Thunder, Cure and Life magicite
  only go into your command list once you have the matching ring. Receiving
  a Ring of Fire, Blizzard, Thunder or Life unlocks its magicite right away.
  The Ring of Cure is an artifact, so Cure stays locked until you find it.
- **Always Best Bonus Tier:** the end-of-dungeon bonus always gives the best
  reward tier your score reached, instead of a random tier up to it.

## Bonus rewards

At the end of a dungeon, the bonus screen offers four items from that
dungeon's bonus pool. Which four depends on the cycle and on the tier your
bonus points reach. With **Randomize Bonus Pools** the items are shuffled for
the seed (never Spell Rings, stage keys or AP Items). Otherwise they are the
game's own. In the client, `/bonus` shows the current dungeon's tiers for
this cycle: the points one player needs, the items, and which you've picked.
The PopTracker pack's **Bonus Rewards** tab shows the same for every dungeon
and marks your picks as you make them.

## Monster Hunt

The Monster Hunt is a list of 108 enemy types: 93 normal enemies and the 15
bosses (the Moschet Manor fight counts as two, the Gigas Lord and the Lamia
Queen). Ice Ahriman and Vampire Bat only appear with more than one player,
so they aren't on it. The copies of normal enemies that join a boss fight
count as that enemy, so an Orc defeated in the Orc King fight counts as an Orc.

- **Victory Goal: Monster Hunt** - defeat at least one of every enemy type.
- **Monster Hunt Checks: Enemy Types** - defeating the first enemy of each
  type is a check ("Monster Hunt - Goblin (Sword)"). The enemies replace the
  chests: chests aren't checks, and they don't appear in the dungeons. With
  about 100 checks instead of about 450, the item pool is smaller: every
  progression item is kept, then progressive equipment, then as many other
  useful items (artifacts and such) as fit.
- **Monster Hunt Checks: Every Enemy** - defeating each enemy in each dungeon
  is a check, about 960 of them ("River Belle Path - Goblin (Sword) 3", and a
  boss is "River Belle Path - Giant Crab"). An enemy that comes back in
  later cycles is one check, in the first cycle it appears in. As with Enemy
  Types, chests aren't checks and don't appear.
- **Monster Hunt Bosses** (on by default) - the bosses are part of the hunt.
  Turn it off to leave them out of the goal and the checks.

Some enemies only appear in a dungeon's second or third cycle, and the logic
knows which. With **Progression Cycles** below 3, an enemy type only found in
later cycles only holds filler.

The client sees an enemy die while it's connected, so keep it connected while
playing. `/hunt` in the client lists how many types are defeated and the ones
left, by the dungeon they appear in most. The PopTracker pack's **Monster
Hunt** tab shows every enemy type, grouped the same way, and lights each one
up when it's defeated (bosses have a gold border). A type still to defeat
has a green border when the logic says you can reach it, and a red one when
you can't yet. Hover over one to see every dungeon and cycle it appears in.

With either kind of Monster Hunt check, the pack's dungeon maps show a pin
for every enemy where it spawns (instead of the chests), and one "Boss
Fight" pin per dungeon for the enemies of its boss room. With Enemy Types,
every pin of a type you've already defeated is cleared, so the pins left are
the enemies still worth hunting. With Every Enemy, each pin is cleared when
that enemy is defeated.

## Shop Checks

With **Shop Checks**, the first purchase from each slot of a town's shop is
a check, 94 slots in all:

| Shop | Slots | Reachable |
|---|---|---|
| Marr's Pass Material Shop | 16 | Year 1, odd years only |
| Alfitaria Food Shop | 4 | Year 2 |
| Alfitaria Material Shop | 16 | Year 2, even years only |
| Shella Shop | 9 | Year 2, with a Shella Mark |
| Fields of Fum Food Shop | 6 | Year 3, across the Jegon River |
| Fields of Fum Material Shop | 16 | Year 3, odd years only |
| Leuda Recipe Shop | 12 | Year 5, by boat from Port Tipa |
| Leuda Material Shop | 15 | Year 5 |

A slot sells your own item when it's something a shop can sell (food,
materials, recipes or a Phoenix Down), and buying it gives you the item.
Anything else is sold as an "AP Item" for 10 gil, and the client sends the
check when you buy it. Each shop sells the same list all game, instead of
adding items as the story goes on. Some merchants only set up their stall
in odd or even years, as in the game.

Only Yukes can enter Shella without a Shella Mark, a material the enemies of
Veo Lu Sluice drop, so the logic expects Veo Lu Sluice before Shella's shop.

Tipa's shop isn't a check: it's run by the family of a caravan member whose
job is Merchant, so not every game has it. The Selkie Peddler, who turns up
on other stages, and the blacksmiths' crafting aren't checks either.

Keep the client connected while shopping: it sees the purchase on the
yes/no screen. The PopTracker pack's **Shops** tab has a map of each town
with a green box at every shop, holding a section per slot.

## DeathLink

With **DeathLink** on, running out of hearts in a dungeon sends a death to the
other DeathLink players, and a death from them empties your hearts. You can
switch it for your slot from the client at any time:

- `/deathlink off` or `/deathlink on`
- `/deathlink` shows whether it's on
- `/deathlink default` goes back to the seed's setting

The choice is kept on the server, so it stays the same after reconnecting.

## Mog Stamp Hints

With **Mog Stamp Hints** (on by default), every new Mog Stamp from a Moogle
Nest hints where one of your progression items is: a stage key, a ring, a
Year Key and so on, in your world or anyone else's. It's always one you
haven't found yet, picked in a random order set by the seed. There are 23
stamps, one in each Moogle Nest in the dungeons and towns. Tipa's moogle
gives your stamp card and first stamp.

The client sends the hint when it sees the new stamp, so keep it connected.
It remembers which stamps already gave a hint, so loading an older save
doesn't hint again. A stamp only gives a hint the first time you get it.

## Dungeon shortcuts

Each of these options opens part of one dungeon from the start. They only
make the dungeon quicker: the logic doesn't change.

| Option | What it does |
|---|---|
| River Belle Path Bridges Lowered | Both drawbridges start lowered |
| Goblin Wall Gates Open | Every gate starts open |
| Mine of Cathuriges Boxes Cleared | The box piles the mine cart breaks are gone |
| Tida Webs Cleared | The spider webs are already burnt away |
| Moschet Manor Doors Open | Tribe switches press themselves, so doors open as you enter |
| Selepation Cave Elevators Lowered | The three elevators start at the bottom |
| Conall Curach Log Bridges | The log bridges are there without bombing Daemon's Court's logs |
| Rebena Te Ra Gates Open | The switch gates and barriers start open (not the item pedestals) |
| Unknown Element Puzzle Solved | Lynari Desert's hotspot gives Unknown right away, and its element obstacles are gone (saved in your save file) |

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
