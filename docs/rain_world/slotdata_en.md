# Rain World slot data

## Integral
These fields can only contain an integer.

### Boolean
These fields can only be `0` (false) or `1` (true).

| Field                  | Description                                                                   |
|------------------------|-------------------------------------------------------------------------------|
| `checks_broadcasts`    | Whether broadcast checks are in the pool.                                     |
| `checks_devtokens`     | Whether developer commentary token checks are in the pool.                    |
| `checks_flowersanity`  | Whether karma flower checks are in the pool.                                  |
| `checks_sheltersanity` | Whether shelter checks are in the pool.                                       |
| `death_link`           | Whether deathlink is enabled.                                                 |
| `difficulty_chieftain` | Whether a Scavenger Toll must be accessible for The Chieftain to be in logic. |
| `difficulty_glow`      | Whether The Glow is required for dark places.                                 |
| `is_msc_enabled`       | Whether More Slugcats Expansion (Downpour) is enabled.                        |
| `is_watcher_enabled`   | Whether The Watcher is enabled.                                               |
| `spinning_top_keys`    |                                                                               |

### Normal enumeration
These fields can only contain specific integers,
each with a meaning that is not necessarily intrinsic to the number itself.
Cells without a description are not valid values for that setting.

| Field                               | Description                                                         | `0`       | `1`           | `2`            | `3`                | `4`                    | `5`           | `6`                             |
|-------------------------------------|---------------------------------------------------------------------|-----------|---------------|----------------|--------------------|------------------------|---------------|---------------------------------|
| `checks_foodquest`                  | Whether food quest checks are in the pool.                          | Off       | Gourmand only | All slugcats   |                    |                        |               |                                 |
| `checks_submerged`                  | Whether Submerged Superstructure checks are generated.              | Off       | Rivulet only  | All slugcats   |                    |                        |               |                                 |
| `difficulty_echo_low_karma`         |                                                                     | Never     | With flower   | Without flower | Unaltered          |                        |               |                                 |
| `normal_dynamic_warp_behavior`      |                                                                     | Ignored   | Visited       |                | Static target pool | Unlockable target pool | Predetermined | Predetermined unlockable source |
| `passage_progress_without_survivor` | Passage progress without Survivor behavior.                         | Disabled  | Enabled       | Bypassed       |                    |                        |               |                                 |
| `throne_dynamic_warp_behavior`      |                                                                     | Ignored   | Visited       |                |                    |                        | Predetermined |                                 |
| `which_gamestate`                   | Deprecated.  Whether MSC is enabled and which campaign is selected. |           |               |                |                    |                        |               |                                 |
| `which_gate_version`                |                                                                     | Key only  | Key and karma | Key or karma   | Karma only         |                        |               |                                 |
| `which_victory_condition`           |                                                                     | Ascension | Alternate     |                |                    |                        |               |                                 |

### Other numeric
These fields can only contain an integer between two limits,
or only specific integers that aren't a normal enumeration.

| Field                            | Description                                                   | Valid values                                      |
|----------------------------------|---------------------------------------------------------------|---------------------------------------------------|
| `checks_foodquest_accessibility` | A bitflag indicating which food quest checks are accessible.  | `0` to `2251799813685248` (2**51 - 1)             |
| `difficulty_hunter`              | Number of accessible foods for The Hunter to be in logic.     | `1` to `4`                                        |
| `difficulty_monk`                | Number of accessible foods for The Monk to be in logic.       | `1` to `4`                                        |
| `difficulty_nomad`               | Number of accessible reigons for The Nomad to be in logic.    | `3` to `8`                                        |
| `difficulty_outlaw`              | Number of accessible creatures for The Outlaw to be in logic. | `1` to `8`                                        |
| `rotted_region_target`           |                                                               | `2` to `18`                                       |
| `which_game_version`             | Rain World version.                                           | `1100400`: v1.10.0 - v1.10.4; `1091503`: 1.9.15.3 |

## String
These fields can only contain a string.

| Field            | Description                                         | Valid values                                                                          |
|------------------|-----------------------------------------------------|---------------------------------------------------------------------------------------|
| `starting_room`  | The room that the player will start in.             | The full name of a shelter room, or the empty string for the default starting point.  |
| `which_campaign` | The name of the slugcat whose campaign is selected. | `Yellow`, `White`, `Red`, `Gourmand`, `Artificer`, `Rivulet`, `Spear`, `Saint`, `Inv` |

## List
These fields can only contain a list/array.
The values contained within that list are decribed in the third column.

| Field       | Description                                      | Valid contained values             |
|-------------|--------------------------------------------------|------------------------------------|
| `warp_pool` | Regions in the dynamic warp pool.  May be empty. | Uppercase region codes as strings. |

## Dictionary
These fields can only contain a dictionary/mapping.
The keys and values within that dictionary are described in the third and fourth columns.

| Field                  | Description                                      | Valid contained keys                          | Valid contained values              |
|------------------------|--------------------------------------------------|-----------------------------------------------|-------------------------------------|
| `predetermined_warps`  | A mapping of predetermined warps.  May be empty. | Region codes or Throne room names, uppercase. | The full name of a room, uppercase. |