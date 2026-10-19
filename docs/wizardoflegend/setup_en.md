# Wizard of Legend Setup Guide

## Required Software

- [Wizard of Legend](https://store.steampowered.com/app/445980/Wizard_of_Legend/) on PC.
- [BepInEx 5.x](https://github.com/BepInEx/BepInEx/releases).
- [Wizard of Legend Archipelago Mod](https://github.com/Skelrin/WoLArchipelago/releases).

## Installation

### 1. Locate Your Game Directory

Find your Wizard of Legend installation directory:
* **Steam:** Right-click **Wizard of Legend** in your Steam Library → *Manage* → *Browse local files*.

### 2. Install BepInEx

1. Download the BepInEx 5.x `.zip` file.
2. Extract the contents of the `.zip` file directly into your Wizard of Legend game directory (the folder containing `WizardOfLegend.exe`).
3. Launch the game once so BepInEx generates its required `plugins` folder, then close the game.

### 3. Install the Archipelago Mod

1. Download the latest mod `.zip` release from [GitHub](https://github.com/Skelrin/WoLArchipelago/releases).
2. Extract the contents and place the mod files into the `BepInEx/plugins` folder inside your game directory.
3. Launch the game.

## Joining a MultiWorld Game

1. Launch Wizard of Legend.
2. On the main title screen, click **CONNECT TO ARCHIPELAGO**. 
   * *Note: You can press **F1** at any time during gameplay to open the connection popup, which is highly useful if you need to reconnect mid-run.*
3. Enter your connection details in the popup:
   * **Host / Server IP**
   * **Port**
   * **Slot Name**
   * **Password** (if required)
4. Click **Connect**. Once connected, your slot options and progress will load automatically.

## Configuring your YAML File

### What is a YAML?
Refer to the [basic MultiWorld setup guide](https://archipelago.gg/tutorial/Archipelago/advanced_settings_en) on the Archipelago website to learn about YAML files and how they configure your game options.

### Where do I get a YAML?
You can find the default YAML template included in the [mod's GitHub releases](https://github.com/Skelrin/WoLArchipelago/releases). Alternatively, you can generate a template YAML using the Archipelago Client Generate Template Option.