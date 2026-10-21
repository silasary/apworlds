# Minit Randomizer Setup Guide

## Required Software

- Minit installed
  - Tested with [Steam](https://store.steampowered.com/app/609490/Minit/), and Epic games.
  - The itch.io release is not supported currently.
- Archipelago from the [Archipelago Releases Page](https://github.com/ArchipelagoMW/Archipelago/releases)

## Configuring your YAML file

### What is a YAML file and why do I need one?

See the guide on setting up a basic YAML at the Archipelago setup
guide: [Basic Multiworld Setup Guide](/tutorial/Archipelago/setup/en)

### Where do I get a YAML file?

You can customize your options by visiting the [Minit Player Options Page](../player-options)

## Joining a MultiWorld Game

### For Connecting
* Run ArchipelagoLauncher.exe
* Open the "Minit Client" through the Launcher
* Use the top bar to enter the host and port of the Archipelago server running already
  (ex. "localhost:38281" if you are hosting it locally and your port is 38281).
* When prompted for you Slot Name, enter whatever your username in the .yaml file is,
  if left default it will likely be "Player1".
* You now have the proxy client connected to the AP server

### For Patching
* Install the Mod Loader
  * download from https://github.com/qwint/UFO-50-MOD-LOADER/releases
  * unzip the appropriate version to a reasonable location, run `minit Mod Loader` to open the Mod Loader
* Install the Minit Mod into the Mod Loader
  * download `Source code (zip)` from https://github.com/qwint/archipelago_minit_mod/releases
  * Launch the Mod Loader
  * under `Mod Loader` select `Open Mod Loader Folder`
  * Open the `Minit mods` subfolder and place the downloaded zip
* Patch the game
  * Launch the Mod Loader
  * Optional: Under `Settings` you can check `Overwrite Installed Files` to patch the source copy of the game
  * Check the installed Minit mod to include it
  * Press the `Load Mods and Launch Game` button
* Run the game
  * The previous step will automatically launch the game, but to not need to patch every time you can either
    * Use the `Overwrite Installed Files` setting and launch through your previous launcher of choice
    * Run the modded copy directly, it will be in `./workspace/Minit Modded Copy/minit.exe` from the same Mod Loader Folder as before
      * On linux the Mod Loader runs the game through `wine` so it is safe to do so manually as well
    * Open the Mod Loader and press the `Launch Game` button
