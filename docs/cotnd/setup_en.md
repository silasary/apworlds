# Crypt of the NecroDancer Setup Guide

## Required Software
- [Latest release of Archipelago Multiworld Suite](https://github.com/ArchipelagoMW/Archipelago/releases). 
- [Crypt of the NecroDancer](https://store.steampowered.com/app/247080/Crypt_of_the_NecroDancer/)
- [Crypt of the NecroDancer: SYNCRHONY expansion](https://store.steampowered.com/app/2094810/Crypt_of_the_NecroDancer_SYNCHRONY/)

## Setup process
1. Download and install the latest release of Archipelago Multiworld from the link above.
2. Take the APWorld downloaded from the [releases](https://github.com/lastingParadox/Archipelago-CotND/releases/latest) page and place it in your `custom_worlds` folder located in your Archipelago install directory.
3. Head over to your NecroDancer game directory and access the `Necrodancer64` folder.
   - Steam: You can access this via right-clicking your game in your library, hovering over "Manage" and selecting "Browse Local Files".
   - Steam File Directory: `Steam\steamapps\common\Crypt of the NecroDancer\Necrodancer64`
4. Modify `config.json`, adding the following strings to the end of the `scriptWhitelist` property: `"system.file.Storage"` and `"system.network.Client`. An example is provided below.
   ```json
   "scriptWhitelist": ["necro.*","system.game.Audio","system.game.Bitmap","system.game.Entities","system.game.FileIO","system.game.Graphics","system.game.Input","system.network.IPC","system.events.*","system.gfx.*","system.i18n.*","system.utils.*","system.file.Storage","system.network.Client"]
   ```
5. Head over to your NecroDancer local data directory and insert the mod downloaded from the [mod page](https://mod.io/g/crypt/m/ap) into your `downloadedMods` folder. A list of file directories for this manual install are provided.
   - Note that you can skip this step if you want to use the in-game mod browser. Just search "Archipelago Redux" and install.
   - Windows: `%LOCALAPPDATA%\NecroDancer`
   - Mac: `~/Library/Application Support/NecroDancer`
   - Linux: `~/.local/share/NecroDancer`

6. Start the game up and access the menu with the `esc` key. Select `Customize` and then `Mods`. Enable the `ArchipelagoMod` mod.

7. Provided you've followed the setup guide correctly, you should now see a new trap in the lobby labelled "Archipelago".
    - If you do not see this trap after fixing a previous step, be sure to either restart your game or restart the lobby.

## Create a Config (.yaml) File

### What is a config file and why do I need one?

Your config file contains a set of configuration options which provide the generator with information about how it
should generate your game. Each player of a multiworld will provide their own config file. This setup allows each player
to enjoy an experience customized for their taste, and different players in the same multiworld can all have different
options.

### Where do I get a config file?

Run the `ArchipelagoLauncher.exe` from your Archipelago install and click `Generate Template Options`.
This will produce a `/Players/Templates` folder in your Archipelago install, which contains default config files for 
every game in your `custom_worlds` folder. You can manually edit the config file using a text editor of your choice.

In addition, a template YAML file is provided on the [releases](https://github.com/lastingParadox/Archipelago-CotND/releases/latest) page.

### Verifying your config file

If you would like to validate your config file to make sure it works, you may do so on the
[YAML Validator](/mysterycheck) page.

## Generating a Game

1. After modifying your YAML, place it into your `Archipelago/Players` folder
   - Alternately, navigate to the [Player Settings](../player-settings) page, configure your options,
      and click the "Generate Game" button.
   - If you are hosting a multiplayer session, make sure to place the other players' YAML files into this folder as well. If they are playing games that are not officially supported, you will need to include their game's `.apworld` in your `custom_worlds` folder.
2. Once you've added all the Open the Archipelago Launcher and click "Generate". This will create a zip file in `Archipelago/output`.
3. Navigate to the Archipelago website and go to the Host Game page
4. Click upload file and pass it the .zip created in your output folder
5. Click the "Create New Room" link.
6. Open up your CotNDClient from within your Archipelago Launcher
   - If you don't see the client in the Archipelago Launcher you did not properly set up the APWorld into `custom_worlds` folder, make sure it is the only one present and there isn't another `cotnd.apworld` inside your `custom_worlds`.
7. In the server page, there will be a port number. Copy this port number into the top of your CotNDClient. 
   - The field should read `archipelago.gg:<port number>`
8. Once you have loaded into the game, click the `Connect` button at the top of the CotNDClient. Once it says you are connected you'll need to type in the slot name you've input into your YAML.
9. Once the client recognizes the slot name you've entered, you're free to start playing. Head over to the Archipelago trap in the lobby and select "Connect".