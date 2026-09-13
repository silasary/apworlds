# Half-Life

## Quick links

- [Setup guide](../tutorial/Half-Life/setup/en)

## What does randomization do to this game?

Half-Life's campaign is cut into its own 18 missions, from Black Mesa Inbound to
Nihilanth, using the game's own chapter boundaries. Instead of playing straight
through, you travel to a mission from a hub, and a mission is locked until the
multiworld sends its unlock item.

Weapons are locked too. Every weapon but the crowbar has to be received before
you can pick one up: walking over a shotgun you have not been sent leaves it
where it is. The check for finding it still fires.

Nihilanth has no unlock item. It opens once you have finished a configurable
number of other missions.

## What items and locations get shuffled?

**Items:** one unlock per mission, one per weapon, optionally the HEV suit and
the long jump module, plus filler (ammo, medkits, armour batteries) and three
traps.

**Locations:** 253 of them.

- reaching each map division of a mission, and finishing the mission
- pressing use on each of the 108 health chargers and HEV charge panels, empty or
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

Kill Nihilanth. It becomes available once `missions_required` other missions have
been finished.

## Unique local commands

Typed in the game console (`~`):

- `ap` -- every mission and its unlock status
- `ap_warp <number or name>` -- travel to an unlocked mission
- `ap_hub` -- return to the hub
- `ap_tracker [map]` -- locations found and still out there
- `ap_find [text]` -- point at the nearest unfound check, or one you name
- `ap_help` -- these, in game
