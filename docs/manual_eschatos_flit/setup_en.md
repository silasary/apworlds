# ESCHATOS Manual Setup Guide

These instructions are only necessary if you wish to play ESCHATOS in a multiworld.

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- Your copy of ESCHATOS

## Installation Procedures

First, ensure you have downloaded and installed the Archipelago software.

### Using silasary's APWorld Manager

This is recommended, as it lets you more easily install updates in the future for the ESCHATOS Manual APWorld, as well as other games not included with Archipelago by default.

1. Download the latest [APWorld Manager](https://github.com/silasary/Archipelago/releases?q=Manager), which should be named `apworld_manager.apworld`. Do not rename it.
2. In your Archipelago folder, place the APWorld Manager in the `custom_worlds` folder (create it if it doesn't already exist).
3. Open the Archipelago Launcher.
    - If you had it open already, close and reopen it.
4. Open "Install/Update Apworlds".
    - If you don't see it, make sure you've correctly installed the APWorld per Step 2.
    - On Archipelago 0.6.1 and earlier, it will be the first option on the left-hand side.
5. Look for "Manual_ESCHATOS_Flit" in the list, and click Install.
    - This will download `manual_eschatos_flit.apworld` for you, and place it in your `custom_worlds` folder.
    - If you don't see it, open `host.yaml` in your Archipelago folder, and ensure the setting `show_manuals` is set to `true`.
6. **Optional:** Look for "Universal Tracker" in the list, and click Install.
    - This will download `tracker.apworld` for you, and place it in your `custom_worlds` folder.
    - Doing this is highly recommended, as it allows you to see what checks are currently in logic.

### Manual installation

1. Download the [ESCHATOS Manual APWorld](https://github.com/FlitPix/archipelago-manuals/releases?q=ESCHATOS), which should be named `manual_eschatos_flit.apworld`. Do not rename it.
2. If you choose to also install [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker), download `tracker.apworld`.
    - You may need to click the "Assets" dropdown to reveal it.
    - If you're playing on Archipelago 0.6.2 or later, download the version that **does** have `MD` at the end of it. If you're playing on an earlier version of Archipelago, download the version that **doesn't** have `MD` at the end of it.
    - Installing Universal Tracker is highly recommended, as it allows you to see what checks are currently in logic.
3. In your Archipelago folder, place the APWorld(s) in the `custom_worlds` folder (create it if it doesn't already exist).

## Creating your YAML file

Use the <a href="../player-settings">options page</a> to create your YAML.

Once your YAML is ready, it can be used by the host to [generate the multiworld](https://archipelago.gg/tutorial/Archipelago/setup/en#generating-a-game). If you aren't the host, send the YAML to them so they can do this.

## Joining a Multiworld Game

1. If you wish to use Universal Tracker, in your Archipelago folder, place your YAML in the `Players` folder (or, if you changed Universal Tracker's `player_files_path` option in `host.yaml`, that path).
2. Open the Archipelago Launcher.
3. Open the "Manual Client".
    - If you don't see it, make sure you've correctly installed the APWorld per the previous section.
    - On Archipelago 0.6.1 and earlier, it will be on the right-hand side.
4. At the top, in the "Server" box, type your room's address and port number. In most cases, it'll probably be something like `archipelago.gg:38281`.
5. At the top, in the "Manual Game ID" box, type `Manual_ESCHATOS_Flit`.
6. Click Connect at the top right corner. If asked, enter your player/slot name in the "Command:" box at the bottom.

You should be connected! Just play your game as normal, use the Manual tab at the top to look at the location checks you can send, and click on a location to send its check. If you have Universal Tracker, locations that are in logic will be colored green, and the Tracker tab will list them out for you.

You can send any location check, even those that aren't in logic, and you can't reverse a sent location check, so be careful!
