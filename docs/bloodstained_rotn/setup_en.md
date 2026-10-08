# Bloodstained Randomizer Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [The Bloodstained AP World](https://github.com/vgfreak95/BloodstainedAP/releases/latest)
- [Lakifume's True Randomizer](https://github.com/Lakifume/True-Randomization/releases/latest)
- [Bloodstained Modding SDK](https://github.com/vgfreak95/BloodstainedModdingSDK/releases/latest)

## Terms for File locations
- Game Shipping Directory = steamapps\common\Bloodstained Ritual of the Night\BloodstainedRotN\Binaries\Win64

## How to play
First, you need a room to connect to. For this, you or someone you know has to generate a game.  
This will not be explained here,
but you can check the [Archipelago Setup Guide](/tutorial/Archipelago/setup_en#generating-a-game).

You also need to have [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest) installed
and the [The Bloodstained AP World](https://github.com/vgfreak95/BloodstainedAP/releases/latest) installed into Archipelago.

Next there are two different ways to host the world. Whether you choose to host it locally or on the webhost, instructions are still the same.

## Setup for True Randomizer
1. Download [Lakifume's True Randomizer](https://github.com/Lakifume/True-Randomization/releases/latest).
2. Open Data/config.ini and find [Archipelago] and change bEnable from false to true.
3. Extract the zip file and find the Randomizer.exe file.

## Using the True Randomizer
1. Open the True Randomizer by double-clicking `Randomizer.exe`, and in the bottom left, select Empty preset.
2. Check `Overworld Pool` and change the Game Difficulty in the bottom left. Optionally in Graphic Randomization select `Outfit Color`.
3. Press the Generate button. Generating adds AP specific assets into the game which the AP Mod reads from.
Note: Applying these fixes will make enemies drop random shards including progression, if it happens that's not intended progression, read bottom
of page for more information.

## Setup for the Bloodstained AP Client
1. Download [Bloodstained Modding SDK](https://github.com/vgfreak95/BloodstainedModdingSDK/releases/latest) `version.dll`.
2. Navigate the File Explorer to your `Game Shipping Directory` (see Terms), and drag `version.dll` into the directory.
3. Still inside `Game Shipping Directory` ensure `UE4SS.dll`, `dwmapi.dll`, and `version.dll` is in the directory.
5. In the Game Shipping Directory, open `UE4SS-settings.ini` in notepad or equivalent and change the [Debug] section to be exactly like this:
```
[Debug]
; Whether to enable the external UE4SS debug console.
ConsoleEnabled = 0
GuiConsoleEnabled = 0
GuiConsoleVisible = 0
```
5. Launch game and load a new save file, once loaded, press `F5` to open ImGui window. Note: You cannot connect to AP in the title the gui won't let you!
6. In game, ensure minimap has green outline box. This means the compatibility between UE4SS and the AP Client are correct.
7. Insert the correct archipelago slot information and press connect!

## Important Things To Note
- Enemies and Shards are CURRENTLY NOT SUPPORTED. If you receive a duplicate shard, that is expected behavior. The required logic shards are in the item pool
so even if you get duplicate shards by defeating bosses, any shards collected from defeating bosses aren't intended, so please do not use them for a fair
game to ensure true completion.
- Please report any crashes, as this software is still in its early beta stages.
