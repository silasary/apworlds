# Changelog
This includes changes in both the mod and AP world, in reverse order of releases.

## v0.6.X

### v0.6.0
- Background changes to support the poptracker and auto tabbing
- Support yamless for Universal Tracker
- Starting inventory is now received from the AP server
  - Added a generate_for_offline setting if you don't want to connect to AP (you'll get the starting inventory like before)
- Fixed a couple item classifications and non-breaking logic bugs
- Various location name fixes/adjustments
- Combined various item weight settings for clarity and simplicity
- Added seed validation to prevent playing with the wrong save. This handles:
  - Loading a save file from a different patch file than it was saved with
  - Loading a save file for the incorrect slot/multiworld
- Error fixes found by the fuzzer:
  - Generation failure when starting with every weapon with force_early_weapon on
  - Generation failure when level unlock method is one_progressive_warp with starting_progressive_warps set to 0
  - Unit test failure caused by adding to local_items after generate_early
- Attempted very rare, hard to reproduce enemizer(?) crash

## v0.5.X

### v0.5.0
- Added Enemysanity, which adds one checks for killing enemies
  - This only includes enmies present in all difficulties
  - A select few enemies have shared IDs; these have a shared check
  - To better support Enemysanity (and to not force the player to need to take damage), in-game enemy spawns requiring an item to be picked up now happen when the item is touched
    - Also fixes several missed instances of these which would never spawn
- Changed the LevelKeyPacks setting to LevelUnlockMethod
  - Adds an option to give level keys on the first progressive warp collected, removing level keys from the pool entirely
- Added tricks:
  - Jump to the red Life Force ledge at the start of level 3
  - Jump to the bridge by the second ammo storage in level 3, skipping the lower portal
  - Eye of Truth skips in levels 3 and 6
  - Jump to the Primagen Key path in level 5, skipping the Breath of Life
  - guarantee_torpedo_launcher is now level_4_skip_torpedo_launcher for trick name consistency
- Added options for River of Souls and Lava pickups:
  - Out of logic: If you would normally die getting this, it isn't in logic.
  - In logic: Requires a death or save scumming AP checks (or the jump through lava trick). Infinite lives cheat may be required.
  - Prevent Collection: The mod will prevent collection until the appropriate talisman is obtained.
- Location changes:
  - Added a/b to some map names for clarity and sorting reasons
  - Changed various location names to be clearer about what they refer to
  - Added a missing explosive shells check in Level 6
  - The first Life Force 10 by the level 1 Primagen key no longer requires the Leap of Faith (as the jump is really easy)
- QoL Changes
  - Enemizer will no longer randomize the Mites in the 5-6 switch room because they get stuck easily and could force you to warp out
  - Added options to remove the (!) indicators for pickups and enemies separately. This is also toggleable in the UI.
  - The checkpoint station portal cutscenes are now skipped, allowing for much faster warps
  - Added level prefixes to the quick warp menu
  - All level intro and talisman cutscenes are now skipped
  - Removed some dummy pickups in 3-2 that could be misleading. This also prevents an out of logic Grenade Launcher
- Misc Changes
  - The "Beacon Power Cell" item is now just "Power Cell", as that's what it's actually called
  - Removed the item counts from the level progress text popup (just use the UI one)
  - Various behind the scenes changes for the future Poptracker update
    - Includes adding "Cave Door Key Used" locations to be able to track key usage
- Bug fixes
  - Fixed being able to could collect items after dying if your body touches them (not vanilla behavior)
  - Fixed the real root cause of the enemizer crash, allowing the level 6 boss spawns to be randomized again
  - Fixed the overall level progress count not including non-pickup checks
  - Fixed Torpedo ammo pickup spelling

## v0.4.X

### v0.4.5
- Fixed a crash caused by enemizer randomizing enemies in the level 6 boss fight
  - This disables random spawns during the fight, and will potentially be added back when the root cause is found

### v0.4.4
- Fixed a rare crash when a killing a random enemy spawned from a wasp nest

### v0.4.3
- Fixed the Nuke weapon not being received if the final Nuke Part is sent from another world

### v0.4.2
- Fixed potential generation failures when weapon randomization and weapon barriers are off
- Fixed generation failures when not randomizing talismans
- Fixed enemy traps spawning directly on the player, which was never intended

### v0.4.1
- Fixed patch file crash when another game's item/slot name contains quotes or backslashes
  - Quotes are removed entirely, as the game's font won't display them
  - Backslashes are replaced with forward slashes
  - Other misc special characters are now handled too

