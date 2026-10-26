# Bloodstained Archipelago Setup Guide

## Requirements

- Bloodstained: Ritual of the Night for Windows
- [Archipelago 0.6.7 or newer](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- The Bloodstained AP 1.1.0 release bundle

True Randomizer, .NET, and UE4SS are no longer required. The release includes one pinned, seed-independent
`BloodstainedAP.pak` for all supported slots and difficulties.

Paid DLC is not part of the world or item pool. Content distributed for free is included even when Bloodstained's
internal data marks it as DLC; this includes the Shantae crossover update.

## Install the APWorld

Open `Archipelago/bloodstained_rotn.apworld` from the release bundle with Archipelago's **Install APWorld**
command.

## Install the game client

The game installation folder is the folder containing `BloodstainedRotN`.

1. Copy everything inside the bundle's `Game` folder into the game installation folder, preserving the folder
   structure.
2. Remove `BloodstainedRotN/Content/Paks/~mods/Randomizer.pak` if it exists. The old generated pak conflicts with
   `BloodstainedAP.pak`.
3. Remove the old AP `version.dll` proxy from
   `BloodstainedRotN/Binaries/Win64` if it exists. The included `winhttp.dll` is the loader; the AP client itself
   is `plugins/BloodstainedAP.asi`.
4. Launch the game and start a **new story save**. Bloodstained AP saves from before 1.1.0 are intentionally rejected.
5. Press `F5` after loading the save, enter the server, slot, and password, then select **Connect**.

The title screen reports whether the exact 1.1.0 pak is installed and whether a legacy `Randomizer.pak` conflicts
with it.

## Difficulty

Normal, Hard, and Nightmare use the same static pak. Select the intended difficulty in the YAML before generating the
multiworld, then create the story save on that same difficulty. The client rejects a mismatch rather than silently
using the wrong logic.

## Tracking and item behavior

- Reachable rooms retain the game's native explored/unexplored map shading.
- Chests, breakable walls, and shard-room hints are Unreal UI widgets inside the native main-map/minimap hierarchy.
  They therefore follow native clipping, fades, warp effects, HUD scaling, and z-order.
- A physical chest may contain multiple AP checks. Its marker remains until all checks assigned to that physical chest
  are complete.
- Ordinary enemy drops are shuffled by the client from the room seed name and slot ID. Corresponding slots on
  different racing teams receive the same drops.
- Every item available from a vanilla or included-free-content enemy drop remains assigned to at least one enemy.

## Troubleshooting

The client log is written to
`%LOCALAPPDATA%/BloodstainedRotN/Saved/Logs/BloodstainedAP.log`. Include it with the matching Archipelago server log
when reporting connection, item, or location-check problems.
