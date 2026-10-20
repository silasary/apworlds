# Bug Fables: The Everlasting Sapling

## What does randomization do to this game?

Key items, medals and other items are shuffled across the multiworld. Picking one up, being handed one, buying one
in a shuffled shop or finishing a quest sends a check instead, and the item there shows what the seed put in its
place. Every item, your own included, arrives from the server and is given to you through the game's own item system.

This is an early version, its logic written room by room, and every room of the game is in it (new in 0.4.0): the
Bugaria Outskirts, Snakemouth Den, Bugaria City, the Golden Path, the Golden Settlement, the Lost Sands, the Golden
Hills, the Far Grasslands, the Wild Swamplands, the Forsaken Lands, Defiant Root, the Ancient Castle, the Bee Kingdom
and its Honey Factory, the Rubber Prison, the Bandit Hideout, Stream Mountain, Chomper Caves, Metal Lake and Peacock
Island, Metal Island, the Termite Capitol, the Fishing Village, Upper Snakemouth, the Wasp Kingdom and the Giant's
Lair, with their shops. Most side quests aren't locations yet; they come later.

## Options

- **Artifacts Required** (0 to 7, default 6): how many artifacts open the last fight, the goal (new in 0.4.0), see
  below.
- **Artifact Shuffle** (Vanilla): where the artifacts may be. Vanilla: each at its own story scene. This World: anywhere
  in your game. Anywhere: anywhere in the multiworld, another player's game included. New in 0.4.0.
- **Shuffle Quests** (on): quest rewards are locations.
- **Shuffle Crystal Berries** (on): crystal berry spots are locations and crystal berries are items.
- **Shuffle Discoveries** (off): recording a journal discovery sends a check.
- **Shuffle Hidden Items** (off): items you can't see until you find them, inside grass or a bush or inside something
  you hit, are locations. New in 0.4.0.
- **Shuffle Dig Spots** (off): the mounds Kabbu digs up are locations. New in 0.4.0.
- **Enemysanity** (off): every enemy on the map is a location; winning its fight drops the check as an item to pick
  up. Every one stays on its map whatever the story, so none can be missed. New in 0.3.0.
- **Shuffle Medal Shops** (on): medals sold in shops are locations.
- **Shuffle Item Shops** (on): the first purchase of each item in an item shop is a location.
- **Shuffle Termacade** (on): the first purchase of each prize at the Termacade's prize stand is a location. Prize
  locations only ever hold filler, and the prizes themselves (medals, ribbons) are found elsewhere, so you never have
  to win tokens for progress. The arcade's welcome gift is always a location. New in 0.4.0.
- **Minigame Prizes** (off): a minigame's high-score prize (25 worms at Whack Farms) can hold anything, and the logic
  counts on winning it. Off, it only ever holds filler. Either way, the Wacka Worm games need Vi and her Beemerang.
  New in 0.4.0.
- **Shop Contents** (No Progression): what shop locations may hold.
- **Shuffle Shop Inventories** (on): what item shops restock and what respawning floor items come back with is
  shuffled among themselves (food and other consumables only, each as often as before). Never a check or location:
  the first purchase or pickup is still the check, and this changes only what comes after. New in 0.3.0.
- **Entrance Randomizer** (off, experimental): doors between areas lead somewhere else. Coupled: a door and its way
  back stay a pair. Decoupled (new in 0.3.0): the way back is shuffled too, so turning round can take you
  somewhere else. Or Room Swap, whole rooms trading places, or Map Shuffle (new in 0.4.0), doors that match sides
  (both below). The spoiler log lists where each door leads. With Coupled, Decoupled or Map Shuffle, one-way doors
  (the Forsaken Lands' fog maze's wrong turns, drops, the underground bar's exit) are shuffled too, only among
  themselves: each now lands where another one did. New in 0.3.0.
- **Enemy Shuffle** (off): ordinary enemies on each map are swapped for others of the same group size.
- **Starting Location** (off, experimental): a new file begins in any room in the game. The items are placed from
  there, so the seed can be finished from where you begin (new in 0.4.0); a room a seed can't begin from (too few
  checks in reach with what a new file has, or no way out yet) is never picked.
- **Starting Party Member** (all three): a new file starts with the whole party; or with Vi, Kabbu or Leif alone (or one
  picked by the seed), and the other two are items; or Off, the story's party, with Leif joining in Snakemouth Den. With
  any setting but Off, the opening and the fall room after the spider become locations.
