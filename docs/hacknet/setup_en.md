# Hacknet Multiworld Setup Guide

## Required Software

* The latest version of [Hacknet](https://store.steampowered.com/app/365450/Hacknet/)
    * Only the Steam and GOG versions of Hacknet are confirmed to be working.
    * It is **recommended** you also own the DLC, Hacknet Labyrinths. The mod may not work otherwise.
* The latest version of [Hacknet: Pathfinder](https://github.com/Arkhist/Hacknet-Pathfinder)
* The latest [Archipelago Plugin](https://github.com/AutumnRivers/HacknetAP/releases) for Hacknet

## Optional Software

* Archipelago from the [Archipelago Releases Page](https://github.com/ArchipelagoMW/Archipelago/releases)
    * Hacknet comes with its own text client built-in, but it's a little bare. You may find the Archipelago TextClient 
    to be more usable.

## Configuring your YAML file

### What is a YAML file and why do I need one?

See the guide on setting up a basic YAML at the Archipelago setup
guide: [Basic Multiworld Setup Guide](/tutorial/Archipelago/setup/en).

### Where do I get a YAML file?

You can customize your options by visiting the [Hacknet Player Options Page](../player-options).

## Joining a MultiWorld Game

### Installing the mod loader

#### Windows

* [Download the installer for Pathfinder](https://github.com/Arkhist/Hacknet-Pathfinder/releases/latest/download/PathfinderInstaller.exe)
* Run the installer

**OPTIONAL, but RECOMMENDED:** Check to make sure Pathfinder was installed correctly. You can do this by launching 
Hacknet via Steam/from `Hacknet.exe`. If you see `OS+Labyrinths <version> Pathfinder <version>` near the Hacknet logo, 
then you are good to go! Otherwise, try [common troubleshooting steps for Pathfinder](https://github.com/Arkhist/Hacknet-Pathfinder#troubleshooting).

#### Linux

* Install Python 3 onto your system. This is dependent on your distribution, but most have it installed by default.
* [Download the Python installer for Pathfinder](https://github.com/Arkhist/Hacknet-Pathfinder/releases/latest/download/PathfinderInstaller.py)
* Run the installer: `python PathfinderInstaller.py`

### Installing the mod

The installation instructions for the Archipelago client mod for Hacknet can be found [here](https://github.com/AutumnRivers/HacknetAP#installation).

### Connecting to the MultiWorld

* After installing the mod, launch Hacknet, and enter the following:
    * `URI`: Full URI (`host:port`) where your game is hosted.
        * (e.g., `archipelago.gg:54321`, `localhost:38281`)
    * `Slot Name`: The name of *your* slot. (e.g., `Player1`, `Autumnet`)
    * `Room Pass`: If you've set up a password for your room, put it here.
* After entering the details, click `Connect To Archipelago`.
* That's it - now you can start a new save file.
    * If you're resuming a previous game of Archipelago, you should instead load the respective savefile.
* Whenever you wish to disconnect, you can simply close the game, or disconnect from the main menu. 
Either way will cleanly disconnect you from the server.

### Interacting with the MultiWorld from in-game

You cannot receive hints within Hacknet itself, but, otherwise, you can:
* Send text messages with `archisay <message>` (e.g., `archisay Hello, World!`)
* View the items you've received and sent by connecting to the in-game Archipelago IRC `connect archipelago.gg`
