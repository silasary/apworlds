# Turok 2: Seeds of Evil Remastered

## IMPORTANT

**Linux and Mac are not supported. If you get it to work through VMs/Proton/etc, please let me know so we can add instructions for others.**

**If "Auto-Switch New Weapon" is on and you receive a new weapon while on the Riding Gun in Level 2, you will be softlocked! Turn off that setting for this map! If you DO get softlocked in this way, press "_~_" to open the console, then type "_warp 125_" to reload the map.**

## Where is the options page?

Archipelago uses yaml files for game options. You will need to get and edit the yaml with your desired options. Either download from [the release](https://github.com/chikakoo/Turok-2-Randomizer/releases), or generate it from the Archipelago Launcher.

To generate it, install the AP world by downloading it and double-clicking it (or by putting it in your Archipelago's "custom worlds" directory). In the launcher, run "Generate Template Option" to generate the yaml.

## What items and locations get randomized?

Static pickups (those not spawned from destructibles):
- Health
- Ammo
- Max Ammo (amounts per ammo type are configurable)
- Weapons
- Life Forces
- Level Keys
- Eagle Feathers
- Talismans
- Nuke Parts
- Mission Items
  - (L1) Power Cells
  - (L2) Gate Keys; Graveyard Keys
  - (L3) Satchel Charges
  - (L4) Satchel Charges; Cave Door Keys
  - (L5) Satchel Charges
  - (L6) Ion Capacitors; Blue Laser Cells; Red Laser Cells
- Activated Switches
- Mission Objectives
- What enemies are (enemizer)
- Whether killing enemies give checks (enemysanity)

## What does randomization mean?

Weapons can be randomized to single or multiple copies. If multiple, they will be progressive upgrades, with each upgrade reducing ammo consumption. See the ammo explanation later on for how ammo is changed.

Life force tiles, health, and ammo can be shuffled throughout the worlds depending on settings. They can also be generated 
based on filler items.

Enemies have various randomization options to make the game more varied, including randomizing what they are, and/or making them checks.

## What core changes have been made?

### Main gameplay

#### Hub changes

When starting a new game, you will be immediately dropped off by the hub's checkpoint station. You will start with a set (or sets, depending on settings) of level keys for the levels that start unlocked. Press **zoom out** to view a UI where you can see what keys you start with (see the **Inventory and Warp UI** section).

There is a set of ammo and health respawns by the checkpoint station for convenience, and to prevent potential softlocks due to lack of resources.

There are now three level 1 keys which must be obtained to enter level 1, which is blocked by a barrier by default.

#### Progressive warps

To make the game more multiworld friendly, there are settings to control how far into each level you can go to in the form of progressive warps. These are shown as purple-colored level keys in the UI.

There are sets of progressive warp items for each level. Each one you has controls how many portals deep into the level you can go, depending on the "Progressive Warp Strength" setting. For example, if you have 2 level 1 warps with strength 1, you can go through 2 of the warp portals before you get blocked. If strength is 2, that number becomes 4.

This is highly recommended to keep on if you are playing in a multiworld. If you don't have it on, you can immediately get to the end of most levels without any items, which makes the progression balancing really bad.

### Inventory and Warp UI

When first spawning into a map, or picking up an item, it will show you how many checks are left there. There are two menus you can use to track progress as well:
- While not scoping, press **zoom out** to open a UI where you can see your inventory progress. You can also click the "Warp to Hub" button to return to the hub, or the "Warp to Boss" button to warp to the boss/totem of the current level (if you've been there before).
- While not scoping, press **zoon in** to show a quick summary of the map/level you are on.

These are important, because **the randomizer breaks the in-game inventory screen.** It will not accurately show your progress.

### Pickup indicators

All checks will use the in-game "important" item exclamation point to make them easier to find. There are separate options for pickups and enemies which are togglable through the UI.

They won't show up like this if the in-game "Show Hints" option is off, though.

### Ammo

Randomized ammo pickups are now "Random Ammo Packs" to avoid ammo starvation. When received, it grants between 20-75% (by default, this is configurable) of your ammo back in a random weapon, including alt ammo. It will roll to (not 100% of the time) give ammo back in weapons with no ammo first, then ones missing ammo. Otherwise, it will choose from your entire weapon list. 

Random Ammo Packs look like 6 shotgun shells in the Archipelago colors.

Ammo from destructables, most generators, and enemy drops are unchanged.

There are settings to modify and/or randomize the max ammo of each weapon. Additionally, each weapon can be set to consume more ammo per shot. Progressive weapon items will reduce this number.

### Totem Missions

To prevent softlocks, totem missions will restart if you fail to save an energy totem.

### Why is my Flare Gun weird/not accessible?

Due to modding limitations, the Flare Gun now requires you to have explosive shells to use (it does not consume them). It otherwise behaves normally.

This was a workaround so that explosive shells could be given from the random ammo pickups.

## Which items can be in another player's world?

Anything that can be randomized.

## What does another world's item look like in Turok 2?

Items belonging to other worlds are represented by an Archipelago model. Progression items have a gold border, useful items have a blue border, and all others have a gray border.

## When the player receives an item, what happens?

All pickups will be collected with the usual sound effects/voice lines. If the in-game setting is on, the auto-weapon switch will occur for new weapons. **See the note on the top about this setting!**

Due to modding limitations, Life Forces will spawn where the player is. They will be picked up when the player moves.

## Hey! This pickup isn't randomized!

A select few pickups aren't randomized because they only exist in lower difficulties. This was done to keep the seeds difficulty-agnostic. These locations are:
- Three Blue Healths in the River of Souls' Life Force Leap of Faith room
- The four Ultra Healths after completing each wing in the Primagen's Lightship

Other exceptions include:
- The Death Marshes red Life Forces in the cages by the talisman portal switch. These aren't included because they aren't pickups until the cages fall. For simplicity, replacements are only done on a map load, so these get excluded.
- Two yellow Life Forces in the Primagen's Lightship wing 1, in the catwalks room. These are actually sets of two Life Forces on the exact same spot. This makes it difficult to safely do the replacement, so they're excluded for now.

Generators and spawns from destructable objects are not randomized at this time.

Any others may be a mistake, so feel free to ask.

## My server is messed up! How do I resync?

This mod will listen for when the client has acknowledged that it has processed a check. It will save the list of unsent locations when you save your game, and resync any unsent locations when you load. However, in the unlikely case that the server doesn't know that you got a check, you'll need to resync.

To do this manually, load into your save file and **press the tilde (~) key**. This will open the console. Run the following command to resync: **call Resync**.

Note that **this is not optimized for speed**, and will take a bit to run (it will process about 10 checks per second, due to the client's tick rate). It's not expected that this will ever be needed.

## Help! I'm softlocked!

If you are stick in the geometry or something similar, see if you can open the UI by pressing your **zoom out** key. Then, click the "Warp to Hub" button. If this doesn't work, opening the console with the tilde "_~_" key and entering "_warp 60_" will also warp you back to the hub.

If something is messed up with the randomizer/Archipelago and you didn't get an item you were supposed to, please post on Discord so it can be fixed. All debug console commands are included with the mod, so you should be able to give yourself any item you need to get yourself unstuck. To see the list of commands, do the following:
- Press "_~_" to open the console.
- Type "_call Help_" to display a list of commands. In general, giving yourself any item will be "_call ItemNameHere_".
