# Divinity Original Sin 2 Randomizer Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)

- Divinity Original Sin 2 Definitive Edition
    - (I have not tried non-steam versions of the game, let Intaiachi know if a different release of the game works)

- [Norbyte's Script Extender](https://github.com/Norbyte/ositools/releases)
    -Install guides will be on the linked Github

- Archipelago DOS2 Mod
    -[Steam workshop link](https://steamcommunity.com/sharedfiles/filedetails/?id=3741893354)
    -[Github Link](https://github.com/Intaiachi/DOS2-Archiplago-Mod/releases)

- [dos2.apworld](https://github.com/Intaiachi/ArchipelagoDOS2/releases)

## Installation

### Windows Setup

1. Download and install Archipelago from the link above, the more recent the better.
2. Install the dos2.apworld. This can be done by using the Archipelago Launcher's "Install AP World" component, or just by copying the dos2.apworld into the custom_worlds folder in the Archipelago install.
3. Download and install Norbyte's Script Extender from the link above, the more recent the better. Follow the instructions on the Script Extender's Github.
4. Download the Archipelago DOS2 mod. If using the Steam workshop, simply subscribe to the linked mod. If you downloaded the mod off Github, move the .pak folder into the the game's mod folder
(Documents\Larian Studios\Divinity Original Sin 2\Mods).
5. Make sure the Archipelago mod is enabled in game by going to "Mods" in the main menu and making sure the corresponding box is checked.
6. Verify that the directory "Documents\Larian Studios\Divinity Original Sin 2\Osiris Data does exist. If not, start a game with the Archipelago mod enabled and play until you load into the tutorial and
complete the first quest (Death Belowdecks, completes after Windego explodes). This will create the folder.
You can also just create the folder manually (make sure the folder location and name are exact).

Other operating systems should be similar if not identical (confirmation needed, let Intaiachi know).

## Create a Config (.yaml) File

In your Archipelago install, locate the Archipelago Launcher and open it. Open the "Options Creator" component. Find Divinity Original Sin 2 on the left and click it. Run through the options presented and hit "export" to create your .yaml
You can also run the "Generate Template Options" component in the Archipelago Launcher, then find the Divinity Original Sin 2 .yaml in the file explorer that pops up. Open this file in a text editor and adjust the settings to your liking.
Don't forget to save!

## Joining a Multiworld Game

When you join a multiworld game, provide your .yaml to the host. You will not need anything from the host, so just wait until the game begins.

### Connecting to the Multiworld

In the Archipelago Launcher, search for "Divinity Original Sin 2 Client" and launch it. A message box will appear asking for the directory you created in step 6 of the setup, select the Osiris Data folder and the client will open properly.
 In the Divinity Original Sin 2 Client, type in the host's room in the server box at the top. This will either be "archipelago.gg:xxxxx" or an ip depending on what the host is hosting on. Hit connect and you
 will be prompted to enter your slot name. Enter the exact name you put as your name in your .yaml and you will be connected. From here, just open up Divinity Original Sin 2, make sure the Archipelago mod is enabled, and start playing!

## Hosting a Multiworld game

It's recommended to use the hosting service provided on the Archipelago website.

1. Collect all the .yaml files from each player.
2. Put them all in the "Players" folder in your Archipelago install.
3. Open the Archipelago Launcher and open the "Generate" component.
4. If successful, a zip will be created in the output folder of your Archipelago install
    -If unsuccessful, double check each .yaml is valid and try again
5. Hit "Start Playing" on Archipelago's website and hit "host a pre-generated game"
6. Upload that zip that was created in the earlier output folder
7. Hit create new room
8. Connect with the port at the top of the page
9. Play!

## Playing Divinity Multiplayer

You can play with multiple people in the same game of Divinity. The host of the game is the only one who needs to follow the instructions, the other players can simply just join their game.
Other players can get checks just as you would expect. Deathlink also applies just as if the other players were normal party members. The host is the only one that will receive items in their inventory.

## IMPORTANT DISCLAIMERS

The client MUST be open and connected BEFORE a new game or save is loaded. It will not work otherwise.

The mod and client talk to each other using files in the directory stated above in the setup. These files will stay there forever. I'm looking for a way do not have that be the case, but for now
please be aware of these files that are left behind. After you are done you are free to delete everything in the Osiris Data folder that is Archipelago related.

This is very early in development and is far from complete. Your feedback is welcome. If you notice any problem, find some checks to be odd, think some locations aren't intuitive or think some are missing, please
let me know in the Archipelago AD Discord. As such, please keep in mind that there may be problems or hiccups while playing. Be cautious about bringing into public games for now.