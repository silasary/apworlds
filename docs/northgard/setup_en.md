# Northgard Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- Northgard (Steam), Conquest mode
- The `northgard.apworld` file, installed like any other apworld

## Installation

1. Place `northgard.apworld` in your Archipelago install's `custom_worlds` folder. Every
   player with a Northgard slot (single player or multiplayer) needs to do this on their own 
   machine, even if someone else is generating/hosting the room. 
2. Add a Northgard entry to your player YAML -- see `Northgard.yaml` for a ready-to-use
   template.
3. Generate or join a multiworld using your Northgard YAML.
4. Open the Archipelago Launcher and click **Northgard Client**.
5. Connect it to your room the same way you would any other Archipelago client.
6. First time on a given computer, it might ask where your Northgard save folder is (usually
   found automatically); use `/savedir` any time to check or change it.
7. Launch Northgard. If you don't already have a Conquest save for this playthrough,
   start a new one now -- every Chapter will show as locked until you pin the save in the
   next step.
8. Run `/conquest` in the client to see your in-progress Conquest saves and pick the one
   for this playthrough with e.g. `/conquest 1`. This is remembered per Archipelago room,
   so running more than one room at once (each with its own client) doesn't mix up which
   save belongs to which. Any items you've already received unlock within a few seconds
   of pinning, live in-game -- no need to back out of the map screen or relaunch anything.
9. Leave the client running in the background while you play -- it watches your pinned
   Northgard save directly; you don't need to manually report anything in-game.

## Uninstalling

- To play vanilla Northgard again, just double-click the standalone `patch_northgard.exe` 
-- it finds your Northgard install automatically and gives you a menu to check status or 
restore to vanilla.
