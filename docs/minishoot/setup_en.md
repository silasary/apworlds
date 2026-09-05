# Minishoot' Adventures Multiworld Setup Guide

## Quick Links

- Minishoot' Adventures: [Steam](https://store.steampowered.com/app/1634860/Minishoot_Adventures/)
- Archipelago Mod: [GitHub](https://github.com/TheNooodle/MinishootRandomizer), 

## Setup

The following installation instructions are for Windows systems. For Linux and MacOS, see [here](https://github.com/TheNooodle/MinishootRandomizer/blob/main/docs/players/installation.md).

Please note that the Gamepass version of the game does NOT work with this Randomizer.

* Download the [latest BepInEx 5 release here](https://github.com/BepInEx/BepInEx/releases/tag/v5.4.23.2).
    * BepInEx 6 will **not** work.
    * Choose the right version depending on your machine architecture (in 99% of the case, choose "BepInEx_win_x64_5.4.23.2.zip")
* Extract the BepInEx archive content into the root of the game directory
    * e.g. on Windows, you should have a `BepInEx` folder alongside `Minishoot.exe`, in a folder called `Windows`.
* Launch the game a first time. This will allow BepInEx to create all necessary files. You can close the game afterwards when you arrive at the main menu.
* **IMPORTANT** : For the randomizer to work, you need to modify the configuration file of BepInEx. Once the game is closed, go to `<game-root-directory>/BepInEx/config` and edit the `BepInEx.cfg` file (for example, with Notepad).
    * After that, search for the line containing `HideManagerGameObject` (it should be near the top of the file by default), and ensure that its value is set to `true`.
* Download the randomizer [here](https://github.com/TheNooodle/MinishootRandomizer/releases).
* Extract `MinishootRandomizer.zip` in `<game-root-directory>/BepInEx/plugins`.
    * You should have a `MinishootRandomizer` directory in the `plugins` folder, with some `.dll` files in the former.
* Launch the game. Once on the title screen, you should see a window in the top-left titled "Randomizer Menu". This means the mod was successfully installed.
    * Please note that the game might be slower to start, due to the randomizer doing some bootstrapping work before letting the game start.

## Connecting

* Before joining a server, you should backup your saves (if you want to keep your vanilla progress).
    * If by mistake you load your vanilla save file while being connected to an AP server, the server will send all items belonging to you, effectively making you overpowered.
    * A future update will save connection infos per save file, avoiding this issue.
    * On Windows, your save files are located at `%appdata%\LocalLow\SoulGame\Minishoot`
* Launch the game, go over to the title screen.
* In the window on the top left, enter the address, your slot name and optionally the room password.
* Press `Connect`.
    * If you cannot connect to the server (timeout, bad credentials...), you will be given an error.
* You should see `Connected` written.
* Start a new save file (or continue an existing one).
* Enjoy !
