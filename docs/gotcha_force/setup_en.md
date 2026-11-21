# Gotcha Force Setup Guide

## Required software

* Dolphin Emulator.
* A Gotcha Force USA ISO (game id `GG4E08`).
* Latest release of Archipelago (0.6.8).

## Patching your ISO (Only required once)

In order to play, you need to use a **patched copy** of the game. 

The patch is **the same for every seed**. This means you only need to patch
one time (when the apworld updates, sometimes you may need to patch again.
the release of the apworld should always indicate if a new patch is needed or not)

1. In the Archipelago Launcher, click **Gotcha Force ISO Patcher**.
2. Select your clean Gotcha Force USA ISO.
3. A copy named like `Gotcha Force (USA) [AP].iso` appears next to
   it. This is the copy you will use to play.

## Generating a seed

Take a look into [archipelago's setup guide](https://archipelago.gg/tutorial/Archipelago/setup_en)
It should guide you into the process of how to make a YAML for this game, generating, and hosting.

## Playing a seed

1. Generate the multiworld following the [setup guide](https://archipelago.gg/tutorial/Archipelago/setup_en).
2. Start Dolphin and boot your patched copy (the ` [AP]` one).
3. **IMPORTANT: Use a fresh save for each seed.** if you use an existing
   file, checks for completed chapters will be sent. To delete your current
   savefile:
      * If you are using "GCI Folder" to store your savefiles, go to where Dolphin 
      stores your savefile and remove the file named "08-GG4E-GG4E_GOTCHA_FORCE_USA.gci". If you don't know where
      the savefiles are:
        * Right click on the game in the game list and a "Open GameCube Save Folder" option should be on the list
        * Go to "Config" -> "GameCube" and press on "..." in the slot that has the GCI Folder option. It should open
        a window that shows you the folder that you have configured for this, and you can set a different one if you want.
      * If you are using the "Memory Card" option to store your savefiles, go to the "Tools" tab in Dolphin
      and choose the "Memory Card Manager" option. It should open a window where you can manage all your saves.
4. Once the **Gotcha Force Client** if you haven't done so already.
5. The client will show a message like "Gotcha Force detected" when connection with Dolphin is stablished and the game is open
6. Write the host and port (usually something like "archipelago.gg:\<port\>") and hit connect
7. Write the slot name when asked for it and press enter


## Reading the world map

The map lists every mission you can currently play. Cleared missions are still available to be played again,
since some checks may require you to play the same mission multiple times. 
There are new colors to the mission icons for the Archipelago:

* **Green icon** — you already beat that mission.
* **Faded gray icon** — playable, but out of logic for now (you need more "GF Energy").

Each mission has a **X/Y counter** as well. It shows checks found / total checks for that mission. 
It turns yellow when you have found them all.
