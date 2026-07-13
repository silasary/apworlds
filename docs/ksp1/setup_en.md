# Kerbal Space Program Archipelago Setup Guide

**This world is experimental.** Only the default (Normal) difficulty has been thoroughly tested.
Only vanilla (unmodded) KSP is supported - no part mods, planet packs, or other gameplay mods have been tested.
[Kerbal Engineer Redux](https://github.com/jrbudda/KerbalEngineer) is known to work and is recommended for delta-v readouts.
If you encounter issues, please report them on
[GitHub](https://github.com/nickdavies/Archipelago/issues) with your player YAML, the AP `.zip` output,
your `.apsave` file, and a screenshot if possible.

## Required Software

- [Kerbal Space Program](https://store.steampowered.com/app/220200/Kerbal_Space_Program/) (Steam or GOG)
- **Making History DLC** — enabled by default and **recommended**. The seed uses its parts unless you opt out:
  if you don't own the DLC, remove `MakingHistory` from the **Enabled Part Packs** option in your YAML so the run
  uses only stock parts.
- The KSP Archipelago `.apworld` file from the
  [Archipelago releases page](https://github.com/nickdavies/Archipelago/releases)
- The KSP Archipelago client mod (`KSPArchipelago`) — install via CKAN (recommended) or from the
  [client releases page](https://github.com/nickdavies/KSP1-Archipelago-client/releases)
- Kerbal-Konstructs (install via CKAN) — **required only if you set `starting_body` to anything other than
  Kerbin.** It provides the off-world launch sites the client mod uses to place you on the chosen body. CKAN
  auto-recommend support for this is in progress; for now, search CKAN for it and install it yourself when
  using a non-Kerbin start.

## Installing the Archipelago World

1. Download the latest `.apworld` file from the
   [releases page](https://github.com/nickdavies/Archipelago/releases).
2. Install the `.apworld` from the Achipelago launcher or you can place the `.apworld` file in your Archipelago `custom_worlds` folder
## Installing the KSP Client Mod

The mod is published on CKAN as **`KSPArchipelago`**, and CKAN is the **strongly recommended** install method —
it handles dependencies and updates for you.

### Option 1: CKAN (recommended)

1. Install [CKAN](https://github.com/KSP-CKAN/CKAN/releases) if you don't already have it.
2. Point CKAN at your KSP install, refresh the mod list, and search for **`KSPArchipelago`**.
3. Install it and let CKAN pull in any dependencies.
4. If you intend to use a non-Kerbin `starting_body`, also install **`Kerbal-Konstructs`** from CKAN
   (auto-recommend support is in progress).

### Option 2: Manual install

1. Download the latest client mod release from the
   [client releases page](https://github.com/nickdavies/KSP1-Archipelago-client/releases).
2. Extract the contents into your KSP `GameData` folder.
3. If using a non-Kerbin `starting_body`, also install Kerbal-Konstructs into `GameData`.

## Create a Config (.yaml) File

### What is a config file and why do I need one?

Your config file (a YAML) holds your personal options for how the randomizer generates your game. Each player
in a multiworld supplies their own.

Because this world isn't part of the main Archipelago distribution yet, there is no online player-options
page for it. After installing the `.apworld` (above), build your config from the **Archipelago Launcher**:

- **Options Creator** — open the Launcher and choose **Options Creator**. It lists every option for each
  installed game (Kerbal Space Program 1 included), lets you set them in a GUI, and exports a ready-to-use
  YAML.
- **Generate Template Options** — open the Launcher and choose **Generate Template Options**. It writes a
  fully-commented template YAML for every installed game to your `Players/Templates/` folder. Open
  `Players/Templates/Kerbal Space Program 1.yaml`, edit the options, and move it into `Players/` to use it.

A basic config file with the defaults is:
```
name: TestPlayer
game: Kerbal Space Program 1

Kerbal Space Program 1:
  goal: duna_return
  difficulty: normal
  start_with_launch_clamps: true
  exclude_late_tech_tree: true
  body_visibility_mode: auto        # hidden bodies unlock via Discover items; auto picks a scope from your goal
  allow_undiscovered_bodies: true   # false = flying into an undiscovered body's SOI destroys your craft
```

Set `body_visibility_mode: all_visible` to play with the whole solar system visible from the start (the
pre–hidden-bodies behaviour).

### Verifying your config file

The online YAML validator only covers games in the main Archipelago distribution, so it can't check this
world. Instead, put your YAML in your `Players/` folder and run a local generation (the Launcher's
**Generate** button, or `ArchipelagoGenerate`) — generation will report any malformed or invalid options.

## Starting a Game

1. Generate a seed using your YAML config file (via the Archipelago website or `ArchipelagoGenerate`). This can take a little while
2. **Start KSP in Career Mode.** Science Mode and Sandbox are not supported.
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
`/explain parts [filter]` to list your received parts by type (optionally filtered by name).

## Troubleshooting

If you run into problems:

1. Use UT's `/explain` command to check what logic thinks you need for a mission.
2. Check the KSP log (`KSP.log` in your KSP install directory) for errors.
3. Ensure you are running in **Career Mode**, not Science or Sandbox.
4. Verify your `.apworld` version matches your client mod version.
5. Report issues on [GitHub](https://github.com/nickdavies/Archipelago/issues) with:
   - Your player YAML file
   - The AP `.zip` output (from generation)
   - Your `.apsave` file
   - A screenshot of the issue if possible
