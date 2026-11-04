# SteamWorld Dig 2 Setup Guide

## Required Software

- SteamWorld Dig 2, the Steam or GOG version
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
    - 0.6.8 or later
- `swd2.apworld` from the [releases page](https://github.com/ClTYOFEVlL/SWD2-Archipelago/releases)

## Recommended Software

- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases), to see what's in logic
    - You don't need the YAML for the tracker to work

## Installation

1. Double click `swd2.apworld` to install it, or move it to the `custom_worlds` folder in your Archipelago install
2. Restart the Archipelago Launcher if it was open

## Creating your YAML

Your YAML has the settings of your game. You can make one with `Options Creator` in the Archipelago Launcher, or edit the template from `Generate Template Options`.

The [Archipelago setup guide](https://archipelago.gg/tutorial/Archipelago/setup_en) explains how to generate and host a game.

## Patching the game

1. In the Archipelago Launcher, open `SteamWorld Dig 2 Client`
2. Type `/auto_patch`. It finds the install by itself, or you can give it the game's folder: `/auto_patch <directory>`

This makes a patched copy in your Archipelago folder and leaves your normal install alone.

Run `/auto_patch` again whenever you update the apworld.

## Joining a MultiWorld Game

1. Type `/launch` in the client to start the patched copy
2. Connect the client to your room
3. Start a New Game

## Linux

1. Get the Windows version:
    - **Steam:** In the game's Properties -> Compatibility, check `Force the use of a specific Steam Play compatibility tool`.
    - **GOG:** Install the Windows version.
2. Follow [Installation](#installation) and [Patching the game](#patching-the-game).
3. Set up the patched copy's `Dig2.exe` in the launcher you want to use:
    - **Steam:** Add it as a Non-Steam game. In its Properties:
        - Compatibility: check `Force the use of a specific Steam Play compatibility tool`.
        - Launch Options: `WINEDLLOVERRIDES="version=n,b" %command%`
    - **Anything else:** Run it through Wine with `WINEDLLOVERRIDES="version=n,b"` set.
4. Start the game from that launcher
5. Connect the client to your room and start a New Game

## Saves

**The patched copy shares its save slots with the normal game. Never open an Archipelago save in the normal game, and
never open a normal save in the patched copy.**

If this happens, close the game and restore `savegame_00N.dat.backup` before playing on. You'll find it here:

- **Steam:** `Documents\My Games\SteamWorld Dig 2\<a number>`
- **GOG:** `Documents\My Games\SteamWorld Dig 2`

## Client commands

- `/auto_patch <directory>` - Makes the patched copy
- `/launch` - Starts the patched copy
- `/deathlink` - Turns DeathLink on or off until the client closes

## Troubleshooting

- You get the "version.dll is missing or can't be read" error.
    - Make sure that your antivirus didn't delete any files. Add your `Archipelago` install to the exclusions and restore
      any affected items.
    - **Windows Defender:**
        - Virus & threat protection settings -> Manage settings -> Exclusions -> Add your `Archipelago` install.
        - Virus & threat protection -> Protection history -> Restore any deleted files.
    - Then run `/auto_patch` again if the error is still there.
- `/auto_patch` says the folder "exists but was not made by this client".
    - This usually means an earlier `/auto_patch` was cut off. Delete the folder and run `/auto_patch` again.
