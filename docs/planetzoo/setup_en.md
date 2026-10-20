# Planet Zoo Randomizer Setup Guide

## Quick Links
[Planet Zoo Mod + Client](https://github.com/tinkieZo/Planet-Zoo-AP)
[Planet Zoo Randomizer (AP World)](https://github.com/tinkieZo/ArchipelagoPZ)

## Required Software
- Windows 10+ (probably?)
- [Planet Zoo](https://store.steampowered.com/app/703080/Planet_Zoo/) for PC
    - If you don't use Steam, you're on your own kid
        - Experiment at your own risk
- [Planet Zoo Mod + Client](https://github.com/tinkieZo/Planet-Zoo-AP) (How-to below)
- [Planet Zoo AP Randomizer (AP World)](https://github.com/tinkieZo/ArchipelagoPZ)
    - Download it, double click it so that your Archipelago Launcher has it. That's it.

## Overview

In the Planet Zoo Mod + Client, cobra tools are used to modify the original game files. **Please back up your beloved save files**. There is a command to set the game back to it's original state, but safe is safe. This has not been tested with DLC as we own none of them. 

While the game is communicating with the server, please keep an eye on the client window, as any important information will be revealed there.

## Planet Zoo Modding Guide

### Install

1. Download and run the [Planet Zoo Mod + Client exe](https://github.com/tinkieZo/Planet-Zoo-AP) anywhere on your PC; Do this with the [AP world](https://github.com/tinkieZo/ArchipelagoPZ) as well

2. After the client (a Window should pop up, looks like the Archipelago base client, but blue) has opened, type in **/pz_install**
    - Please note, have your save files backed up before this step. You've been warned at least twice 

3. After pz_install has finished running, open the game from Steam and load into the scenario by going to 'Career' and selecting **'ARCHIPELAGO ZOO'** from the list of 'Career Scenarios'

4. Select **'Start New'**, pick your difficulty. (Not altered, so pick what you want)
    - If you are starting a new run, make sure to start new as well. 
    - If you want to pick up where you left off, you select 'Resume'

5. Once your Zoo has been loaded in, pause your game immediately. Tab into your Planet Zoo Archipelago Client, and connect into your room by giving the server address, and typing your player name into the command line when prompted. ** Wait until 'READY' is shown in the Archipelago log **
    - You may skip the intro load scene by pressing ESC as normal.
    - Please ignore Objectives, and the constant complaint that you don't have a research centre or workshop.
    - Try not to do anything during this step other than connect to the server.

6. After your 'READY' has been shown in the client, feel free to start playing! Your starting money should be adjusted to your settings, and your water terrain tools should be locked. 
    - If water tools are not locked, give it a minute, and it will lock afterwards. Honor system here, but if you don't wanna, do you.

7. After completing your goal, please close the client first (Wait like a minute), then close the game. Game might crash otherwise.
    - We haven't found any problems with crashing yet, but it's not clean, so follow order, thanks :D

### Disable and Uninstalling

If you want to return to the orignal version of Planet Zoo, **Make sure the game is closed**, and use the **'/pz_restore'** command in the Planet Zoo Archipelago Client window. You should get a notification in the console that it's done when it is.
    - You probably don't want the game open during this step.
    - Verifying the game files in Steam will probably also fix anything. Usually.


## Generate a MultiWorld Game

1. Visit the [Archipelago Website](https://archipelago.gg/)

2. Learn how to generate your Template YAMLs
    - Copy the Planet Zoo YAML into the players folder and edit it to your liking

3. Generate your randomized game, following the instructions from [Archipelago Website](https://archipelago.gg/), and host it.

*For instructions on how to generate an Archipelago game, refer to the [Archipelago Setup Guide](../../../../tutorial/Archipelago/setup/en)*

## Sequence Breaking

If you break the sequencing by placing a Research centre or something, without having the option unlocked, you're on your own. Hasn't been tested yet. If you want to continue, possibly regenerating the game might help, but of course, you would have to start over. Otherwise have fun with your shennanigans.

Do tell us in the [discord](https://discord.com/channels/731205301247803413/1326681567665324082) about how you were able to access it though. Should count as a bug.

## Rejoining a MultiWorld Game

1. Make sure the Game Mod Client is still loaded (If you're unsure, just run /pz_install again in the client)
    - Start the Client

2. Start the game, pause after loading in your Archipelago Zoo.

3. Use the Client to rejoin, **wait** until AP Ready is shown in the Client, may take a few minutes.
    - Make sure your server is still being hosted! (Refresh the site, and such, you know the drill)

4. Play!

## Known Issues:

1. Don't release animals using the mass release button in the Animals tab. This will result in only one release being checked, and all other animals that are available to be released will disappear, with no extra credit being awarded. Releasing animals from their Habitats, Exhibits, and Storage will still work.

2. Just so it's here too, If you don't wait for the AP Ready signal, you can sequence break.
    - Even after the AP Ready is shown, Water tools take a little longer to lock.

3. There is a sneaky way to place barriers that you don't have access to yet. Involves using shortcuts.
    - Specifically if you are in the barriers menu, have something selected, and then use the 'move to next item' key (mine was '<') and you might be able to access brick barriers earlier that way.
    - Is theoretically sequence breaking, but not sure if there's a major repercussion for it.

4. Although I wouldn't count this as a bug: if you have unlocked a permit for an animal that you cannot yet place due to barrier level, You will be able to buy it in the market already. This is fine. Buy the animal and save it for later, or ignore it. Animals that are locked behind water tools, won't show, even if you have the permit for them.



Note: Claude AI was used to create some things here. Not all of it, as we still have some principles, but a newbie did the AP world and a profi did the client.