# Rabi-Ribi Setup Guide

## Required Software

- Rabi-Ribi from the [Steam page](https://store.steampowered.com/app/400910)
- Archipelago from the [Archipelago Releases Page](https://github.com/ArchipelagoMW/Archipelago/releases)

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a config file.

## Update host.yaml to include the Rabi-Ribi installation path

1. Look for your Archipelago install files. By default, the installer puts them in `C:\ProgramData\Archipelago`.
2. Open the `host.yaml` file in your favorite text editor (Notepad will work).
3. Put your Rabi-Ribi root directory in the `game_installation_path:` under the `rabi_ribi_options:` section.
   - The Rabi-Ribi root directory can be found by going to 
   `Steam->Right Click Rabi-Ribi->Properties->Installed Files->Browse` and copying the path in the address bar.
   - Paste the path in between the quotes next to `game_installation_path:` in the `host.yaml`.
4. Start the Rabi-Ribi client.

## Starting a Multiworld game

1. Start the Rabi-Ribi Client and connect to the server. Enter your username from your 
[options file.](../player-options)
2. Start Rabi-Ribi.
3. Select the Archipelago custom map by pressing F5 and selecting the map displayed in the client.