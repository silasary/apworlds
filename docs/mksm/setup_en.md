# Mortal Kombat: Shaolin Monks Guide

## Required Software

- A legally obtained NTSC ISO of Mortal Kombat: Shaolin Monks (`SLUS-21087`)
- [A version of PCSX2 which supports PINE (recommended: 2.2.0)](https://pcsx2.net/downloads)
- The Archipelago launcher, which can be installed [here](https://github.com/ArchipelagoMW/Archipelago/releases). 0.6.7 or higher required.

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should
generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy
an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

You can customize your options by using the built-in *Options Creator* in the Archipelago launcher.
The *Options Creator* allows customization of all the game's options and hovering over an option explains what it does.
You can read more about the options [here](en_Mortal%20Kombat%20Shaolin%20Monks.md)

## Configuring PCSX2

Enable PINE in PCSX2

* In PCSX2, under Tools, check Show Advanced Settings.
* In PCSX2, System -> Settings -> Advanced -> PINE Settings, check Enable and ensure Slot is set to 28011.

## Connect to the MultiServer

1. Open PCSX2 and load MKSM

2. Go to the main menu

3. Set Up the Client
    - Run MKSM Client from the Archipelago Launcher and connect while at the main menu

4. Press New Game to start playing

## Notes

* You can only connect to the server while in the main menu.
* Backup your save if you want, the client removes all collected Red Koins so you can collect them while playing.
* Start each run by pressing New Game, don't load save files belonging to a different playthrough.
* Avoid using save states while playing, they can mess with the client's autosave and location checks.
* Co-op is untested for now, don't expect it to work.
