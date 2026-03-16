# Setup Guide for Tetris (Gameboy)

## Important

As we are using BizHawk, this guide is only applicable to Windows and Linux systems.

## Required Software

- BizHawk: [BizHawk Releases from TASVideos](https://tasvideos.org/BizHawk/ReleaseHistory)
  - Version 2.9.1 is recommended.
  - Detailed installation instructions for BizHawk can be found at the above link.
  - Windows users must run the prereq installer first, which can also be found at the above link.
- The built-in Archipelago client, which can be installed [here](https://github.com/ArchipelagoMW/Archipelago/releases)
- A Gameboy Tetris ROM file. The Archipelago community cannot provide this.

## Configuring BizHawk

Once BizHawk has been installed, open EmuHawk and change the following settings:

- Under Config > Customize, check the "Run in background" box. This will prevent disconnecting from the client while
EmuHawk is running in the background.

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should
generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy
an experience customized for their taste, and different players in the same multiworld can all have different options.

[//]: # ()
[//]: # (### Where do I get a YAML file?)

[//]: # ()
[//]: # (You can generate a yaml or download a template by visiting the [Tetris Player Options Page]&#40;/games/Tetris/player-options&#41;)

## Joining a MultiWorld Game

### Generating a Game, Patching, andConnecting to the Multiserver

1. Create your options file (YAML).
2. Follow the general Archipelago instructions for [generating a game](https://archipelago.gg/tutorial/Archipelago/setup_en#generating-a-game).
3. Tetris uses Archipelago's BizHawk Client. You can open `ArchipelagoBizhawkClient.exe` or launch it from the Launcher.
4. Ensure EmuHawk is running the patched ROM.
5. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing.
6. In the Lua Console window, go to `Script > Open Script…`.
7. Navigate to your Archipelago install folder and open `data/lua/connector_bizhawk_generic.lua`.
8. The emulator may freeze every few seconds until it manages to connect to the client. This is expected. The BizHawk
Client window should indicate that it connected and recognized Tetris.
9. If you managed to connect during the intro copyright screen, you will be informed that the game was successfully
patched. Most likely, you will have reached the title screen and will be told by the client and the game to
reset your game to patch it. Open the Emulation menu, select "Hard Reset" and your game will reset. At this point
you should be told that your game was patched, and you will move on to the Archipelago Tetris title screen.
10. To connect the client to the server, enter your room's address and port (e.g. `archipelago.gg:38281`) into the
top text field of the client and click Connect. You will be prompted to enter your slot name. You will not be able to
proceed from the title screen until you have connected to the server and entered your slot name.

To connect the client to the multiserver simply put `<address>:<port>` on the textfield on top and press enter (if the
server uses password, type in the bottom textfield `/connect <address>:<port> [password]`)