# Sonic Colours (Wii) Setup Guide

## Required Software

- [Archipelago 0.6.7](https://github.com/ArchipelagoMW/Archipelago/releases/latest) or newer
- [Dolphin Emulator](https://dolphin-emu.org/download/) (64-bit)
- An unmodified, uncompressed PAL Sonic Colours Wii ISO, game ID `SNCP8P`
- The [Sonic Colours `.apworld` file](https://github.com/mariokirby1703/Lumas-Archipelago/releases)
- [Wiimms ISO Tools](https://wit.wiimm.de/): installed automatically when needed on Windows; install it separately on other platforms

Other game regions are not yet supported.

## Installing the APWorld

1. Install Archipelago and download `sonic_colours_wii.apworld`.
2. Double-click the `.apworld` file to install it.
3. Restart the Archipelago Launcher and check that the Sonic Colours (Wii) Client appears.
4. If Archipelago asks to install missing requirements, allow it. The client needs Dolphin Memory Engine to connect to Dolphin.

## Creating a YAML and Generating a Game

Create a Sonic Colours player YAML using the Archipelago Launcher's Options Creator and set your player name and options. Place the YAML in your Archipelago `Players` folder for local generation.

Generate the multiworld through the Generate Button in the Archipelago Launcher.
Host your game on `archipelago.gg` and create a room. When the port appears, download your patch file from the room page.

## How to Play

1. Open your `.apsoniccolours` patch using the **Sonic Colours (Wii)** Client in the Archipelago Launcher.
2. When prompted, select your Dolphin executable and your original PAL ISO. The installer creates a separate patched ISO in the folder your patch file is located; your original ISO stays unchanged.
3. Wait for the patching and verification to finish. Dolphin will start the patched ISO automatically.
4. If the patch file was downloaded after the port was created, the client will connect automatically. If not, connect the client to your Archipelago room using its full address and port, your player name and, if required, the room password.
5. Connect **before starting New Game**, so the client can detect checks during the opening Acts. Choose a free save slot when the game prompts you to after Tropical Resort Act 2.
6. Wait for the client to connect to Dolphin and enjoy playing! Keep using the same patch, patched ISO and save for the seed. You 

No manual Gecko codes or Riivolution setup is required. Keep the generated ISO and its accompanying `.iso.sonic.json` file; the generated ISO contains game data and should not be redistributed.
