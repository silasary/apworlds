# Another Crab's Treasure Setup Guide

## Required Software

- [Another Crab's Treasure](https://aggrocrab.com/ACT) (Steam or PC Gamepass versions)
- [Another Crab's Treasure APWorld](githublinkhere)

**Either:**

- [BepInEx (Unity Mono)](https://github.com/BepInEx/BepInEx/releases/tag/v6.0.0-pre.1)
- [Another Crab's Treasure Randomizer Mod](githublinkhere)

**OR**

- [Thunderstore Mod Manager](thunderstorelinkhere)

## Installation

There are two ways to install the randomizer mod:
- Thunderstore Mod Manager
- Manual Install

### Thunderstore

Will add info here when mod gets added to thunderstore.

If installing this way, the next step can be skipped.

### Manual Installation

Download BepInEx for **Mono** games from the link under the **Required Software** section.

Extract the contents of the .zip file into your game's directory:
- **Steam**: Steam\steamapps\common\AnotherCrabsTreasure
- **PC Gamepass**: XboxGames\AnotherCrabsTreasure\Content

Launch the game at least once after this step to allow BepInEx to initialize and finish installing.

Download the latest release of the `Another Crab's Treasure Randomizer` mod from the link under the **Required Software** section.

Place the downloaded `Archipelago` folder into `BepInEx\plugins` in your Another Crab's Treasure game directory.

Launch the game and, if everything was installed correctly, you should see a small archipelago interface in the top left corner on the main menu.

## Installing the APWorld

Download the latest release of the `anothercrab.apworld` file from the link under the **Required Software** section.

Place the `.apworld` file into the custom_worlds folder in your Archipelago install directory.

**OR**

Open the **Archipelago Launcher** and click the "Install APWorld" button. This will open a file explorer window and all you have to do is locate the `.apworld` file and open it.

## Configuring YAML Options

Once the `.apworld` file is installed, open the **Archipelago Launcher** and press "Generate Template Options."

Locate the "Templates" folder inside `\Archipelago\players` and, subsequently, locate the YAML file generated for Another Crab's Treasure.

Follow the [Archipelago Setup Guide](setupguidelinkhere) for instructions on what to do with your YAML file.

## Connecting to The Multiworld

Load up the game and you should see an archipelago interface in the top left corner on the main menu.

Input the necessary info for your multiworld and click **connect**.

Load up an empty save file and begin collecting!