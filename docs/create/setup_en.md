# Create Setup Guide

## Requirements

- Archipelago 0.6.7 or newer
- Dolphin Emulator
- The PAL Wii release of Create, game ID `SECP69`
- `create.apworld`, installed by each Create player and the person generating the seed

The client connects to Dolphin's memory. No game-image patch is required.
Only Save Slot 3 is supported. Back up an existing save before starting, and use a fresh
Save Slot 3 for each new seed so that previous progress does not carry over.

## Install

1. Close the Archipelago Launcher.
2. Copy `create.apworld` into Archipelago's `custom_worlds` folder, replacing the older version if present.
3. Restart the launcher. `Create Client` should appear in the component list.
4. If prompted to install missing requirements, allow the installation. The client requires
   `dolphin-memory-engine` to communicate with Dolphin.

Keep the APWorld as a single file; do not extract it. Use the same release for generation and play.

## Generate a seed

1. Run `Generate Template Options` from the Archipelago Launcher.
2. Find the generated Create YAML in `Players/Templates`, copy it into `Players`, and set your player name.
3. Edit the Create options in the YAML. The default goal is the final challenge of a random world,
   unlocked by collecting 100 Archipelago Sparks in Goal World Unlock mode. Start and goal worlds
   are random, Create Chain checks are enabled, and the four II worlds are disabled by default.
4. Run `Generate` with the player YAMLs, then host the generated multidata file with Archipelago.

A web player-options page can also export a YAML if that host has this Create APWorld installed.
The public website does not automatically include locally installed custom worlds.

Generation produces a `.apcreate` file for each Create player. Opening it with the launcher starts
Create Client with the slot name filled in. You can also launch the client directly; it receives
its slot configuration from the server when you connect. The `.apcreate` file is not a game patch.

## Connect and play

1. Start Create in Dolphin and load Save Slot 3.
2. Open `Create Client`, or open your `.apcreate` file with the Archipelago Launcher.
3. Connect to the server address supplied by the host and enter your slot name when prompted.
4. Wait for `Dolphin connected successfully.` and `Save Slot 3 connected.` before completing checks.
   Initial synchronization takes a few seconds after loading the save.

Keep the client open while playing. World Access and Object items unlock their corresponding
content. Received Archipelago Sparks count toward your configured goal; they do not replace the
game's vanilla Total Sparks counter. Use `/create` to see checks, received items, and AP Sparks.

Stay in Save Slot 3 for the session. Close the client before changing save slots or seeds, and
restart it when returning to the intended save. The slot check is retained after the first successful
verification and does not continuously protect other saves.

## Troubleshooting

### Dolphin does not connect

Use `/dolphin` to inspect the connection status. Confirm that Create is running and that its game ID
is `SECP69`. Other regions are unsupported. Restart the client with the game already running.

### The client says "Waiting for Save Slot 3"

Load Save Slot 3 and allow time for synchronization. If the message persists, restart the client
and load the slot again. Do not use Save Slots 1 or 2.

### Objects remain locked or checks are missing

Check the server connection and use `/create` to confirm that Save Slot 3 is armed. Leave and
re-enter the menu or challenge after receiving items. Complete checks with the client connected;
previously completed hub events may need to be repeated so the client can observe completion.

### The APWorld is invalid or Create Client is missing

Replace `create.apworld` with a fresh copy, check the required Archipelago version, and restart the
launcher. Remove duplicate copies of older Create APWorlds from `custom_worlds`.

### Reporting a problem

Include the APWorld and Archipelago versions, Dolphin version, game ID, selected options, steps to
reproduce the issue, and the relevant `CreateClient` log from Archipelago's `logs` folder. Remove
server passwords from any files you share.
