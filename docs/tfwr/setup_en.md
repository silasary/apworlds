# The Farmer Was Replaced Randomizer Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [Steam: The Farmer Was Replaced](https://store.steampowered.com/app/2060160/The_Farmer_Was_Replaced/)
- [The apworld](https://github.com/seadoggie001/TFWR-APMod/releases/latest)

## Preparing to play

### Installing The Farmer Was Replaced

Purchase and install The Farmer Was Replaced. Launch the game at least once to create the required paths to the game.
Close the game before installing.

### Installing BepInEx

The mod for the game requires BepInEx. BepInEx has their
own [installation instructions](https://docs.bepinex.dev/articles/user_guide/installation/index.html)

Install a stable version starting with 5 (I used 5.4.23.4) and use the Win x64-bit executable version (even when using
Proton on Linux).

The game folder, by default, is located:

- Windows: `%AppData%\Steam\steamapps\common\The Farmer Was Replaced\`
- Linux: `/home/<username>/.local/share/Steam/steamapps/common/The Farmer Was Replaced/`

Note - Linux users will also need to add a command line parameter to Steam's launch options:
`WINEDLLOVERRIDES="winhttp.dll=n,b" %command%`

Launch the game and a folder should be created in the game folder named `BepInEx`.

### Installing the mod

1. Download the mod: [TFWR-AP Mod](https://github.com/seadoggie001/TFWR-APMod/releases/latest)
2. Locate the mod folder. This is the game folder as described above followed by `BepInEx/plugins/TFWRArchipelago/`
    - when first installing the mod, you need to create the `TFWRArchipelago` folder
    - when updating, delete the contents of this folder first
3. Unzip the mod. Copy the contents to the mod folder.
4. Launch the game

## Setting up Archipelago

### Create a room
First, you need a room to connect to. For this, you or someone you know has to generate a game. This will not be
explained here, but you can check the [Archipelago Setup Guide](/tutorial/Archipelago/setup_en#generating-a-game).

You also need to have [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest) installed
and [the apworld](https://github.com/seadoggie001/TFWR-APMod/releases/latest) installed into Archipelago.

### Creating your Config (.yaml)

#### What is a config file and why do I need one?

Your config file contains a set of configuration options which provide the generator with information about how it
should generate your game. Each player of a multiworld will provide their own config file. This setup allows each player
to enjoy an experience customized for their taste, and different players in the same multiworld can all have different
options.

#### Where do I get a config file?

Launch the Options creator and select The Farmer Was Replaced as the game. Fill in options as you'd like.

## Connecting to Archipelago

Once the mod is correctly installed, the game will display a crossed out Archipelago icon in the bottom right corner
indicating you are not connected to the server. Open the Load menu and use the "New AP" button to create an Archipelago
game. Optionally rename the game. Click on the button to open the connection options. Here you'll be able to enter
information about your slot.

- Archipelago URL: if hosting locally, this will be `localhost`. Otherwise, this will be a URL like `archipelago.gg`
- Archipelago Port: the port being used. Do not enter the port in the Archipelago URL box.
- Username: the name you entered as your Player Name in your config file
- Password: (optional) the password for your room. Leave blank if you didn't assign or receive one.

These options are saved locally and show the last entered options. Press the button to submit to Archipelago.

After a successful connection, the AP icon will update and the connection dialog can be closed.