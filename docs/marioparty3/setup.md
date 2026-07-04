# Mario Party 3 Randomizer Setup Guide

## Required Software

- Archipelago (the latest release)
- The latest release of the world (https://github.com/xoric713/MP3_AP)
- BizHawk 2.7 or newer
- Party Planner 64 (web-based editor): https://partyplanner64.github.io/PartyPlanner64/
- A legally obtained Mario Party 3 (USA) ROM (`.n64` or `.z64`)

## Patch the Game With Custom Boards

This integration works with custom boards made in Party Planner 64, not the vanilla boards.

1. Pick the boards you want and grab their JSON files, named like `<board name>.json`.
2. Open your Mario Party 3 ROM in Party Planner 64.
3. For each board you want to use, import its `<board name>.json` and overwrite the corresponding vanilla board slot.
4. Save the ROM as a new patched file.

## Create a Config (.yaml) File

### What is a config file and why do I need one?

See the guide on setting up a basic YAML at the Archipelago setup guide:
[Basic Multiworld Setup Guide](/tutorial/Archipelago/setup/en)

### Where do I get a config file?

Use the Archipelago launcher to generate template YAMLs, then edit the Mario Party 3 YAML accordingly.

## Joining a MultiWorld Game

1. Place the MarioParty3.apworld into your custom worlds folder.
2. Start BizHawk and load your patched Mario Party 3 ROM.
3. Copy `connector_MP3.lua` and the `boards` folder into your Archipelago `data/lua/` folder.
4. Open the Lua console and load the connector script:
   - `data/lua/connector_MP3.lua` in your Archipelago folder.
5. Start the Archipelago client and connect to your room.
6. Once both the client and BizHawk are connected, you are ready to play.
