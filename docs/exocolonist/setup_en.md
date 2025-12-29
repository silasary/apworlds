# Exocolonist Setup Guide

## Requirements

[Exoloader](https://github.com/Pandemonium14/ExoLoader/releases)

[Exopelago](https://github.com/pamymaf/Exocolonist-AP/releases)

## Exocolonist Mod Instructions

### Windows

0. Back up your `Groundhogs.json` file located in `C:\users\steamuser\Documents\Exocolonist`. 
  ***THIS FILE MAY BE OVERWRITTEN*** and contains what achievements and characters you have unlocked on the main menu.
  This file is located in `/path/to/your/steamapps/compatdata/1148760/pfx/drive_c/users/steamuser/Documents/Exocolonist` in Linux.
1. Download Exoloader and extract it into your Exocolonist game folder.
2. Download Exopelago and extract it.
3. Copy the contents of Exopelago's CustomContent folder into the CustomContent folder in your game directory.
  The file structure should be `Exocolonist/CustomContent/Exopelago/`
4. Copy `Exopelago.dll`, `Archipelago.Multiclient.net.dll`, and `Newtonsoft.json.dll` into the `BepInEx/plugins/` folder.
5. Launch the game.
6. Open the settings menu and click the buttons to set the Archipelago IP, port, slot, and password.
7. Click connect and enjoy!

### Linux

1. Tell Steam to use compatibility mode.
  This game does have a native Linux release, but BeInEx needs the Windows release.
2. Launch the game at least once to build the Proton prefix.
3. Install and open Protontricks.
  If needed, select the version of Steam you want to use (native vs flatpak).
4. Select the game.
  It may take Protontricks a couple minutes to open the next window.
5. Click Select the default wineprifix and click OK.
6. Select Run winecfg and click OK.
7. Navigate to the Libraries tab.
8. In the textbox, enter winhttp and click Add.
9. Click OK at the bottom.
10. Follow Windows instructions and enjoy!