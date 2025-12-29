# Isles Of Sea And Sky Randomizer Setup Guide

### Required Software

- Isles Of Sea And Sky from the [Steam page](https://store.steampowered.com/app/1233070/Isles_of_Sea_and_Sky/)
- Isles Of Sea And Sky [APWorld](https://github.com/Kim-Delicious/Archipelago_IslesOfSeaAndSky/releases)
- Archipelago from the [Archipelago Releases Page](https://github.com/ArchipelagoMW/Archipelago/releases)

## First time setup

### Connect to the Multiworld

Make sure both vanilla Isles Of Sea And Sky (v1.2b), and Archipelago are installed.
If they are, open up the Isles Of Sea And Sky Client. 

In the top text box of the client, type the `IP Address` (or `Hostname`) and `Port` separated with a `:` symbol. 
(Ex. `archipelago.gg:38281`)

The client will then ask for the slot name, input your slot name chosen during YAML creation in the text box at the 
bottom of the client, and you should connect.

#### Patch the Game

Type in the Client console: `/auto_patch`. This will freeze the program for a few moments while it's working,
but when that's done you will receive a message:`"Game patched successfully!"`.

If things have worked correctly, the game should launch automatically.


### Launch the game, and enjoy!

If you are connected to the Server, use `/launch` to begin, if the game hasn't started already. 

***(Being connected to the Server when the game launches is important for multiple features initializing correctly)***

The game should start running, and all the background stuff should be working automatically. 

Congratulations on successfully joining a multi-world game!

### Where do I get a YAML file?

A Template file can be found inside `isles_of_sea_and_sky.apworld` in `/data`, or should be found on the release page.


### For Linux Users

*Compatibility hasn't been tested, so user beware!*

Once the `.apworld` has been installed, and the Client is running, use the `/savepath` command to set the path the vanilla game's save folder. 
It should look something like this: `/home/.../.local/share/Steam/steamapps/compatdata/1233070/pfx/drive_c/users/steamuser/AppData/Local/IslesOfSeaAndSky` 

Then run through the rest of the setup points found above.
- Connect to the Server
- `/auto_patch`
- `/launch` if the game hasn't started already.

## Setup Custom AP Sprites

*(This can only be setup after `/auto_patch` has been run at least once)*

It's possible to display some of the items that will be sent to other players in other worlds. To make this work you will need. KaitoKids' [Archipelago Utilities](https://github.com/agilbert1412/ArchipelagoUtilities)

In the modded directory for Isles Of Sea And Sky, there should be a folder called `Custom Sprites`. If there is not, create one.

Once you've downloaded the zip folder of Archipelago Utilities, extract it, and copy the folder called `Custom Assets` Into the `Custom Sprites` folder.

And you should be done! Items should now display if you've connected to the Server.

## Setup the Alt Room Randomizer

All information on this can be found [here.](<https://github.com/Kim-Delicious/Archipelago_IslesOfSeaAndSky/blob/master/worlds/isles_of_sea_and_sky/docs/en_Alt%20Room%20Randomizer.md>)