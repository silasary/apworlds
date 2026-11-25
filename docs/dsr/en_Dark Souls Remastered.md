# Dark Souls Remastered

## What do I need to do to randomize DSR?

See full instructions on [the setup page](./setup_en.md).

## What does randomization do to this game?

1. Treasure chest loot, loot found on corpses, most shop inventories, one-time enemy drops, boss drops, and passing through fog walls, can be "locations" or "checks".
   Depending on options, items in those locations will be shuffled into the randomized multiworld Item Pool.
   This means they can be found elsewhere, and that the items at those locations will themselves be replaced by other items in the Item Pool.

2. Undead Asylum is only partially randomized. This is intended behavior so as to not put the player into BK mode immediately.
   The keys and Estus flask are not randomized, but class equipment can be, depending on your settings.
   The only randomized ground item in the AP item pool is the one by the stairs to the exit.

3. By default, fog walls are locked until you get their keys (see [below](#isnt-the-game-extremely-open-from-the-start-what-is-fogwall-sanity))

4. By default, the starting equipment for each class is randomized. This can be
   disabled by setting "Randomize Starting Loadout" to false.

5. There are options for "Progressive Soul Multipliers", "Progressive Weight Reducers", and "Progressive Incoming Weapon Upgrades" to modify soul drops, equipment weight, and received weapon upgrade levels as you receive these items, or you can set fixed multipliers or upgrade levels instead. See the settings for more details.

6. You can optionally limit the number of AP checks the game has by turning off shuffling of certain regions (`include_dlc`, `include_pw`, `include_gh`) or either unshuffling or only locally shuffling certain categories of check (e.g `corpse_filler_item_shuffle`, `mimic_drop_shuffle`, etc).

There are also options that can make playing the game more convenient or
bring a new experience, like removing start requiements for spells or weapons.
Check the options for more.

## How is the item pool constructed?
* Item Pool is currently constructed as follows:
    1. First all items in locations which were randomized to AP are added to the pool.
    2. Then, key items and embers will replace any filler items. This includes any "Fog Wall Keys", if either `fogwall_sanity` option is on. This includes the three living Firekeepers' Souls.
    3. Then, Guaranteed items are added to the pool.
    4. If any of the options which create Progressive upgrades (soul multiplier, weight reducers, or incoming weapon upgrades) are configured with non-zero `_steps`, then those will be added to the pool. To make room for them, minor Soul items will be removed as needed. If there were not enough minor souls, then a percentage of armor, consumable, shield, upgrade material, then weapon items will be removed (in that order).
    5. If there are any Filler or Junk items left over, they are replaced with Souls of a Proud Knight (2000 souls each).

## What's the goal?

That depends on your choice of `goal_condition`.
If you choose `gwyn`, it is to defeat Gwyn, which will require opening the path to his arena (by finding the lordvessel & 4 lord souls, which are randomized into the pool) and defeating him.
If you choose `all_bosses`, it is to defeat all 26 bosses. If you have limited your regions by turning off `include_dlc` and/or `include_pw`, then those 4 and/or 1 bosses will not be required to goal.
If you choose `manus`, it is to defeat Manus, Father of the Abyss in the Artorias of the Abyss DLC (which is included in Remastered).
If you choose `ornstein_and_smough`, it is to defeat Ornstein and Smough in Anor Londo (recommended for short syncs). Choosing this option also excludes all checks that would require the Lordvessel in vanilla (including the DLC). If `logic_to_access_catacombs` is also set to `ornstein_and_smough`, the catacombs will be unshuffled as well.

## Isn't the game extremely open from the start? What is fogwall sanity?

In order to prevent ~60% of the game being open and available immediately, this mod introduces "Fogwall Sanity", which is on by default.    
With fogwall sanity, fogwalls in DSR will be locked, and will require an item from the Item Pool to unlock them.  
Passing through them will also count as a location or "check". 
* This includes the Fog Wall near the beginning of the Upper Undead Burg. If it's blocked - you'll have to go somewhere else! (e.g. check the skeleton courtyard, and part of Upper New Londo Ruins)
* This does not include the fogwall in the Northern Undead Asylum.
* This `fogwall_sanity` option can be disabled, but doing so is not recommended. Without this option, about 60% of the locations in your game would be consdiered in logic immediately - this is also considered a big "Sphere 1". With a big Sphere 1, you might need to get to the last check in the immediately available 60% of your game, in order to find an item that unlocks your friend who is stuck at 10% of their game. Because of how large Dark Souls is, it could take a long time to do that many checks - and make your friends have to wait on you, for quite a while.
* There is an additional `boss_fogwall_sanity` option that can be turned on, which makes most boss' arena fogs be similarly locked.
* The `Catacombs` and `Lower New Londo Ruins` fogwalls can be bypassed by basic platforming & elevator usage repsecitvely. As a result, they do not logically block access to their other sides.

## Do I have to check every item in every area?

By default, you will have to check every non-missable item, and kill most one-time enemies with drops.
This does not include failable quests or other missable items.

## What if I don't want to do the whole game?

If you want a shorter DSR randomizer experience, there are several ways to do so.
You can choose the `ornstein_and_smough` goal, which will make your goal faster and
also remove all post-lordvessel locations from the game. You can also configure
`Item Pickup Shuffling`  and other `Shuffling`-type groups of options, to limit
what categories of locations will be created as valid AP locations.
For example, you can change `corpse_filler_item_shuffle` to `false` or `local_only`, 
and all corpses in DSR that have filler (in vanilla) will be unrandomized or shuffled
locally only, respectively. This reduces the check count significantly, and can result 
in a much faster game.

You can also "exclude" whole regions or categories of locations via the [Location Groups](#Location-Groups) listed below, which will make them guaranteed to not contain items tagged as Useful or Progression.

## Artificial Logic Without Fogwall Locking
* If you disable the options for fogwall or boss fogwall locking, some artificial "logic" is introduced to limit the number of items that are "in logic" extremely early. This does not affect actual access, but affects what the randomizer considers "logically possible" to access at any point. The only such rule are listed below:
* Access to New Londo Ruins Door to the Seal + Lower New Londo Ruins from Upper New Londo Ruins requires access to being able to defeat Ornstein and Smough (in addition to having the Key to the Seal - the default rule).

## How do I read the location names?

Locations are generally in this format:  
region code: item name - (optional) location

Region codes:  
UA - Undead Asylum  
UA2 - Undead Asylum 2nd visit  
FS - Firelink Shrine  
UB - Undead Burg  
UP - Undead Parish  
DE - Depths  
BT - Blighttown  
VotD - Valley of Drakes  
DB - Darkroot Basin  
DG - Darkroot Garden  
GH - The Great Hollow  
ASH - Ash Lake  
SF - Sen's Fortress  
AL - Anor Londo  
PW - The Painted World of Ariamis  
NL - New Londo  
TA - The Abyss  
DA - Duke's Archives  
CC - Crystal Cave  
DR - Demon Ruins  
LI - Lost Izalith  
TC - The Catacombs  
TotG - Tomb of the Giants  
FA - Firelink Altar  
KoFF - Kiln of First Flame  
SG - Sanctuary Garden  
OS - Oolacile Sanctuary  
RW - Royal Wood  
OT - Oolacile Township  
CotA - Chasm of the Abyss  


## Location Groups
### Location Groups By Category of check:
Fog Walls (17)
Boss Fog Walls (22)
Shop Basic Items (96)
Shop Extended Items (64)
Boss Souls (11)
Boss Humanity (20)
Boss Bones (10)
Boss Drops (10)
Lord Souls (4)
Mimic Drops (8)
Black Knight Titanites (7)
Black Knight Weapons (7)
Crystal Lizards (50)
Chest Items (75)
Corpse Filler Items (365)
Corpse Prog Items (7)
Corpse Useful Items (7)
Hostile Npc Drops (4)
Miniboss Drops (4)
Misc Drops (7)
Frozen Blacksmiths (5)
Corpse Ring Items (7)
Npc Prog Items (2)

### Location Groups By Region:
2 Merchants - Bottomless Box (1)
3 Blacksmiths - Smithboxen (2)
4 Merchants - Repairbox (1)
Anor Londo (60)
Ash Lake (6)
Chasm of the Abyss (13)
Crystal Cave (12)
Darkroot Basin (26)
Darkroot Garden (36)
Demon Ruins (27)
Depths (27)
Firelink Shrine (93)
Kiln of the First Flame (6)
Lost Izalith (26)
Lower Blighttown (40)
Lower New Londo Ruins (11)
Lower Undead Burg (22)
Northern Undead Asylum (7)
Northern Undead Asylum Second Visit (11)
Oolacile Sanctuary (2)
Oolacile Township (17)
Painted World of Ariamis (49)
Royal Wood (41)
Sanctuary Garden (3)
Sen's Fortress (55)
The Abyss (3)
The Catacombs (35)
The Duke's Archives (54)
The Great Hollow (31)
Tomb of the Giants (35)
Undead Asylum Cell (1)
Undead Parish (37)
Upper Blighttown Depths Side (16)
Upper Blighttown VotD Side (9)
Upper New Londo Ruins (24)
Upper Undead Burg (53)
Valley of the Drakes (17)
Watchtower Basement (3)

## Item Groups
Ammunition (21)
Armor (235)
Boss Fog Wall Keys (22)
Boss Souls (12)
Bows (7)
Carvings (5)
Catalysts (11)
Consumables (71)
Covenant Items (4)
Embers (10)
Fire Keeper Souls (7)
Fog Wall Keys (17)
Junk (33)
Key items (32)
Lord Souls (4)
Medium Shields (23)
Melee Weapons (111)
Multiplayer Items (20)
Progression Items (27)
Ranged Weapons (11)
Rings (41)
Shields (46)
Souls (10)
Spell Tools (20)
Spells (72)
Talismans (7)
Traps (1)
Upgrade Materials (23)
Weapons (163)

