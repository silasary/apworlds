# Watcher-specific notes

Any documentation details that are specific to The Watcher are detailed here.

## This necessarily contains major spoilers!

## General
### Beta testing state
Watcher worlds are currently in a beta testing state, both for the APWorld and the client.
Logic elements and settings are subject to change.

Other Watcher-specific player YAML settings are discussed on this page.
Some non-Watcher-specific settings still apply to Watcher worlds;
some, like `which_gate_behavior`, are ignored.

### Terminology
A few pieces of terminology are used in this documentation for brevity:
* **Watcherspace**: All regions added in The Watcher.  There are 27 Watcherspace regions.
* **BWP region**:  A bad warp pool region - one of Corrupted Factories, Crumbling Fringes, Decaying Tunnels, or Infested Wastes.  There are 4 BWP regions.
* **Permarotted region**: Any BWP region, plus Unfortunate Evolution and Outer Rim.  There are 6 permarotted regions.
* **Unrottable region**: Any of Shattered Terrace, Ancient Urban, or Daemon.  There are 3 unrottable regions.
* **Normal region**: Any Watcherspace region that isn't permarotted or unrottable.  There are 18 normal regions.

### Ripple value
As far as the in-game representation of Ripple is concerned, there are 9 Ripple "levels."
When first entering Watcherspace, Ripple is set to level 1.
Upon meeting the first Spinning Top, maximum Ripple is set to level 2.
When stated this way, there are nine Ripple levels, numbered 1 through 9,
and Ripple level 9 is required to enter Ripplespace. 

### Start in Watcherspace
A Watcher world always starts in Watcherspace (that is, not on the Five Pebbles facility grounds).
Max Ripple starts at level 1, as if all three of the first Spinning Tops have already been encountered,
which means the ability to camouflage is already unlocked.

By default, the starting region is in Sunbaked Alley -
but this can be changed by the `random_starting_region` player YAML setting.
Any Five Pebbles facility grounds regions are invalid values for this setting.

## Items
### Fixed warp keys
As with karma gates, most warp points have a key which is required to use it.
There are several exceptions which do not require keys:
* All dynamic warp points, including the semi-permanent ones created in The Throne.
* All warps leaving a permarotted region (except Outer Rim to Daemon).
* The warp from Daemon to Shattered Terrace.

Spinning Top warps may also have keys (except for the encounter in the BWP regions), 
if the setting `spinning_top_keys` is enabled. Spinning Top will still appear in these locations when the warp is locked.

### Ripple
Twelve progressive Ripple items are placed in the pool rather than being awarded by visiting Spinning Top.
Initially, Ripple is restricted to level 1 (as with Karma for unmodded Artificer).
The first four Ripple items increase the maximum Ripple by one level;
after all four are collected, current Ripple may lie between level 1 and level 5.
The next four Ripple items increase both the minimum and maximum by one level;
after eight total are collected, current Ripple may lie between level 5 and level 9.
At this point, it is possible to enter ripplespace (but see `logic_ripplespace_min_req`).
The final four Ripple items increase the minimum by one level,
after which current Ripple is fixed at level 9.

Effects which are tied to current Ripple level, such as the behavior of the camouflage ability
and the creation of Ripple spawn, remain tied to current Ripple level.

### Dynamic Warp Behavior
Watcher's dynamic warp ability behaves differently than it does in vanilla.
When a dynamic warp is created, the valid destinations are only normal regions that can be 
currently logically accessed. Below is a summary of the new warping algorithm.

* Find all regions that should be reachable with the current warp keys
* If the player has the Weaver ability, additionally consider BWP regions and Outer Rim
if they contain any remaining checks.
* Each region is assigned a weight, which determines the likelihood of it being chosen as the destination.
* For each considered region:
  * Weight is assigned to an initial value of 1.
  * Weight is multiplied by the percentage of checks in the region that have not been collected,
  ranging from 1-10 (10 if no checks are collected, 1 if region has been "cleared")
  * If this warp is spreading rot and the region has not yet been rotted, weight is multiplied by 8.
  The weight is additionally multiplied by 3 if the player has heard the Prince's last dialogue 
  (where the Prince thanks the Watcher for their help)
  * If the Weaver ability has been obtained and the region has unsealed warps in it, weight is multiplied by 16.
  * If the region still has a weight of 1 and the Weaver ability has been obtained or the last 
  Prince dialogue has been heard, remove the region as a possible destination.

TLDR: Dynamic warps can only reach regions in logic, and will attempt to send you to regions where you have a lot of checks to do or otherwise
are important to reach for a goal condition.

### Passage Tokens
Passage tokens are normally excluded from Watcher's item pool, as passages are non-functional in the base Watcher campaign.
However, thanks to Shrub and many talented artists, there exists a mod that adds passages for Watcher. 
When the option `watcher_passages` is enabled, passage tokens will be shuffled into the item pool and will be able to be used 
if and only if the Watcher Region Art mod is enabled in-game.

You can find Watcher Region Art on the Steam workshop:
https://steamcommunity.com/sharedfiles/filedetails/?id=3660768308

## Checks

Most of Watcher's checks fall into one of a few categories.
See [the naming subpage](/tutorial/Rain%20World/naming/en) for naming of checks not unique to Watcher.

| Check type         | Count | Naming                                                                                                        |
|--------------------|------:|---------------------------------------------------------------------------------------------------------------|
| Fixed warp point   |    90 | `REGION - Warp Point - ROOM_NAME`                                                                             |
| Spinning Top       |    12 | `REGION - Spinning Top`                                                                                       |
| Spread the Rot     |    21 | `REGION - Spread the Rot`                                                                                     |
| The Prince         |     4 | `Outer Rim - Prince encounter #N` where `N` is `1`, `2`, `3`, or `4`                                          |

