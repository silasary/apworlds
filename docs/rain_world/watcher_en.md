# Watcher-specific notes

Any documentation details that are specific to The Watcher are detailed here.

## This necessarily contains major spoilers!

## Watcher worlds are not currently supported by the client.  Everything here is preliminary and subject to change!

## General
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

Internally, Ripple levels 1 through 9 actually correspond to the values 1.0 through 5.0,
with each Ripple level a step of 0.5 above the previous level.
This documentation will only refer to Ripple by the integer levels and not by the internal values. 

### Start in Watcherspace
A Watcher world always starts in Watcherspace (that is, not on the Five Pebbles facility grounds).
Max Ripple starts at level 1, as if all three of the first Spinning Tops have already been encountered,
which means the ability to camouflage is already unlocked.

(UNIMPLEMENTED) 
By default, the starting region is one of the three original starting regions -
Coral Caves, Sunlit Port, or Torrential Railways -
but this can be changed by the `random_starting_region` player YAML setting.
Any Five Pebbles facility grounds regions are invalid values for this setting.

## Items
### Fixed warp keys
As with karma gates, most warp points have a key which is required to use it.
There are several exceptions which do not require keys:
* All dynamic warp points, including the semi-permanent ones created in The Throne.
* All warps leaving a permarotted region (except Outer Rim to Daemon).
* The warp from Daemon to Shattered Terrace.

Spinning Top warps also have keys (except for the encounter in the BWP regions).
Spinning Top does not appear if the key is not collected.

### Dynamic warp keys
For some values of `normal_dynamic_warp_behavior` (see below), dynamic warp keys may be placed in the item pool.
The keys may make the corresponding region either a valid source or a valid target for a dynamic warp.

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

## Checks

Most of Watcher's checks fall into one of a few categories.
See [the naming subpage](/tutorial/Rain%20World/naming/en) for naming of checks not unique to Watcher.

| Check type         | Count | Naming                                                                                                        |
|--------------------|------:|---------------------------------------------------------------------------------------------------------------|
| Fixed warp point   |    78 | `REGION - Warp Point - ROOM_NAME`                                                                             |
| Fixed Karma Flower |    76 | `REGION - Karma Flower - ROOM_NAME`                                                                           |
| Spinning Top       |    14 | `REGION - Spinning Top`                                                                                       |
| Spread the Rot     |    18 | `REGION - Spread the Rot`                                                                                     |
| Throne warp point  |     4 | `Outer Rim - Create LOC warp` where `LOC` is either `upper west`, `lower west`, `upper east`, or `lower east` |
| The Prince         |     4 | `Outer Rim - Prince encounter #N` where `N` is `1`, `2`, `3`, or `4`                                          |

