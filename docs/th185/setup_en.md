# Black Market of Bulletphilia ~ 100th Black Market Randomizer Setup Guide

## Troubleshooting for Esoteric Issues

If any issues arise that **cannot be solved by going over this guide**, you may ask in the [thread](https://discord.com/channels/731205301247803413/1346288808512983040/1470840910500724736) for Touhou 18.5: 100th Black Market in #future-game-design in the official Archipelago Discord server. Of course, before attempting to troubleshoot via the Discord thread, please ensure that you have familiarized yourself with the procedures involved in setting up the game and have attempted to fix it using all of the information provided below.

## TL;DR:

0. Get Archipelago Launcher and Touhou 18.5.
1. Disable Steam Cloud saves if it's the Steam release. 
2. Install .apworld (see latest release).
3. Open Archipelago Launcher.
4. Open Options Creator.
5. Tweak as needed and export Options as a .yaml file.
6. Get a server running (can skip if someone else is handling this part).
7. Open Touhou 18.5 client.
8. Connect to the server.
9. Enter name as written in the .yaml's settings. 
10. Launch the game.

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- The .apworld for 100th Black Market, if not bundled with Archiepelago.
- Touhou 18.5: 100th Black Market, the game. Available on [Steam](https://store.steampowered.com/app/2097720/Black_Market_of_Bulletphilia___100th_Black_Market/), but its Comiket CD release also works.

## Starting Conditions

- You will begin the game with one stage unlocked, no cards unlocked, no Funds, only 1 loadout card, and 100% equipment cost limit.
- Which stage would be unlocked at start can be changed in the Options.
- For beginners, it is recommended to choose "**Tutorial - First Black Market Deal**" as the Starting Market.
- The client will **automatically** save your progress and restore it according to server data. You will receive your unlocked stages, cards, Funds, card slots, and equipment cost upon a successful connection. **_Local save data/Steam save data is not needed for this reason._**

## Important Setup Before Playing

If the .apworld for 100th Black Market has not yet been installed, do so.

For Steam releases, disable Steam's Cloud saving feature for the game. This can be done in Settings -> Properties... -> General -> Steam Cloud.

Before attempting to open the game and play, please backup your previous save data. This is typically located in `%appdata%\ShanghaiAlice\th185`, and **nowhere** in the game's installation folder. These files would be named `scoreth185.dat` and `scoreth185bak.dat`, wherein the latter is a backup copy of the former.

Before launching the game, open the Touhou 18.5 client in the Archipelago Launcher and run the `/replace_save` command in order to clear the game's save data. The command will paste in save data specifically tailored to work with the randomizer. Do this every time before opening the game to ensure no inconveniences arise during launcher. Alternatively, if the command does not work, you may manually delete the save data.

In both cases, the client will default to `%appdata%\ShanghaiAlice\th185` as the game's save data path. If the game keeps its save data elsewhere, change the path as necessary.

Once the above is done, continue reading below.

## Randomizer Setup

In order to play this implementation, a multiworld room is required. For this, you or someone you know has to generate a game. This will not be explained here, but you can check the [Archipelago Setup Guide](/tutorial/Archipelago/setup_en#generating-a-game).

At the top of the client, you may see a text box. This is where the `IP Address`/`Hostname` and `Port` will go so that the client can connect to a room. Simply type in the address and port number separated by a `:` symbol. (e.g. `archipelago.gg:69420`)

If the client successfully connects, you will be asked for your slot name. Enter the name you used during the `.yaml` generation.

Once this is done, you may open the game. The client will attempt to connect to the game. If successful, you will be informed that the client has found the game. You may then play the game as usual.

## Modding Compatibility

- Mods which _**directly**_ modify the game executable will break compatibility. As the client relies on consistent memory addresses to operate, directly editing the executable will derail the entire thing.
- Mods run via the [Touhou Community Reliant Automatic Patcher (thcrap)](https://github.com/thpatch/thcrap) _may_ work, at least for language patches. This patcher is not bundled in with this AP implementation.
