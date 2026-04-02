# Commander Keen AP Setup Guide

## Required Software

* [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases).
* The latest [OmnispeakAP](https://github.com/kodbyte/omnispeak-ap/releases) release.
* Your legally obtained Commander Keen play files from [Steam](https://store.steampowered.com/app/9180/Commander_Keen/) or [GOG](https://www.gog.com/en/game/commander_keen_complete_pack).

## Optional Software

* The use of [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases) is highly recommended.

## Installation Procedures

### Windows Setup

1. Download and extract the contents of the latest OmnispeakAP release.

2. Locate and copy the play files for the episode(s) you plan to play.

   * Steam:

     * Right Click "Commander Keen Complete Pack" in your Steam library, hover "Manage", and then click "Browse local files".
     * For episode 4, open the folder "base4" and copy AUDIO.CK4, EGAGRAPH.CK4, GAMEMAPS.CK4.
     * Place the files in the folder you extracted OmnispeakAP to in step 1. Ensure that the files are in the same folder as omnispeak.exe.
     * Repeat for episode 5 by grabbing the same files but with a CK5 extension from the "base5" folder.
   * GOG:

3. Follow the standard process for creating a YAML file and generating a multiworld.

## Joining a MultiWorld Game

### Connect to the Archipelago server

When the game has been generated, note the room's port number and your slot name. Open connection.txt which is located in the folder where you extracted OmnispeakAP. Add your port and slot name (and a password if applicable) and save the file.

> server: archipelago.gg
> port: 12345
> slotname: MySlotName
> password:

Use "AP Keen Launcher.exe" located in the OmnispeakAP folder to launch the specific episode you wish to play and start a new game. If returning after closing the game, load your saved game file.

Once on the world map, wait for the slot connected message to appear and then you may start playing.

* If you do not see the slot connected message, check that the server, port, slot name, and password in connection.txt are accurate. If it still does not connect, check a file named ap_log.txt for any error messages.

### Play the game

Once you see the slot connected message you are free to play!
