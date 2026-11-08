# Final Fantasy Crystal Chronicles

## What is this game?

Players take on the role of adventurers who travel in a caravan gathering mystical fuel (Myrrh) for crystals which protect the world's settlements from the destructive Miasma. The single-player campaign has the player escort the vessel carrying the crystal's energy, defending it from enemies and solving puzzles to progress. Multiplayer, which uses Game Boy Advance units connected using the console's link cable, has up to four players protecting the vessel.


Ported to Archipelago, this World provides the following:
- Items, Food, Magicite, Artifacts
- Chest Locations
- Enemies as checks (Monster Hunt Checks)
- Shop slots as checks (Shop Checks), or shuffled shop stock and prices
- Grooming the Moogle as checks, or as the goal (Mog Grooming)
- On-screen messages for the items you send and receive, a play timer and enemy health bars
- Dolphin automatic integration (No Support For Bizhawk)

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export
a config file.

There are a lot of options, so the page has presets that set many of them at once. Pick one, then change anything you
like:

- **Beginner:** one cycle per dungeon, the dungeon shortcuts opened, no traps, Free Cure Magicite and enemy health on
  screen.
- **Full Randomizer:** stage keys, shuffled loading zones and Miasma Streams, progressive artifacts and equipment,
  cycle, year and shop checks, randomized shops and bonus pools, and the extra spell rings.
- **Chaos:** Full Randomizer, plus shuffled hotspots, a random artifact order, reshuffled tribe stats and lots of
  traps.
- **Monster Hunter:** defeating each enemy type is a check, and defeating them all wins.
- **Speedrun:** reach and beat the final boss, with the speedrun timer on screen, the shortcuts opened and no traps.
- **Stamp Collector:** collect all 23 Mog Stamps to win.
- **Mog Grooming Only:** no dungeons. Find the grooming tools, then dye and trim Mog.

The Launcher's "Generate Template Options" also writes a YAML file for each preset, in `Players/Templates/Presets`.

## What does randomization do to this game?

The items in every dungeon chest are shuffled into the multiworld, for each of the three cycles a dungeon can be on.
Options can also lock every dungeon behind a key, shuffle which dungeon each world-map spot leads to, change the
elements the Miasma Streams ask for, and shuffle shop stock and prices. With all options enabled, there are over 1000 checks!

## What is the goal?

The Victory Goal option picks one of these:

- **All Myrrh:** collect a Myrrh drop from all 13 dungeons' trees.
- **Final Boss:** defeat the final boss at Mount Vellenge and reach the credits.
- **Monster Hunt:** defeat at least one of every enemy type (see Monster Hunt below).
- **Mog Stamps:** collect all 23 Mog Stamps from the Moogle Nests. There is a nest in each of the 14 dungeons
  (Mount Vellenge too) and in Tipa, Port Tipa, Marr's Pass, Alfitaria, Shella, the Fields of Fum, West Jegon
  River, Leuda and Mag Mell, so the logic expects all of them to be reachable before the goal. The client shows
  your stamp count each time you get one.
- **Mog Grooming:** dye or trim a Moogle's fur in any Moogle Nest (see Mog Grooming below).

## What items and locations get shuffled?

Locations are the dungeon chests, counted separately for each cycle a chest can be opened in. Optionally, reaching a
dungeon's second and third cycle, the start of each new year, defeating enemies (Monster Hunt Checks), buying
from the towns' shops (Shop Checks) and grooming a Moogle (Mog Grooming Checks) are checks too.

Items are artifacts, spell rings, magicite, materials, food, recipes and phoenix downs, plus stage keys, progressive
artifacts, progressive equipment, gil and the Moogle's grooming tools when those options are on, and traps.

## What does another world's item look like in this game?

A chest holding another player's item has the Archipelago logo on it and opens empty. The
item is sent when the chest opens. Your own items that the client hands over instead of the
chest (artifacts, spell rings, stage keys, gil and traps) use the same chest.

## Gold chests

With **Chest Color Matches Contents** (on by default), a chest holding a
progression or useful item, for you or for another player, is gold, and a
chest holding filler looks normal. A chest with the Archipelago logo can be
gold too. A chest can hold something different in each cycle, so its color
can change from one cycle to the next.

## When the player receives an item, what happens?

The client puts the item into the game while you are in a dungeon or a town (items that arrive on the world map
wait until you enter one). Artifacts and stage keys go to your artifact list, progressive equipment puts the next
piece in your bag, traps take effect, and everything else goes in your bag. If the bag is full, the item waits until
there is room unless you change the options in the yaml.

A chest's check is sent when you open it, so keep the client connected while playing. Chests can be opened again on
a later visit in the same cycle if a check was missed.

