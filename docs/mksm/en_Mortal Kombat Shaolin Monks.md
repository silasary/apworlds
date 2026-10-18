# Mortal Kombat: Shaolin Monks

## What items and locations get randomized?

### Items

* Red Koins (60)
* Movement abilities:
    * Long Jump
    * Fist of Ruin
    * Wall Climb
    * Wall Run
    * Wall Jump
    * Double Jump
    * Swing
* Progressive health upgrades (4)
* Progressive Blood bar upgrades (3)
* 1000 EXP (filler)

Optional (configure in options)

* If `Shopsanity` is on:
    * Progressive special move upgrades (amount depends on character)
    * Combos (amount depends on character)
* If `Randomize tournament victories` is on:
    * Tournament victories (5)
* If `Mana upgrades` is on:
    * Progressive mana upgrade (4)

### Locations

* Collecting a Red Koin
* Collecting a health upgrade
* Beating a boss
* Collecting a medallion

Optional (configure in options)

* If `Shopsanity` is on:
    * Purchasing an upgrade using EXP
* If `Fatalitysanity` is on:
    * Performing each one of your character's finishing moves

## What is the goal of this game?

There are two possible goals to enable,
at least one goal needs to be enabled to generate a seed.

### Boss goal

Defeat a set amount of bosses to clear the goal.
You can configure in the options which bosses are needed to complete the goal.

### Red Koin goal

There are 60 Red Koin items shuffled in the item pool.
The goal is to find a set amount of them.
You can configure in the options what percent of them are needed for goal.

## Options

You can use the `Options Creator` in the Archipelago launcher to customize the options.
You can press the `random` button in the creator to randomize an option instead of picking one.

### Character

The character you will play as in the run.

Choices are:

* liu_kang
* kung_lao
* sub_zero
* scorpion
* baraka
* kitana
* reptile
* johnny_cage

The game will force the character picked to be your in-game character.

That means you don't need to unlock Scorpion and Sub-Zero before picking them.

The VS mode exclusive characters are also available, but due to how they work they always start with fully upgraded
special moves and combos, except for the R2 special move.\
You can still purchase upgrades in the shop with VS characters if `Shopsanity` is on.

For some characters some Red Koins, specifically from shooting a projectile, are impossible to obtain.
Therefore, the game will spawn those Red Koins without needing to shoot a projectile.

### Red Koin goal percent

What percent of the 60 Red Koins are needed for goal.

Choice is a number from 0 to 100, for example:

* 0 means collecting Red Koins is not required to complete the run, and they will become filler items.
* 80 (default) means you need 48/60 koins to complete the goal.
* 100 means you need all 60 Red Koins to complete the goal.

There is a tracker in the pause menu that shows current amount / needed for goal / total.

### Boss Goal

What bosses are needed to be defeated for goal.

Choices are:

* no_bosses - no bosses are needed for the goal, only collecting enough Red Koins.
* shao_kahn_only (default) - only the final boss of the game is needed for the goal.
* main_bosses - all main bosses are needed for the goal, including the final boss.
* main_and_secret_bosses - all main and secret bosses are needed for goal, including the final boss.

If `Randomize tournament victories` is on you're technically not required to beat any main boss to complete the game.  
Beating a boss is still a check, plus the medallion they drop,
so you may still need to beat a boss to complete a `no_bosses` run.

### Fatalitysanity

If on, adds checks for performing each one of your character's finishing moves.
That includes all fatalities, multalities and brutality.

VS mode characters can only perform fatalities.