- **Filler Starting Checks** (on): the checks a new file sends by itself when the game begins (Maki and Eetl's gift,
  the tutorial battle, and the opening spot when members are items) hold filler only, so a seed doesn't open with its
  good items. Nothing else changes; turn it off to plando an item there. With the Entrance Randomizer on Coupled, Map
  Shuffle or Room Swap it doesn't apply, since the doors can leave the start too small. New in 0.3.0.
- **Shuffle Field Moves** (off): Vi's Beemerang Toss, Kabbu's Horn Slash and Leif's Freeze are items too (the Toss and
  the Freeze as the first copy of their progressive item, new in 0.3.0); until one arrives, that attack only buzzes, and
  each shows in your key items once it does.
- **Shuffle Jump** (off): Jump is an item for the whole party; until it arrives, the jump button only buzzes, and the
  pause menu's Warp is always there. When a new file starts with very little in reach (one member with the moves and
  Jump shuffled, or a starting room with little around it), an item that opens the way on is placed among your first
  checks (new in 0.4.0), or up to three when no one item does (a member and their ability).
- **Points of No Return** (off): the logic may send you somewhere only the pause menu's Warp gets you out of,
  a drop or a one-way door, so items can land in more places and you're expected to warp back. Off, it always leaves
  you a way to walk back. New in 0.3.0, and in effect from 0.4.0, now that the rooms' drops and one-way doors are
  mapped.
- **Progressive Boat** (on): the Boat Ticket and the submarine are one item found twice, the ticket first; off, two
  items in any order (see below). New in 0.3.0.
- **Extra Roadblocks** (none): obstacles the game puts up later in the story, there from the start instead, each
  crossed both ways with its ability. None to choose yet: the *Snakemouth Barrier* was taken out in 0.4.0, since the
  horn tutorial moves you past it; the gate before Snakemouth Den stays away all game. New in 0.3.0.
- **Death Link** (off): sets the Archipelago panel's DeathLink row when you first connect to the seed; the panel can
  still switch it afterwards (the setup guide says what it does). New in 0.4.0.
- **Music Shuffle** (off, under Aesthetic Options): every song plays in place of another, the same every time you play
  the seed, and the jingles (victory, game over, chapter titles) swap among themselves. The title screen, the wind,
  water, machine and breathing sounds, and the factory elevator's music stay. Samira plays the song you pick. It changes
  nothing else. New in 0.3.0.
- **Start Inventory from Pool** (under Item & Location Options): items you start with, taken out of the item pool, with
  filler in their place. New in 0.4.0.

Each option's description in the yaml says what it does in full and how many checks it adds.

## Room Swap

Set *Entrance Randomizer* to `room_swap` (experimental, new in 0.3.0). Whole rooms trade places with rooms of as many
doors in their part of the world (parts joined only by a ride or a scene stay apart), so the map keeps the game's
shape: familiar roads, unfamiliar rooms. Turning round always takes you back where you came from. It is gentler than
Coupled, where any door may lead to any other. One-way doors, like the fog maze's wrong turns, still lead where they do
in the game. The logic follows the doors and what every room needs inside; a few doors are still to be gone through,
so it stays experimental, and the pause menu's Warp gets you out of a dead end.

## Map Shuffle

Set *Entrance Randomizer* to `map_shuffle` (experimental, new in 0.4.0). As Coupled, any door may lead to any other,
but the doors match sides: a door on a room's right edge brings you in through another room's left edge, a door at its
top in at another's bottom, so walking right keeps you going right and the world still reads like a map. Turning round
always takes you back. About nine doors in ten match; there are more doors on rooms' left edges than right ones, and
more at the bottom than the top, so the few left over take another side. One-way doors are shuffled among themselves,
as with Coupled.

## Plando: choosing where doors lead

With *Entrance Randomizer* on Coupled, Decoupled or Map Shuffle, `plando_connections` pins doors (new in 0.3.0). Each
door is named where it is, `Area: Room, Door to` and the room it leads to in the unshuffled game, as the spoiler log's
Entrances section lists them (a room with no name yet shows its map's name; two doors between the same rooms are
`Door 1` and `Door 2`). The older names, `MapName: DoorName`, still work. `entrance` is the door you go through, `exit`
the door you arrive next to:

```yaml
plando_connections:
  - entrance: "Outskirts: Outside the City, Door to Bugaria City: Main Plaza"
    exit: "Snakemouth Den: Lake, Door to Underground Door Room"
    direction: both
```

