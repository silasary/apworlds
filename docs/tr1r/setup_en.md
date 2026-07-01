# Tomb Raider 1 Remastered - Archipelago Setup Guide

## Required Software

- Tomb Raider I-III Remastered (Steam version)
- Archipelago client (TRArchipelagoClient)
- Python 3.10+ (for generating seeds)

## Installation

### APWorld

1. Download `tr1r.apworld` from the releases page
2. Place it in your Archipelago installation's `lib/worlds/` directory
3. The game "Tomb Raider 1 Remastered" should now appear in the YAML editor

### Client

1. Download the latest `TRArchipelagoClient` release
2. Extract it to any directory
3. Note the path to `TRArchipelagoClient.exe`

## Generating a Seed

1. Create a YAML configuration file (see example below)
2. Generate the seed using Archipelago's generation tools
3. Host the resulting multidata file on an Archipelago server

### Example YAML

```yaml
game: Tomb Raider 1 Remastered
name: YourName
Tomb Raider 1 Remastered:
  goal: final_boss
  secrets_mode: useful
  trap_percentage: 10
  death_link: false
  starting_weapons: pistols
```

## Playing

1. Launch `TRArchipelagoClient.exe`
2. Enter the server address, slot name, and password
3. The client will automatically patch your level files
4. Launch Tomb Raider I-III Remastered from Steam
5. Play normally - the client handles all synchronization

## How It Works

- Pickups in levels are replaced with multiworld items
- When you pick up an item, it may be sent to another player
- Items from other players appear in your inventory automatically
- Key items (keys, puzzle items) are required for progression
- Level completion events unlock the next level in the sequence

## Troubleshooting

- **Client can't find game**: Make sure tomb123.exe is running
- **Items not syncing**: Check your connection to the AP server
- **Level files corrupted**: The client creates backups; use "Restore" to fix
