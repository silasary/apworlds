# Etrian Odyssey (DS) Setup Guide

## Required Software

- [Archipelago 0.6.7+](https://github.com/ArchipelagoMW/Archipelago/releases)
- [Bizhawk 2.10+](https://github.com/TASEmulators/BizHawk/releases)
- A North American copy of Etrian Odyssey for the Nintendo DS. The Archipelago community cannot provide this.
- [Latest etrian_odyssey.apworld](https://github.com/TheMasterZelda/Etrian_Odyssey_1_Archipelago/releases)
- [Latest Etrian Odyssey Patcher](https://github.com/TheMasterZelda/etrian-odyssey-1-archipelago-patcher/releases)

## Recommended Software

- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases)

### Configuring Bizhawk (Recommended)

Once you have installed Bizhawk, open `EmuHawk.exe` and change the following settings:

- Under `Config > Customize`, check the "Run in background" option to prevent disconnecting from the client while you're
tabbed out of EmuHawk.
- Open a `.nds` file in EmuHawk and go to `Config > Controllers…` to configure your inputs. If you can't click
`Controllers…`, load any `.nds` ROM first.
- Consider clearing keybinds in `Config > Hotkeys…` if you don't intend to use them. Select the keybind and press Esc to
clear it.

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should
generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy
an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

Install the downloaded .apworld file with the Archipelago Launcher. In the launcher, click "Generate Template Options" to generate a template YAML for EoS. You can make a copy of this template, and edit it to configure your settings.
Alternatively, you can use the supplied yaml file from the .apworld release page.

### What do the options mean?

The template yaml comes with comments explaining what each of the options do.

## Setup

1. Install the .apworld: Place the .apworld in your Archipelago/custom_worlds folder, or double-click
the .apworld to do so automatically.
2. Create and configure a yaml file with your desired options.
3. Place the yaml file in the Archipelago/players folder.
4. Generate your game.
5. Host the game, either locally or via the archipelago web hosting service.
6. Patch the game (See the dedicated section).
7. Open the 'generic bizhawk client' in Archipelago, and connect to the server.
8. Launch the patched game in bizhawk.
9. In Bizhawk, open the lua console. Add the 'connector_bizhawk_generic.lua' script that can be found in 'Archipelago\data\lua'.
10. Start a new savefile. GLHF!

## Patching the Game

Currently, the patcher is standalone, but it is planned to be merged into the .apworld eventually.
Once you have the patcher downloaded and have the game patch generated, follow these instructions:

1. Open the patcher `etrian_odyssey_ap_patcher.exe`.
2. Select your vanilla Etrian Odyssey rom.
3. Select the `.apeo` patch file.
4. Select the desired output file. Make sure to end the name with `.nds` so Bizhawk play nice.
5. Double-check the patcher was successful, then the patching process is done.

## Important Notes

Even on a singleplayer game, the connection to the client is required to handle most items and locations.
The exception to this are inventory items obtained from Treasure Box.