# RVGL Setup Guide

## Required Software

- Re-Volt (PC version), can be either:
    - The original release from 1999
    - [Steam version](https://store.steampowered.com/app/287310/ReVolt/)
    - [GOG version](https://www.gog.com/en/game/revolt)
- [RVGL](https://rvgl.org/)
    - Supported version: 23.1030a1, Windows 64-bit only.
    - [Direct download](https://rvgl.org/downloads/rvgl_23.1030a1_setup_win64.exe)
- RVGL Randomizer ([Github](https://github.com/HansyRod/rvgl-randomizer) | [Re-Volt World](https://www.revoltworld.net/dl/rvgl-randomizer/))
    - Supported version: 0.3.0 or higher

## Installation

### Preparing RVGL

To play RVGL in Archipelago, your Re-Volt installation needs to be patched with RVGL.

1. Open the RVGL Setup executable
2. Browse to select your Re-Volt installation path
3. Click Install to update your game

This process will create the `rvgl.exe` executable in your Re-Volt installation folder.

### Installing RVGL Randomizer

Follow the install instructions in the [RVGL Randomizer page](https://github.com/HansyRod/rvgl-randomizer).

## Multiworld configuration

### Creating a Multiworld Game with RVGL

To create an Archipelago Multiworld game with RVGL:

- The Multiworld creator must install the RVGL APWorld.
- Each RVGL player must provide their own YAML file with the chosen configuration for their playthrough.

Both the RVGL APWorld and the YAML template are available on the [release page](https://github.com/HansyRod/Archipelago-RVGL/releases).

### Multiworld Generation Output

When the multiworld is generated, the output will include one `.aprvgl` file for each RVGL player.

- If your multiworld is hosted in an Archipelago server room, and uploaded as the full generated package, you can download your file from the room page.
- If you cannot download your file, obtain it from the multiworld creator. The file name includes the player's name provided in the YAML, to identify which player should use which file.

## Playing RVGL in Archipelago Mode

To play in Archipelago mode with RVGL, it's required to launch the game through RVGL Randomizer. It works as a game client that can connect to Archipelago and manage your progress through the multiworld game.

### Set Up RVGL Randomizer

You will need to do these steps the first time you play using RVGL Randomizer.

1. Launch RVGL Randomizer.
2. On the "Mode" screen, select the Archipelago mode.
3. On the "Setup" screen, click the Browse button and find your RVGL installation.
4. Select the `rvgl.exe` executable created in the [Preparing RVGL](#preparing-rvgl) step.

### Import Your Archipelago File

You will need to do these steps when starting a new multiworld game.

1. In the "Import" screen, click the "Load Archipelago File" button.
2. Select the `.aprvgl` file obtained in the [Multiworld Generation Output](#multiworld-generation-output) step.

### Launch RVGL and Connect to Archipelago

1. On the "Play" screen, click the Launch Game button.
2. Inside the game, enter the "Archipelago" menu.
3. The "Slot Name" is your player name from the YAML file. It is automatically filled in.
4. In "Server URL", type in the server and port.
    - Example: `archipelago.gg:12345`
5. If your room has a password, type it in "Password".
6. Select "Connect" and wait until the connection is complete.

When connection is complete, the game automatically returns to the Main Menu, and the "Start Game" option is unlocked. You can now start playing!

### Resume Playing

To continue playing, launch the game again through the "Launch Game" button.

- If your server URL didn't change and your room has no password, your game will automatically connect.
- Otherwise, repeat the steps above to reconnect to Archipelago.