# Half-Life 2

Half-Life 2 on retail Steam, as an Archipelago world.

## Quick links

- [Setup guide](../tutorial/Half-Life%202/setup/en)

## What does randomization do to this game?

Half-Life 2's campaign is cut into its own 14 chapters, from Point Insertion to
Dark Energy. Instead of playing straight through, you travel to a chapter from a
hub, and a chapter is locked until the multiworld sends its unlock item.
Finishing a chapter returns you to the hub.

Weapons are locked too. Every weapon but the crowbar has to be received before
you can pick one up: walking over a shotgun you have not been sent leaves it
where it is. The check for finding it still fires. With `weapons_per_level`
on, each chapter has its own item for each weapon (Highway 17 SMG), and a
weapon is only in your hands in chapters whose item for it has arrived.

Dark Energy has no unlock item. It opens once you have finished a configurable
number of other chapters.

## What items and locations get shuffled?

**Items:** one unlock per chapter, one per weapon (or one per weapon per
chapter with `weapons_per_level`), the gravity gun as four Progressive Gravity
Guns, Airboat Keys and Buggy Keys (or keys for each chapter that drives one
with `vehicle_keys_per_level`), the Airboat and Buggy Guns, optionally the HEV suit, the
flashlight, Progressive Aux Power and an added melee throw (very fun, highly recommend), 
plus filler (ammo, medkits, batteries) and traps.

**Locations:** 167.

- reaching each part of a chapter, and finishing the chapter
- pressing use on each of the 41 health chargers and 31 suit chargers, empty or
  not; these can be switched off with `chargesanity`
- the first pickup of each weapon, of the HEV suit, and of the super gravity gun

## What does another world's item look like in Half-Life 2?

There is no world model for it: locations are places and things that were
already in Half-Life 2. Making a check prints a line in the game naming what you
found.

## When the player receives an item, what happens?

It is announced in chat, and takes effect immediately: a chapter becomes
enterable, a weapon becomes collectable and is put in your hands, filler is
granted where you stand. A trap springs a few seconds after it arrives, once the
level has settled.

## What is the goal?

Finish Dark Energy: it opens after `missions_required` other chapters, and its
closing credits goal the slot.

## Unique local commands

Typed in chat (`Y`) with a `!` in front, or in the game console (`~`) as
`ap <command>`:

- `!ap`: every chapter and its unlock status
- `!warp <number or name>`: travel to an unlocked chapter
- `!warp <chapter> <part>`: travel to a part of a chapter you have reached
- `!setwarp [name]`, `!warps`: make and list warp points of your own
- `!hub`: return to the hub
- `!tracker [filter]`: locations found and still out there
- `!find [text]`: point at the nearest unfound check
- `!trace [text]`: draw a path to it
- `!menu`: warps, the tracker, find and trace as a menu (the `-` key)
- `!status`, `!help`
