# Silver Daze Setup Guide

## Required Files:
Silver Daze on [Steam] (https://store.steampowered.com/app/2912770/Silver_Daze/) or [Itch.io] (https://sawyer-friend.itch.io/silver-daze)
Silver Daze APWorld from [Github] (https://github.com/udime123/Silver-Daze-APWorld/releases)
ArchipelagoSilverDaze.json file from [Github] (https://github.com/udime123/Silver-Daze-APWorld/releases)

# Quick Install Instructions
Place the ArchipelagoSilverDaze.json file in the www folder of your Silver Daze install path.

Open the game, select New Game, then Archipelago.

It'll ask you to enter your host, room number, and player name.

Give it a couple seconds, and you're in!

# In Depth Install Instructions
Silver Daze Archipelago only works on Silver Daze version GOLD 1.4.1 or later. If your game isn't up to date, please update it before installing this APWorld.
This APWorld was created for Archipelago version 0.6.4 and may not be compatible with earlier versions. [Click here to install the latest version of Archipelago.](https://github.com/ArchipelagoMW/Archipelago/releases)

To begin, download the ArchipelagoSilverDaze.json file.
Open up your install directory for Silver Daze and place this file into the WWW folder.
This file doesn't do anything on its own, except inform the game that it can play Archipelago.
Now that the game is set up, we can install your APWorld.

Download the silverdaze.apworld file and open your Archipelago install.
Select "Install APWorld", then navigate to the location of your silverdaze.apworld and select it.
To create a yaml, select Generate Template Options, then navigate to the "Players/Templates" folder in your Archipelago install.
Finally, open up the Silver Daze.yaml file and edit your settings to suit your preferences.

## How To Generate A Game
Collect the .yaml files for each player and place them in the Players folder in your Archipelago install.
Then, open the launcher and select "Generate". This will open a terminal which will begin generating your game.
If nothing went wrong, the terminal will close on its own, and a .zip file will appear in your Output folder.

## Hosting A Game
To host a game, go to the [Archipelago Hosting Page](https://archipelago.gg/uploads) and click "Upload File".
Navigate to your Output folder and select the .zip file you generated. When given the option, select "Create Room".
This will bring you to a room where you can connect to the server to play the generated game. Share the room's link with all players.

## Connecting Your Game
Open up Silver Daze and select New Game.
The game will give you a few options. Select "Archipelago".
Now, the game will ask you to enter the host name. If you are hosting your game on the Archipelago server, simply press Enter to skip to the next step.
Next, you'll be asked your room number. This is the five digit number at the end of the server address.
Finally, you'll be asked your player name. Simply enter the name associated with your slot in the room.

# Options
### Minibosses
This option prevents important items from being associated with the card drops for minibosses. Some runs may require you still defeat certain minibosses to progress if they're blocking your path.

### Wardens
This option prevents important items from being associated with the Key and Card drops from Wardens. Since all Wardens are completely optional, you can choose not to fight them at all if this setting is false.
This setting treats the final battle against Griffin as a Warden.

### Chaos Wardens
This option prevents important items from being associated with the Fragment and Card drops from Wardens. Since all Chaos Wardens are completely optional, you can choose not to fight them at all if this setting is false.
This setting treats the Purple Hippo as a Chaos Warden.

### Omni
This option prevents important items from being associated with the FCard drops from Omni. Since Omni is completely optional, you can choose not to fight them at all if this setting is false.

### Shops
This option prevents important items from being associated with shops.

### ReCollections
This options prevents important items from being associated with the rewards at the end of ReCollections. The checks for unlocking ReCollections are sitll included in the pool.

### Starstuds
This option prevents important items from being associated with Starstuds.

# FAQ

### How do I get hints?
-At the moment, it is recommended that you play this game alongside the Generic Client or Universal Tracker, as Silver Daze currently does not have a native way to send messages or request hints.

### What happens if I disconnect?
-The game will remember your room number when you save. As long as your room number doesn't change, you can use these settings to quickly connect.

### What happens to the locations I exclude in my options?
-Excluded locations from your options will cause those slots to be filled with random cards.

### The item I need is in the shop but I can't find it.
-Shops in the randomizer obtain new stock every time you get a new party member. All 59 shop items will only be available if you have seven party members.

### I haven't gotten my item yet while I'm in a battle.
-Items will not be given to you during battle. Leaving combat will cause items to be delivered to you.

### Are enemy drops shuffled?
-Enemy drops are not currently included in the multiworld pool, but they are randomized.

### Is there Deathlink support?
-Deathlink is in development.




