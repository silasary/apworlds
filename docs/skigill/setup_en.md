# Skigill Randomizer Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [The Skigill apworld](https://github.com/ThinkInvisible/Archskipelagill/releases), if not bundled with your version of Archipelago
- The Archskipelagill BepInEx plugin, found alongside the apworld
- [The latest release of BepInEx 5](https://github.com/bepinex/bepinex/releases)

## How to Play

First, you need a room to connect to. For this, you or someone you know has to generate a game.  
This will not be explained here, but you can check the [Archipelago Setup Guide](https://archipelago.gg/tutorial/Archipelago/setup_en#generating-a-game).

You also need to have [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest) installed and the [Skigill apworld](https://github.com/ThinkInvisible/Archskipelagill/releases) placed within Archipelago's `custom_worlds` folder.

Finally, you need to install [the latest release of BepInEx 5](https://github.com/bepinex/bepinex/releases) on your copy of Skigill, then extract the client plugin into its `plugins` folder (you may have to create this folder manually or by starting the game). To ensure successful installation of the client, check that the following file exists at this exact path: `[game root directory]/BepInEx/plugins/Archskipelagill/Archskipelagill.dll`.

Once installation is complete, you can launch the game at any time. Then, connect to Archipelago by entering your Archipelago host IP/URL, slot name, and password in the ingame plugin panel (accessed via a new button on the lower left of the main menu) and clicking Connect. Alternatively, connection information can be added to the client config to auto-connect on game launch.

**IMPORTANT:** If you've already completed an Archipelago run with this game, you must manually reset or rename your save file to start another. See [Switching Rooms](#switching-rooms).

Once the client is connected, the ingame plugin panel will switch to displaying a console which can be used to send local commands (e.g. `!hint`).

## Client Configuration

After your first launch of the game with the client mod installed, a config file will be generated at `[game root directory]/BepInEx/config/com.ThinkInvisible.Archskipelagill.cfg`. This file may be edited to configure several mod features, such as death link, trap difficulty, Archipelago server autoconnect, and/or the built-in location tracker. The game *must be restarted* to apply config file changes.

## Switching Rooms

To switch rooms, you must either reset your save file by clicking and holding the ingame "RESET SAVE" button (lower right of the plugin panel), or change the "Save/Load" -> "Run Suffix" config option. The client plugin will generate a separate save file from vanilla, and the aforementioned config option can be used to switch save file names. A fresh save file should be used for each separate Archipelago room/run to avoid having inappropriate items or location statuses.