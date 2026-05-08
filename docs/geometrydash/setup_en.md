# Geometry Dash Archipelago Setup Guide

## Required Software

- Geometry Dash
    - [Buy on Steam](https://store.steampowered.com/app/322170/Geometry_Dash/)
    - Linux users must use Proton.
    - macOS users must use Wine/Whisky, Parallels or CrossOver, as the mod does not support the native version. Sorry!
    - Android is not supported.
    - iOS is not supported.
- [Geode for Windows](https://geode-sdk.org/install/)
- Visual C++ Runtime (can be installed through the Geode installer)
- [ArchipelagoGD](https://github.com/matorblal-byte/ArchipelagoGD2) (read the instructions before downloading!)
- [Geometry Dash APWorld](https://github.com/matorblal-byte/ArchipelagoGD2/releases/latest)

## Instructions

### Installing ArchipelagoGD

1. Download the Geode installer and run it. **Do not uncheck the Visual C++ Runtime!**
    - If you are on Linux, you may do the manual install or run the installer through Wine or Protontricks.
    - If using Whisky on macOS, run the installer in the same bottle in which the game is installed in. 

2. Open Geometry Dash through Steam. You should now see the Geode button on the bottom menu.
    - If you are on Linux, you may need to set your launch options to `WINEDLLOVERRIDES="xinput1_4=n,b" %command%` if Geode doesn't load.

3. Install the mod. There are 2 ways to do this:
    - (Recommended) Search for **ArchipelagoGD** in the Geode Index and download it.
    - If the mod isn't available on the index, download the mod from the [GitHub releases](https://github.com/matorblal-byte/ArchipelagoGD2/releases/latest) (you need `1257plays.archipelagogd.geode`) and copy it to `geode/mods` in your game files.

4. Restart your game. If you see the Archipelago button on the top right corner of your main menu, you're good to go!

### Connecting to a MultiWorld

1. Click the Archipelago button on the top right corner. A popup with multiple text fields should open.

2. Fill the URL and Slot fields correctly. If your MultiWorld has a password, you may add it to the password field, otherwise keep it empty.

3. Click the `Connect` button on the bottom of the popup. You should see another confirmation popup with the info you inserted.

4. Your game will now be in Archipelago mode and connect to the MultiWorld. You may now start playing!

- If you're unsure if you're connected, click the Archipelago button again and it will show information about the world you're currently on.
- The game will open on a fresh save file. Don't worry, your original save is intact.
- If anything goes wrong, a popup will show up in the main menu with more information and the game will restart in normal mode.

### Disconnecting from a MultiWorld

Simply restart the game. It's that simple.

### Mod compatibility

Due to the nature of ArchipelagoGD, some mods may be incompatible with it. Although some mods will probably work fine, I do not recommend the usage of the following mods while connected to a MultiWorld:

- BetterProgression by ItzKiba
- Main Level Pages by Capeling
- Backups by HJfod
- Globed by dank_meme (can probably work, but can break some things and can be used to completely break progression)


Mods that are **fully incompatible** have been configured to not load along with ArchipelagoGD.

GitHub: The .apworld is literally just a zip lol
