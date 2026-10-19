# DOTA 2

A **Meta-progression randomizer** for DOTA 2. You play regular online matches and the Archipelago client parses your match results and sends location checks (hero wins, stats, shop purchases)

## How it works

- **Heroes** - You are given a random pool of 30 heroes to start and can unlock more by finding "Progressive Group Unlock" items. Wins with a hero from each group is a check. 

- **Stats and Attributes** - Checks such as "Win with a Melee Hero", "Win with a Support Hero", "Have X kills", "Have X Dewards" are examples of some checks in the game

- **Shop Items** - While you can buy any item in a Dota 2 match, the checks for buying those items will be **locked** for the Archipelago until the right unlock items are found. All Consumable Items will start unlocked: Tangos, Salves, Wards etc. For an Item to be available **all Basic Components** of that item must be unlocked (Recipes not included). Example: the `"Unlock Ring of Protection"` item unlocks both the `"Ring of Protection"` check and the `"Buckler"` check (ring + recipe), however the `"Soul Ring"` check would require the `"Unlock Gauntlets of Strength"` item as well (ring + gauntlets + recipe). 

- **Collectables** - A certain number of **Primordial Fragments** set by the options are required to complete the goal. This is needed so the archipelago has something it can actually track and generate the logic around

- **Goal** - Have the number of Unique Hero Wins, Total Wins, and Primordial Fragments set by the YAML

see the **Setup Guide** in setup_en.md for setup and custome client instructions