# Final Fantasy XIII-2 Start Guide

## Prerequisites

As well as Archipelago and the AP World, you will also require:

- Final Fantasy XIII-2 Randomizer tool [FFModdingWPF](https://github.com/Bartz24/FFModdingWPF)
  - To generate the necessary modpack from the AP seed file
- Nova Chrystalia (v2 beta)
  - A mod management tool for the FF13 trilogy games
  - A link can be found for this within the randomizer tool if you don't already have it

## First time setup

Download the latest prerelease version of FFModdingWPF here [0.8 Pre-release](https://github.com/Bartz24/FFModdingWPF/releases/tag/pre-release-0.8).
Specifically, the "FF13_2Randomizer0.8.x.y.7z" archive.

Unpack this where you want, but bear in mind that the modpacks will be generated in its subfolders and can be quite large, so ensure you have sufficient hard drive space.

Once unpacked, start the tool, and point the 2 paths at the top to your FF13-2 installation folder, and your Nova install.

### Nova Setup

NOTE: Nova 2+ is required for the randomizer to function as expected, if you have an old Nova 1.x install you will need to download the newer version.

If you don't already have Nova setup, click the download link to the right of the Nova Chrysalia Path entry box in the randomiser tool, and follow the setup there.

Once Nova is installed, start it up, setup your FF13-2 installation folder (and the other trilogy games if desired), ensure the active game is set to FF13-2, and in the
rightmost column, click the button marked "Unpack Game Data (EN Audio)". This will take some time.

If you wish to use DLC regions/items in the randomiser, you will also need to obtain the "DLC Restoration - Console Content" mod for FF13-2.

### Post Nova Setup

Once your game is unpacked, CLOSE NOVA CHRYSALIA, and return to the Randomizer tool. Setup your Nova Chrysalia installation directory (if done correctly, the version of nova
will be autodetected by the tool), and you're ready to go!

Leaving nova open when generating a modpack will lead to various strange issues. The tool will attempt to warn you at some points in the process if the program is open, but
is not quite smart enough to detect if you open it at a bad time during generation, so please don't :)

## Understanding generation options (AP)

### Historia Crux randomisation

`shuffle_historia_crux`

If enabled, causes the Historia Crux to be randomised. This acts as an "Entrance Randomiser", causing you to start in a random area, and for some gates to lead you to areas they would not normally.

It is generally recommend to also enable Battle/Boss randomisation in the post-generation options when using this flag, as otherwise encounters in the area you start with may be unwinnable.

`fixed_crux_start`

To ease some of the issues with battle scaling, and to provide some more early game familiarity, you can choose the following options to fix the starting location(s) even when the Historia Crux is randomised.

`allow_dlc_locations`

By enabling this option, the 3 DLC locations will be added to the Historia Crux randomisation pool. Currently these locations contain no checks, but also adds 3 additional starting locations that will be unlocked from the beginning of the seed.

Enabling this option requires the "DLC Restoration" mod to be present within Nova Chrysalia for post-generation to function.

### Item randomisation options

`allow_dlc_items`

Add items from the DLC into the pool. 

Enabling this option requires the "DLC Restoration" mod to be present within Nova Chrysalia for post-generation to function.

`fully_remote_items`

Enabling this option will cause AP to place excluded/junk locations rather than
post-generation.


## After generating a game

Once a room is generated, you should be provided (or be able to download from the room page) a `.apff132` file.

Open the FF13-2 randomizer tool, and select the button marked "Load from ZIP/APFF132", and select this downloaded file.

You can then adjust various local only settings, which do not affect item placement, but can adjust your experience to your taste.

(Images tbd)

### Local / post-generation settings

Most options are either self-explanatory or have a help string in the randomizer tool, but here's a quick reference also (which may be out of sync with reality
as new options are added/amended - if something looks wrong here yell at MLSTRM to fix this list!)

`Randomize Crystarium Abilities`

Does what it says, will cause the abilities for Noel, Serah, and all monsters to be randomised. Abilities remain within the same role, and there is a chance that
some abilities do not appear at all (as the number of ability slots per role is fixed, and the lists are wider than the number of slots).

`Start with CP`

Select an amount of CP to be given to you at the start of the game. Recommended for newer players to help bootstrap your setup a bit especially with Battle Randomisation

`Randomize Weapon Stats`

Does what you'd expect

`Randomize Equipment Passive Abilities`

Does what you'd expect. Note that this can lead to some pretty silly situations, and there's a lot of bad/negative passives out there.

`Randomize Accessory Weights`

In jumps of 5, adjust how much each accessory's weight can drift from its vanilla weight. This is capped at 99 so everything is still technically equipable if you get the slots.

`Run Speed Multiplier`

Adjust how fast Serah/Noel run on the field. Caps at 150%. Highly recommended especially if you have low patience and like to go zoomy.
Be warned, after using this option going back to the vanilla run speed feels _really_ bad.

`Enemy CP Multiplier`

Multiplies the CP given out when defeating an enemy.

`Shuffle Music`

Does what you'd expect. Currently includes every music track in the game we can get to.

#### `Randomize Enemy Locations`

These options get their own section as this gets a little complicated.

It's important to note that since this is local only, if you get stuck with battle rando due to crashes or fights you can't win, you can always regenerate the modpack
with different battle rando settings without disrupting your checks/treasures/etc and then swap out the modpacks and carry on.

`Allow Larger Encounters`

Increases the size of some encounters. Generally unstable, not recommended for use.

`Shuffled Bosses`

Select which boss fights are in the pool to be randomised.
"Caius (Beach)" is in the list here but currently is fixed in place due to some issues with the Caius fights if they end up in a different Caius slot, this is being looked into currently still.

`Enemy Rank Range`

Each enemy is given a rank by the randomiser indicating its (rough) difficulty/strength, increase the range to allow for a wider replacement variation. This may lead to some very silly encounters.

`Scale Boss Stats [Experimental]`

Scales boss stats to match the area/sphere they are placed in. Even though this is Experimental, if playing with Crux Randomisation this option is recommended.
If you get some very difficult boss fights still (or very easy ones), please let us know with the following information:
- The Boss location
- The Boss fight that was placed in the location
- Your Spoiler log docs zip (from standalone) or your `.apff132` file (from AP)
- A screenshot of the enemy libra screen if able

`Deprioritise Caius Boss Shuffle [Experimental]`

This game has a lot of Caius fights, and it gets a bit tedious beating just him up all the time. This option shoves all of the Caius fights to the bottom of the placement list
internally, which means they are much more likely to show up in optional/dlc boss fight locations, making the "normal" boss fights you'll usually encounter during the run much
less likely to be Caius.

`Full random shuffle bosses [Experimental]`

Full shuffles the boss list before placement.
Highly recommended to be selected only with "Scale Boss Stats" enabled.
Takes place before the Caius deprioritisation if applicable.

This option true shuffles the boss list before placing the boss locations, so that there is no longer any correlation or sphere correction applied to the placement,
you can end up with any boss in any location. Doing this without scaling enabled will likely lead to unwinnable boss fights in the early game.

#### `Puzzle QOL Options`

Options which adjust the behaviour of the Temporal Rift puzzles.

`max stage count`

Select the maximum number of stages you have to complete of each rift type to clear the rift.
For example, if set to 1, then in Bresha Runs 5AF when clearing the void before fighting Atlas, only 1 puzzle is required when normally there are 3.

`Clock puzzles - max clock count`

Set the maximum number of clock numbers the puzzles can contain, between 5 and 13. This will place an upper limit on the internal puzzle generation script to keep the
puzzles below a desired complexity.

`Clock puzzles - timer behaviour`

Adjust the timer behaviour for clock puzzles. Note that not every clock puzzle has a timer in the base game, this only applies to those which do set a time limit.

- Normal: Unchanged from base game
- Double: Doubles the timer when it is present
- None: Removes the timer from all clock puzzles

## Playing the randomizer

Once a modpack is generated, you add it in Nova through the following steps:

- Navigate to the "Mod manager" tab
- If you have an existing seed installed, uninstall it first
- Click "Add mod"
- Navigate to the generated modpack
- The mod should now show in the list, select it and click "Install mod"
- Once complete, running the game through Nova will enable the mod for you

For more information on some randomiser specific changes, see [Rando info](./rando_info_en.md)

### AP Client and UT integration

The AP client should be resilient to being opened independent of the game running, although it is generally recommended to start the game first to avoid some edge cases.
Once connected to a room, if the game is running the client should automatically start auto-tracking for you.
Checks will be sent out fairly soon after obtaining the item in the game.

To receive items, ensure you are active on the field (i.e. not in the main menu or Historia Crux) and hold down one of the triggers (L2/R2), items will be given to you
if there are any to give, and the client maintains an internal queue so you will receive things in order they were sent until there is nothing left. Feel free to run around
and do things while this is happening, although you may need to clear through the pop ups to interact with objects/skip cutscenes/etc.

The apworld supports yamlless UT integration, so you can just run UT and point it at the room/slot with no prior setup. Note that UT currently will "spoil" your
Crux randomisation if enabled, since as soon as you have an Artefact, it can see what area is past the gate before you can.
There are plans to look into doing something to suppress this in the future, but its not currently a high priority.