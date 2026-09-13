# C&C Reloaded Multiworld Setup Guide

## Compatibility

- Game: `C&C Reloaded`
- Package namespace: `cnc_reloaded`
- World version: matches the launcher release version
- Supported mod version: C&C Reloaded 2.7.0
- Minimum Archipelago version: 0.6.7
- Active factions: Allies, Soviets, Yuri, GDI, and Nod
- CABAL: excluded

Install `cnc_reloaded.apworld` in Archipelago's `custom_worlds` directory and
restart Archipelago. Export Player YAML from the matching C&C Reloaded
Randomizer launcher. The launcher and APWorld catalogue checksums must match.
Player YAML contains reusable settings only. Archipelago generates a fresh
mission order, Grid, starters, rewards, and signed run manifest for each room.

The world supports standard objective/victory runs and Shop Mode purchase/run
locations. Mental Omega YAML, rooms, saves, items, and locations are not
compatible.
