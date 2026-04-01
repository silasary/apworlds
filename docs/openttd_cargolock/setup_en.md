# OpenTTD Cargolock Setup Guide

## Requirements
- OpenTTD 15.2 (patched with Archipelago integration)
- Archipelago 0.6.6 or later

## World Identifier
- This APWorld registers as: OpenTTD Cargolock
- Use this exact game identifier in your generation setup to avoid conflicts with the standard OpenTTD implementation.

## Why is this a separate implementation
- This implementation is a fork based on solida's Archipelago OpenTTD implementation.
- What started as a simple feature fork evolved into a different gameplay and design vision.
- We decided to keep these changes in this fork instead of folding them back into the original implementation.
- A separate world identifier preserves compatibility and avoids world-detection collisions during generation and server setup.

## New Features
- Cargo lock: the player's company cannot transport cargo types that are not unlocked.
- Progressive vehicle tiers: instead of one item unlocking one vehicle, vehicles are grouped into progressive tier unlocks.
- Static list of mission locations.
- Multiplayer support:
	- Coop mode: multiple players can play in one company using one Archipelago slot.
	- Multi-company mode: multiple companies can connect as separate Archipelago slots.

## Installation
1. Build or download the patched OpenTTD binary from this project.
2. Place the generated APWorld package in your Archipelago custom_worlds folder.
3. Restart the Archipelago launcher/server after adding or updating the APWorld.

## YAML and Generation
1. Ensure your player YAML targets OpenTTD Cargolock (not OpenTTD).
2. Generate normally with Archipelago after the world is detected.
3. If the game does not appear, verify there is only one OpenTTD Cargolock APWorld installed.

## Connecting In Game
1. Launch the patched OpenTTD build.
2. Click Archipelago on the main menu.
3. Enter host, port, slot, and password.
4. Connect and start or continue your session.

## Multiplayer Guide

Host setup (required order):
1. From the main menu, open Archipelago and connect using the host's AP slot.
2. After connecting, either:
	- generate/start the AP map from YAML, or
	- load an existing AP save to continue.
3. Once the AP map is running, start the OpenTTD multiplayer server from that loaded map.

### Coop mode (one company, one Archipelago slot)
Use this when multiple human players share one in-game company and one AP slot.

Other players:
1. Join the host's OpenTTD multiplayer server.
2. Join the same in-game company as the host.

### Multi-company mode (multiple companies, multiple Archipelago slots)
Use this when each company maps to a different AP slot in the same game.

Each additional player/company:
1. Join the host's OpenTTD multiplayer server.
2. Create or join a different in-game company.
3. Connect Archipelago with the AP slot assigned to that company.

Notes:
- Keep slot-to-company mapping consistent for the whole save.
- If someone reconnects, they should use the same company and same AP slot they used before.

## Gameplay Summary
- Vehicles and cargo types are item-gated.
- Missions send checks when completed.
- Optional shop for purchasable checks.

## Win Conditions
Current win condition:
- Collect all cargo type progression items: Passengers, Mail, Coal, Oil, Livestock, Goods, Grain, Wood, Iron Ore, Steel, and Valuables.
