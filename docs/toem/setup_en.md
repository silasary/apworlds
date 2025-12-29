# TOEM: A Photo Adventure for Archipelago Setup Guide

See [here](https://github.com/bbernardoni/Archipelago/blob/toem/worlds/toem/docs/en_TOEM.md) for more details on the Randomizer itself.

## Required Software

- [TOEM: A Photo Adventure](https://store.steampowered.com/app/1307580/TOEM_A_Photo_Adventure/)
  - Only the Steam version has been tested
- [BepInEx IL2CPP v6 x64](https://builds.bepinex.dev/projects/bepinex_be)
  - It must be specifically the IL2CPP x64 version
  - Currently you must use the bleeding edge release of v6 since the stable version does not support IL2CPP. A direct download for the version tested against can be found [here](https://builds.bepinex.dev/projects/bepinex_be/738/BepInEx-Unity.IL2CPP-win-x64-6.0.0-be.738%2Baf0cba7.zip).
- [Archipelago Mod for TOEM](https://github.com/bbernardoni/Archipelago.TOEM/releases/latest)

## Installation

1. Download and extract [BepInEx](https://builds.bepinex.dev/projects/bepinex_be/738/BepInEx-Unity.IL2CPP-win-x64-6.0.0-be.738%2Baf0cba7.zip) into your TOEM install folder. On steam the install folder can be found by right clicking on the game "Manage > Browse local files".
2. Start Toem once so that BepInEx can create its required configuration files.
3. Download and extract the [Toem Archipelago Mod](https://github.com/bbernardoni/Archipelago.TOEM/releases/latest) into the `BepInEx/plugins` folder in TOEM install folder.

## Joining a Multiworld Game

1. Launch the game (if installed correctly, the BepInEx terminal window should open as well).
2. Enter your connection details in the text boxes at the top right and hit connect.
3. If successful, the connection details box will now display the "Connected" status.
4. If you already have a previous save, the "New Adventure" menu will pop up. If achievements are randomized, the "Reset in-game achievements" option should already be turned on. Hit yes to reset your save.
5. Start the game normally.