# Northgard Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- Northgard (Steam), Conquest mode
- The `northgard.apworld` file, installed like any other apworld

## Installation

1. Place `northgard.apworld` in your Archipelago install's `custom_worlds` folder. Every
   player with a Northgard slot needs to do this on their own machine, even if someone
   else is generating/hosting the room.
2. Add a Northgard entry to your player YAML (`amount_of_locations`, `progression_mode`,
   `chapter7_requirement`) -- see `Northgard.yaml` for a ready-to-use template.
3. Generate or join a multiworld using your Northgard YAML.
4. Open the Archipelago Launcher and click **Northgard Client** -- it's bundled inside the
   apworld, the same way as any other game's client.
5. Connect it to your room the same way you would any other Archipelago client -- server
   address, slot name, optional password.
6. First time on a given computer, it'll ask where your Northgard save folder is (usually
   found automatically); use `/savedir` any time to check or change it.
7. Run `/conquest` to see your in-progress Conquest saves and pick the one for this
   playthrough. This is remembered per Archipelago room, so running more than one room at
   once (each with its own client) doesn't mix up which save belongs to which.
   - Make sure you have created your Conquest save in-game first -- `/conquest` can only
     list saves that already exist.
8. Leave the client running in the background while you play. It watches your pinned
   Northgard save directly; you don't need to manually report anything in-game.

## Notes

- The client never edits your Northgard save file. It only reads it (to detect completed
  Chapters) and writes small marker files elsewhere on disk that Northgard's own game
  files check to decide whether a Chapter can be selected.
- The first time you connect, the client automatically patches your Northgard install so
  those locks are enforced by the game itself, not an honor system -- no manual step
  needed, and it re-heals itself on every future connect (e.g. if a Steam update ever
  reverts it). It never reverts the patch itself: to play vanilla Northgard, just
  double-click the standalone `patch_northgard.exe` -- it finds your Northgard install
  automatically and gives you a menu to check status or restore to vanilla.
