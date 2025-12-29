# Yoku's Island Adventure Randomizer Setup Guide

## Required Software

- Yoku's Island Adventure, from:
    - [GOG.com](https://www.gog.com/en/game/yokus_island_express),
    - [Epic Games](https://store.epicgames.com/en-US/p/yokus-island-express) or
    - [Steam](https://store.steampowered.com/app/334940/Yokus_Island_Express/)
- The [Yoku's Island Express Archipelago Mod](https://git.makuluni.com/Archipelago/YokuArchipelagoMod)

## Optional Software

- For sending commands: an archipelago text client.

## Installation
Download `yam-x.y.z.tgz` from the mod's [releases page](https://git.makuluni.com/Archipelago/YokuArchipelagoMod/releases), and extract it into the game folder. 

## Launching
Launch the `yam-launcher.exe` file however you normally launch the game:

### GOG
It should be enough to just click `yam-launcher.exe`, or make a shortcut, or whatever.

### Epic
It should still work to simply open `yam-launcher.exe`; the game may complain about not being launched from the Epic launcher, but it will still run.

### Steam
#### Windows
Modify "Launch Options" to read:
```bash
"C:\...\yam-launcher.exe" %COMMAND%
```
Replace `C:\...\yam-launcher.exe` with the correct full path to `yam-launcher.exe`.

Alternatively, you can add `yam-launcher.exe` as a non-steam game.

#### Linux
NOTE: I have not been able to test this code successfully on steam in linux. You're welcome to try it; YMMV.

On steam in linux, you will have to get proton to run `yam-launcher.exe`. Create the following script in the game folder:
```bash
#!/bin/bash
"${@:1:$#-1}" "$STEAM_COMPAT_INSTALL_PATH"/yam-launcher.exe
```
Make it executable, then set your game's "Launch Options" to:
```bash
./yam-proton.sh %COMMAND%
```
Replace `yam-proton.sh` with the name of the script file.

## Opening a game and connecting to a server.
To open an archipelago game from the main menu:
  1. Select "Continue"
  2. Select an empty slot
  3. Select "Randomize mode"
  4. Set the difficulty to "Very Hard" (this does not depend on the configuration you set when you generated the world.)
  5. Choose any start option.
  6. When the beginning animation ends, the game will ask you if you want to load an APWorld. Select "Yes".
  7. The game will then prompt you for server/slot/password.

