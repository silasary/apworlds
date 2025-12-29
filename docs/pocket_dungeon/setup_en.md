# Shovel Knight Pocket Dungeon MultiWorld Setup Guide

## Required Software
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [Shovel Knight Pocket Dungeon on Steam](https://store.steampowered.com/app/1184760/Shovel_Knight_Pocket_Dungeon/)

## Installation Procedures

### Windows Setup
1. Download and install [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest).
2. Switch and download the Pals Pack early preview branch, instructions can be found [here](https://www.yachtclubgames.com/blog/shovel-knight-pocket-dungeon-early-preview-update-notes/#branch)
3. Download [the mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3619001702) from the Shovel Knight Pocket Dungeon workshop.
4. Also download the latest [Shovel Knight Pocket Dungeon APWorld from the releases page on this GitHub](https://github.com/Mitchell1711/Archipelago/releases/latest).
5. Install the .apworld by double clicking it.
6. Open the Archipelago launcher and select the Shovel Knight Pocket Dungeon Client.
7. When first booting up the client you may be prompted to change some folder paths, please refer to the section below to see what folder locations you must set up.
8. Inside of the client, run the command /setup_mod, this will copy all the files from the workshop mod over to the correct file location for you. You should now be all set up!

### Settings up folder paths
#### Shovel Knight Pocket Dungeon save directory
This needs to be set to the following directory, this can also be changed using /savepath.
<img width="926" height="219" alt="image" src="https://github.com/user-attachments/assets/c2eb48cf-b279-4381-b172-5c29f07fea9f" />

Note: you should not put it inside of the folder with your steamID, it needs to be this folder. In some cases there may be an existing savefile, the Archipelago client will back this savefile up as the file "saveBackup".

#### Shovel Knight Pocket Dungeon game directory
This needs to be set to the following directory, this can also be changed using /gamepath.
<img width="559" height="504" alt="image" src="https://github.com/user-attachments/assets/156c74e8-12f3-47d1-97ca-2b1c4acd4eeb" />

Note: the easiest way to locate this folder is by doing the following: open Steam > right click the game on the sidebar > select properties > select installed files > click the browse... button.

#### Archipelago Workshop mod directory
This needs to be set to the following directory, this can also be changed using /workshop_path.
<img width="658" height="493" alt="image" src="https://github.com/user-attachments/assets/3ddb12df-db76-4928-9f1e-631c385c8ef7" />

### Playing the game
If you've followed the setup instructions you can open the Archipelago Launcher and launch the Shovel Knight Pocket Dungeon client. If everything is set up properly the Archipelago client will automatically boot up the game for you when you connect to a multiworld server!

### Where do I get a YAML file?
When you have the Shovel Knight Pocket Dungeon APWorld installed you can generate one by clicking "Generate Template Options" inside of the Archipelago Launcher, they are also provided with the latest release.
