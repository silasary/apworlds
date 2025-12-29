# Final Fantasy Tactics A2

## Setup:
Generate on source https://github.com/ArchipelagoMW/Archipelago/blob/main/docs/running%20from%20source.md
Open patch file (apffta2) with the launcher. US Rom is required. 
Bizhawk client should launch then you connect to the server. 

## Things to know:
Gate items are just loot items in the game. They can be sold or discarded. Don't do that.
Entering the auction house softlocks the game.
There is no in-game notification when receiving items from other players.
Items from other players currently show up as "-", and can be sold

## What is randomized?:
quest order, job unlocks.
You can receive equipment, consumables, loot items, quest items, and job unlocks from other players depending on settings.

## What are the locations?
Currently, it is just quest rewards. Up to three rewards for every quest. 
There can be up to 21 quest gates which is 76 quests.

## What is the goal?
There are quest gates with four quests each. One of the quests requires a loot item which will
be the one that unlocks the next quest gate. The goal is to unlock the final quest which is "The Two Grimoires". 
This quest is unlocked after clearing every quest gate. The quest location has been moved to Targ Woods (where the game starts).

## Basepatch changes:
The intro cutscenes and tutorials are skipped.
The entire map is unlocked (but unexplored) from the beginning with a few exceptions.

## Known issues:
Auction House softlocks when entered. Save often just in case you accidentally do this.
Story quests are broken due to story progress reliance (removed from the pool for now)
No popup for received items
Rewards are visible in pub
Job Unlocks and Archipelago do not have dedicated items
Gate items should be removed from bazaar recipes

## Credits:
Spicynun - A lot of the code and ideas are based on the FFTA apworld.
Lennart - (I believe) they made the spreadsheet I found that contains a lot of data from the game.