
# Setup Guide for Arzette Archipelago

## Patch the game files

- Before you begin, please ensure your Arzette game install files are untouched. Verify this on Steam by right clicking `Arzette: The Jewel of Faramore` in your Steam Library (or clicking the gear icon on the Library's game page) and selecting `Properties`. Then, select `Installed Files`. Next, click `Verify integrity of game files`. After this finishes, you should be ready to install this patch.

- Locate your Steam game folder. You can normally access it by right clicking `Arzette: The Jewel of Faramore` in your Steam Library (or clicking the gear icon on the Library's game page), and clicking `Manage > Browse local files`. On Windows, it is normally located at `C:\Program Files (x86)\Steam\steamapps\common\Arzette The Jewel of Faramore`.

- [OPTIONAL] For an easier switch between the randomizer and the vanilla version of the game, make a copy of `Arzette.exe`, `data.win` files and the `textures` folder. I recommend naming them `Arzette_original.exe`, `data_original.win` and `textures_original`, respectively. Make sure you make a copy and not simply renaming them.

- Download the file `Arzette AP Client Patch 1.0.zip` from the latest release on the [releases page](https://github.com/nicolasberube/Arzette_Randomizer/releases) and extract the .zip file.

- Move the content of `Arzette AP Client Patch 1.0` directly in the Steam game folder. Do not move the whole folder itself, only copy the files inside. Yes, this implies adding 25 files to a busy folder. Every files you moved (including `apply_patches.bat`) should be in the same folder as `Arzette.exe`.

- Download the latest xdelta3 for Windows [here](https://github.com/jmacd/xdelta/releases) and extract the .zip file.

- Move the file `xdelta3.exe` to the Steam game folder with the other files.

- Make sure the game is not running, then double click the `apply_patches.bat`. If you have a security warning pop up, click `Run`.

- The patches should be completed automatically.

## Set up an Archipelago seed and server

If you already know how to generate an Archipelago seed with an .apworld file, you can download the latest .apworld version from the [releases page](https://github.com/nicolasberube/Arzette_Randomizer/releases) and skip this section straight to [setting up the client](#set-up-the-client-connection-information).

- If you do not have Archipelago installed, download the latest stable release of Archipelago for Windows [here](https://github.com/ArchipelagoMW/Archipelago/releases). This randomizer has been tested with the release version 0.6.7. You want the file `Setup.Archipelago.[VERSION].exe`.

- Run the `Setup.Archipelago.[VERSION].exe` file. Follow all the steps until Archipelago is installed on your computer.

- Download the latest `arzette.apworld` and the `template.yaml` file from the [releases page](https://github.com/nicolasberube/Arzette_Randomizer/releases)

- In the main Archipelago folder (where you installed Archipelago from the Setup file), put the `arzette.apworld` in the `custom_worlds` folder, and the `template.yaml` in the `Players` folder.

- You can edit the `template.yaml` file to set up the options of your randomizer seed. The important part to be aware of is the line that says `name: Player{number}`, which you can change for your own name. If you generate a multiworld with more than one player, simply include a different yaml file in the `Players` folder for each world. Every player must have a different name.

- In the Archipelago folder, double click to run `ArchipelagoGenerate.exe`. If everything goes well, it will create a file named `AP_[NUMBERS].zip` in the `output` folder.

- Host the seed
    - If you want to host the seed online (necessary for multiworld), you can go on the [archipelago website](https://archipelago.gg/uploads), click `Upload File` to upload the newly created `AP_[NUMBERS].zip`, and click on `Create New Room`. Once the room is created, take note of the port number on the top of the page, in the form of `/connect archipelago.gg:[PORT_NUMBER]`.
    - If you want to play by yourself and host the seed locally, just extract the `AP_[NUMBERS].zip` file, and double click on the `AP_[NUMBERS].archipelago` file. This will start a local server.

- Note your connection information. Those consist of four things: your player name (as defined in the yaml file), a password (normally defaulting to an empty field), the server (`archipelago.gg` if you host online, or `localhost` of you host locally) and the port number (identified on the room page if you host online, or `38281` if you host locally).

### Universal Tracker set up

The following is optional but helps to avoid getting lost while playing the game.

- In the Archipelago folder, open the `ArchipelagoLauncher.exe`. In the Launcher's Search bar, type `Universal Tracker` and then click Open. This will open the Universal Tracker in a new window, after which you can close the Launcher window.

- In the Universal Tracker, enter your server information on the top in the form of `[SERVER]:[PORT_NUMBER]` (for example, `localhost:38281`), and click `Connect` on the top right. Then, on the Archipelago tab, it should prompt you `Enter slot name:` after which you can enter your player name on the bottom.

- Once connected, you can see every available location to check in the randomizer on Tracker Page tab of the Universal Tracker.

- If a location is hard to find (for example, an item given by an NPC where you don't know where the NPC is), you can type in the console (the Archipelago tab) the command `/get_logical_path [NAME OF THE LOCATION]` (for example: `/get_logical_path Dungeon Key (from Alven)`) to find out in which level it is located.

## Set up the client connection information

- Find the save files folder of the game. On Windows, it is normally located on `C:\Users\[USER]\AppData\Local\Arzette`.

- You do not need to back up your save file `savedata.ini`. The Archipelago save file will be separate as `savedata_rando.ini`. Note that if you play multiple players on the same seed, there will be save file conflicts and you will need to manage them manually.

- Start the game either from Steam, or by double clicking on your now patched `Arzette.exe` in your Steam game folder.

- Upon booting the game, a pop-up will appear asking you for Archipelago connection information. This information will be saved under `apconfig.txt` in the save files folder. To change connection information, you can either press Y on the title screen (you will need to reboot the game after entering the new information there), or directly modify the `apconfig.txt` file, or delete the `apconfig.txt` file and enter the new information when rebooting the game.

- Sometimes, the game will not boot if the connection information is wrong. If this is the case, delete the `apconfig.txt` file in the save files folder and try again.

- Sometimes, you might not receive all your items on your first connection. On your very first connection to a seed, after you select New Game, it is recommended to reboot the game. It should work properly after that.

- If you want to change the difficulty in the middle of a playhrough, you can try to start a New Game at the desired difficulty, and then rebooting the game to resync with the server and receive your items. You can also simply manually edit the `[difficulty]` part of `savedata_rando.ini`. While I would recommend the latter, both those methods have not been thoroughly tested.

- If you have another syncing problem, try closing the game and relaunching it to resync with the server.

- If you still have problems, you can always manually edit `savedata_rando.ini` to give yourself an item. But if you find a way to reproduce that bug, please report it (keep all the yaml used to generate the seed and the `AP_[NUMBERS].zip` file) to the Archipelago Discord server or to this project's maintainer.

## Switching between randomizer and vanilla

- If you backed up your original files as directed during the mod installation
    - Rename your patched files `Arzette.exe`, `data.win` and the `textures` folder from the game folder. I recommend renaming them `Arzette_rando.exe`, `data_rando.win` and `textures_rando`, respectively.
    - Rename your original files `Arzette_original.exe` to `Arzette.exe`, `data_original.win` to `data.win` and `textures_original` to `textures`. The game should now revert to its vanilla state.
    - To revert back to playing the randomizer, just revert back the previous 2 steps.

- If you didn't back up your files, you can uninstall the mod by simply verifing the integrity of game files through Steam as described [here](#patch-the-game-files).

## More info

Make sure to read the [Randomizer Information](en_Arzette.md) page for more information, techniques and known bugs about this randomizer.