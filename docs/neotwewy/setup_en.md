# NEO: The World Ends with You Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- Melon Loader: [GitHub](https://github.com/LavaGang/MelonLoader/releases/latest)
    - .NET Framework 4.8 may be needed for the
      installer: [Download](https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48)
- .NET Desktop Runtime 6.0.XX (If not already installed): [Download](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
- NEO: The World Ends with You Archipelago Mod: [GitHub]((https://github.com/Sjerver/NEO-Twewy-Archipelago-Mod/releases))

## Installing the Archipelago mod to NEO: The World Ends with You 
1. Download the [latest release](https://github.com/Sjerver/NEO-Twewy-Archipelago-Mod/releases) of this mod.
2. Download MelonLoader.Installer.exe from https://github.com/LavaGang/MelonLoader/releases/latest and run it.
3. Select NEO: The World Ends with You in the list of games.
   If NEO: The World Ends with You does not appear, click add game manually then browse to NEO: The World Ends with You.exe.
4. Click install. If the latest version is not working: Untick Latest and select 0.7.3
5. Download NEOTwewyArchipelagoMod.zip.
6. Head to the NEOTwewyArchipelagoMod folder and open up /mods/. If this folder does not exist, run the game and it should appear.
7. Extract the contents of the .zip file into mods. Ensure the files are not in a subfolder, this mod is not setup for that yet.
8. Edit `Mods/NeoTwewyArchipelago/NEOTwewyArchipelagoConfig.json` to match the Archipelago room you want to connect to.
9. Run the game.

## Generating a Game

1. Use `Generate Template Options` from Archipelago Launcher to get the YAML option file.
2. Follow the general Archipelago instructions for [generating a game](../../Archipelago/setup/en#generating-a-game).

## Connecting to a Server

1. Open the file at `/UserData/NEOTwewyArchipelagoConfig.json`.
2. Enter in the details for the archipelago game, such as the server address, port, username and password.
3. Run the game.
4. If you are able to start a new game save file, you have successfully connected to a server.

### Regarding Save File

The mod currently saves information about the last used seed in a separate file. This allows for offline play once the
save file has been initialized. In order to initialize a new save file, simply start a new game while connected to a
different seed. If you load up a save file while the seed from the server does not match the local save file, you will
not be able to receive items nor send checks.

## Changes to the Base Game

1. Most menu options are unlocked from the start.
2. Fast-forwarding through dialogue is unlocked from the start.
3. Beating a day unlocks it's corresponding Secret Report.
4. In order to unlock a day you need at least as many Secret Reports as the days number - 1. 
   Example: Week 1 Day 2 needs 1 Secret Report, Week 3 Day 4 would need 17 Secret Reports.
5. Beating a day without having unlocked the next one, repeats the day from the beginning.
6. When repeating a day you can press a configured  button to skip to the end of the day. The default key is F5 and 
   can be changed in the config file.
7. The 1 Yen Pin has been replaced by the Archipelago Pin representing items from other worlds.


## Current Known Issue

- Currently, there is no way to tell which Archipelago items from other worlds you collect in game via scenario/quest
  rewards. It is recommended to keep an eye on the MelonLoader console while playing. 
