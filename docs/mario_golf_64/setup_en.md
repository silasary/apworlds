# Mario Golf 64 Archipelago Setup Guide

## Requirements
- [BizHawk](https://tasvideos.org/BizHawk) 2.9.1 or later
- A Mario Golf 64 ROM (USA)
- The Mario Golf 64 APWorld (`mario_golf_64.apworld`)
- The Mario Golf 64 Archipelago Lua script (`connector_mario_golf_64.lua`)

### BizHawk settings
The only setting you really need to mess with is the video plugin. `Angrylion` is recommended, but requires more performance. Otherwise, `Glide64Mk2` is a good backup option. This Lua script is designed for `Angrylion`, so some of the on-screen displays may not be positioned properly if using `Glide64Mk2`.

1. Open BizHawk.
2. Go to **Config → Core Settings → For Consoles → Mupen64Plus → Video Plugins...**
3. Under Active Video Plugin, select either `Angrylion` or `Glide64Mk2`.

## Installing The APWorld
1. Download the Mario Golf 64 APWorld (`mario_golf_64.apworld`) and either double-click it to install it, or manually put it in `C:\ProgramData\Archipelago\custom_worlds`.
2. Run the Archipelago Launcher and click Generate Template Settings which will give you the default Mario Golf 64.yaml located at `C:\ProgramData\Archipelago\Players\Templates`.
3. Download the Mario Golf 64 Archipelago Lua script (`connector_mario_golf_64.lua`). Place the script in this folder: `C:\ProgramData\Archipelago\data\lua`.

## Generating a Game
1. Create your YAML options file using the template provided by the Archipelago Launcher.
2. Edit your YAML options how you like and put it in the `Players` folder located at `C:\ProgramData\Archipelago\Players`.
3. Click Generate in the Launcher which will make the multiworld based on all YAML files in that `Players` folder. This will create a .zip file located in the `output` folder located at `C:\ProgramData\Archipelago\output`.
4. [Upload it to the Archipelago website](https://archipelago.gg/uploads) by selecting the .zip file created in the `output` folder or use the Archipelago Launcher to generate locally.

For more information, check out the [Archipelago instructions for generating a game](https://archipelago.gg/tutorial/Archipelago/setup/en#generating-a-game) and [hosting an archipelago server](https://archipelago.gg/tutorial/Archipelago/setup_en#hosting-an-archipelago-server).

## Joining A Multiworld
1. Open BizHawk and load your Mario Golf 64 ROM. **MAKE SURE TO DELETE YOU SAVE DATA BEFORE OPENING THE LUA SCRIPT.**
2. Go to **Tools → Lua Console**.
3. Open `connector_mario_golf_64.lua` in the Lua Console and click **Script → Run**.
4. Connect to your Archipelago server using the Mario Golf 64 AP client with your slot name and server address.

For more information, check out the [Archipelago instructions for connecting to an archipelago server](https://archipelago.gg/tutorial/Archipelago/setup_en#connecting-to-an-archipelago-server).