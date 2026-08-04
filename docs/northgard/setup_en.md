# Northgard Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- Northgard (Steam), Conquest mode
- The `northgard.apworld` file, installed like any other apworld

## Installation

1. Place `northgard.apworld` in your Archipelago install's `custom_worlds` folder. Every
   player with a Northgard slot needs to do this on their own machine, even if someone
   else is generating/hosting the room.
2. Add a Northgard entry to your player YAML -- see `Northgard.yaml` for a ready-to-use
   template.
3. Generate or join a multiworld using your Northgard YAML.
4. If you don't already have a Conquest save to play, launch Northgard now (vanilla is
   fine at this point) and start a new Conquest game -- you only need to create the save,
   then you can close Northgard again. `/conquest` (step 9) can only pin a save that
   already exists, so this has to happen before you connect the client for the first
   time.
5. **Fully close Northgard if it's currently running.** The lock-enforcement patch
   (step 7) is written to files on disk and is only read by Northgard when it starts --
   a copy of the game that's already running won't see it until you restart it.
6. Open the Archipelago Launcher and click **Northgard Client** -- it's bundled inside the
   apworld, the same way as any other game's client.
7. Connect it to your room the same way you would any other Archipelago client -- server
   address, slot name, optional password. This is what triggers the client to patch your
   Northgard install (see Notes below), so connect the client *before* launching Northgard
   for this play session, not after.
8. First time on a given computer, it'll ask where your Northgard save folder is (usually
   found automatically); use `/savedir` any time to check or change it.
9. Run `/conquest` to see your in-progress Conquest saves and pick the one for this
   playthrough with e.g. `/conquest 1`. This is remembered per Archipelago room, so
   running more than one room at once (each with its own client) doesn't mix up which
   save belongs to which.
10. Now launch (or re-launch) Northgard and continue the Conquest save you picked in step
    9. Leave the client running in the background while you play -- it watches your
    pinned Northgard save directly; you don't need to manually report anything in-game.

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
