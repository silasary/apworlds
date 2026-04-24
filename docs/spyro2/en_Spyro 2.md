# Spyro 2: Ripto's Rage

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a
config file.

## Which version of the game is supported?

This is an Archipelago implementation of the PlayStation 1 version of Spyro 2: Ripto's Rage (1999), **not**
the Reignited Trilogy version (2018).  This randomizer requires use of the 
NTSC-U (North America, as opposed to the PAL/European or NTSC-J/Japanese) version, due to differences in the internal workings of the game.

## What does randomization do to this game?

When the player completes a task (such as collecting a talisman or orb), an item is sent.

This does not randomize the location of orbs, talismans, or gems, or shuffle entrances.

Progression is based on items the player has received, not what they have completed in game.
It is possible to advance to the next world without having completed each level first,
if you are sent the right items to do so.

The following options significantly impact gameplay. All default to off or vanilla behavior.

- Moneybagssanity - Creates an item for each Moneybags unlock. Prevents paying for these unlocks.
- Open World mode - Removes talismans and talisman locks from the game. Typically best for playing with other open games.
- Level Locks - Adds keys to the item pool that are required to enter specific levels. Strongly encouraged with Open World mode. Increases the likelihood of becoming stuck.
- Ability options - The player can start with, shuffle into the item pool, or disable double jump and the permanent fireball ability. The player can also start with swim, climb, and headbash.
- Tricks - As of version 1.2.0, the player may pick specific speedrunning tricks to put into logic.
- Progressive Sparx Health - Start with a lower max health and unlock upgrades. Optionally, logically require sufficient max health for some levels.
- Easy challenges - The player may modify a number of challenges to make them easier than in vanilla, if desired.
- Death Link - Will not trigger in speedways or Dragon Shores to prevent softlocks and crashes.

Some small cosmetic randomization options are also available.

## What items and locations get shuffled?
The following locations always grant shuffled items.

- Talismans (14)
- Orbs (64)

The following locations may grant shuffled items based on player options.

- Individual gems (random 200 or all 2546) - Choosing all 2546 ("full gemsanity") requires host approval.
- Having total gem count reach a multiple of 500 (up to 20 locations)
- Collecting 100, 200, 300, and/or 400 gems in a given level (up to 4 checks per level, 25 levels)
- Skill Points (16)
- Life Bottles (23)
- Collecting every spirit particle in a level (18)

The following locations may be included in the multiworld but grant the same item each time.

- Defeating each boss (3)
- Dragon Shores token minigames (10)
- Moneybags Unlocks paid for with gems (11)
- Skill Points goal locations (16)

In addition to 64 orbs and, depending on settings, 6 Summer Forest Talismans and 8 Autumn Plains Talismans,
depending on the player's options, Moneybags unlocks may
be shuffled into the item pool, rather than having the player pay Moneybags.
Level Keys and Progressive Sparx Health Upgrades are also possible items.
Leftover items will be "filler", based on the player's
options.  Examples include giving extra lives, temporary invisibility, changing Spyro's color, or making the player Sparxless.

## Which items can be in another player's world?

Any of the items which can be shuffled may also be placed into another player's world.

## What does another world's item look like in Spyro 2?

The visuals of the game are unchanged by the Archipelago randomization.  The Spyro 2 Archipelago Client
will display the obtained item and to whom it belongs.

## When the player receives an item, what happens?

The player's game and HUD will update accordingly, provided that they are in their save file.  Some effects,
such as healing Sparx, may operate with a delay to avoid unintended interactions in game.

Talisman count is not displayed in game.  The `!talismans` command (Duckstation) or `/talismans` command (BizHawk) can be entered into the client to see the current counts.

Receiving a Moneybags unlock will complete the unlock automatically.

## Unique Local Commands

The following commands (starting with a / for BizHawk and an ! for Duckstation) are available when using the S2AP client to play with Archipelago.

- `talismans` Prints how many Summer Forest Talisman items and how many Autumn Plains Talisman items the player has received.
- `unlockedLevels` Show which levels the player has unlocked in open world mode.
- `goal` Show what your completion goal is.
- `options` Show some of your most important options.
- `debugInfo` Information that may be helpful when reporting bugs.
- `patch` (Duckstation only) Creates a patched version of your vanilla ROM for Archipelago. This is not seed-specific and is optional.
