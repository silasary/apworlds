# Neon White Setup Guide

## Requirements
- The **Steam** version of [Neon White](https://store.steampowered.com/app/1533420/Neon_White/) 
  - Xbox/Gamepass version *might* work, but will never be guaranteed.

## Mod Installation/Configuration

1. Download [MelonLoader](https://github.com/LavaGang/MelonLoader/releases/latest) and install **specifically v0.6.1** onto your `Neon White.exe`.
    - If on Linux, ensure that you set the environment variable for `WINEDLLOVERRIDES` by setting your launch arguments similar to `WINEDLLOVERRIDES="version=n,b" %command%`.
2. Run the game once. This will create required folders.
3. Download and follow the installation instructions for [NeonLite](https://github.com/Faustas156/NeonLite).
    - NeonLite is **required** for this mod.
    - **Take notice of the steps regarding the preferences manager and UniverseLib!!!!**
4. Download `NWArchipelago.dll` from the [Releases page](https://github.com/stxticOVFL/NWArchipelagoMod/releases/latest) and drop it in the `Mods` folder.
5. Additionally download `Archipelago.MultiClient.Net.dll` from the release and drop that in the *`UserLibs`* folder.
    - If you've already done this, there's usually no need to do it again.
6. Re-open the game and press **`F5`** (by default) to open the preferences menu.
7. Enable the mod in the Archipelago category and input your IP address, port, slot name, and password in Archipelago/Connection.
8. Relaunch your game one more time and enjoy!
    - Click through the preferences menu settings to configure the tracker and other settings to your liking!
    - Some settings only show up when the mod is enabled. 

## Archipelago Setup

1. Download the [Archipelago Launcher](https://github.com/ArchipelagoMW/Archipelago/releases/latest) for your preferred operating system.
2. Download the [latest APWorld](https://github.com/Badhamknibbs/ArchipelagoNeonWhite/releases/latest).
3. Launch the Archipelago Launcher and drag the .apworld file into the client. Restart the Archipelago Launcher after installing the apworld.
4. You can then generate a options configuration for yourself using one of the following two methods:
    - Press the "Options Creator" on the Launcher. Select Neon White on the left hand side of the screen that pops up and select all your preferred options. Finally, press export options and save it.
    - Press the "Generate Template Options" on the Launcher which will create .yaml's for all your installed .apworlds. Look for the 'Neon white.yaml' file, this will be the file you edit for your options.
5. Take the file that you generated in step 4 and place it in your Archipelago 'Players' folder alongside any other YAML that you will be using for your multiworld.
    - See the [below section](#what-is-a-yaml-and-why-do-i-need-one) for more explanation on this file.
6. Go back to the Archipelago Launcher and press generate. A script will run that will generate your multiworld seed and place a .zip file into your Archipelago 'output' folder.
7. You can then upload the zip to host the game as you wish. Archipelago's upload hosting page can be found [here](https://archipelago.gg/uploads).

### What is a YAML and why do I need one?
You can see the [basic multiworld setup guide](https://archipelago.gg/tutorial/Archipelago/setup/en) on the Archipelago website to learn
about why Archipelago uses YAML files and what they're for.
Please note that Neon White only allows you to type certain characters for your slot name.
These characters are: `` !#$%&'()+,-.0123456789;=@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_`abcdefghijklmnopqrstuvwxyz{}~<>|\/``

### Where do I get a YAML?

Refer back to step 4 of the [Archipelago Setup](#archipelago-setup).