With **Gil Weight** above 0, some filler is gil (100, 500 or 1000). It is never dropped on the ground but given directly to player 1.

## On-screen messages, play timer and enemy health

These show up over the game itself, so you don't need to look at the client:

- **Show Item Messages** (on by default): each item you receive, and each of your finds that belongs to someone
  else, is named at the bottom of the screen ("Received Ring of Fire from Jane", "Sent Master Sword to Bob",
  "Found Phoenix Down"). Up to three lines show at once, newest at the bottom.
- **Show Play Timer:** a clock in the top-right corner once you choose New Game or load a save. It only counts
  while you play: it stops while the game is paused, in a menu or loading, and keeps going through cutscenes
  and talking.
  - **play_time** shows your save's own play time.
  - **speedrun_automatic** starts at 0 when you choose New Game (so the intro is timed) or load a save, and
    stops on the final blow to the last boss.
  - **speedrun_manual** only starts, stops and resets when you tell it to.
  - In both speedrun modes, hold **L + R + Z** and press D-pad **Up** to pause or resume the timer, **Down** to
    reset it to 0, or **Left** to hide or show it.
- **Show Enemy Health:** each enemy shows its health above it, as a small red bar, as numbers ("12/20") or both.
  Bosses keep their own health gauge.

Item messages need the client to be connected. The timer and enemy health work on their own.

## Which character gets the items

Items go to the character you are playing, whichever of your save's family members that is. The client tells you
who when you connect ("Playing as ..."), and `/party` lists your caravan's characters and who each controller is
playing.

## Choosing "Other" at character creation

The patched game adds **Other** to the gender screen when you create a character. An Other character uses the male
models and hairstyles, and the game's gendered text uses neutral wording for them ("they", "their", "child"),
including the family's farewell when your caravan sets out. Male and female characters read exactly as before.

## Playing with friends (multiplayer)

With more than one player (GBA controllers), the client shares the multiworld's items with the whole party:

- Artifacts, stage keys and Spell Rings go to every player. Someone who joins later gets the ones they missed.
- Progressive equipment gives every player the next piece for their own tribe.
- Other items go in player 1's bag, or the next player's if it is full (player 1 still gets them at their
  feet with "Items Dropped At Your Feet").
- A trap hits one random player, with its visual effect (Trap Visuals) on whoever it hits. The Chalice Element
  Trap changes the shared chalice.
- Free Cure Magicite gives every player a Stone of Cure.
- With DeathLink, any player running out of hearts sends a death, and a death from someone else takes out the
  whole party.

## Items dropped at your feet

With **Items Dropped At Your Feet**, received items are put on the ground in
front of you instead of in your bag, so you only pick up what you want and
the bag doesn't fill up by itself. Materials, food, recipes, magicite and
Phoenix Downs are dropped. Artifacts are dropped too when **Keep Picked-Up
Artifacts** is on (it is by default), and otherwise they go straight into your
artifact list. Progressive Equipment always goes in your bag, and stage keys and
Spell Rings always go straight to you.

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
- **Free Cure Magicite:** each time you enter a dungeon you get a Stone of
  Cure. With Magicite Needs Its Ring it only works once you have the Ring of
  Cure.
- **Extra Spell Rings:** adds a Ring of Gravity, Holy, Slow, Stop and Haste
  to the game and the item pool. Like the other magic rings, each casts its spell
  from the command list without magicite. The logic never needs them. The
  PopTracker pack shows them in the **Extra Spell Rings** group.
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
- The Lamia Queen in Moschet Manor never dies: at 1 HP she flees across the
  room. That counts as defeating her.
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
yes/no screen. The PopTracker pack's **Towns** tab has a map of each town
with a green box at every shop, holding a section per slot.

## DeathLink

