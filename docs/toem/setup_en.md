# TOEM: A Photo Adventure for Archipelago Setup Guide

See [here](https://github.com/bbernardoni/Archipelago/blob/toem/worlds/toem/docs/en_TOEM_A_Photo_Adventure.md) for more details on the Randomizer itself.

## Required Software

- [TOEM: A Photo Adventure](https://store.steampowered.com/app/1307580/TOEM_A_Photo_Adventure/)
  - The Steam, GOG, Epic versions has been tested
- [BepInEx IL2CPP v6 x64](https://builds.bepinex.dev/projects/bepinex_be/738/BepInEx-Unity.IL2CPP-win-x64-6.0.0-be.738%2Baf0cba7.zip)
  - It must be specifically the IL2CPP x64 version
  - Currently you must use the bleeding edge release of v6 since the stable version does not support IL2CPP. v738 is version tested against and the one linked above.
- [Archipelago Mod for TOEM](https://github.com/bbernardoni/Archipelago.TOEM/releases/latest)

## Mod Installation

1. Download and extract [BepInEx](https://builds.bepinex.dev/projects/bepinex_be/738/BepInEx-Unity.IL2CPP-win-x64-6.0.0-be.738%2Baf0cba7.zip) into your TOEM install folder. The contents of the zip (such as the `doorstop_config.ini` file) should be next to the `TOEM.exe`. On Steam the install folder can be found by right clicking on the game "Manage > Browse local files".
2. Download and the [Archipelago.TOEM.dll](https://github.com/bbernardoni/Archipelago.TOEM/releases/latest) and copy it to the `BepInEx/plugins` folder in TOEM install folder.
3. Start the game as normal. If installed properly, a BepInEx terminal logging window will open alongside the game.

## Creating a yaml

A yaml is used to describe what options to use for your slot in the multiworld. There are two ways of creating a yaml.

### Options creator

The options creator provides a simple and easy to use UI to set your options.

1. Download the latest release of the [Archipelago launcher](https://github.com/ArchipelagoMW/Archipelago/releases/latest) if you don't have it already. Version 0.6.7 is the current minimum supported version if you do have it already.
2. Download the [apworld](https://github.com/bbernardoni/Archipelago.TOEM/releases/latest).
3. Double click on the file to install the apworld.
4. Run the launcher and open the `Options Creator`.
5. Select Toem from the list on the left.
6. Enter a player name and select your desired options. The default settings are good for a short first game. Tip: You can hover over the option titles to see their description.
7. Press `Export Options` to save the yaml file.

### Template yaml

For more advanced users, you can generate a template yaml and edit it manually.

1. See steps 1-3 above to install the launcher and apworld.
2. Run the launcher and select `Generate Template Options`. This will open a folder to the newly created templates for all installed apworlds.
3. You can now manually edit the Toem template file to your liking.
4. For advanced option choices see here: https://archipelago.gg/tutorial/Archipelago/advanced_settings_en

## Joining a Multiworld Game

1. Launch the game (if installed correctly, the BepInEx terminal window should open as well).
2. Enter your connection details on the title screen and press the connect button.
3. If successful, the "Connect & Start" button will change to "Start".
4. A new save will be created for each multiworld, leaving your vanilla save untouched.
5. Press "Start" to start the game.

## In game options

A new AP tab has been added in the options menu.

- "Unlock Cursor" - Allows the cursor to not be confined to just the game window to make it easier to multitask while playing. Note this feature was accidently enabled in previous releases, and now the vanilla behavior has been restored with an option to change it back.
- "Open Save Directory" - Opens the folder that contains the save data. All AP saves begin with "AP_".
- "Delete AP Saves" - Deletes all AP saves. Essentially deleting all folders beginning with "AP_" in the save directory beside the current save if currently connected.

## Trackers

There are two supported ways to track this game Universal Tracker and Poptracker.

### Universal Tracker (UT)

UT extends the basic text client by providing a tab that lists the locations that are currently in logic. The toem apworld improves the basic UT experience by implementing support for yaml-less, deferred entrances (unexplored entrances show up as green in the list to not spoil where they lead), and hard logic. Install instructions:

1. See steps 1-3 from the Options creator section to install the launcher and apworld.
2. Download and install the latest [UT release](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker).
3. Run the launcher and select `Universal Tracker`.
4. Enter you connection details and hit connect.

See the [UT troubleshooting discord pin](https://discord.com/channels/731205301247803413/1367270230635839539/1475320475277070427) for more help.

### Poptracker (PT)

PT provides a visual interface to track items received and locations in logic. A Toem specific Poptracker pack has been developed by culk. See the [Toem Poptracker pack README](https://github.com/culk/toem-poptracker-pack/blob/main/README.md) for more details.

- [Toem Poptracker pack latest release](https://github.com/culk/toem-poptracker-pack/releases/latest)
- [Poptracker latest release](https://github.com/black-sliver/PopTracker/releases/latest)