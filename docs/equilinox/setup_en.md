# Equilinox Archipelago Setup Guide

> [!IMPORTANT]
> Currently, the mod only supports the Windows version of the game (and has only been tested on the Steam installation). I hope to add support for other operating systems in the future.

## Host
Only the host needs to have the Archipelago Client installed. General archipelago installation / world generation will not be covered here, 
instead see [the official guide](https://archipelago.gg/tutorial/Archipelago/setup_en). The host needs the `equilinox.apworld` file found in (ADD LINK). Download this file, then double-click it to 
automatically place it in the `custom_worlds` folder.

## Player

You need to own a copy of the game to run this mod, it is not a stand-alone application. 
Download the latest `EquilinoxAP.zip` file from (ADD LINK). Opening this zip file should show a similarly named folder; place this `EquilinoxAP` folder into the installation directory of the game. 
If you installed the game via Steam, you can find this by going to `Manage -> Browse local files` from the game's library page. After doing this, the game directory should look something like this:

<img width="75%" alt="image" src="https://github.com/user-attachments/assets/01b02f71-98af-4d5b-a550-6c452e3a19f3" />


> [!WARNING]
> The mod should not be able to touch your existing save files, since it will create a new folder for AP saves. However, to be safe, I recommend backing up your existing save files. To do this, create a copy of the `Equilinox_0_Saves` folder somewhere safe.

On a fresh installation of the mod, this `EquilinoxAP` folder should have three files (the mod .jar and two .bat files):

<img width="75%" alt="image" src="https://github.com/user-attachments/assets/3446a936-744a-4c41-ad0e-31badf843c39" />


To run the game with the Archipelago mod, double click the `Run Equilinox AP.bat` file. A terminal window will open, but you can close this if you'd like. 

> [!CAUTION]
> The console window logs information about the game (saved in the `APEqLog.log` file), including the AP Server connection info (the host, slot, *and password*) in plain text. You should close this window if you are streaming the game anywhere, just to be safe. 

When running the game this way, 
a new UserConfigs file is created with the default settings; if you would like to copy use the same options as the vanilla game (graphic settings, etc), 
copy the `Equilinox_0_UserConfigs.dat` file from the root directory into the EquilinoxAP folder.

To run the game without the Archipelago mod, open the game via Steam or the original .exe file -- the mod is run if and only if one of the .bat files in the EquilinoxAP folder is used to start the game.

# Connecting to a multiworld

## For the first time

After running the game via the mod loader, the main menu should look like this (notice the mod version number under the title, and the word "Archipelago" on the New World button):

<img width="75%" alt="image" src="https://github.com/user-attachments/assets/db6f6099-f693-4b37-9659-4590fa314ca4" /></br>


To connect to a multiworld for the first time, click the `New World (Archipelago)` button and input the connection information: 

<img width="75%" alt="image" src="https://github.com/user-attachments/assets/13d0b209-b269-441b-bb07-03545d75605d" /></br>

> [!IMPORTANT]
> To edit a text field, click the square button on the right-hand side of it. Then click that button again to stop editing that field before you start editing the next field,
> or you will be typing in both fields at the same time (see Known Issues).

  
Then select the desired world options (note, only "Normal" mode is supported, so the option to change the Game Mode has been removed) and click `Generate World & Connect`. 
You can make the World Name whatever you want\* -- it does not have to start with "\[AP\]".  

\**Be weary of including special characters (see the Known Issues section)*

## Reconnecting to an existing world

To reload an existing world, simply load the save file for the world and the mod will automatically attempt to reconnect (the slot, host, and password are saved in the save file):

<img width="75%" alt="image" src="https://github.com/user-attachments/assets/e92790d0-4949-4afe-a386-fb5779837d78" />


Notice that the save preview does not display the AP connection info for that save yet. 
This is something I plan to add eventually, but in the meantime, if you are playing in more than one multiworld at once, it may be best to set the world names accordingly when creating them.

## Changing connection info

If the server port changes, or if you made a typo when creating the save file and don't want to back out an make a new world, you can change this in-game by clicking the "Archipelago Settings" button on the toolbar: 

<img width="100%" alt="image" src="https://github.com/user-attachments/assets/ef5ab189-6a20-4dd1-a392-a76cfe20ba22" />


> [!CAUTION]
> The menu that opens when you click this button will display the server password in plain text, as does the new world generation menu. I plan to address this in a future update.

You can then update the connection info and click "Connect". Eventually, I plan on adding info about completion progress and connection status to this menu.

<img width="75%" alt="image" src="https://github.com/user-attachments/assets/baa92bd7-20e7-4f78-847a-71840a9dd5ee" />

# Updating the Mod

To update the mod, you can replace the entire `EquilinoxAP` folder with the new one from the new .zip file. This will reset your config file, so copying that (the `Equilinox_0_UserConfigs.dat` file in the EquilinoxAP folder) first may be desirable. 
Replacing the EquilinoxAP folder will *not* touch your existing save files, since they are saved in the `Equilinox_AP_Saves` folder in the game directory. 
However, you should still pay attention to compatibility warnings in the release notes for a new version. 
