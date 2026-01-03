# Easy Delivery Co. Randomizer Setup Guide

## Required Software

- [Easy Delivery Co.](https://store.steampowered.com/app/3293010/Easy_Delivery_Co/) for PC
- [Easy Delivery Co. Randomizer Mod](https://github.com/Aeromaze/EasyDeliveryAP)
- [BepInEx 5.4.23.4 (win_x64)](https://github.com/BepInEx/BepInEx/releases/tag/v5.4.23.4)
- [Easy Deliver API](https://github.com/foxfoxfoxgay/EasyDeliveryAPI/releases/tag/1.0.0)

## Optional Software
- [Archipelago Text Client](https://github.com/ArchipelagoMW/Archipelago/releases/latest)

## Installation

### Find Your Relevant Game Directories

Find your Easy Deliver Co. game installation directory:

- **Steam**: Right click Easy Delivery Co. in your Steam Library, then *Manage → Browse local files*.<br>

### Install BepInEx

BepInEx is a general purpose framework for modding Unity games, and is used to run the Easy Delivery Co. Randomizer.

Download [BepInEx 5.4.23.4 (win_x64)](https://github.com/BepInEx/BepInEx/releases/tag/v5.4.23.4)

If playing on Steam Deck, following this [guide to set up BepInEx via Proton](https://docs.bepinex.dev/articles/advanced/proton_wine.html) might work.

If playing on Linux, you may be able to add `WINEDLLOVERRIDES="winhttp=n,b" %command%` to your Steam launch options. If this does not work, try following the guide for Steam Deck above.

Extract the contents of the BepInEx .zip file into your Easy Deliver Co. game directory:<br>
- **Steam**: Steam\steamapps\common\Easy Delivery Co<br>

Launch the game once and close it to finish the BepInEx installation.

### Install The Easy Delivery Co. Randomizer Mod

Download the latest release of the [Easy Delivery Mod](https://github.com/Aeromaze/EasyDeliveryAP) and the latest release of the [Easy Deliver API](https://github.com/foxfoxfoxgay/EasyDeliveryAPI/releases/tag/1.0.0).

Extract the contents of the downloaded .zip files, and find the folders labeled EasyDeliveryAP and BepInEx

Copy the `EasyDeliveryAP` folder into `BepInEx/plugins` in your Easy Delivery Co. game installation directory.
Copy the `BepInEx` folder into your Easy Delivery Co. game installation directory.

The filepath to the mode should look like `BepInEx/plugins/EasyDeliveryAP/EasyDeliveryAP.dll`<br>

Launch the game, and if everything was installed correctly you should see `EasyDeliveryAP vx.y.z` in the top left corner.
