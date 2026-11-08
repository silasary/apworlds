# Castlevania: Aria of Sorrow

## Quick Links
- [Setup](/tutorial/Castlevania%20-%20Aria%20of%20Sorrow/setup_en)
- [Options Page](/games/Castlevania%20-%20Aria%20of%20Sorrow/player-options)
- [Releases](https://github.com/anonymous-heap/Archipelago/releases)
- [Report a bug](https://github.com/anonymous-heap/Archipelago/issues)
- [Logic spreadsheet](https://docs.google.com/spreadsheets/d/1FraahXhneKxnXsj_FX9LxrFJLJpsDQJNIrsSCmVWqEo/edit?gid=430351875#gid=430351875)

## What does randomization do to this game?

Pickups (including hard-mode pickups with the right toggle or hard mode being on) and certain means of progression get shuffled

The one-time items lying on the ground throughout Dracula's castle are shuffled. Logic makes sure every seed can be finished. The souls that open new parts of the castle can be anywhere, though, so you may explore in a different order from the vanilla game.

That covers 115 pickups. The "Hard Mode Pickups" option can add 5 more, which the game normally spawns only in Hard Mode. Money pickups are shuffled along with everything else, so a spot that held 500 gold in the vanilla game may now hold a soul, a weapon or another player's item. By default, only the ground pickups become Archipelago locations. The "Enemy Checks" option adds one for the first defeat of each boss, or of each kind of enemy, as described under [What are enemy checks?](#what-are-enemy-checks)

The souls that enemies drop stay with their enemies by default, so you farm them as in the vanilla game. The "Soul Shuffle" option changes which enemy drops which soul. It leaves seven souls with their own enemies, because the game's routes can depend on them: those of Flame Demon, Succubus, Devil, Manticore, Curly, Kicker Skeleton and Chronomage. With "Soul Shuffle" on, the soul Soma receives in the opening changes too, unless you turn off "Shuffle Starting Soul". The opening scene still calls it the Winged Skeleton soul. Type `/souls` in the client to see which enemy drops each soul in your seed, and how often.

Room connections, enemy placement and boss fights stay as they are in the vanilla game. Enemies also drop their vanilla items, unless "Item Drop Shuffle" or "Wide Item Smoothing" is on. While the client is connected, you can skip cutscenes with Start.

## Which versions of the game work?

Only the US version. You can play it as a ROM in BizHawk, or inside the Steam Castlevania Advance Collection on Windows. The [setup guide](/tutorial/Castlevania%20-%20Aria%20of%20Sorrow/setup_en) covers both ways of playing.

## What is the goal?

The "Goal" option chooses between two goals:

- **Chaos** (default): reach and defeat Chaos's second form, for the true ending. The game requires you to beat Graham with the Flame Demon, Giant Bat and Succubus souls equipped. Logic also expects all three Ancient Books before you enter the Chaotic Realm, although the game itself doesn't need them.
- **Graham**: defeat Graham with whatever equipment you have, for the bad ending. This makes for a much shorter seed.

## What items can appear in other players' worlds?

Anything that can be found on the ground: souls, weapons, armor, accessories, consumables, the Ancient Books, Castle Maps 1 and 3, and gold. Depending on your options, the Study Sealswitch and the Progressive Movement items can appear too, as described under [Gameplay options](#gameplay-options). So can the items that "Enemy Checks" and "Item Drop Shuffle" add to the pool. You can keep particular items in your own world with the "Local Items" option.

## What does another world's item look like?

It looks like a **Skull Key**. When Soma collects a pickup, the game has to give him a real item. It has no "empty" item to give, so it gives him a Skull Key. Every other player's item looks like this, even one for another Aria of Sorrow player.

No pickup or enemy in the castle gives a Skull Key, so they are easy to recognize. Picking one up still sends the item to the player it belongs to. The game's banner names only the Skull Key, but the client's window shows what you found and who it was for.

The game normally won't let you pick up an item you already hold 9 of, but the randomizer lets you collect a Skull Key at any count. Other players' items can therefore always be picked up, even while the client isn't connected. While it is connected, the client also keeps your Skull Key count at one or less. With "Skull Key Warp" on, it keeps exactly one, for warping.

With "Progressive Movement" on, a Skull Key can also be one of your own Progressive Movement items. Its soul arrives once the client is connected.

## What happens when you receive an item?

The client adds the item straight to Soma's inventory during normal play. It waits while you're paused, in a menu, in a shop or moving between rooms, then delivers everything that arrived in the meantime.

The game shows the same banner and plays the same sound as when Soma picks the item up himself. A soul gets the game's soul banner instead. With "New Soul Pause" on, which is the default, a soul you don't own yet also stops the action until you press A, just as when you absorb one yourself. With it off, every soul gets the short banner a duplicate gets, so nothing interrupts play.

Gold gets the banner a gold pickup shows, such as "$100". The banner never says who sent an item, but the client's window does. When several items arrive at once, for example when you reconnect after playing offline, some of them may arrive without a banner. They are still added to your inventory.

Your starting inventory arrives the same way, once the client connects to your new file.

The client records each item it delivers in your save file. If you load an earlier save, for example after Soma dies, it gives you again anything you received since that save. Pickups you collected after that save reappear, but anything they held for other players has already been sent.

## How are locations named?

Each location is named after the spot where its pickup lies. The square brackets then give the room's number and the item the vanilla game puts there. For example, a hint for "Tallest Ascent [009 Lance]" points to the pickup in room 009 that holds a Lance in the vanilla game.

A letter such as "(A)" tells apart pickups of the same item, as in "White Dragon Hallway [00D Potion (A)]". Room numbers don't appear in the game, but the map tracker shows where every location is.

Items have no letter. Every Potion is named "Potion", wherever it lies, so a hint for "Potion" can find any of them. Item groups name a kind of item: "Gold", "Weapons", "Armor", "Accessories", "Consumables", "Souls", "Blue Souls", "Yellow Souls" and "Ability Souls". Red souls only drop from enemies, so they have no group.

An enemy check is named "Defeat" followed by the enemy's name, as in "Defeat Skeleton".

## What are the Experimental options?

The options page has a collapsed "Experimental" group, which holds four new options and one new value. Their balance has been measured but not play-tested, so they may change between versions:

- **Enemy Checks**: adds a check for the first defeat of each boss, or of each kind of enemy. See [What are enemy checks?](#what-are-enemy-checks)
- **Soul Shuffle**'s "Matched" value: each soul trades places only with a soul of the same colour and strength tier, and each enemy keeps its own soul drop rate. A run then gives about as many souls of each colour and tier as an unshuffled run.
- **Enemy Drop Rate**: enemies drop their soul and their common item more often. Enemies that your seed reaches early get only a small part of the boost, while strong souls you could find early, rare drops and the better items keep their usual chance. Above 100, this option replaces "Multiply Soul Drop Rates".
- **Item Drop Shuffle**: the items that enemies drop move into the item pool, so any player's location can hold them. An enemy whose drop moved drops a similar item from this game instead. The drops are then dealt out again, so early enemies drop cheap items and the castle's last enemies drop the best ones.
- **Wide Item Smoothing**: keeps weapons and armor that are too good for the start of the run out of it, whether they come from a pickup, an enemy check, another world or an enemy drop. It also makes sure you hold an early weapon and armor. While it is on, it sets "Item Smoothing" to "Strict" and "Item Smoothing Order" to "Spheres".

Each of these is off by default, so a YAML that doesn't mention them plays as before. A YAML that sets "Soul Shuffle" to "random" never rolls "Matched". The options page's "Experimental" preset turns all five on, at the settings they were measured with. Each option's description, on the options page or in the template YAML, explains the details and how the options combine.

The group also holds "Soul Shuffle" itself, "Keep Soul Drop Rates" and "Shuffle Starting Soul". Their other settings work as before.

When a seed changes which enemy drops which soul or item, or how often, the spoiler log has a table of each enemy's drops and their chances. In game, `/souls` in the client lists which enemy drops each soul, and `/drops` lists the items each enemy drops. Both read the ROM you are playing.

## What are enemy checks?

The "Enemy Checks" option adds a location for the first defeat of each kind of enemy. With "Bosses", that means the ten bosses: Creaking Skull, Manticore, Great Armor, Big Golem, Headhunter, Death, Legion, Balore, Belmont (the Julius fight) and Graham. With "All", it means every kind of enemy except Chaos, 112 in all. Under the Graham goal, defeating Graham is the goal rather than a check.

Defeating any enemy of a kind, wherever you meet it, makes that kind's check. Creaking Skull, Manticore, Great Armor and Big Golem also appear as ordinary enemies, and defeating one of those counts too. The game's Enemy List records each kind's first defeat in your save, and the client reads it from there. So a defeat made while the client is disconnected is sent when it reconnects. Defeats in Boss Rush or as Julius don't count, because the game doesn't record them there.

The game has nothing to hand out when an enemy falls, so the item at an enemy check comes through the client a moment later, even when it is one of your own. Each enemy check also adds one item from this game to the pool, never progression. It is the enemy's common drop when that drop is cheap, a food or potion that restores HP when it isn't, and 100 gold when the enemy drops nothing. With "Item Drop Shuffle" on, many checks add a moved enemy drop instead.

Iron Golem's and Final Guard's checks hold only filler for now, because how long those fights take with ordinary gear isn't known yet.

A hint for an enemy check lists the rooms where that enemy appears, area by area, as in "Underground Reservoir 710 (after Legion); Forbidden Area A03". Location groups let you exclude or prioritize enemy checks together. "Enemy Defeats" holds all of them and "Boss Defeats" holds the bosses, while a group such as "Chapel Defeats" holds the checks of every enemy that appears in that area.

For most rooms, the logic spreadsheet doesn't record the route to their enemies yet. Until it does, logic expects all eight movement souls before such an enemy's check: Flying Armor, Skeleton Blaze, Malphas, Hippogryph, Undine, Skula, Black Panther and Giant Bat. The "Unrouted Enemy Defeats" location group holds these checks. A boss's check never waits for the eight souls, because logic counts a boss as defeatable once you can reach its arena.

So with "All", many enemy checks come late in logic. You will usually defeat those enemies much earlier, and their items arrive as soon as you do. Because unrouted checks come so late, at most ten of them can be priority locations. Any more in "Priority Locations" are treated as ordinary locations, and generation logs a warning that names them.

The map trackers pin each enemy check in every room where that enemy appears. All of a check's pins stand for the same check, so the first defeat of that kind, in any of those rooms, clears them all. In the tracker that comes with the randomizer, each pin is also coloured by whether logic reaches the enemy in that room. Both trackers show a check that waits for the eight movement souls in the colour for reachable with tricks once one of its rooms is reachable, because you can usually make it long before logic expects it.

## How does logic work?

### Which souls count

Logic tracks the movement souls, because they decide which parts of the castle you can reach: Flying Armor, Skeleton Blaze, Malphas, Hippogryph, Undine, Skula, Black Panther, Giant Bat, Grave Keeper and Galamoth. Kicker Skeleton's soul is only a rare enemy drop, so logic never expects it.

### Souls from enemies

Flame Demon and Succubus are enemy drops rather than ground pickups, so logic checks whether you can *reach* an enemy that drops them. The transformation souls, Devil and Manticore, work the same way. Curly's soul can also transform Soma, but logic never counts on it.

In every seed, the Devil, Manticore and Curly souls drop about four times as often as in the vanilla game. For Flame Demon and Succubus, "Ancient Book Soul Drops" can make the drop certain, as described under [Gameplay options](#gameplay-options). If farming still takes too long, "Multiply Soul Drop Rates" makes every soul drop more often, by the amount set in "Soul Drop Rate Multiplier". Common souls can only become a little more common, so it helps most with rare ones. "Enemy Drop Rate", one of the [Experimental options](#what-are-the-experimental-options), replaces both when it is above 100.

### Difficulty

Some routes need execution skill on top of the right soul. The "Logic Difficulty Preset" option sets how much of that skill logic may expect. Each preset allows everything the one before it allows, and more:

- **Canonical** (default): only the routes the developers intended.
- **Standard**: may also expect a launch off a kickable enemy.
- **Advanced**: may also expect platform clips.
- **Expert**: may also expect pixel-perfect platforming.

No preset expects quick-save resets, which respawn Soma at the room's entrance, or inbounds zips. Each technique also has its own option, which can put it in or out of logic whatever the preset says: "Kickable-Enemy Logic", "Platform Clip Logic", "Pixel-Perfect Logic", "Quick-Save Reset Logic" and "Inbounds Zip Logic".

### Where logic comes from

Logic is built from a shared [logic spreadsheet](https://docs.google.com/spreadsheets/d/1FraahXhneKxnXsj_FX9LxrFJLJpsDQJNIrsSCmVWqEo/edit?gid=430351875#gid=430351875) of what each route in the castle needs. If you find a mistake in logic, report it as a [bug](https://github.com/anonymous-heap/Archipelago/issues) or correct it in the spreadsheet.

## How are items placed?

By default, the randomizer biases placement so that weaker items tend to turn up early and stronger ones late, using a ranking built from community tier lists. This is called item smoothing. It rearranges the items that progression doesn't need. It also moves the weapons whose only progression use is breaking floors or ceilings, but it undoes any such move that would leave something unreachable. The Ancient Books, the three vertical mobility souls and Black Panther are placed separately, with a logic check for every move, so smoothing can never make a seed unwinnable.

The "Item Smoothing" option has three values:

- **Strict** (default): keeps placement tight.
- **Loose**: allows more surprises.
- **Off**: places items uniformly.

The "Item Smoothing Order" option sets how "early" is measured:

- **Map Distance** (default): distance from the start through the castle's rooms, ignoring which souls each route needs. A room counts as early or late by where it is in the castle, whatever this seed's progression does. So if a seed pushes you into a hard area early, you can still find something useful there.
- **Spheres**: the order in which logic can reach locations in *this* seed.

The vertical mobility souls (Malphas, Hippogryph and Giant Bat) have their own option, "Early Mobility Souls", because they decide where you can go rather than how strong you are. By default, one of Malphas and Hippogryph usually lands in the first third of the run (Malphas more often), and Giant Bat usually lands late. "Black Panther Bias" does something similar for Black Panther, aiming it at roughly the first half of the run. While item smoothing is on, the three Ancient Books are also spread across the early, middle and late parts of the run. None of this happens when "Item Smoothing" is "Off".

Item smoothing orders only the castle's pickups. "Wide Item Smoothing", one of the [Experimental options](#what-are-the-experimental-options), also orders enemy checks, your items in other worlds and enemy drops.

## Gameplay options

- **Skull Key Warp** (on by default): using a Skull Key from the Consumables menu teleports Soma to the starting room.
- **Hard Mode**: the client switches the game to its Hard Mode difficulty, where enemies take less damage. By default, this also shuffles the five Hard Mode-only pickups into the pool.
- **Hard Mode Pickups**: chooses when those five pickups are shuffled, separately from Hard Mode. The choices are "With Hard Mode" (the default), "Always" and "Never". With "Always", the patch makes them spawn in normal mode too.
- **Progressive Movement**: replaces the Flying Armor, Malphas and Giant Bat souls with three Progressive Movement items. The first one you get, whether found or received, gives Flying Armor, the second gives Malphas (double jump) and the third gives Giant Bat.
- **Forbidden Area Button**: normally, the Forbidden Area gate at the bottom of the Study opens only with a button on its far side. By default, that button is replaced with a shuffled "Study Sealswitch" item, and the gate opens once you receive it.
- **Ancient Book Soul Drops** (on by default): while you hold Ancient Book 1, every Flame Demon you defeat drops its soul, and Ancient Book 3 does the same for the Succubus. The books' pause-menu descriptions say so. Ancient Book 2 has no drop effect, because the Giant Bat soul is a shuffled item rather than an enemy drop.
- **New Soul Pause** (on by default): a soul you don't own yet stops the action when it arrives. See [What happens when you receive an item?](#what-happens-when-you-receive-an-item)
- **Single-Jump Divekick** (on by default): Soma can divekick from his first jump, before he has Malphas, though not in water without Skula.
- **Classicvania Movement**: removes air control, as in the NES games. A jump's arc is fixed at takeoff, and walking off a ledge drops Soma nearly straight down. Malphas and Hippogryph still let him change direction, and the flight souls keep normal control.
- **Oops! All Whips**: every weapon swings like the Whip Sword. The whip swing can't break floors or ceilings, so with this on, logic expects Black Panther for those.

"Single-Jump Divekick", "Classicvania Movement" and "Oops! All Whips" come from Xanthus's public Aria of Sorrow patch collection.

## Does DeathLink work?

Yes: turn on the "Death Link" option. Soma's death is sent as soon as he dies. When another player dies, Soma dies through the game's normal death sequence, rather than just having his HP set to zero. If you are paused or in a menu at that moment, the death waits until you are back in normal play.

## What if I get stuck?

If Soma is trapped somewhere he can't leave, use a Skull Key from the Consumables menu. With "Skull Key Warp" on, which is the default, it warps him back to the starting room, and the client always keeps one in your inventory for this.

If you don't know where to go next, the map tracker shows which locations are in logic and can draw a route to any of them.

## Is there a tracker?

Yes. One comes with the randomizer, and it opens a map of the castle in your browser. Once you are connected, type `/map` in the BizHawk Client or the Collection Client, or press the "Open map" button beside "Connect". You can also choose "Aria of Sorrow Tracker" when you open your slot's link on the room page, or start it from the Launcher and enter the server address and your slot name.

The map shows:

- every location, coloured by whether it is in logic, reachable with tricks or out of logic;
- the locations in your world that a hint points to, outlined in light blue;
- where Soma is, following him while "Follow Soma" is ticked;
- the rooms Soma has explored, as the in-game map shows them, plus the areas covered by any Castle Maps you hold (tick "Reveal full map" to show the whole castle);
- the souls and items you have, and how many of the locations shown are in logic, area by area.

A location shows as reachable with tricks when only a trick that your options leave out of logic reaches it, such as a kickable-enemy launch, a platform clip, a pixel-perfect jump or a quick-save reset. Otherwise, it would show as out of logic. Tick "In-game look" to draw the map in the game's own colours.

Click a location, then "Find route", and the map draws a route there. The route lists the rooms on the way and the souls or weapons each room needs. It starts at the door Soma used to enter his current room, and it is redrawn each time he enters another room. It stays until the location is checked or you press "Clear route", even if the tracker has to reconnect. In a race room, "Find route" is turned off.

Nothing extra needs installing, and no YAML is needed: the tracker reads your seed's options from the server, including your logic difficulty and Hard Mode settings, and rebuilds the seed's logic from them. Opening it again for the same slot while it is running opens another tab on the same tracker, rather than starting a second one. It stops when you press "Quit tracker" in its "Connect" dialog, or half an hour after you close its last tab.

[Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases) works too, also without a YAML. Its map tab pins every location, marks the map square Soma is in, and shows locations that only a trick reaches in its colour for reachable with tricks. Its `/get_logical_path` command gives the same room-by-room routes, though they start from the beginning of the game. For a seed generated by an older version of this randomizer, the server holds only the goal and Hard Mode settings, so either tracker uses the defaults for the other logic options.
