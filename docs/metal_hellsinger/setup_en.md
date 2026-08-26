# Metal: Hellsinger Setup Guide

## Required Software

- [Metal: Hellsinger](https://www.metalhellsinger.com/) for PC
- [Metal: Hellsinger AP World](https://github.com/DanielSchaack/ArchipelagoMetalHellsinger/releases/latest)
- [Metal: Hellsinger Randomizer Mod](https://github.com/DanielSchaack/Metal-Hellsinger-AP-Mod/releases/latest)
- [BepInEx Unity (IL2CPP) for Windows](https://builds.bepinex.dev/projects/bepinex_be)

## Optional Software

- [Archipelago Text Client](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [BepInEx Config-Manager](https://github.com/Jelosus2/BepInExConfigManager/releases)

## Installation

### Find Your Relevant Game Directories

Find your Metal: Hellsinger game installation directory:

- **Steam**: Right click Metal: Hellsinger in your Steam Library, then *Manage → Browse local files*.<br>

### Install BepInEx

BepInEx is a general purpose framework for modding Unity games, and is used to run the Metal: Hellsinger Randomizer.

Download [BepInEx Unity (IL2CPP) for Windows](https://builds.bepinex.dev/projects/bepinex_be).

If playing on Steam Deck, follow this [guide to set up BepInEx via Proton](https://docs.bepinex.dev/articles/advanced/proton_wine.html).

If playing on Linux, you may be able to add `WINEDLLOVERRIDES="winhttp=n,b" %command%` to your Steam launch options. If this does not work, follow the guide for Steam Deck above.

Extract the contents of the BepInEx .zip file into your Metal: Hellsinger game directory:<br>

- **Steam**: Steam\steamapps\common\Metal Hellsinger<br>

### Install The Metal: Hellsinger Randomizer Mod

Download the latest release of the [Metal: Hellsinger Randomizer Mod](https://github.com/DanielSchaack/Metal-Hellsinger-AP-Mod/releases/latest).

Extract the contents of the downloaded .zip file, and find the folder labeled `MetalHellsingerApMod`.

Copy the `MetalHellsingerApMod` folder into `BepInEx/plugins` in your Metal: Hellsinger game installation directory.

The filepath to the mod should look like `BepInEx/plugins/MetalHellsingerApMod/MetalHellsingerApMod.dll`<br>

Launch the game, and if everything was installed correctly you should see `Archipelago` as a menu option on the main menu!

## Configure Archipelago Options

### Configure Your YAML File

Visit the [Metal: Hellsinger options page](/games/MetalHellsinger/player-options) to generate a YAML with your selected options.

### Configure Your Mod Settings

Click the menu option labeled `Archipelago`, and fill in *Player*, *Hostname*, *Port*, and *Password* (if required) with the correct information for your room.

Once you've input your information, click the `Connect` button. If everything was configured properly, you should see `Status: Connected!` in the text console on the top of the screen.

An error message will display if the game fails to connect to the server.

Be sure to also look at the configuration file for a variety of additional settings, such as song/outfit/weapon randomization!

For a couple of world settings, the configuration file needs to be adjusted to allow for more weapon types. Using a configuration manager like [BepInEx ConfigManager](https://github.com/Jelosus2/BepInExConfigManager/releases) is highly recommended.
