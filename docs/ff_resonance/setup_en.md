# Final Fantasy Resonance Setup Guide

## Required software

- Final Fantasy Resonance (Steam, Windows)
- [UE4SS](https://github.com/UE4SS-RE/RE-UE4SS), a build for Unreal Engine 5.6
- The FFRArchipelago UE4SS mod
- The FFR Modding Tools' ModSettings panel, for on-screen messages (optional; without it, messages go to `UE4SS.log` only)
- Archipelago 0.6.7 or later, with `ff_resonance.apworld` in its `custom_worlds` folder

## Installing the mod

1. Copy the `FFRArchipelago` folder into `FINAL FANTASY RESONANCE\FFRS\Binaries\Win64\ue4ss\Mods\`.
2. Disable FFRRandomizer if it is installed: delete or rename its `enabled.txt`. It patches the same chest rows.

## Generating a game

1. Create a player options file. Archipelago's Launcher can generate a template ("Generate Template Options"), or use the example in this repository.
2. Generate and host as usual.

## Connecting

1. Start the game.
2. Open the Archipelago Launcher and start **Final Fantasy Resonance Client**.
3. Connect to the server with your slot name.
4. Start a new game. The mod links it to the seed by itself. To play an existing save instead, load it and type `/bind` in the client.

The mod pauses while any other save is loaded: it gives no items, sends no checks, and the chests are vanilla.

The client finds the mod folder through `ff_resonance_options.mod_folder` in `host.yaml`. It defaults to the usual Steam path. When the mod is not there, the client looks in your other Steam libraries. To use another folder for one session, run `/modfolder <path>` in the client. Both take the `FFRArchipelago` folder or the `Mods` folder that holds it.

## Client commands

- `/modfolder [path]`: show or set the mod folder.
- `/bind`: link the save loaded in the game to this seed.
- `/resync`: ask the mod to report every chest and shiny the save says is looted, and resend all checks.
