# A Link Between Worlds Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases).
- A decrypted, North American A Link Between Worlds `.3ds` ROM. Instructions for dumping your ROM can be found [here](https://wiki.hacks.guide/wiki/3DS:Dump_titles_and_game_cartridges). **Make sure to select "decrypt" when dumping.** Note: for use with the Azahar emulator (below), rename the `.3ds` ROM to a `.cci` file. These files are identical, only the extension is different.
- [Azahar](https://azahar-emu.org/pages/download/)
- **The game must be played with the language set to English.**

## Installation

1. Install the latest version of Archipelago.
2. Download `albw.apworld` and put it in your `Archipelago/custom_worlds/` folder.
3. In the emulator, select `File > Open Azahar Folder`. Create a `load` folder inside this folder, and inside the `load` folder create a `mods` folder.
4. Also in the emulator, select `Emulation > Configure`. Then, in the general section, on the top, select `Debug`. Finally, at the bottom, ensure that the `Enable RPC Server` option is enabled.

## Generating a Game

1. Create your player options YAML file. A sample YAML is included.
2. Gather the YAMLs of all players into the `Archipelago/Players` folder.
3. Run the Archipelago Launcher and select Generate.
4. A zip file will be created in the `Archipelago/output` folder. Upload this to [the Archipelago website](https://archipelago.gg/uploads) to host your game.
5. Inside the zip file is a `.apalbw` file. You will need this file to play the game.

## Playing a Game

1. The host will give you a `.apalbw` file. Drag and drop this file onto the Archipelago Launcher. Alternatively, run the Launcher, click Open Patch, and select your `.apalbw` file.
2. Enter the path to your A Link Between Worlds ROM when prompted. Wait about 20 seconds for the game to patch.
3. This will do two things. First, it will open the A Link Between Worlds client. Second, it will create a zip file with the same name and directory as the patch file. Unzip this file; it contains a folder named `00040000000EC300`.
4. Place the `00040000000EC300` folder inside the `load/mods/` folder you created. (If there is already a folder with this name from a previous randomizer, delete it first.)
5. Run A Link Between Worlds in the emulator. The client should automatically connect to the emulator.
6. Enter the server URL into the client and press Connect.

## Resuming a Game

1. Run the Archipelago Launcher and select the A Link Between Worlds client.
2. Run A Link Between Worlds in the emulator. The client should automatically connect to the emulator.
3. Enter the server URL into the client and press Connect.
