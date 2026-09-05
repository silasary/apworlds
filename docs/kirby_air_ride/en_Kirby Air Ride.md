<img src="https://raw.githubusercontent.com/DeDeDeK/KARchipelago/main/worlds/kirby_air_ride/assets/karchipelago-logo.png" alt="karchipelago logo" width="400"/>

# Kirby Air Ride APWorld

- [Kirby Air Ride APWorld](#kirby-air-ride-apworld)
  - [What is this?](#what-is-this)
  - [How do I set this up?](#how-do-i-set-this-up)
  - [Poptracker](#poptracker)
  - [Universal Tracker Support](#universal-tracker-support)
  - [Game modes and goals](#game-modes-and-goals)
    - [City Trial](#city-trial)
    - [Air Ride](#air-ride)
    - [Top Ride](#top-ride)
    - [Archipelago checklist](#archipelago-checklist)
  - [AP Patches](#ap-patches)
  - [Access gating](#access-gating)
  - [Checklist rewards](#checklist-rewards)
  - [What does randomization do to this game?](#what-does-randomization-do-to-this-game)
  - [What does another world's item look like in Kirby Air Ride?](#what-does-another-worlds-item-look-like-in-kirby-air-ride)
  - [What happens when the player receives an item?](#what-happens-when-the-player-receives-an-item)
    - [Checkbox filler items](#checkbox-filler-items)
    - [Patch cap increase items](#patch-cap-increase-items)
    - [Permanent patch increase items](#permanent-patch-increase-items)
    - [Allowed item types](#allowed-item-types)
    - [Spawn Rate Up items](#spawn-rate-up-items)
    - [Access-gating unlock items](#access-gating-unlock-items)
    - [When items are applied](#when-items-are-applied)
  - [Traps and TrapLink](#traps-and-traplink)
  - [EnergyLink](#energylink)
    - [Energylink spend menu](#energylink-spend-menu)
    - [Auto-Charge](#auto-charge)
  - [DeathLink](#deathlink)
  - [Other features](#other-features)
    - [In-game textbox](#in-game-textbox)
    - [Reveal checklists](#reveal-checklists)
    - [Drop ability](#drop-ability)
    - [Air quick spin](#air-quick-spin)
    - [Random start machine](#random-start-machine)
    - [Server sync](#server-sync)
  - [I need help! What do I do?](#i-need-help-what-do-i-do)
  - [Known Issues](#known-issues)
  - [Planned Features](#planned-features)
  - [Contributing](#contributing)
  - [Credits](#credits)


## What is this?

This is an APWorld for the Archipelago multi-world, multi-game randomizer: [archipelago.gg](https://archipelago.gg/)

This APWorld allows you to play Kirby Air Ride in an Archipelago Multiworld, or solo.

## How do I set this up?

Setting up the game and instructions on where to get the apworld file, yaml file, and mod files are in the [setup guide](https://github.com/DeDeDeK/KARchipelago/blob/main/worlds/kirby_air_ride/docs/setup_en.md).

## Poptracker

There is also a poptracker for this apworld, created by @lighting8282!

Get it [here!](https://github.com/lighting8282/KAR-Poptracker)

## Universal Tracker Support

The Kirby Air Ride client supports yaml-less Universal Tracker. If you have Universal Tracker installed in your `custom_worlds` folder, it will automatically add a Tracker tab to the client - no need to open UT as a separate client. No yaml file needed in the `Players` folder. 

See the setup guide for more info.

## Game modes and goals

Kirby Air Ride has three independent game modes: City Trial, Air Ride, and Top Ride. 

The mod also adds a fourth checklist/mode of its own, the Archipelago checklist. 

You can enable any combination of them, each with its own goal, locations, and progression settings. 

Setting a mode's goal to "None" disables that mode entirely, so none of its checklist locations will exist. AP Patches are the one exception: they are City Trial locations that exist whenever "AP Patches" is above 0, whatever the City Trial goal is. 

When more than one mode has a goal, you only complete your game by completing every one of them.

### City Trial

- **Fill in over 100 Checklist Boxes** (default). The in-game checkbox for filling in over 100 checklist boxes.
- **Fill in N Checklist Boxes.** Choose the number from 1 to 120.
- **Complete both Dragoon and Hydra in one match.** The standard legendary-machine checkbox from the base game.
- **Beat King Dedede.** KO King Dedede in under a minute in the VS. KING DEDEDE stadium.
- **Complete a specific list of checklist boxes.** (via "City Trial Goal Locations").
- **Max stats in one run.** Reach the "Patch Cap Max" on every stat in a single City Trial round.
- **None.** Disables City Trial.

### Air Ride

- **Fill in over 100 Checklist Boxes.**
- **Fill in N Checklist Boxes** 
- **Complete a specific list of checklist boxes** (via "Air Ride Goal Locations").
- **None.** Disables Air Ride (default).

### Top Ride

- **Fill in over 100 Checklist Boxes.**
- **Fill in N Checklist Boxes**
- **Complete a specific list of checklist boxes** (via "Top Ride Goal Locations").
- **None.** Disables Top Ride (default).

### Archipelago checklist

**EXPERIMENTAL:** this checklist is incomplete and under active development. It does not yet have all 120 checkboxes. Logic or checks for this may
not work properly. 

- **Fill in N Checklist Boxes**
- **Complete a specific list of checklist boxes** (via "Archipelago Goal Locations").
- **Assemble the Archipelago Star.** Collect all six Archipelago spheres in one City Trial round.
- **Assemble all three legendaries in one run.** Build Dragoon, Hydra and the Archipelago Star in the same City Trial round
- **None.** Disables the Archipelago locations (default).

## AP Patches

Setting "AP Patches" above 0 adds that many AP patches to your world. These will spawn in City Trial, inside of AP Boxes. 

These are locations, and so each collected AP patch is a check. AP patches are always collected in order, no matter which one you pick up. If you don't pick one up, it will continue to spawn until it is collected.

"AP Patch Placement" chooses whether these locations can hold progression.

## Access gating

Most categories of content can be locked behind AP items. When a category is gated, that content starts locked and you must find its unlock items to access it; the checkboxes and races that depend on it become logically reachable only once you have the unlock. When a category is not gated, that content is available from the start and no unlock items are placed for it.

The gateable categories are:

- **City Trial stadiums.** 
- **City Trial events**
- **Copy abilities** Affects all modes.
- **Base abilities** (inhale, quick spin, and machine charge). Affects all modes.
- **City Trial patch types** (Boost, Top Speed, Offense, etc.)
- **City Trial game items** (All Up, Speed Max, Candy, food, legendary parts, etc.)
- **Air ride machines.** Across all modes.
- **City Trial box types** (Blue, Green, Red)
- **Air Ride courses**
- **Top Ride courses**
- **Top Ride items.**
- **Kirby colors** Affects all modes.

## Checklist rewards

Many checklist boxes (red boxes) award something when ticked in the base game. "Checklist Rewards" picks which of the minor extras among them get placed into the multiworld, one category at a time:

- **Sound Test** - sound test entries, 34 of them
- **Music** - course and stadium music tracks
- **Filler Boxes** - boxes awarding a checkbox filler
- **Endings** - the ending movie for each mode
- **Gameplay Extras** - Top Ride's extra rules, Air Ride's Special Machine Intros, City Trial's pause-screen power-up display

A category you pick is shuffled into the multiworld like any other item, so it can turn up anywhere your items can, across any of your enabled modes. A category you leave out is not placed at all: the mod unlocks it the instant you connect, the boxes that award it in the base game carry ordinary multiworld items instead, and no reward shows on those checklist cells. The default is an empty list, so nothing is placed unless you ask for it.

## What does randomization do to this game?

Randomization decides which AP item is attached to each checkbox you complete, and which unlock items you must find to reach gated content. No in-game locations are physically shuffled.

## What does another world's item look like in Kirby Air Ride?

There is no change in the graphical appearance of other worlds' items. Completing a checkbox sends whatever AP item is attached to that location.

## What happens when the player receives an item?

The items you can receive include:

- Checkbox filler items (per mode)
- Patch cap increase items (City Trial)
- Permanent patch increase items (City Trial)
- Spawn Rate Up items (City Trial / Top Ride)
- Game item gives (boxes, food, copy abilities, legendary machine parts, All Up, etc.)
- Cosmetic filler (Big Kirby and Small Kirby)
- Access-gating unlock items [(Access gating)](#access-gating)
- Traps (1 HP Trap, stat-down patches, fake patches)

### Checkbox filler items

Receiving a checkbox filler item for a given checklist gives you a purple checkbox filler in-game for that checklist. Look to the side of the checklist for the purple boxes. 

The game only shows up to 5 of them at once, but if you have unlocked more they are still yours and you can keep using them as they run out. There is a separate filler item for each checklist (City Trial, Air Ride, Top Ride, Archipelago). **You cannot use these to unlock checkboxes that are goals.**

### Patch cap increase items

When "Patch Cap Min" is below "Patch Cap Max", the per-stat patch cap starts at the min and each Patch Cap Increase item raises it by one, up to the max. This is tracked per stat. 

For example, with a cap of 6, collecting a 7th Top Speed will drop you back to 6 until you raise the cap. Set the min equal to the max (both default to the vanilla 18) for a flat cap with no Patch Cap Increase items.

### Permanent patch increase items

These items give a permanent +1 to a City Trial stat that persists for the rest of your run. They are in the pool as long as "Permanent Patches" is among your "Allowed Item Types". This also works in Air Ride and Stadiums.

You can change which modes these will apply to in the in-game settings menu.

### Allowed item types

"Allowed Item Types" controls which categories of optional (non-progression) give items appear in your pool. 

Only "Permanent Patches" is on by default; add a category to put its gives in your pool, and removing one keeps all of that category's items out.

### Spawn Rate Up items

The City Trial and Top Ride item spawn rate starts at your "Spawn Rate Min" and each Spawn Rate Up item raises it by 10% toward your "Spawn Rate Max". A min below 100% starts spawns suppressed below vanilla; set the min equal to the max for a flat rate with no Spawn Rate Up items.

For CT, it not only affects the spawn rate, but the max amount of items that will appear in the City at a time. This will go beyond the vanilla max of 100.

### Access-gating unlock items

When a category is gated (see [Access gating](#access-gating)), receiving its unlock item makes that content available for the rest of your run.

### When items are applied

Received items for game modes like CT, AR, TR are applied immediately when playing, or if not, at the start of the next round/course.

Items that don't apply directly to in-game modes (checkbox fillers, reward items, etc.) are applied immediately. 

## Traps and TrapLink

Set "Trap Chance" above 0 to turn a percentage of your non-progression item slots into traps. 

"Trap Types" chooses which categories are in play (all on by default).

With "Trap Link" enabled, traps you receive are broadcast to other players who have TrapLink on, and you receive the traps they broadcast in return. This is independent of "Trap Chance": you can take part in TrapLink even with no traps in your own pool. 

You can enable or disable this in the in-game settings menu, or in your yaml. It works in all modes.

## EnergyLink

EnergyLink applies to every mode. While it is on, charging your machine, collecting patches and other items, and destroying objects (rocks, trees, coral, houses, etc.) in the City contributes energy to the multiworld's shared pool, and you can spend that pool from within the game to receive items.

You can enable or disable this in the in-game settings menu, or in your yaml.

### Energylink spend menu

There is an in-game menu where you can spend your pooled energy to purchase in-game items. You'll see the price listed below the item. 

### Auto-Charge

Auto-Charge (Settings -> Energy Link -> Auto-Charge in the in-game menu) spends pooled energy to keep your machine's charge meter topped up. It adds a steady amount over time, so it gently assists your own charging - holding A, or coasting and gliding - and your energy drains gradually rather than all at once.

The **Auto-Charge Rate** setting (Slow / Medium / Fast) controls how quickly the meter fills.

## DeathLink

When on, dying links your deaths with other DeathLink players in the multiworld, and other players dying causes you to die. This works in all modes. In Top Ride, you just receive a negative effect.

You can enable or disable this in the in-game settings menu, or in your yaml.

## Other features

### In-game textbox

The mod includes a built-in scrolling textbox that lets you know what items your receiving and other information in real time!

Configure how it looks - position, size, colors, how long a message stays - in the in-game settings menu under "Text Box".

Which Archipelago messages appear is separate, under "Archipelago Settings -> Messages":

- **Checks** - what a completed checkbox sent, and to whom.
- **Items** - items arriving for you, and who found them
- **Hints** - hints for your items, and hints telling someone else that your world holds theirs
- **Status** - goal, release and collect announcements, plus a line when the client connects or drops.
- **Chat** - player and server chat. Off by default.

These lines come from the client, so they only appear while it is connected to both the server and Dolphin. With no client attached, a completed checkbox just reports "Check recorded".

### Reveal checklists

Each mode has its own "Reveal Checklist" option. With one enabled, that checklist starts fully revealed instead of filling in around the squares you complete, so you can read every objective from the start.

Revealing is visual only - it does not complete or unlock anything.

### Drop ability

With "Drop Ability" on, pressing Z discards your current copy ability in City Trial and Air Ride, or your current ability-power item in Top Ride.

Off by default. Toggle it in the in-game settings menu.

### Air quick spin

Allows you to quick-spin in the air in Air Ride and City Trial.

It still respects [access gating](#access-gating): if base abilities are gated and you have not Quick Spin yet, it will not work in the air either.

Off by default. Toggle it in the in-game settings menu.

### Random start machine

With "Random Start Machine" on, City Trial starts you on a random machine you have unlocked instead of the Compact Star.

With it off you get the Compact Star as usual, falling back to a random unlocked machine when machines are gated and you have not found the Compact Star yet.

On by default. Toggle it in the in-game settings menu.

### Server sync

The client syncs your completed AP checks and items to your game every time you connect to the server. This keeps your game in sync with the server even if you lose your save file, start fresh for a same-slot co-op, or have had checks collected by another player.

## I need help! What do I do?

Try the troubleshooting steps in the [setup guide](https://github.com/DeDeDeK/KARchipelago/blob/main/worlds/kirby_air_ride/docs/setup_en.md).

If you are still stuck, please ask us over in the "Kirby Air Ride" discussion thread in the "future-game-design" channel in the Archipelago Discord server! [(Link)](https://discord.com/channels/731205301247803413/1291501105389502554)

## Known Issues

Known bugs and issues are tracked in the GitHub issues [here.](https://github.com/DeDeDeK/KARchipelago/issues?q=is%3Aissue%20state%3Aopen%20label%3Abug)

Feel free to report any issues or suggest improvements either there or in the "Kirby Air Ride" discussion thread in the "future-game-design" channel in the Archipelago Discord server [(Link)](https://discord.com/channels/731205301247803413/1291501105389502554)

## Planned Features

You can see a current list of planned features and other requests [here.](https://github.com/DeDeDeK/KARchipelago/issues?q=is%3Aissue%20state%3Aopen%20label%3Aenhancement)

## Contributing

Contributions are very welcome!

Feel free to [raise an issue](https://github.com/DeDeDeK/KARchipelago/issues) or [submit a PR](https://github.com/DeDeDeK/KARchipelago/pulls)! And you can always pop into the [Discord channel](https://discord.com/channels/731205301247803413/1291501105389502554) to ask questions or collaborate!

## Credits

- Swiggity - karchipelago logo design
- Taco - KAR Deluxe logo + font design
