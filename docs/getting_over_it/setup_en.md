# Setup Guide for Getting Over It in Archipelago

## Quick links

- Game Info Page
    * [English](/games/Getting%20Over%20It/info/en)
- [Player Options Page](/games/Getting%20Over%20It/player-options)

## Required Software

- The game ([Steam](https://store.steampowered.com/app/240720/Getting_Over_It_with_Bennett_Foddy/))
- [BepInEx 5.4.23.2](https://github.com/BepInEx/BepInEx/releases/tag/v5.4.23.2) (mod loader)
- [Checking Over It](https://github.com/BlastSlimey/CheckingOverIt/releases) (client mod)

## Optional Software

- Archipelago from the [Archipelago Releases Page](https://github.com/ArchipelagoMW/Archipelago/releases)
    * (Only for the TextClient)
    * (If you want, you can use the BedInEx console as a read-only text client (instructions further down))
- Universal Tracker (check UT's `#future-game-design` thread in the discord server for instructions)

## Installation

1. Download `BepInEx 5.4.23.2` and `Checking Over It` from their respective release pages
2. Open the directory of the game (the "game root" containing the game executable, e.g. `GettingOverIt.exe`)
   - This directory can be found by opening Steam > Library > Getting Over It [...] > Settings wheel or right click > Manage > Browse local files
3. Copy the contents of both downloaded zip files to the game root
4. Open the game once and close it (so that BepInEx creates the necessary files, including the config files)
5. OPTIONAL BUT RECOMMENDED: Open `<game root>/BepInEx/config/BepInEx.cfg` with a text editor, scroll to `[Logging.Console]`, and set `Enabled = ...` to `true`
   - This is to enable the BepInEx console to see server messages and game error messages

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should
generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy
an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

You can generate a yaml or download a template by visiting the 
[Getting Over It Player Options Page](/games/Getting%20Over%20It/player-options)

## Joining a MultiWorld Game

Open the config file of the client mod, which can be found at `<game root>/BepInEx/config/BlastSlimey.CheckingOverIt.cfg`, 
with a text editor and read the config descriptions for how to correctly enter your connection details. 
Then you can just start a new game (but remember that continuing saved progress is disabled in AP).
