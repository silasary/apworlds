# Q-UP Randomizer Setup

## Required Software
- [Q-UP](https://store.steampowered.com/app/3730790/QUP/)
- [BepInEx](https://github.com/BepInEx/BepInEx/releases)
  - If you are using Windows, you will likely need the `BepInEx_win_x64_[version].zip`
- [Q-UP Archipelago Mod](https://github.com/cxve/q-ap-mod)
- [Q-UP Archipelago World](https://github.com/cxve/q-ap-world)

## Installation
0. If you care about your current save files, make a backup!
    - The mod does not use vanilla save files, but things can always go wrong.
    - On Windows, your save files are located here: `C:\Users\<username>\AppData\LocalLow\EHG\Q-UP`
    - Backup the entire folder, not just the `saves` subdirectory
0. Extract BepInEx in your Q-UP game directory
    - You can find your game directory by right-clicking Q-UP on steam then go to `Manage > Browse local files`
    - For more detailed instructions, check out [the official user guide](https://docs.bepinex.dev/articles/user_guide/installation/index.html#installing-bepinex-1)
0. Place the Q-UP Archipelago Mod in `.../steamapps/common/Q-UP/BepInEx/plugins`
    - In the end, your Q-UP game directory should look something like this:
    ```
    ├───BepInEx
    │   ├───cache
    │   ├───config
    │   ├───core
    │   ├───patchers
    │   └───plugins
    │       └───Q-AP
    ├───MonoBleedingEdge
    └───Q-UP_Data
    ```
0. Start the game on Steam, like you normally would
   - If everything worked correctly, you will see the Q-UP Archipelago screen instead of the character selection

## Disabling or uninstalling the mod
- If you want to temporarily disable the mod:
  1. Right-click Q-UP on Steam
  2. Click `Properties...`
  3. Add `--cxve_ap_disable` to "Launch Options"
  4. When you start the game you should now see the regular main menu instead of the Q-UP Archipelago connection screen
- If you want to uninstall the mod but keep the mod loader:
  1. Delete the `Q-AP` folder located in `.../steamapps/common/Q-UP/BepInEx/plugins/`
  2. When you start the game you should now see the regular main menu instead of the Q-UP Archipelago connection screen
- If you want to uninstall the mod and the mod loader:
  1. Delete the `BepInEx` folder located in `.../steamapps/common/Q-UP/`
  2. Right-click Q-UP on Steam
  3. Click on `Properties...`
  4. Click on `Installed Files > Verify integrity of game files`
  5. Once it's done, when you start the game you should see the regular main menu