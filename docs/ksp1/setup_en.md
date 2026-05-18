# Kerbal Space Program Archipelago Setup Guide

**This world is experimental.** Only the default (Normal) difficulty has been thoroughly tested.
Only vanilla (unmodded) KSP is supported - no part mods, planet packs, or other gameplay mods have been tested.
[Kerbal Engineer Redux](https://github.com/jrbudda/KerbalEngineer) is known to work and is recommended for delta-v readouts.
If you encounter issues, please report them on
[GitHub](https://github.com/nickdavies/Archipelago/issues) with your player YAML, the AP `.zip` output,
your `.apsave` file, and a screenshot if possible.

## Required Software

- [Kerbal Space Program](https://store.steampowered.com/app/220200/Kerbal_Space_Program/) (Steam or GOG)
- The Mod today **REQUIRES Making History DLC!!**. If you wish to play without this please send me an Issue and I can look into supporting enabling/disabling it has an option
- The KSP Archipelago `.apworld` file from the
  [Archipelago releases page](https://github.com/nickdavies/Archipelago/releases)
- The KSP Archipelago client mod from the
  [client releases page](https://github.com/nickdavies/KSP1-Archipelago-client/releases)

## Installing the Archipelago World

1. Download the latest `.apworld` file from the
   [releases page](https://github.com/nickdavies/Archipelago/releases).
2. Install the `.apworld` from the Achipelago launcher or you can place the `.apworld` file in your Archipelago `custom_worlds` folder
## Installing the KSP Client Mod

1. Download the latest client mod release from the
   [client releases page](https://github.com/nickdavies/KSP1-Archipelago-client/releases).
2. Install it like any other KSP mod: extract the contents into your KSP `GameData` folder.
   - CKAN is **not supported** at this time.

## Create a Config (.yaml) File

### What is a config file and why do I need one?

Your config file contains your personal options for how the randomizer should generate your game. Each player
in a multiworld provides their own config file. Visit the
[player options page for this game](../player-options) to configure your options and export a YAML file.

A basic config file with the defaults is:
```
name: TestPlayer
game: Kerbal Space Program 1

Kerbal Space Program 1:
  goal: duna_return
  difficulty: normal
  start_with_launch_clamps: true
  exclude_late_tech_tree: true
```

### Verifying your config file

You can validate your config file on the [YAML Validation page](/check) to make sure it is correctly formatted
before submitting it for generation.

## Starting a Game

1. Generate a seed using your YAML config file (via the Archipelago website or `ArchipelagoGenerate`). This can take a little while
2. **Start KSP in Science Mode.** Career Mode and Sandbox are not supported.
4. The client mod will connect to the Archipelago server. Enter the server address, slot name, and
   password when prompted.

## Gameplay

- Build rockets in the VAB/SPH using only the parts you've received from the multiworld.
- Complete missions (orbits, landings, returns, etc.) to send location checks.
- Purchase tech tree nodes with science points to send additional checks.
- Receive parts, science packs, and equipment from other players as they complete their checks.

## Tracking In-Logic Locations (Universal Tracker)

KSP1 integrates with the [Universal Tracker (UT)](https://github.com/FarisTheAncient/Archipelago/releases)
for out-of-game location tracking. No YAML file is needed — UT reconstructs the full logic state
from slot data when you connect.

Install UT, connect to your AP server, and you'll see which unchecked locations are in logic, sorted by
body order. Use `/explain <location>` to see a detailed rocket design breakdown for any mission, or
`/explain parts` to list your received parts by type.

## Troubleshooting

If you run into problems:

1. Use UT's `/explain` command to check what logic thinks you need for a mission.
2. Check the KSP log (`KSP.log` in your KSP install directory) for errors.
3. Ensure you are running in **Science Mode**, not Career or Sandbox.
4. Verify your `.apworld` version matches your client mod version.
5. Report issues on [GitHub](https://github.com/nickdavies/Archipelago/issues) with:
   - Your player YAML file
   - The AP `.zip` output (from generation)
   - Your `.apsave` file
   - A screenshot of the issue if possible