### v0.4.0
- Weapons and Ammo
  - Options for different levels of progressive weapons, which impact how much ammo is consumed per shot
    - For instance, setting this to 3 will result in 3x the ammo consumption, with each additional duplicate weapon
      picked up reducing this by 1
  - Options to configure max ammo for each ammo type
    - Supports randomization for more interesting/varied seeds
  - Options for "weapon barriers", requiring a set number of unique weapons to use a warp portal
    - This helps a lot with balancing early/late game weapons
    - Configurable for each level's second warp, the warp after the second checkpoint, and the exit warp
      - ...except in Level 6, where the second barrier is at the start of wing 3 (a more convenient halfway point)
    - Includes a configurable weapon requirement to enter the Primagen's lair
  - Random ammo packs will now show the amount/type(s) of ammo received instead of the weapon name
  - The hub's ammo pack will now completely refill all owned weapons for quicker restocks
- Enemies
  - Added enemy randomization (enemizer)
    - Enemy pool options:
      - Same as current level (excluding or including oblivion enemies)
      - Similar difficulty to current level
      - Scale to owned unique weapons
      - No logic (any enemy can be anywhere)
    - Enemy spawners can be randomized too
      - Includes undead spawners, Sisters of Despair (who spawn the undead), wasp nests, spiders, and hives
      - Can be set to the same setting as the enemizer, or a more manageable set of easy-to-kill enemies
  - Enemy trap pools are now configurable to the same pool options as the enemizer
    - They contain the full suite of enemies now as well!
- Totem/Boss changes
  - Allow the player to teleport out of totems/boss fights
  - Added a UI button to teleport back into the fight if you've been there before, as the end portal will not work twice!
  - Removed the "Boss Weapon List" option because the weapon barriers will cover this case
- Bug fixes
  - Fixed random ammo packs sometimes coming back after being collected
  - Fixed duplicate health/ammo spawners when saving and loading from the hub
  - Fixed the Beacon Power Cell/Ion Capacitor "important" indicators not displaying when mission items are not randomized
  - Misc location name fixes

## v0.3.X

### v0.3.0
- Hub changes
  - Core gameplay change so that the player always starts in the hub with starting level keys
  - Added health/ammo spawns by the checkpoint station
  - Level 1 now requires 3 Level 1 Keys to enter
- Added inventory progress UI with a way to warp back to the hub checkpoint station
- Significant new options
  - Progressive warps are included by default, to limit your progress through levels until you get the progressive warp items
    - Options exist to control the starting number of them, and how far each item lets you go into each level
    - This is very important for balanced multiworlds
  - Switches can now be checks
    - Includes switches you can touch and shoot, as well as the portal and force field generators in level 5
    - This just sends a check, it doesn't actually prevent the switch from being activated
  - Mission objectives can now be checks
    - This just sends a check, it doesn't actually prevent the objective from being completed
- Other option changes
  - General renames for consistency/clarity
  - Options to start with and/or exclude sets of levels to control the size of the seed
  - Options to choose what to do with various randomized items if the level they are normally in is excluded
  - Options to choose a % of randomized Ammo/Health/Life Force pickups rather than doing all of them
  - Option to only randomize full/ultra healths when randomizing health pickups
  - Options to only randomize red or yellow Life Forces when randomizing Life Forces
  - Option to define a list of weapons you can receive when entering one of the late-game bosses
  - Option to turn level keys into "Level Key Packs", which give you all of them in one item
  - Options to configure how much ammo the Random Ammo Pack can give
  - Options to further configure filler item distrubution, including making it put all randomized vanilla items back into the pool
  - Removed the Open Hub setting, as you always start there now
  - Removed the level key randomization setting, as they will always be randomized
- Location name changes
  - Each location is prefixed by the map it's on for easier Universal Tracker visuals
  - Spawning into a map now shows the progress count automatically to help track progress/where you are
- Added a "Useful" AP model to use for off-world useful items
- Removed the jank extra level warp portals, since the UI can be used instead
- Support the Start Inventory setting
- Bug fixes
  - Issues with syncing items with AP...
     - If you collect some before connecting to the client
     - If you disconnect from the client, collect some, then reconnect

## v0.2.X

### v0.2.2:
- Removed impossible to send location "LBO Lava Caves - Plasma Rounds by Lava"
- Fixed Level 6 Oblivion portal being logically accessible without the two Blue Laser Cells
- Fixed generation failures if guarantee_torpedo_launcher is on, but weapons are not randomized

### v0.2.1:
- Fixed enemy traps from Leap of Faith jumps potentially knocking you down, causing softlocks
- Fixed non-collected items not sent to AP during Leap of Faith jumps
- Fixed some items not showing the map progress message
- If there is a level goal, totem missions will restart if unsuccessful to prevent softlocks
- Updated description of the "Get to Lair" setting to be clearer what it is

### v0.2.0:
- All levels are now included
- Ability to open the hub from the beginning (so Level 1 doesn't need to be completed)
- Options reworked to be clearer in general
- Options to weigh health pickups and life force pickups
- Options to choose whether or not to randomize various locations
- Options to choose level and Primagen goals separately (or at the same time)

## v0.1.X
Initial release. This version does work with AP, but with limited options.

### v0.1.0
- Randomizes weapon pickups, ammo pickups, health pickups, and Life Forces
- No options to configure what can be randomized
- Only level 1 is supported