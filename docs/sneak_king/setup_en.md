# Setup Guide for Sneak King Archipelago

## Required Software

- [xemu](https://xemu.app/) — original Xbox emulator
- The built-in Sneak King client, included with [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- A copy of Sneak King for the original Xbox in .iso format

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should
generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy
an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

You can customize your options by visiting the [Sneak King Options Page](/games/Sneak%20King/player-options).

## Joining a MultiWorld Game

### Obtain your patch file

When you join a multiworld game, you will be asked to provide your YAML file to whoever is hosting. Once that is done,
the host will provide you with either a link to download your data file, or with a zip file containing everyone's data
files. Your data file should have a `.apsk` extension.

Double-click your `.apsk` file to launch the Sneak King client and automatically patch your ROM.

### Configure xemu

Before connecting, ensure xemu is set up with your patched Sneak King ISO:

1. Open xemu and go to **Settings → System**.
2. Set the HDD image path to a valid Xbox HDD image.
3. Load your patched Sneak King ISO via **Machine → Load Disc**.

### Connect to the Multiserver

Once xemu is running with the patched game loaded, the Sneak King client should detect it automatically.

To connect to the multiserver, enter `<address>:<port>` in the top text field of the client and press Enter. If the
server uses a password, type `/connect <address>:<port> [password]` in the bottom text field.