You can find a guide on all the finishing
moves [here](https://gamefaqs.gamespot.com/ps2/925007-mortal-kombat-shaolin-monks/faqs/79640/overview).

### Shopsanity

If on, adds checks for purchasing special move upgrades and combos in the pause menu.
If off, the shop acts like in the vanilla game, special move upgrades and combos are not randomized.

### Skip Tutorial

If on, the game skips all the beginning tutorials in Goro's Lair.
Irrelevant when `Wu-Shi Academy start` is on.

### Wu-Shi Academy start

If on, pressing new game will not put you in the normal Goro's Lair start but in the first area of Wu-Shi Academy.
You can still get to Goro's Lair from Wu-Shi after finding the Fist of Ruin ability.

Turn this option on if you're more familiar with the game and want a faster start and more varied seeds.
Turning this option on means you don't need to find Long Jump immediately to leave Goro's Lair,
that makes it so that Evil Monastery is not accessible 100% of the time at the beginning of the run.

### Randomize tournament victories

If on, shuffles 5 tournament victory items in the item pool,
all 5 are required to open the door to the Foundry in the Portal.

If off, the door to the Foundry acts like in the vanilla game, that means you need to beat all 5 main bosses to open the
door.

There is a tracker in the pause menu that shows your current tournament victory amount.

### Mana Upgrades

The vanilla game doesn't include mana upgrades, so here it's an optional feature you can enable.

If on, adds 4 mana upgrade items to the item pool,
each upgrade increases your max mana by about 25%, meaning that your max mana is doubled after getting all 4 upgrades.

## Logic

### Abilities

Most of the game's logic revolves around the 7 movement abilities.
Almost every area in the game is gated behind an ability, with some areas requiring multiple.

Logic requires you to have the required abilities to collect Red Koins.

Here's a small overview of the main areas and their logic:

* Goro's Lair: Fist of Ruin (if `Wu-Shi Academy start` is on)
* Wu-Shi Academy: Long Jump / Double Jump (if `Wu-Shi Academy start` is off)
* Evil Monastery: Long Jump / Double Jump
* Living Forest: Fist of Ruin
* Soul Tombs: Wall Climb
* Wastelands: Wall Climb + (Wall Jump / (Wall Run + Double Jump))
    * inner areas of Wastelands require Fist of Ruin and Wall Run
* Netherrealm: Swing + (Double Jump / Wall Run)
    * the second half of the Scorpion fight requires jumping long distances,
      and if you miss the jumps you fall down and become stuck unless you have Wall Run or a Double Jump,
      so that's why they are in the logic here.

### Fatalitysanity

If `Fatalitysanity` is on, the required amount of Blood bar upgrades is needed to perform finishing moves.

* Fatalities require 1 upgrade.
* Multalities require 2 upgrades.
* Brutality requires all 3 upgrades.

### Shopsanity

If `Shopsanity` is on, the logic expects you to be able to reach a certain amount of main bosses before being able to
buy upgrades

In general, logic expects you to buy upgrades in order, from least expensive to most expensive.
Pricing and amounts of upgrades vary by character.

* The first R2 special move upgrade is always free and can always be bought from the start.
* When you're able to reach 2 main bosses, the logic expects you to buy the first tier of upgrades (3000 EXP each)
* When you're able to reach 3 main bosses, the logic expects you to buy the second tier of upgrades (all combos, 5000
  EXP each)
* When you're able to reach all 5 main bosses, the logic expects you to buy the rest of the upgrades.

You can obviously farm EXP to buy all upgrades early, which makes them out of logic checks.
Generally you're not expected to farm, unless you haven't been doing your combos and barely earning EXP throughout the
game.

### The Foundry

If `Randomize tournament victories` is on, logic expects you to have all 5 tournament victories before being able to
reach the Foundry.

If it's off, logic expects you to be able to reach and beat all 5 main bosses before reaching the Foundry.

## Autosave

The client implements a sort of autosave feature that the vanilla game doesn't have.

Each time you exit a room or save in a save statue the client saves your progress to the server,
and it restores it when you re-enter the game.

That means you can safely exit to main menu and press New Game to go back to the starting area, as the Archipelago specs
require.

That also means that if you make different save files in different spot in the game,
you can load them to act as a sort of fast travel.

