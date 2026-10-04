# Archskipelagill

## Where is the options page?

To configure and export a config file: install Archskipelagill's `.apworld` file into your local copy of Archipelago, then run the Options Generator directly or from the Archipelago Launcher. If the `.apworld` is installed correctly, Skigill should appear as a selectable game on the left side of the Options Generator.

## What is Skigill?

[Skigill](https://store.steampowered.com/app/3657180/Skigill/) is a game released on Steam in early 2026 by Achromi. It's a Survivors-like -- a top-down single-stick shooter where aiming and shooting happens automatically, and enemies spawn in waves from the edges of the screen. What makes this game unique is that its map/playfield is a gigantic skill tree! Purchases are made by standing on nodes of the tree for a couple seconds (a possibly dangerous proposition when being constantly swarmed by enemies), granting you extra stats, weapons, and perks.

## What does Archskipelagill do?

[Archipelago](https://archipelago.gg/) is a program that coordinates randomizers across multiple games, letting players find and send each other items that have been scrambled throughout a cross-game Multiworld.

Archskipelagill currently exists as a Custom implementation and must be installed to Archipelago manually. It currently makes the following changes to Skigill once installed:

### Summary of Effects (on Default Settings)

- Some nodes of the Skigill will be locked; these appear dimmer, and cannot be activated. These must be unlocked in batches by being sent corresponding Archipelago items.
- The following will all be randomized: the starting character/node in the meta-tree, which weapon each character starts with, and which weapons are in the starter pool vs. which are on the meta-tree.
- Some items from the meta-tree (characters and weapons) will be locked; these display a custom lock icon, and can't be used even once purchased. These must be unlocked individually by being sent corresponding Archipelago items.
- The alternate maps are unsupported and will be permanently locked for as long as the mod is installed.
- A Location will be placed at each Chest and Perk on the Skigill, as well as after escaping with each character and weapon and defeating each boss.
- Not much extra randomization is added, as Skigill is a decently random roguelite already. The primary source is which extra Item is attached to each Location, and in which order regions/weapons/characters get unlocked.
- The Goal is to defeat the final boss.
- Built-in Location Tracker effects will highlight unchecked locations with spinning orbs and blinking minimap dots, and cause comets to fall/rise whenever you receive or send items.
- A new button and submenu will be added to the main and pause menus, containing a connection panel and console for the Archipelago client.
- A separate save file will be used by the mod, leaving the base game save file untouched. The mod's save file can be wiped from a button on the Archipelago submenu while disconnected.
- 50 Gill will be granted each time a new run is started (by wiping the save file) to prevent some unplayable starts that weapon randomization can otherwise cause.

### Goals

- Defeat the final boss (default)
- Defeat any boss once, excluding the final boss
- Defeat all bosses in one run ("I'm the boss now" achievement)
- Any of the above goals with an added Difficulty 7 requirement

### Items

- (7) Unlock access to a region of the Skigill corresponding to each character (other than the starting character), the bosses, or the final boss node
- (5) Unlock access to each character, other than the starting character
- (30) Unlock access to each weapon, other than the starting weapons
- (Filler) Gain bonus Gill based on progression (cannot be disabled)

The following items are in starting inventory by default:
- (6) Unlock access to each difficulty level
- (1) Unlock access to Endless Mode

### Locations/Checks

- (6) Escape on each character
- (60) Escape with each weapon equipped
- (51) Collect each Chest node on the Skigill
- (42) Collect each Perk node on the Skigill
- (6) Defeat each boss

The following checks are only included if an equal or harder goal is chosen:
- (1) Defeat the final boss
- (1) Defeat all 6 bosses in one run
- (6) Defeat each boss on Difficulty 7
- (1) Defeat the final boss on Difficulty 7
- (1) Defeat all 6 bosses in one run on Difficulty 7

### Traps

Traps are disabled by default and must be configured in your world options `.yaml` file to appear. Each trap has additional difficulty options in the client's BepInEx config. Traps will queue up and trigger one at a time for every 15 seconds of non-paused run time.

- Damage: instantly lose 50% health
- Pull Enemies: all currently living enemies get +200% speed for 5 seconds
- Weapon Jam: most weapons have -99% fire rate for 10 seconds
- Drain Ski: instantly lose 50% Ski (temporary currency)
- Scramble Stats: Str/Dex/Int stats are exchanged with each other
- Flash Mob: add 30 extra enemies to the next spawn wave
- Stronger Enemies: add 1 minute to the run timer for purposes of enemy/wave difficulty only

### Death Link

Death Link is disabled by default and must be configured in the client options `.cfg` file to enable. It can be configured to send and/or receive Death Link deaths; and to either kill the player, end the run with no reward, or trigger a random trap when a death is received.
