## Required Software

- Current Release TCG Card Shop Simulator, on any platform that supports BepInEx with at least v5.4 or newer.
- BepInEx v5.4 or newer. BepInEx is either installed with a mod manager, or [installed manually](https://github.com/BepInEx/BepInEx/releases/tag/v5.4.23.2)
- [The matching apworld file and client mod file.](https://github.com/FyreDay/Archipelago-TCGCardShopSimulator/releases) This is either installed via mod manager or manually.

  - **The Client plugin mod has to match the apworld version for the randomizer to work.**
  - If you want to play pre-release test builds, you'll also need to install the client plugin mod manually.

## Setup (Mod Manager)

If you don't currently have TCG Card Shop Simulator modded, You have two options. You can install BepInEx and the randomizer plugin through a mod manager like Thunderstore/r2modman/Nexus Mods, or you can install BepInEx manually. Skip the Mod Manager section if you want to install manually.

**Pick one of the three mod managers to use.**

Selecting mod managers is mostly personal preference. There may be more mod managers out there that support TCG. While not tested, if they support BepInEx 5.4 or newer, they should work.

### Thunderstore/r2modman

Download the [Thunderstore](https://www.overwolf.com/app/thunderstore-thunderstore_mod_manager) *or* the [r2modman](https://thunderstore.io/c/timberborn/p/ebkr/r2modman/) app and install it.
- Open the app and type in "TCG" into the search bar. Select the game.
- Create a profile, if you wish, or just click on **Select Profile** to use the Default profile.
- Click on the **Get Mods** (Thunderstore) or **Online** (r2modman) button on the left menu. Find **TCG_AP_Client** and click Download.

  - This should also prompt you to install BepInExPack, which handles the BepInEx installation automatically.

    - Both apps also optionally support installing the Archipelago mod manually from the **Settings** menu, and the **Import local mod** option. Point to the .zip mod file to install it manually. This is the only way to install prerelease builds of the randomizer through the app.
  - In the app, use the **Config editor** menu to select "Edit Config", select "Chainloader", and set the `HideManagerGameObject` option to **True**. You can also open the .cfg file manually and edit it in Notepad if you wish.
  - The Mod is now installed alongside BepInEx and you can click on the blue **Modded** (Thunderstore) or **Start modded** (r2modman) button to launch your game with the Archipelago mod enabled.

**Continue on to the ***Connecting*** section to connect to the multiworld.**

### Nexus Mods Vortex

Nexus Mods doesn't have the mod listed, but you can still install the mod itself manually using the mod manager.

Download the [Vortex app](https://www.nexusmods.com/vortex) and install it.
- In the **Games** menu on the left, use the Search Bar to find "TCG" and select "Manage" on the game card.
- The app will instruct you to download and install the Nexus Mod Extension for TCG. The prompt gives a download button, but if you close it you can still install the Extension using the **Extension** menu option in the left side bar. "Find more" at the bottom of that screen allows you to search for extensions by name.

  - You should also be prompted to install BepInEx, which we need to do.
  - Run the game once to the main menu and close it. This creates a config file we need to edit later.
- Download the [matching client file from the same releases page you downloaded the apworld from.](https://github.com/FyreDay/Archipelago-TCGCardShopSimulator/releases)
- Select the game icon for TCG in the left sidebar of the app. Click on "Install From File" in the main window, and point the prompt to the mod file that was downloaded in the previous step.
- Click on **Open..** in the main window and select "Open Game Mods Folder". In `/BepInEx/config` there should be a BepInEx.cfg file. Open it in any text editor. Under [ChainLoader] change `HideManagerGameObject = false` to `HideManagerGameObject = true`
- Click on **Play** at the bottom left corner of the app to launch the modded TCG Card Shop Simulator with the mod installed.

**Continue on to the ***Connecting*** section to connect to the multiworld.**

## Manual Setup
To install manually, you need to complete the following steps:
- Install BepInEx
- Run the game once
- Edit the BepInEx.cfg file
- Install the Archipelago Plugin
- Launch the game, connect to the multiworld server.

Install BepInEX from the [official releases page.](https://github.com/BepInEx/BepInEx/releases/tag/v5.4.23.2)

- [There is a full install guide by the BepInEx devs here.](https://docs.bepinex.dev/articles/user_guide/installation/index.html)

### BepInEx Configuration

Once installed, launch your game once. Close it at the main menu. Navigate to `TCG Card Shop Simulator\BepInEx\config` in your game's install folder and open `BepInEx.cfg` in any text editor, such as Notepad.

Under [ChainLoader] change HideManagerGameObject = false to HideManagerGameObject = true

### Install Plugin

Extract the [latest release of the mod plugin]((https://github.com/FyreDay/Archipelago-TCGCardShopSimulator/releases) into `TCG Card Shop Simulator\BepInEx\plugins` inside your game's install folder.

# IF YOU DON'T SEE A CONNECTION WINDOW WHEN YOU LAUNCH THE GAME DOUBLE CHECK THAT HideManagerGameObject IS SET TO TRUE IN THE BEPINEX.CFG FILE

## Connecting

If installed correctly you should see a window in the top left of the main menu with fields to enter the IP:Port, Password, and Slot. The New Game and Load Game buttons should be disabled. If you are ever able to see your save slots your installation has been done incorrectly.

To Connect, Enter the connection address, the Password (if your multiworld has one), and your Player Name from the multiworld room. If the `Not Connected` Text changes to `Connected` You have succesfully connected. You May now click New Game if starting, or Load game if you have previously played on this seed.
Your save slots will not be used and will be there after you uninstall the mod.
