# Silver Daze


## What does randomization do to this game?

The game begins in a special state that exists outside of the main story. You begin in Geo's Room and will be given one party member, after which point you will be able to explore the world freely.
In order to access each Zone, you'll need to collect keys to pass doors and other miscellaneous items to unlock features. Silver Daze Archipelago functions identically to the vanilla randomizer, but
contains additional options and features.

## What is the goal of Silver Daze when randomized?

### Entropy
The default goal is to defeat the final boss by accessing the Final Zone. To do this, you will need:
-All seven party members (Pinn, Geo, Kani, Shane, Wink, Jeff, and Liza)
-The Black Key
-The ability to defeat the final boss (this is not difficult.)

### Omni
The Omni goal requires you to reach Omni at the end of White Zone and defeat them. In order to reach Omni, you will need:
-The Black Key
-Dragon
-Kappa
-Cyclops
-Unicorn
-Phoenix
-Pulgasari
-Pixie

(Note that the "+" versions of the Warden cards do not enable you to access Omni.)

Once you have reached Omni, you will need to defeat them, which can require strategic builds and clever strategy. The game's logic
is preset to ensure that you have access to at least one build that can provably defeat Omni, but this logic is extremely soft and
any strategy can be utilized.


### Memory Emblems
This goal requires you seek out a specific number of Memory Emblems as specified by your options.
You can select the Required Emblems amount (the number needed to finish the game), as well as the amount added to the pool.
For example, if your required amount is 10 and the amount in the pool is 20, then you will need to find any 10 of those 20 items to finish.
If your required amount exceeds the pool amount, the difference will be added to ensure the game is always beatable.


### Chaos Seeds
This goal requires you seek out a specific number of Chaos Seeds as specified by your options.
The goal is very similar to Memory Emblems, however the Chaos Seeds will only be placed in locations dropped by bosses; in other words, this is a boss rush mode.
Your settings will enable you to influence which bosses are able to drop Chaos Seeds.

## What items and locations can get shuffled?

Locations in which items can be found:
- Any spot where you have recruited a party member (as well as all of their starting equipment)
- Any spot where an item would be given to you
- Any spot where a ReCollection is unlocked
- All chests
- All Starstuds
- The keys dropped by Wardens
- All card drops from bosses (includes minibosses, Wardens, and Chaos Wardens)
- The Fragments dropped by Chaos Wardens
- The Memo Items, as well as their corrosponding card that you would normally get from the password trader.
- All shop items
- All ReCollection rewards

Based on your settings, some locations may only drop filler and are not included in the pool.


Items that can be shuffled:
- Any "special" card (cards that are obtained from drops listed above). Note that cards dropped by enemies are not inherently shuffled into the pool, unless they are considered "valuable" (i.e. in logic).
- All MP3s
- All Party Members
- All Keys
- All Fragments
- Blue_Zone() and ._locale
- The MemFinder
- ReCollection unlocks
- Exander (this causes Wink to transform into Exander)

## What does another world's item look like in Silver Daze?

Items picked up from chests or other overworld items do not change appearance, but will inform you of the player and name of the item when picked up.
Itmes in shops and ReCollections will display an Archipelago icon as well as the name of the multiworld item.

## When the player receives an item, what happens?

Items are automatically added to the player's inventory upon receiving a message from the game. 
If the game does not give you an item, leaving a room will force a refresh, causing the item to return to your inventory if it is not detected.