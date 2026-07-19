# Layer8Problem Setup Guide

Layer8Problem is a browser-based game playable at
<https://seluce.github.io/Layer8Problem/>.

This APWorld lets the game participate in an Archipelago multiworld by
defining items, locations, regions, and a victory condition. The base
game has **no official Archipelago client**, so item send/receive is
not automatic — a companion userscript or manual tracker is required to
mark locations as checked when you complete them in-game.

## Install

1. Copy `layer8problem.apworld` into your Archipelago install's
   `custom_worlds/` (or `worlds/`) directory.
2. Restart the Archipelago launcher. The game "Layer8Problem" will
   appear in the YAML generator.

## Generate

1. Use the bundled `Layer8Problem.yaml` template to configure your
   slot (difficulty, max tickets, traps, death-link).
2. Run `ArchipelagoGenerate` as usual.

## Goal

Survive until **16:30** without being fired or rage-quitting.

## Locations

- Half-hour survival checks from 08:00 to 16:00.
- Named office milestones (reboot the main server, calm Chantal, hack
  the cafeteria cameras, etc.).

## Items

- **Progression**: Coffee Mug, Server Room Keycard, Phone Headset,
  Walking Shoes, Admin Password, Backup Tape, Emergency Excuse,
  Spare Keyboard, Network Cable, VPN Token.
- **Useful**: Energy Drink, Stress Ball, Rubber Duck, etc.
- **Filler**: Stale Coffee, Cat GIFs, Sticky Notes…
- **Traps**: Chef Visit, Ticket Avalanche, Rage Quit, Monday Morning.
