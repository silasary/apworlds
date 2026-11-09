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

You can instead open Archipelago's **Options Creator**, select **C&C Reloaded**,
configure the grouped Randomizer options, enter the slot name, and select
**Export Options**. This creates a valid Player YAML without opening the
Randomizer executable. Launcher-exported `launcher_settings` YAML remains
supported for advanced launcher configuration and old player files.

The world supports standard objective/victory runs and Shop Mode purchase/run
locations. Mental Omega YAML, rooms, saves, items, and locations are not
compatible.


## Required Grid victories and mission keys

New Grid rooms support exact required victory missions, generic consumable
mission keys, and mission-specific access items. Required Victory Missions
defaults to 1; Options Creator accepts `all` (numeric 0) for every generated
mission. Mission Unlock Mode defaults to Standard. Key Currency delivers one
shuffled Mission Key Supply worth the total board cost, allowing optional
purchases without permanently exhausting the required-objective budget. Its
protected bottom-right mission automatically gets a win requirement based on
the board size. Choose the unlock mode on the Archipelago page; hover over it
for an explanation. No separate currency setup is needed. Mission-Specific Keys opens only the mission
matching the received code. All keys grant access only; local gameplay victories
are still required. Install the matching updated launcher for slot-data version
8 and regenerate the room to use these settings.

See [Grid progression and mission access](grid_progression.md) for field names,
persistence, economy proof, compatibility, and manual gameplay checks.