`direction` is `both` (the default), `entrance` (only the first door leads to the second) or `exit` (only the second
leads back to the first); Coupled and Map Shuffle always join both ways. A one-way door's `exit` is another one-way's
landing, named as the spoiler log lists it, e.g.
`"Far Grasslands: Wizard's Tower Basement as from Far Grasslands: Wizard's Tower, Door to Wizard's Tower Basement"`;
it only goes one way, whatever the direction, and can't be paired with a two-way door. The rest of the doors are
shuffled around them. Plando's "connections" must be turned on where the seed is generated (Archipelago's plando
guide). It's ignored with the Entrance Randomizer off or on Room Swap.

## Field abilities

Every ability the story teaches is an item, in every seed, and the scene where the game teaches it is a check instead:
the Beemerang Halt, Bee Fly, the Dash, the Horn Dash, Beetle Dig, the Icicle and the Shield. Three come as progressive
items, in the game's own order: **Progressive Beemerang** (the Toss, then the Halt), **Progressive Dash** (the Dash,
then the Horn Dash) and **Progressive Freeze** (the Freeze, then the Icicle). An ability works once its item arrives,
wherever you are in the story, and its battle skill comes with it. New in 0.3.0. The logic stays cautious with two
of the scenes, the Dash's at the Lost Sands' entrance and Bee Fly's at the Forsaken Lands' broken bridge: each asks
for abilities the story teaches before it.

Beetle Dig is taught in the Bandit Hideout's cell, after the bandits capture the party. The capture is skipped, so its
check is an item lying on the altar in the hideout's Entrance instead, reached with Jump or Bee Fly. New in 0.4.0.

With *Shuffle Field Moves* on, the Dash and the Horn Dash work without the Horn Slash, but only as themselves: the Dash
moves you faster and the Horn Dash breaks boulders. Cutting grass, hitting switches and knocking things over wait for
the Horn Slash; once it's yours, the Dash does them too, as in the game. Fixed in 0.4.0: in 0.3.0, without the Horn
Slash the Dash didn't work at all.

## The boat and the submarine

The Boat Ticket and the submarine, the Termite Kingdom's **Subaquatic Maritime Neotransport**, are items in every
seed. With the option *Progressive Boat* on (the default) they are one item, **Progressive Boat**, found twice: the
first copy is the Boat Ticket, the second the submarine. Off, they are two items found in any order. The pier's sailor
takes you to Metal Island only with the ticket. The submarine's docks are there only once it is yours, wherever you are
in the story, and it sails to every one of them, Metal Island's included. The scene where the Termite King hands it over
is a check instead.

To hint it, `!hint Submarine` (or `!hint Boat` for the ticket) works either way. With the progressive item it shows
where both copies are, since a hint can't tell the two apart.

## Good to know

- **We Owe Ya!** calls a helper into battle only from those you have unlocked in the story or a side quest.
  Received early, it does nothing until then.
- **Save crystals** can be used with the confirm button when you stand next to one (a "?" shows over you, as when
  examining a statue), so you can save without a field attack, as with *Shuffle Field Moves*. Hitting one still works.
- **The Factory Pass** is one item and never used up: every lock in the Honey Factory keeps it in your bag, and the
  pump room's scanner opens on the first show. New in 0.4.0.
- **The Prison Key** is the same in the Rubber Prison: one item, kept at every lock. A later story scene there that
  would take your Prison Keys leaves it, and the key spots it would clear stay until you take them. New in 0.4.0.
- **The Small Ancient Key** (the game's Ancient Key, renamed: chapter 3's artifact has that name), **the Wasp Key**
  and **the Lab Card** are kept the same way: one each, opening every lock of its kind in any order. New in 0.4.0.
- **The Sand Castle Key** is one item: the spots where the game hands over its two halves, the Heaven Key (the Roach
  Village's hawk) and the Earth Key (Astotheles), are ordinary locations. New in 0.4.0.

## What is the goal?

Beat the last fight, at the Giant's Lair's Sapling Plains (new in 0.4.0). It opens once you have collected a number
of artifacts (the option *Artifacts Required*, 6 by default; 0 leaves it open from the start); a sign by its door says
how many.
The game has 7, one per chapter milestone: the Ancient Mask (chapter 1), the Ancient Tablet (chapter 2), the Ancient
Key (chapter 3), the Ancient Half (chapter 4), the Queen's Mask (chapter 5), the Flame Brooch (chapter 6) and the Wasp
King's Crown (chapter 7). Each is an item: the scene that hands it over or counts it in the story is a location, and
*Artifact Shuffle* decides where the item goes. With *Artifact Shuffle* on Vanilla the 7th is the last fight's own
reward, so at most 6 can open it. Hint one by its name or by its chapter (`!hint Artifact 6`), or all of them with
`!hint Artifacts`. The pause menu shows the artifacts you have received. Win the fight and watch the ending: as the
credits start, the mod tells the server, which marks your game finished.
