# Manual Randomizer Setup Guide

## Required Software

- The latest [version of Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) (not pre-release)
- PC version of Baldur's Gate 2: Shadows of Amn, classic or Enhanced Edition.
- The latest BG2 apworld from [this github's releases page](https://github.com/Angevon-1/manual_baldursgate2_angevon/releases). 
- (optional) The latest version of the [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases) apworld. 
- (optional) The latest version of the GO_AP BG2 mod from this github's releases page.
- (optional) The latest version of [Gibberlings 3 Item Randomizer BG2 mod](https://github.com/FredrikLindgren/randomiser/releases)

## Installation Procedures

1. Install the latest Archipelago version from the link above. 
2. Install Baldur's Gate 2: Shadows of Amn. 
3. (optional) Install the GO_AP BG2 mod and any other mods. Other mods can be used, but modded content is not included in randomization at this time. To install, extract the GO_AP zip into your BG2 installation folder, then run the setup-GO_AP.exe and follow the instructions there to install. The GO_AP mod adds an item you can right-click and Converse with to open a dialogue menu that you can use to receive items and to easily teleport to various places. The item can be found in Imoen's inventory at the start of the game or for sale at the Adventurer's Mart in Waukeen's Promenade.
4. (optional) Install Item Randomizer BG2 mod. See "Ways to play this manual" in the [readme](BG2_readme.md) to help decide if you'll want this or not. Due to how it works, Item Randomizer should be installed AFTER all other BG2 mods. The Mode 1 setting is recommended, just remember to wait a few minutes for the "Squeak" to show up in the BG2 dialogue window after starting a new game to let you know the randomizing has completed.
5. Download the apworld from this github's releases page. 
6. Double-click the apworld to automatically install it into Archipelago's custom_worlds folder.
7. (optional) Download and then double-click the tracker.apworld from the Universal Tracker link.
8. Open the Archipelago Launcher and click "Generate Template Options". A folder will open. Find the yaml file that corresponds to this game.
7. Open the yaml in a text editor and change options as needed.
8. Place the yaml, along with any other yamls to be included in the multiworld, into the "Players" subfolder in the Archipelago folder.
9. In the Archipelago launcher, click "Generate". If all goes well, the generator will create a zip in the "output" subfolder. This is your multiworld data.
10. Upload the zip to [Archipelago](https://archipelago.gg/uploads) for hosting, or set up a localhost.

## Joining a MultiWorld Game

1. In the Archipelago launcher, launch the Manual Client.
2. In the Manual Client, use the dropdown next to Manual Game ID to choose what manual you are using (Manual_BaldursGate2_Angevon).
3. Use the Server box to input your connection info. The format is Slotname:<span>password</span>@archipelago.gg:#####
where Slotname is the Player name you put in the yaml, password is the server password ("None" if the server doesn't have one), and ##### is the port. If you're using a localhost, use "localhost" instead of archipelago.gg. In this case, ##### is your localhost port.
4. When everything is right, press Connect and you'll be connected.

## Tracking your items and locations

1. Open the Manual tab of the Manual Client. On the left is a list of items you've received, and on the right are all the game's location checks.
2. Checks that are logically available are highlighted green if Universal Tracker is installed and your BG2 yaml is in the Players folder.
3. When you've completed a check, click it to send it to the server as complete.
4. When you've achieved the goal condition, click the GOAL button to mark the world as complete.

Note: Universal Tracker needs to know your exact settings to correctly track. If you have any random options in the yaml, be sure to set them to what the generator chose so that the tracker knows.<br/>
For example, say you had include_irenicus_dungeon at true: 50 and false: 50 (a random 50/50 chance of either being chosen), and the generator chose true. You need to change the false: 50 to false: 0 in the yaml or else the tracker will think it might be false and may highlight locations incorrectly. Options that the generator chose can be seen at the top of the spoiler log. These options are also listed in the Archipelago tab of the Manual Client when you first connect. A 0 next to the option means false and 1 means true.

## Game Troubleshooting

See the [faq](faq.md) for common questions related to this manual. You are also welcome to open issues on this github or contact me (Angevon) in the Discord thread on the manual Discord server.