All checks, upgrades and EXP are shared between save files while the client runs, so you won't lose progress loading an
earlier save.

It is recommended to not overwrite your save at Wu-Shi Academy,
because it's the nearest save file to the Portal.
Meaning you can always come back to it when you want to go to a new area.

**Notes:**

* You should always choose New Game in the main menu to start a run.
* You shouldn't load a save file that isn't part of your current run, it can mess with the game progress.
* Some areas in the game allow you to enter, but not to leave without a required ability,
  it is safe to enter those areas, collect the checks that are there then exit to main menu and load a different save
  file.

  For example:
    * Entering the Oni Warlord boss in Goro's Lair without Long Jump means you can't leave the arena,
      even if you have Double Jump, the jump to get to the top of the room is really hard,
      so it's safe to exit to menu and load the save spot from the start of the room,
      using Double Jump to clear the broken bridge is possible and logic expects you to do it.
    * Entering the Reptile fight without Long Jump means you're unable to complete the snake sequence.
    * Also entering the Reptile fight without Wall Climb means you can't leave the arena after the fight, it is safe to
      exit to menu after beating Reptile and getting the check for beating him.
    * The area in Wu-Shi Academy where you unlock Wall Run, without Wall Run you can't leave the area.
      You can safely enter the area, collect the check, exit to menu and load a save.
    * If you enter the Sub-Zero fight without Fist of Ruin, you won't be able to break the ice wall to enter the next
      room,
      if that happens you can exit to menu and load the previous save file, you will have to fight Sub-Zero again.
* Sometimes exiting to menu might break some game sequences, like exiting to menu after beating Orochi in Soul Tombs
  without returning to the main room and seeing the laser.
  If you don't return to the main room naturally, the game doesn't spawn the laser to open the Baraka door.
    * In that case you can manually walk back to the Orochi room, then back to the main room.

The general flow of the run is this:

* At the start you press New Game
* Then you can make save files in different spots, always making a new save file and not overwriting old ones.
* Then you can exit to menu and "fast travel" to old save spots.

## Deathlink

Deathlink is supported and can be turned on by using the `/deathlink` command in the client.

## What other changes are made to the game?

* Removed needing to perform a Fatality / Multality / Brutality to progress the game
  in the rooms where you acquire them. That means you can complete the game without unlocking the Blood bar.
* Made it so that the Red Koin that is in the room where you unlock the Brutality after beating Reptile is spawned in
  without needing to beat Reptile.
* Made it so that the room before the Goro fight is pre-completed,
  meaning the portal to the Dead Pool is always open,
  and you don't have to beat Goro to progress.
* Added Mana upgrades that are shuffled into the pool if `Mana upgrades` is turned on.
* Made it so that if `Randomize tournament victories` is on, you don't need to beat all bosses to open the Foundry door,
  only requiring to find all 5 tournament victories.
* Made it so that the UI for the health bar and EXP never leave the screen, so you can always see incoming messages.

## When the player receives an item, what happens?

The EXP text above the health bar changes to display the message about the received / sent item.
You can always pause the game to see your current EXP if there is a long queue of messages.

## Universal tracker

If you have Universal Tracker installed, the client adds a Tracker tab which lists all currently available locations to
check.
You can get Universal Tracker [here](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker).

## Can I play offline?

No, a connection to the Archipelago server is required to receive items, even in a single-player multiworld.
You can always use the Archipelago launcher to locally host a server on your PC.

If the connection to the Archipelago server is lost it is recommended to exit to main menu, reconnect and load a recent
save.

## Known Issues

### Mileena boss softlock

Sometimes when fighting the secret Mileena boss while still in the same in-game session of beating the Kitana fight,
beating Mileena can softlock the game.
To avoid this fully restart the game before going to fight Mileena, exiting to main menu isn't enough.

### In-game messages

Messages disappear after a few seconds, messages can disappear during cutscenes
so sometimes you might not see new messages, always check the client itself for missed messages
