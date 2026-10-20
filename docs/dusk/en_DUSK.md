# DUSK

## What does randomization do to this game?

Item pickups placed in DUSK's campaign levels become checks. Which kinds of pickups count is up to you:
weapons, keys, powerups, secret areas, treasure chests, health, morale (armor) and ammo can each be switched on or
off. Finishing a level is always a check.

Levels are unlocked by **Level Access** items instead of the normal episode order. Each included episode starts with
its first level unlocked (and that level's keys in hand).

## What items can I receive?

- Level Access for each level (`E1M4 Access`, ...)
- Each level's keys (`E2M5 Red Key`, ...), which only work in their own level
- Weapons: Progressive Pistol (x2 for dual pistols), Progressive Shotgun (x2 for dual shotguns), Super Shotgun,
  Assault Rifle, Hunting Rifle, Crossbow, Mortar, Riveter, Sword. Received weapons are yours for the rest of the
  seed, in every level.
- Powerups, health, morale and ammo pickups.

## What is the goal?

By default, finish the final level of every included episode (E1M10, E2M10, E3M10). The `all_levels` goal
requires finishing every included level.

## What does another world's item look like in DUSK?

For now, randomized pickups keep their vanilla look. Picking one up sends the check and shows what was found.

## Known logic simplifications

- Keys use *strict* logic: every check in a level that has keys is expected to need all of that level's keys.
  This is safe but conservative until per-door data exists.
- Respawning climbing powerups and Thermal Suits are never randomized because levels depend on them.
- Items dropped by breakable objects and enemies are random in vanilla and are not checks.
