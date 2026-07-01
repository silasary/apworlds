# Setup Guide for apAdventure

## Requirements

- familiarity with Archipelago - This is not a great first introduction for people who are new to AP, I would recommend playing a few other games in AP first to get a feel for how things work.
    - Knowing how to edit YAMLs manually is a hard requirement, as this implementation features some non-standard YAML settings which the Web UI and Options Creator cannot handle.
- Garry's Mod
- Half-Life 2 (Not strictly required, but the default configs included are mainly made for HL2 maps, so you'll want it for your test run.)
- [GWSockets](https://github.com/FredyH/GWSockets/releases) - More information on which version to grab can be found further down.
- [GMAP](https://github.com/ChrisCj8/gm_ap/releases)
- [apAdventure itself](https://github.com/ChrisCj8/ap_adventure/releases)
- Other games or workshop content may also be required depending on what configs are chosen for your run, apAdventure has a requirements system that you can use to check what else you need in game, and can create a addon preset for you to download/activate required workshop items automatically.

## Installation (for Players)

1.  Install GWSockets

    1. Grab the right version of GWSockets depending on your operating system and what version of GMod you're playing.

        Whether or not you need the 32 or 64-bit version of GWSockets doesn't depend on your OS, but on whether or not you're playing on the 64-bit branch of GMod. If you don't know what that means or think you may want to switch between the two in the future you can just get both, GMod will automatically load the correct version.

        GMAP was mainly coded on GWSockets 1.3.0, 1.4.x should work but hasn't been tested much.

        Linux is also completely untested.

    2. Navigate to your GMod install folder. (Right-Click the game in your Steam Library, Manage > Browse local files)

    3. Put the .dll file(s) in the `GarrysMod\garrysmod\lua\bin\` directory. (The final path should be something like `GarrysMod\garrysmod\lua\bin\gmsv_gwsockets_***.dll`)
        - Yes, the name of these .dll files is supposed to start with `gmsv`, even if you're not installing this on a server.

2. Install GMAP and apAdventure

    1. Get apAdventure and GMAP from their releases pages. The apAdventure release entry should contain a link to whatever version of GMAP it's supposed to run alongside with.

    2. Put GMAP and apAdventure in your GMod addons folder. When everything is installed the final filesystem structure should look something like this:
        ```
        steamapps/common/GarrysMod/garrysmod/addons/
            apadventure/
                gamemodes/
                lua/
                ...
            gmap/
                lua/
                materials/
                resource/
        ```

    3. Install the apAdventure apworld like any other apworld.

    4. (Optional) After starting the Archipelago Launcher with the apAdventure apworld installed, a new folder called "gmod_apadv" should have been created in your Archipelago install directory, containing a file called "gmodpath.txt". Put the path to your GMod install folder into this file. The path should end with `../steamapps/common/GarrysMod/`.

        Doing this lets Archipelago load map configs and item sets you create in GMod directly from your data folder, meaning you won't have to copy them to your Archipelago folder every time you want to test them out.

### Recommendations

I recommend disabling all unneeded GMod addons while playing apAdventure. While apAdventure is designed to be playable alongside as many addons as possible, you will be changing between maps quite often and loading times can get very long if the player has too many addons installed.

## Hosting

### Loading Custom Map Configs and Item Sets

While apAdventure will automatically load custom Map Configs and Item Sets from the GMod data folder if the player completed step 4 of the installation instructions, the host will not be able access these if they're not the one playing apAdventure. In this case, the logic data can also be loaded from a subfolder in the Archipelago directory.

Whenever a Map Config is saved or Item Set is processed, GMod will write logic data for it to the `GarrysMod/garrysmod/data/apadventure/logic/` folder in the players GMod installation folder. This data needs to be copied to the hosts `gmod_apadv/logic/` folder in their Archipelago installation folder.

Logic data from different players can be "merged" together, as long as all Map Groups and Item Sets using the same name are identical between all players.

Note that if the host DOES have the GMod path set up in their `host.yaml` and is also loading logic data from `gmod_apadv/logic/`, the generator will prioritize loading the files from the GMod folder over the ones in the Archipelago folder. Logic data in these folders can also override the logic data included in the apworld.

## Playing

1. After the Archipelago server has been hosted, start up Garry's Mod and select the apAdventure gamemode by clicking the button in the bottom right (which should say "Sandbox" by default but may say something else if you've been playing a different gamemode) and selecting "apAdventure" from the list of gamemodes.
    - Make sure to do this while you're in the Main Menu, NOT on the map selection screen, GMod can be somewhat finnicky when selecting gamemodes like this and may end up starting the wrong gamemode.
2. Click "Start New Game".
3. If you know what your starting map is (it should be "ap_orange" with the default YAML settings), select it. Otherwise, just select any map.
    - You may have noticed that there is a "Connection Preset" option on right hand side. Just leave this empty for now.
4. Once you're in game, open the context menu by holding "C" (or whatever else you've bound it to) and click the large Archipelago icon on the left side of your screen that is labeled "Connection".
5. Enter your connection info into the window that just opened.
6. (Optional) You can save your connection info as a preset by entering a name for it in the text input field at the bottom and hitting "Save Preset". Doing this not only lets you fill the info into this window faster, it also lets you skip this window entirely by entering the name of your preset into the "Connection Preset" option in the map selection menu the next time you're starting up this gamemode.
    - The reason you can't enter this information on the map selection screen directly is because that screen does not offer a password field that hides whatever you're putting into it.
7. Hit "Connect". If you are not in the right starting map for your current run, you will be sent there automatically.
    - When reconnecting to an already started run later, you can also go straight to a map you have already visited. You will only be sent back to your starting map if you visit a map you have not reached through a level transition before. You can use this to "fast travel" to already visited maps.
8. Once connected, you can click the "Check Requirements" button to open the requirements menu. This menu lets you check if all requirements needed for your run are installed. Further explanations on how to use this menu can be found ingame.
9. (Optional, only in singleplayer) Open the console and type in `sv_pause_sp 0`.\
    GMods Lua Environment gets paused when the game is paused in singleplayer, which eventually causes the game to lose connection with the AP server. Changing this console variable stops the game from pausing when the player brings up the main menu as if they were playing in multiplayer, which prevents this.\
    The game reconnects automatically after this happens, but this is still an option if you want other players to not get spammed with (dis)connection messages.

## Making your own Configs

apAdventure adds new Toolgun modes and an editor to the Sandbox Gamemode which can be used to create Map Configs. The new tools are located in the apAdventure Tool Category and the editor can be found by opening the Context Menu (normally opened by holding "C") and clicking the Archipelago icon on the left side of the screen. More documentation for these tools is included ingame.

Configs can also have additional functionality added to them through config scripts, but this functionality is currently undocumented. These scripts are automatically loaded from `lua/apadventure/cfglua/[group name]/[map name].lua`, if you're a developer who wants to attempt to use this feature you can try referencing the existing scripts for now.

If you're a mapper who wants to make a custom map for apAdventure, the gamemode includes some custom map entities which you can place in your map to interact with Archipelago without the need for coding knowledge. A .fgd for these custom entities is included in the releases.

## Custom Items

apAdventure allows custom items to be defined through Lua, but this feature is currently undocumented. If you want to try making custom items anyways, you can reference the existing item sets in `lua/apadventure/itemsets/`. Once you have created an item set in Lua, you can process it into logic data for the generator to read through the `apadventure_editor_processitemdefs "[set name]"` command ingame. Note that this command will not work on the menu screen, it needs to be used in sandbox.

## Commands

### Any Mode

#### Console Commands
- `apadventure_save_manager` - Opens a window that lets you manage local save data from apAdventure, which is created every time you connect to a new slot in a multiworld. You should clear these out occasionally. This window can also be accessed through the apAdventure editor window in Sandbox.
- `apadventure_dump_ammotypes` - Prints out the names of all ammotypes that currently exist in the game. This mainly exists to help people figure out the names of addon-added ammo types for the `ammo_merge` YAML option.

### Sandbox

#### Console Commands
- `apadventure_patch_changelevel 0/1` - Controls whether or not apAdventure should replace `trigger_changelevel` brush entities with its own custom version, which disables its normal functionality and makes it visible to you, stopping you from accidentally triggering level transitions and making you more aware of where they are. Defaults to 0.
- `apadventure_patch_loadsaved 0/1` - Controls whether or not apAdventure should replace `player_loadsaved` point entities with its own custom version, which disables it's normal functionality. These entities normally exist to reload the game whenever the player reaches a certain fail state, which may be triggered accidentally while editing configs, causing you to lose progress. Defaults to 0.
- `apadventure_editor_allow_static_overwrite 0/1` - Allows players to save maps into map groups that also exist in data_static (the configs included with the apworld). Mainly exists to prevent people from accidentally overwriting stuff that they shouldn't. You can turn this on if you think you know what you're doing. Defaults to 0.
- `apadventure_editor_processitemdefs "[name]"` - Converts an item set defined in Lua into a JSON format so the generator can use it. You won't need this if you're not making your own item sets.

### apAdventure only

#### Chat Commands
- `/ap [any text]` - apAdventure normally prepends any chat messages players send with their ingame username, preventing them from using Archipelago chat commands. This bypasses this. May require the player to be in the (super) admin usergroup depending on what `apadv_apsay_perms` is set to.

#### Console Commands
- `apadv_apsay "[any text]"` - Functions like the `/ap` chat command, but works through the console instead.
- `apadv_apsay_perms 0/1/2` - Determines what usergroup the player needs to be in to use the `/ap` and `apadv_apsay` commands. Defaults to 1.
    - 0 - Everyone
    - 1 - (Super) Admins and Listen Host only
    - 2 - Super Admins and Listen Host only
- `adadv_slot_connect` - If connection info has already been sent to the GMod Server, (re)connects to the Archipelago Server. Does nothing otherwise. Super Admins and Listen Host only.
- `adadv_slot_disconnect` - Disconnects the GMod Server from the Archipelago Server if it's connected. Does nothing otherwise. Super Admins and Listen Host only.