### Fixed warp points
Visting a warp point, which puts it on the map, is a check.
A pair of two-way warp points is two separate checks.
The check is earned even if the warp is not currently usable
(e.g., cannot enter Ripplespace or don't have the key).

### Throne warp points
Creating a semipermanent warp point in The Throne is a check.

### Spinning Top
Visiting Spinning Top in a _normal_ region is a check.
By default, Spinning Top does not appear if the key corresponding to the warp point is not collected
(but this behavior may be changed with the `spinning_top_keys` player YAML setting).
In that case, the check cannot be earned without the key.

All Spinning Top checks are immediately released when the `WAUA_BATH` Spinning Top is visited,
even if `which_victory_condition` is `ascension`,
since Spinning Top no longer appears after they ascend.

### Spread the Rot
Spreading the Rot to a new region is a check.
The check is earned upon hibernation if the region is sufficiently infected.
By default (see `checks_spread_rot`), these checks are only generated for the `alternate` victory condition.

### The Prince
Each unique encounter with The Prince is a check.
These checks are awarded upon visiting The Prince's room (`WORA_AI`).

### Other
* (UNIMPLEMENTED) Watcher can earn some passages.
Watcher cannot earn The Pilgrim, The Nomad, The Scholar, The Wanderer, or The Mother.
* (UNIMPLEMENTED) If `sheltersanity` is enabled, every shelter is a check when visited.
* (UNIMPLEMENTED) If `checks_food_quest` is enabled, Watcher can earn certain food quest checks.

## Settings

### Rot spread checks
`checks_spread_rot` controls whether spreading the Rot to a new region is a check.
Its default setting, `alternate_only`, only generates the checks if `which_victory_condition` is `alternate`.

### Victory condition
The `ascension` victory condition is the Toys/Driedel/Spinning Top ending.
Logically, this just requires access to Ancient Urban.
This in turn requires access to Shattered Terrace (possibly, but not necessarily, through Daemon)
and the ability to shift into Ripplespace,
which in turn requires at least 8 Ripple items (but see `logic_ripplespace_min_req` below).

The `alternate` victory condition is the Sentient Rot ending.
This requires awakening The Prince, which in turn requires 8 Ripple items
and several visits to Outer Rim, creating all four Throne warps in the process,
and spreading sentient rot to all 18 infectable regions (but see `rotted_region_target` below).

With the `alternate` victory condition enabled, meeting Spinning Top in Ancient Urban
will release all progressive Spinning Top checks immediately.

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
The default, unaltered behavior is all 18 infectable regions.
This has no effect if `which_victory_condition` is `ascension`.

### Spinning Top keys
`spinning_top_keys` controls whether each Spinning Top location requires a key as most warp points do.
If enabled and the key has not been collected, Spinning Top will not appear and the warp will not be usable.
If disabled, Spinning Top always appears and the associated warp does not require a key.

### Rotted generation
`logic_rotted_generation` controls the generation and connectivity of BWP regions.
It only affects logic and the check pool.

| Value            | BWP regions have checks? | Bad warps could be logically required? |
|------------------|--------------------------|----------------------------------------|
| `none` (default) | No                       | No                                     |
| `passthrough`    | No                       | Yes                                    |
| `full`           | Yes                      | Yes                                    |

If set to `none`, the only way to logically access Outer Rim is through Unfortunate Evolution.

### Dynamic warp behavior
There are two settings which affect the behavior of normal dynamic warps (`normal_dynamic_warp_behavior`)
and of the semipermanent dynamic warps created in The Throne (`throne_dynamic_warp_behavior`).
Both settings have similar possible values and similar effects.
Their defaults are `visited` and `static_predetermined`, respectively.

| Setting                                 | Where can dynamic warps go?                                                                                                                                                                        |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `ignored` <sup>o</sup>                  | Anywhere.<sup>r</sup>  Logic pretends that dynamic warping is impossible.                                                                                                                          |
| `visited` <sup>o</sup>                  | Anywhere in a region that has already been visited.                                                                                                                                                |
| `static_predetermined`                  | Each normal region (or, for Throne warps, each of the four rooms) is tied to a randomly predetermined target in another region.  Warping from that region (or room) will always go to that target. |
| `unlockable_predetermined` <sup>n</sup> | As above, but dynamic warping requires the _source_ region's dynamic key.  Without it, dynamic warping from that source is not possible.                                                           |
| `static_pool` <sup>n</sup>              | A number of regions are picked by the randomizer to be in the static pool.  Only regions in the static pool can be target of a dynamic warp. <sup>r</sup>                                          |
| `unlockable_pool` <sup>n</sup>          | As above, but dynamic warping additionally requires the _target_ region's dynamic key. <sup>r</sup>                                                                                                |

- <sup>n</sup> This value is only valid for `normal_dynamic_warp_behavior`.
- <sup>o</sup> This value takes dynamic warps out of logic,
so they will never be required to reach the victory condition.
- <sup>r</sup> Current Ripple must still satisfy the target's Ripple requirement
unless `dynamic_warp_ripple_requirement` is `none`.

| Dynamic warping from `A` to `B`...                             | `i.` | `v.`               | `s.pre.` | `u.pre.`     | `s.pool` | `u.pool`           |
|----------------------------------------------------------------|------|--------------------|----------|--------------|----------|--------------------|
| ...could be required to reach the victory condition?           |      |                    | Yes      | Yes          | Yes      | Yes                |
| ...is always possible once Ripple is at least 3?               | Yes  | Almost<sup>3</sup> | Yes      |              | Yes      | Almost<sup>4</sup> |
| ...requires a `Dynamic` key?                                   |      |                    |          | Yes, for `A` |          | Yes, for `B`       |
| ...requires meeting the Ripple requirement of `B`?<sup>1</sup> | Yes  | Yes                |          |              | Yes      |                    |
| ...requires hoping that `B` gets picked as the target?         | Yes  | Yes                |          |              | Yes      | Yes                |
| ...requires previously visiting `B`?                           |      | Yes                |          |              |          |                    |
| ...requires that `B` is in the target pool?                    |      |                    | Yes      | Yes          | Yes      | Yes                |
| ...requires that `B` is the predetermined target of `A`?       |      |                    | Yes      | Yes          |          |                    |

- <sup>1</sup> Unless `dynamic_warp_ripple_requirement` is set to `none`.
- <sup>2</sup> Except for Throne dynamic warps.
- <sup>3</sup> Dynamic warping is impossible if no other regions have been visited.
After at least a second region is visited, dynamic warping is always possible
(provided that the Ripple level requirement is either waived or satisfied for at least one target).
- <sup>4</sup> Dynamic warping is impossible if no `Dynamic` keys have been collected,
or if the only `Dynamic` key collected is for the current region.
After two `Dynamic` keys are collected, dynamic warping is always possible.

### Dynamic warp pool size
`dynamic_warp_pool_size` controls the number of regions that can be the target of a normal dynamic warp.
The default is `18`, which places all 18 normal regions in the pool.
If `normal_dynamic_warp_behavior` is either `predetermined` setting,
every normal region is a target from one other normal region.

If set lower than `18`, some regions are selected at random to be excluded from the pool.
These excluded regions can never be the target of a normal dynamic warp from another region.
In a `predetermined` warp mode, some regions will be the target of multiple other normal regions.
Regardless of warp mode, at least one region that has a dynamic warp target whose Ripple level requirement is 1
(Sunlit Port, Coral Caves, Torrential Railways, and Aether Ridge) will be in the pool.

This setting does not affect non-normal (Throne, Outer Rim, or bad) dynamic warping at all
and is irrelevant if `normal_dynamic_warp_behavior` is `ignored` or `visited`.

### Dynamic warp Ripple level requirement
(UNIMPLEMENTED) 
`dynamic_warp_ripple_requirement` dictates how the Ripple level requirements for dynamic warp targets are handled.
This only affects normal dynamic warps.

| Value       | Effect                                                                      |
|-------------|-----------------------------------------------------------------------------|
| `unaltered` | Unaltered.  Each target has some Ripple level requirement that must be met. |
| `none`      | Each target has no Ripple level requirement.                                |