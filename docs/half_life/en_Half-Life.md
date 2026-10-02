# Half-Life Trilogy

Half-Life, Opposing Force and Blue Shift on retail Steam, as one world. It is
listed as **Half-Life** in the game list and in YAMLs.

## Quick links

- [Setup guide](../tutorial/Half-Life/setup/en)

## What does randomization do to this game?

Half-Life's campaign is cut into its own 18 missions, from Black Mesa Inbound to
Nihilanth, using the game's own chapter boundaries. Instead of playing straight
through, you travel to a mission from a hub by walking into its entrance or
pressing its button, and a mission is locked until the
multiworld sends its unlock item.

Weapons are locked too. Every weapon but the crowbar has to be received before
you can pick one up: walking over a shotgun you have not been sent leaves it
where it is. The check for finding it still fires.

Nihilanth has no unlock item. It opens once you have finished a configurable
number of other missions.

## What items and locations get shuffled?

**Items:** one unlock per mission, one per weapon, optionally the HEV suit, the
long jump module, the flashlight (and Opposing Force's night vision goggles) and
Melee Throw, plus filler (ammo, medkits, armour batteries) and traps.

**Locations:** 252 for Half-Life.

- reaching each map division of a mission, and finishing the mission
- pressing use on each of the 107 health chargers and HEV charge panels, empty or
  not, and standing in each of Xen's 15 healing pools -- these can be switched
  off with `chargesanity`
- reaching each weapon at the place Half-Life would first have given it to you

## What does another world's item look like in Half-Life?

There is no world model for it: locations are places and things that were already
in Half-Life. Making a check prints a line in the game naming what you found.

## When the player receives an item, what happens?

It is announced in the message area at the bottom left, and takes effect
immediately: a mission becomes enterable, a weapon becomes collectable and is put
in your hands, filler is granted where you stand. A trap springs a few seconds
after the level has settled.

## What is the goal?

Finish the finale of every game in the seed:

| Game | Finale | Opens after |
| --- | --- | --- |
| Half-Life | Nihilanth: kill Nihilanth | `missions_required` other Half-Life missions |
| Opposing Force | Worlds Collide | `opposing_force_missions_required` other Opposing Force missions |
| Blue Shift | Power Struggle: reach the ending | `blue_shift_missions_required` other Blue Shift missions |

A finale has no unlock item; it opens on its own game's mission count, and only
missions of that game count toward it. With one game in the seed, its finale is
the whole goal.

## Opposing Force and Blue Shift

Either game can be added to a seed, or played alone, if you own it. Each brings
its own missions, its own finale and its own armour item (the PCV, the Security
Armor), and Opposing Force brings seven weapons and two more melee weapons. The
goal is then every included game's finale. Half-Life's weapons are items in
every seed, since all three games place them.

## Unique local commands

Typed in the game console (`~`), or in chat (`Y`) with `!` in place of `ap_`
(`!warp 3`, and `!ap` for the first):

- `ap` -- every mission and its unlock status
- `ap_warp <number or name>` -- travel to an unlocked mission
- `ap_warp <mission> <part>` -- travel to a part of a mission you have reached
  (the part as `3`, `p3`, `part 3` or `pt 3`)
- `ap_warp <map>`, such as `ap_warp c2a3b`: that map's part of its mission
- `ap_setwarp [name]`, `ap_warps` -- make and list warp points of your own
- `ap_hub` -- return to the hub
- `ap_tracker [map]` -- locations found and still out there
- `ap_find [text]` -- point at the nearest unfound check, or one you name
- `ap_menu`: the warp and tracker as a menu, picked with the number keys
- `ap_help` -- these, in game