### Fixed warp points
Visting a warp point, which puts it on the map, is a check. 
The check is awarded upon entering a certain radius of the warp.
A pair of two-way warp points is two separate checks.
The check is earned even if the warp is not currently usable
(e.g., cannot enter Ripplespace or don't have the key).

### Spinning Top
Visiting Spinning Top in a _normal_ region is a check.

All Spinning Top checks are immediately released when the `WAUA_BATH` Spinning Top is visited,
even if `which_victory_condition` is `ascension`,
since Spinning Top no longer appears after they ascend.

### Spread the Rot
Spreading the Rot to a new region is a check.
The check is earned upon hibernation if the region is sufficiently infected.
By default (see `checks_spread_rot`), these checks are only generated for the `alternate` victory condition.

### The Prince
Each of 4 unique encounters with The Prince up to his awakening are checks.
These checks are awarded upon visiting The Prince's room (`WORA_AI`).

### Other
* Watcher can earn some passages.
Watcher cannot earn The Pilgrim, The Nomad, The Wanderer, or The Mother.
* Watcher can collect sandbox token and pearl checks, same as all other campaigns.
* If `sheltersanity` is enabled, every shelter is a check when visited.
* If `checks_food_quest` is enabled, Watcher can earn certain food quest checks.

## Settings

### Applicable non-Watcher settings
Some yaml settings are no longer applicable when playing as Watcher.
* `which_gate_behavior` - Warps do not behave the same as gates and never require Ripple.
* `checks_dev_tokens` - There are no developer commentary tokens in Watcher.
* `checks_submerged` - Submerged Superstructure is not accessible.
* `difficulty_glow` - Watcher always starts with the glow.
* `difficulty_echo_low_karma` - Spinning Top does not behave as normal echoes do, so this setting is ignored.

`extra_karma_cap_increases` *will* apply - extra Ripple is added to the pool instead of Karma. 

### Rot spread checks
`checks_spread_rot` controls whether spreading the Rot to a new region is a check.
Its default setting, `alternate_only`, only generates the checks if `which_victory_condition` is `prince`.
This setting will be ignored if `which_victory_condition` is `weaver` or `true_ending`, 
as obtaining the Weaver ability makes these checks impossible.

### Victory condition
The `ascension` / `spinning_top` victory condition is the Toys/Driedel/Spinning Top ending.
Logically, this just requires access to Ancient Urban.
This in turn requires access to Shattered Terrace (possibly, but not necessarily, through Daemon)
and the ability to shift into Ripplespace,
which in turn requires at least 8 Ripple items (but see `logic_ripplespace_min_req` below).

The `alternate` / `prince` victory condition is the Sentient Rot ending.
This requires awakening The Prince, which in turn requires 8 Ripple items
and several visits to Outer Rim, creating all four Throne warps in the process,
and spreading sentient rot to all 21 infectable regions (but see `rotted_region_target` below).

The `weaver` victory condition is the Weaver ending.
This requires obtaining the ability to seal warps from the Weaver, 
which needs 8 Ripple items in order to follow the thread trails to find them*, 
and subsequently sealing every fixed warp. To accelerate progress towards this,
sealing a warp by travelling through it will seal all warps in the region you left.
Additionally, warps can still be sealed if you don't have their key by using the dynamic warp
keybind while in the same room as one.

*Max ripple is not technically required to encounter the Weaver, but is included in
logic as a convenience.

The `true_ending` victory condition is the True Ending.
This requires completing both the Spinning Top and Weaver ending, as well as encountering 
the Prince enough times to wake him, and then completing the final warp sequence in Daemon.
This requires all the same things as the `spinning_top` and `weaver` victory conditions, plus
the ability to reach Outer Rim and Daemon.

### Ripplespace minimum Ripple requirement
`logic_ripplespace_min_req` controls the number of Ripple items required for Ripplespace to be logically accessible.
The true access requirement for Ripplespace is having a *maximum* Ripple of level 9.
This requires 8 Ripple items, which would raise *minimum* Ripple to level 5.
This is the logical behavior if `logic_ripplespace_min_req` is set to `5` (its default).
Setting it to anything higher ensures that more Ripple items are logically required to enter Ripplespace,
reducing difficulty in maintaining the Ripple level necessary to enter Ripplespace.
If set to `9`, 12 Ripple items must be in logic so that minimum Ripple may be raised to level 9
before entering Ripplespace is required.

### Rotted region target
`rotted_region_target` controls the number of regions that must be rotted to trigger the Sentient Rot ending.
The default, unaltered behavior is all 21 infectable regions.
This has no effect if `which_victory_condition` is not `prince`.

### Spinning Top keys
`spinning_top_keys` controls whether each Spinning Top warp requires a key as most warp points do.
If enabled and the key has not been collected, the warp will not be usable.
If disabled, the associated warp does not require a key.

### Rotted generation
`logic_rotted_generation` controls the generation and connectivity of BWP regions.
It only affects logic and the check pool.

| Value                    | BWP regions have checks? | Bad warps could be logically required? |
|--------------------------|--------------------------|----------------------------------------|
| `none`                   | No                       | No                                     |
| `passthrough` (default)  | No                       | Yes                                    |
| `full`                   | Yes                      | Yes                                    |

If set to `none`, the only ways to logically access Outer Rim are through Unfortunate Evolution or Daemon.