With **DeathLink** on, running out of hearts in a dungeon sends a death to the
other DeathLink players, and a death from them empties your hearts (in
multiplayer, every player's). You can
switch it for your slot from the client at any time:

- `/deathlink off` or `/deathlink on`
- `/deathlink` shows whether it's on
- `/deathlink default` goes back to the seed's setting

The choice is kept on the server, so it stays the same after reconnecting.

## Mog Stamp Hints

With **Mog Stamp Hints** (on by default), every new Mog Stamp from a Moogle
Nest hints where one of your progression items is: a stage key, a ring and
so on, in your world or anyone else's. Year Keys are left out, since they
only tell the logic which year you can be in. It's always one you
haven't found yet, picked in a random order set by the seed. There are 23
stamps, one in each Moogle Nest in the dungeons and towns. Tipa's moogle
gives your stamp card and first stamp.

The client sends the hint when it sees the new stamp, so keep it connected.
It remembers which stamps already gave a hint, so loading an older save
doesn't hint again. A stamp only gives a hint the first time you get it.

The PopTracker pack has a **Mog Stamps** group with an icon for each stamp,
and a pin for each Moogle Nest on its dungeon or town map. They light up and
clear as you collect stamps. The pins show with the Mog Stamps goal or Mog
Stamp Hints.

## Mog Grooming

In a Moogle Nest you can groom the Moogle: dye its fur with the **Red**,
**Blue** and **Green** dyes, **Wash** the dye out, or **Trim** its fur. The
Moogle's fur is shared by every nest, so it doesn't matter which one you use.
Tipa has a nest from the start.

- **Victory Goal: Mog Grooming** - win by grooming the Moogle enough.
  **Mog Grooming Goal** picks what counts: **dye** (that much of its fur dyed,
  in any colours), **trim** (that much of it cut) or **both**.
  **Mog Grooming Percent** sets how much, from 10 to 95 (default 50). A few
  spots on the Moogle can't be reached or is very hard to get, so it never asks for more than 95.
- **Grooming Tools** - the five tools are items: **Red Dye**, **Blue Dye**,
  **Green Dye**, **Mog Soap** (the Wash tool) and **Mog Scissors** (the Trim
  tool). A tool does nothing until you've found it. It's **with_goal** by
  default (only with the Mog Grooming goal), and can be **off** or **always**.
- **Mog Grooming Checks** - **radars**, **milestones** or **all**:
  - **Radars:** in this game, the colour the Moogle's fur shows most sets the
    GBA radar. Each one is a check: **Mog Radar - Red (Monster Radar)**,
    **Mog Radar - Green (Score Radar)** and **Mog Radar - Blue (Treasure
    Radar)**. A colour only wins if it clearly beats the other two, and big
    rings around the body and lines out from the centre count much more
    than scattered dabs.
  - **Milestones:** **Mog Grooming - Dyed 25% / 50% / 75%** (in any colours)
    and **Mog Grooming - Cut 25% / 50% / 75%**.
  - With Grooming Tools on, a radar check needs its colour's dye, the dye
    milestones need any dye, and the cut milestones need the scissors.
- **Mog Grooming Only** - a seed of only the Moogle. This world has no
  chests or other checks, just the 9 grooming checks and the Mog Grooming
  goal. The tools are items, and you start with one random dye. It's a short
  seed to play on its own, or to join a multiworld with.

While you're in a Moogle Nest, the top of the screen shows how far you've
got ("Dyed 54%/50%  Cut 0%/50%") and how much of each colour there is. If you
pick a tool you haven't found, it says which item you need. Cut fur can
still be dyed. If you cut too much, `/regrow` in the client grows the fur
back to full length and keeps its colours. It shows on your next stroke.

Keep the client connected: it checks the Moogle's fur while you're in a nest.
The radar checks also count from anywhere, since your save keeps the radar.

## Starting stats

**Starting Stats** changes each tribe's starting Strength, Magic and Defense. Artifacts and equipment add to them as
usual.

- **Shuffle Tribes:** each tribe gets another tribe's stats.
- **Same Total:** each tribe keeps its total, but the points are spread at random.
- **Fully Random:** each stat is a random number.

**Starting Stats Minimum** and **Starting Stats Maximum** set how low and how high a stat can go in the last two modes.
**Starting Hearts** sets how many hearts every character starts with, from 2 to 8 (the game's own is 4). Heart
artifacts still add one each, up to the game's limit of 8.

Male and female characters of a tribe always get the same stats, and so does every player of that tribe in co-op. The
stats also apply to characters in an existing save, and the spoiler log lists them.

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
| Lynari Desert North Exit | A quicksand pit at the first area's northern dead end (where the two rock pillars were) drops you into the second area. The PopTracker map shows it as a gold marker |

## Chests with extra requirements

- **Conall Curach chests 12 and 21** are behind the log bridge, which is blown
  up with bombs in Daemon's Court. They are only in logic once Daemon's Court
  can be reached.
- **Rebena Te Ra chests 6 and 9** need painful timing to reach alone (Mog has to
  cast the spell for you). They only hold filler items unless the
  "Rebena Te Ra Timed Chests" option is on.

## Credits / Shoutouts
PaulSRC
- Created the awesome title and AP client logos

Zcanann
- Working hard on the decomp project gave us many insights on how things worked

ACluelessBull, Scionceon
- Other AMAZING devs who have looked into the game and spent HOURS of time collecting research notes / ideas

And of course, the amazing community!
- For all the hours spent sending bug reports / ideas and just great overall research notes :)
