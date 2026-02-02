# Setup Guide for Dyson Sphere Program Archipelago

## Important

This version of the Dyson Sphere Program Archipelago multiworld is in very early alpha.
It has only been lightly tested, and there are no options available yet.
If you encounter any bugs, or anything else noteworthy, please report it in the DSP thread in the Archipelago Discord.

## Requirements

- Dyson Sphere Program
- BepInEx
- The DSP Archipelago mod, `DSP_AP`

## Installation

There are two methods of installation:
- Using a mod manager (preferred)
- Manual

### Mod Manager Installation

> [!NOTE]
> When a new update of the mod is released, it takes a while for it to appear in the mod manager. If you can't find the mod, this is probably why. In that case, you can either wait, or install the mod manually.

The [DSP Archipelago](https://thunderstore.io/c/dyson-sphere-program/p/Peasantsworth/DSP_AP/) mod is available on Thunderstore. To install the DSP Archipelago mod using a mod manager, follow these steps:

1. Follow the installation instructions for the mod manager of your choice (for example, r2modman or Gale)
1. Select Dyson Sphere Program in your mod manager
1. Search for `DSP_AP` in the mod manager's mod list
1. Install the `DSP_AP` mod (the dependencies will be installed automatically)
1. Launch the game using the mod manager for the mod to work

### Manual Installation

To install the DSP Archipelago mod manually, follow these steps:

1. Install BepInEx manually
    1. Download BepInEx using the Manual Download option from the [BepInEx DSP Thunderstore page](https://thunderstore.io/c/dyson-sphere-program/p/xiaoye97/BepInEx/)
    1. Extract the contents of the downloaded zip
    1. Move the contents of the BepInExPack to your DSP installation folder (for Steam installations: `...\Steam\steamapps\common\Dyson Sphere Program`)
    1. The folder structure should look like this:
        ```
        Dyson Sphere Program
        ├── BepInEx
        ├── doorstop_config.ini
        ├── winhttp.dll
        └── ...
        ```
1. Run the game once to let BepInEx set up its folders
1. Download the latest release zip file of the `DSP_AP` mod from the [mod release page](https://github.com/FHAUKEM/DSP_AP/releases/)
1. Extract the contents of the downloaded zip somewhere
1. Move the three `.dll` files to the `BepInEx/plugins` folder in your DSP installation folder (create the `plugins` folder if it doesn't exist)
1. The folder structure should look like this:
    ```
    Dyson Sphere Program
    ├── BepInEx
    │   ├── config
    │   ├── plugins
    │   │   ├── Newtonsoft.Json.dll
    │   │   ├── Archipelago.MultiClient.Net.dll
    │   │   └── DSP_AP.dll
    │   └── ...
    ├── doorstop_config.ini
    ├── winhttp.dll
    └── ...
    ```

You can now launch the game, and the mod should be loaded automatically.

## Joining an Archipelago Session

### Connecting to the server

To connect to an Archipelago session, follow these steps:

>[!CAUTION]
> Always make sure you are loaded into a game world (either a new game, PAST THE INTRODUCTION, or a loaded save) before trying to connect to the Archipelago server.

1. If the mod is installed correctly, you should see a connect dialog in the top left corner of the screen when you start the game.
1. Load into a game world (either a new game *past the introduction cutscene*, or a loaded save)
1. Fill in the connection details:
    - **Host**: The server address and port, separated by a colon (for example, `archipelago.gg:38281`)
    - **Player name**: Your player (or slot) name. This is the name you entered in the YAML
    - **Password**: The password for the session, if any
1. Click the **Connect** button
1. If the connection is successful, you should see a message in the top center of the screen indicating that you are connected.
1. You can now click the **Show** button to open the Archipelago console, where you can see messages from the server and other players, as well as send commands or chat messages.
    1. Pressing show also shows two small buttons in the top right: **Disconnect** and **Dump techs**.
    1. Pressing **Disconnect** will disconnect you from the server.
    1. The **Dump techs** button is irrelevant for normal play, and is only used for debugging. 
1. You can hide the console and extra buttons again by clicking the **Hide** button.

> [!TIP]
> If at any point, you are missing any items or checks that should've been received, first try to restart the game, load into a world, and reconnect to the server.

### Gameplay

Once connected to an Archipelago session, the gameplay is mostly the same as in a normal game of Dyson Sphere Program. Start researching the tech and upgradess as you normally would.
When you complete a research, you will not receive any rewards, and instead check a location in the multiworld.
Other players will send you items, which are the research rewards you would normally get.

### Compatibility with other mods

The DSP Archipelago mod has not been tested with other mods, and may not be compatible with them. If you can confirm compatibility or incompatibility with other mods, please let us know in the DSP thread in the Archipelago Discord.

Confirmed compatible mods:
- [BulletTime](https://thunderstore.io/c/dyson-sphere-program/p/starfi5h/BulletTime/), which is recommended for use with Archipelago

### Known issues (there's probably more)

The mod has only been lightly tested, and may contain bugs or other issues. If you encounter any, please report them in the DSP thread in the Archipelago Discord.

Most critical issues:
- If you try to connect to the server before loading into a game world, this can lead to lost items or incomplete save files.
    - These can mostly be solved by just restarting the game, loading into a (if necessary, fresh) world, and reconnecting to the server.
- If you lose connection to the server, the console will be flooded with error messages.
- Successive upgrades don't work correctly, meaning that depending on the order you receive them in, some upgrades may not work at all, or you'll receive overpowered upgrades early on.