# Changelog
Versions are sorted in ascending order, i.e. the most recent changes are at the top.

## 1.1.0

- A lot of internal reworking
- Updated names of buildings, space platforms, displayed research credits amount, and other features to official 1.0.0+ names
- Overhauled many options for better design
  - Old yamls will be fixed by the apworld and do thereby **not** break
- Added `Unlock pipes with pumps` to `Item Pool Modifiers`
- Added `Jobs` to `Operator Lines Shapes` (formerly `Shape Generation Modifiers`)
- Fixed the two final shapes of a milestone potentially being randomized to the same shape
- Fixed milestones sometimes containing the same shape twice
- Tweaked RNG handling to reduce the risk of updates breaking UT accuracy
- Fixed platform capacity items giving only half of the amount mentioned in their name
- Lessened restrictions for minimum amount of locations
- Added nested randomness to list-based options
- Merged multiple trains-related space platform items into `Shape Trains` and `Fluid Trains`
  - This also fixes the former `Rails` item not actually unlocking the rails
- Fixed job lines and operator lines being considered accessible in sphere 1 even if locked
- Added some missing building variants
- Fixed shapes sometimes generating with floating parts that might even be impossible to produce
- Fixed generation failures when generating with a game that has "Proguseful" items while the classification is enabled to be written into the scenario file
- Fixed the "Surprise out-of-logic item" in the shop sometimes containing items that are useless to your slot
- Turned output zip into a patch file, that automatically installs the scenario and preset files
- Added a `save_data_folder` setting for patch files to know where to put the output files
- Added a `overwrite_scenario` setting that determines, whether an already installed scenario+preset should be overwritten
- Fixed the crystal generator's logic missing `2nd Machine Level`

### Is this version compatible with older multiworld slots and save files?
No

## 1.0.1

- Fixed UT rejecting any slot

### Is this version compatible with older multiworld slots?
Manual-like client yes, back to 0.99.0 (will be deprecated soon though)
<br>UT will probably be inaccurate for worlds generated prior to 1.0.0

## 1.0.0

APWorld:
- Made the apworld compatible with shapez 2 1.0
- Fixed the first 3 task lines sometimes having a (logically) impossible shape
Client:
- First public version
- Will be updated independently

### Is this version compatible with older multiworld slots?
Manual-like client yes, back to 0.99.0 (will be deprecated soon though)
<br>First release of the client mod, so no backwards compatibility with that
<br>UT will probably be inaccurate for worlds generated prior to 1.0.0

## 0.99.6

- Fixed generation failures on AP 0.6.7

### Is this version compatible with older multiworld slots?
Manual-like client yes, back to 0.99.0
<br>UT will probably be inaccurate for worlds generated prior to 0.99.5

## 0.99.5 (Hexagonal update)

- Added the hexagonal shape configuration
- Fixed milestone counts of more than 8 always crashing multiworld generation
- Fixed manual-like client not allowing to check operator levels over 100

## 0.99.4 (Who's that pokémon? update)

- Fixed bad copy-pasting of the scenario preset file content
- Tried reducing the frequency of a downgraded shape being the same as before
- Added an option to show the names of other players' items in your world (enabled by default)
  - Also added the possibility to show the receiving player's name and the item's classification

## 0.99.3 (mid-stream hotfix)

- Actually fixed fluids, wires, and trains toolbars never being unlocked
- Fixed crystals having incorrect logic in very rare cases
- Added `Unlock extensions with miners` to the `item_pool_modifiers` option
- Added `Starting platform points`, `Starting research points`, and `Starting blueprint points` to the `location_adjustments` option

## 0.99.2

- Fixed some upgrades never being unlocked
- Fixed starting milestone still being called "Rotate & Cut" and having the vanilla description
  - Also made it have a random preview image and video
- Fixed fluids, wires, and trains toolbars never being unlocked
- Fixed current research points permanently being hidden
- Added surprise out-of-logic item as upgrade (this is what actually fixes the research points visibility)
- Added goal tab to manual-like client (this also fixes not being able to send the goal flag to the server)
- Fixed multiworld output zip files being rejected by webhost if they contain a shapez 2 output zip
- Fixed `Maximum processors per milestone` in the `shape_generation_adjustments` option not working
- Prevented milestones from having the same final shape twice 
- Overhauled the classification of a bunch of items
- Tweaked `location_adjustments` option description to mention minimum required locations
- Added `Include blueprint points` to the `item_pool_modifiers` option
- Added a shape generation debug file to the output zip

## 0.99.1

- Fixed logic being broken entirely (goddammit even double-checking didn't protect me from lambdas in for loops)
- Added `Location modifiers` option with modifiers `Lock task lines`, `Lock operator lines`, and `Lock operator levels tab`
- Tweaked item generation such that starting items are actually taken into account for event generation

## 0.99.0 (pre-mod release)

- Locations:
  - 3-20 Milestones containing up to 12 items
  - 3-200 Task lines containing up to 5 checks
  - 0-100 Operator levels
- Items: 
  - Buildings, space platforms, various mechanics
  - Task line unlocks, operator line unlocks
  - Research points, blueprint points, platform points
- Options:
  - Goal: Milestones, Operator levels
  - Location adjustments: 
    - Milestones, min/max checks per milestone
    - Task lines, min/max checks per task line
    - Operator lines, random operator lines, operator level checks
    - Required shapes multiplier
  - Shape configuration: Tetragonal (for now)
  - Shape generation modifiers: Milestone operator lines
  - Shape generation adjustments: Maximum layers, maximum processors per milestone
  - Blueprint shapes:
    - Regular, hard, insane
    - Randomized
    - Plando
  - Item pool modifiers: Random starting processor, arbitrary research/blueprint points, arbitrary platform items
- Shape generator and downgrader (only tetragonal for now)
- Scenario and preset files as output
- Manual-like client

## 0.0.1 (proof of concept)

Only added 4 shapesanity-like locations, without any gameplay-altering modifications.
