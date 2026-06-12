# Kirby Air Ride APWorld

- [Kirby Air Ride APWorld](#kirby-air-ride-apworld)
  - [What is this?](#what-is-this)
  - [How do I set this up?](#how-do-i-set-this-up)
  - [Poptracker](#poptracker)
  - [Game modes and goals](#game-modes-and-goals)
    - [City Trial](#city-trial)
    - [Air Ride](#air-ride)
    - [Top Ride](#top-ride)
    - [Mixing goals](#mixing-goals)
  - [Access gating](#access-gating)
  - [Shuffle checklist rewards](#shuffle-checklist-rewards)
  - [Checklist rewards gated](#checklist-rewards-gated)
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
    - [Server sync](#server-sync)
  - [I need help! What do I do?](#i-need-help-what-do-i-do)
  - [Known Issues](#known-issues)
  - [Planned Features](#planned-features)
  - [Contributing](#contributing)


## What is this?

This is an APWorld for the Archipelago multi-world, multi-game randomizer: [archipelago.gg](https://archipelago.gg/)

This APWorld allows you to play Kirby Air Ride in an Archipelago Multiworld, or solo.

## How do I set this up?

Setting up the game and instructions on where to get the apworld file, yaml file, and mod files are in the [setup guide](https://github.com/DeDeDeK/KARchipelago/blob/main/worlds/kirby_air_ride/docs/setup_en.md).

## Poptracker

There is also a poptracker for this apworld, created by @lightning8282!

Get it [here!](https://github.com/lighting8282/KAR-Poptracker)

## Game modes and goals

Kirby Air Ride has three independent game modes: City Trial, Air Ride, and Top Ride. You can enable any combination of them, each with its own goal, locations, and progression settings. Setting a mode's goal to "None" disables that mode entirely, so none of its checklist locations will exist.

### City Trial

- **Fill in over 100 Checklist Boxes** (default). In the base game this unlocks viewing the ending.
- **Fill in N Checklist Boxes.** Choose the number from 1 to 120 with "Number of Checklist Boxes for City Trial".
- **Complete both Dragoon and Hydra in one match.** The standard legendary-machine checkbox from the base game.
- **Beat King Dedede.** KO King Dedede in under a minute in the VS. KING DEDEDE stadium.
- **Complete a specific list of checklist boxes.** (via "City Trial Goal Locations").
- **Max stats in one run.** Reach the "Patch Cap Max" on every stat in a single City Trial round.
- **None.** Disables City Trial.

### Air Ride

- **Fill in over 100 Checklist Boxes.**
- **Fill in N Checklist Boxes** (1 to 120).
- **Complete a specific list of checklist boxes** (via "Air Ride Goal Locations").
- **None.** Disables Air Ride (default).

### Top Ride

- **Fill in over 100 Checklist Boxes.**
- **Fill in N Checklist Boxes** (1 to 120).
- **Complete a specific list of checklist boxes** (via "Top Ride Goal Locations").
- **None.** Disables Top Ride (default).

### Mixing goals

You can mix and match goals across modes. When more than one mode has a goal, you only complete your game by completing every enabled goal. Your items all share a single pool across your enabled modes: any of your items can land at any of your checklist locations, so an Air Ride unlock might be found on a City Trial checkbox, and vice versa.

## Access gating

Most categories of content can be locked behind AP items. When a category is gated, that content starts locked and you must find its unlock items to access it; the checkboxes and races that depend on it become logically reachable only once you have the unlock. When a category is not gated, that content is available from the start and no unlock items are placed for it.

The gateable categories are:

- **City Trial stadiums.** 
- **City Trial events** (Dyna Blade, Meteor, Tac, etc.)
- **Copy abilities** (Fire, Sword, Bomb, etc.). Affects all modes.
- **City Trial patch types** (Boost, Top Speed, Offense, etc.)
- **City Trial game items** (All Up, Speed Max, Candy, food, legendary parts, etc.)
- **Air ride machines.** Across all modes.
- **City Trial box types** (Blue, Green, Red)
- **Air Ride courses**
- **Top Ride courses**
- **Top Ride items.** Items tied to copy abilities (Freeze Fan, Fire, Bomb, Walky) are gated by the copy ability unlock instead.
- **Kirby colors** (every color other than Pink). Affects all three modes.

Generation will choose one starting unlock item for the following categories. Each is picked at random and given to you for free before your run begins:

- **City Trial stadiums.** One of the 24 stadiums (never VS. KING DEDEDE when that is your goal). Only when stadiums are gated and City Trial is enabled.
- **Air Ride machines.** One machine you can ride in City Trial and Air Ride (never the Hydra or Dragoon). Only when machines are gated and City Trial or Air Ride is enabled.
- **Top Ride machines.** Free Star or Steer Star, since Top Ride cannot be entered without one of them. Only when machines are gated and Top Ride is enabled.
- **Air Ride courses.** One course. Only when courses are gated and Air Ride is enabled.
- **Top Ride courses.** One course. Only when courses are gated and Top Ride is enabled.
- **Kirby colors.** One color, Pink included. Only when colors are gated.

If you already preset an unlock from one of these categories in your start inventory, generation keeps your choice and skips the random pick for that category. The remaining gateable categories - events, copy abilities, patch types, game items, box types, and Top Ride items - are playable without any unlock, so they get no starting item.

**Note:** A few categories are normally unlocked in vanilla by completing specific in-game checklist squares - air ride machines, Kirby colors, the Nebula Belt course, the reward stadiums, and the Top Ride "New Item" types (Lantern, Who? Paint, Chickie). When one of those categories is ungated, the mod has already unlocked it at connect, so those checklist reward squares are not placed as items and are skipped. The only effect is cosmetic: you won't see those particular checkbox rewards (their description text or icon) appear in your own checklist. Nothing is lost for progression - the content is already available.

## Shuffle checklist rewards

Many checklist boxes (red boxes) award a specific reward when ticked in the base game: a machine, a Kirby color, a music track, a sound test, a Dragoon or Hydra part, and so on. "Shuffle Checklist Rewards" controls only those reward items.

- **On (default):** each reward is shuffled into the multiworld like any other item, so it can turn up anywhere your items can, across any of your enabled modes.
- **Off:** every reward is placed back on the box that awards it in the base game, including the Dragoon and Hydra parts, so ticking that box gives what it gave in the original game.

A couple of edge cases when this is off: a reward whose native box is excluded from receiving good items (for example a box behind a progression flag you left off) is pinned only when it is a filler reward - a more valuable reward there is shuffled instead. And in a very tight single-mode seed, some filler rewards may shuffle rather than pin if their native box is needed to keep progression placeable. Content delivered by other unlock items (extra machines, hidden stadiums, the spare Kirby colors, and so on) still randomizes either way.

## Checklist rewards gated

Some checklist boxes award a minor extra when ticked: a music track, a sound test entry, an ending, a Top Ride rule, and so on. "Checklist Rewards Gated" controls whether those non-progression rewards are part of the multiworld at all.

- **Off (default):** none of these rewards are placed; the mod unlocks them all the instant you connect (the same way an ungated category works), and the checklist boxes that would have awarded them carry ordinary multiworld items instead. This leaves more room on your checklist boxes for the gating categories and other items. Because the rewards are no longer in the pool, "Shuffle Checklist Rewards" has nothing to act on for them.
- **On:** each such reward is an item you find in the multiworld, and "Shuffle Checklist Rewards" decides where it can land.

The Dragoon and Hydra parts are never affected - they are progression (they build the legendary machines), so they always stay in the multiworld regardless of this option. Turning this off is a good way to thin out low-value cosmetic items, at the cost of those checklist boxes no longer feeling like they "give" anything in-game.

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
- Cosmetic filler (Big Kirby and Small Kirby, which scale Kirby's size)
- Access-gating unlock items [(Access gating)](#access-gating)
- Traps (1 HP Trap, stat-down patches, fake patches)

### Checkbox filler items

Receiving a checkbox filler item for a given checklist auto-completes a checklist block immediately. Look to the side of the checklist for the purple boxes. The game only shows up to 5 of them at once, but if you have unlocked more they are still yours and you can keep using them as they run out. There is a separate filler item for each mode (City Trial, Air Ride, Top Ride). You cannot use these to unlock checkboxes that are goals.

### Patch cap increase items

When "Patch Cap Min" is below "Patch Cap Max", the per-stat patch cap starts at the min and each Patch Cap Increase item raises it by one, up to the max. This is tracked per stat. For example, with a cap of 6, collecting a 7th Top Speed will drop you back to 6 until you raise the cap. Set the min equal to the max (both default to the vanilla 18) for a flat cap with no Patch Cap Increase items.

### Permanent patch increase items

These items give a permanent +1 to a City Trial stat that persists for the rest of your run. They are in the pool as long as "Permanent Patches" is among your "Allowed Item Types" (see below). This also works in Air Ride and Stadiums.

You can change which modes these will apply to in the in-game settings menu.

### Allowed item types

"Allowed Item Types" controls which categories of optional (non-progression) give items appear in your pool. All categories are on by default; removing one keeps all of that category's items out of your pool. It is independent of "Trap Types" - trap items are governed only by that option, so a category here never adds or removes traps.

### Spawn Rate Up items

The City Trial and Top Ride item spawn rate starts at your "Spawn Rate Min" and each Spawn Rate Up item raises it by 10% toward your "Spawn Rate Max". A min below 100% starts spawns suppressed below vanilla; set the min equal to the max for a flat rate with no Spawn Rate Up items. Air Ride has no spawn-rate scaling and is unaffected.

For CT, it not only affects the spawn rate, but the max amount of items that will appear in the City at a time. This will go beyond the vanilla max of 100.

### Access-gating unlock items

When a category is gated (see [Access gating](#access-gating)), receiving its unlock item makes that content available for the rest of your run.

### When items are applied

Items for game modes like CT, AR, TR are applied immediately when playing, or if not, at the start of the next round/course.

Items that don't apply directly to game modes (checkbox fillers, reward items, etc.) are applied immediately. 

## Traps and TrapLink

Set "Trap Chance" above 0 to turn a percentage of your non-progression item slots into traps. "Trap Types" chooses which categories are in play (all on by default), and the selected categories are drawn at equal weight: Direct Damage (1 HP Trap), Stat Debuff (All Down, stat-down patches, etc.), and Fake Patches (items that look like stat-ups but are harmful).

With "Trap Link" enabled, traps you receive are broadcast to other players who have TrapLink on, and you receive the traps they broadcast in return. This is independent of "Trap Chance": you can take part in TrapLink even with no traps in your own pool. 

You can enable or disable this in the in-game settings menu, or in your yaml. It works in all modes.

## EnergyLink

EnergyLink applies to every mode. While it is on, charging your machine, collecting patches and other items, and destroying objects (rocks, trees, coral, houses, etc.) in the City contributes energy to the multiworld's shared pool, and you can spend that pool from within the game to receive items.

You can enable or disable this in the in-game settings menu, or in your yaml.

### Energylink spend menu

There is an in-game menu where you can spend your pooled energy to purchase in-game items. You'll see the price listed below the item. 

### Auto-Charge

Auto-Charge (Settings → Energy Link → Auto-Charge in the in-game menu) spends pooled energy to keep your machine's charge meter topped up. It adds a steady amount over time, so it gently assists your own charging - holding A, or coasting and gliding - and your energy drains gradually rather than all at once.

The **Auto-Charge Rate** setting (Slow / Medium / Fast) controls how quickly the meter fills.

## DeathLink

When on, dying links your deaths with other DeathLink players in the multiworld, and other players dying causes you to die. This works in all modes. In Top Ride, you just receive a negative effect.

You can enable or disable this in the in-game settings menu, or in your yaml.

## Other features

### In-game textbox

The mod includes a built-in scrolling textbox that lets you know what items your receiving and other information in real time!

Configure it in the in-game settings menu.

### Reveal checklists

With "Reveal Checklists" enabled, the checklists for each of your enabled modes start fully revealed instead of hidden.

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
