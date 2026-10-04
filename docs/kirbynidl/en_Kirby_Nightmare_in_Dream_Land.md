# Kirby Nightmare in Dream Land Archipelago

Welcome to the in-progress Kirby Nightmare in Dream Land Archipelago implementation project (developer VizCount). This document should contain all the necessary information to understand how to play, the alterations made to the base game, and how to use the options.


## General Information

The goal of Kirby Nightmare in Dream Land is to collect all pieces of the Star Rod and defeat Nightmare at the end of the Fountain of Dreams. By default, all levels are unlocked, but pieces of the Star Rod are required to enter Boss levels. The number of Star Rod pieces that exist can be adjusted in the options, with a minimum of 7 and maximum of 56. The number of pieces that are absolutely required can be less than the total, also adjustable in the options (7 is still the minimum required). The cumulative piece requirement to fight each boss is evenly distributed (ie 2 for W1, 4 for W2, 6 for W3 with 14 total pieces) with any remainder going to the final boss requirement. This requirement per boss is NOT displayed in game, so double check your options if unsure. 

Clearing every normal level, boss, and Arena challenge will grant a check, as well as every Big Switch. Every food item and 1up in normal levels is also a check. Maxim tomatoes given in arenas are not checks (only clearing the Arena itself is), and 1ups given out in minigames are NOT checks. 

Kirby cannot obtain any copy abilities until that copy ability is unlocked via Archipelago. By default, Kirby also begins with a reduced number of max health segments, with more unlockable via AP vitality items. You may also use vanilla health values by reconfiguring the options to start with all 6 segments and no AP vitality items. Kirby may also receive Pep Drinks, Maxim Tomatoes, 1ups, and invincibility Candy at any time in a level via the AP client. Items will not take affect (and their SFX will not play) until you enter a level.  

All items, inlcuding client-side unblockers (door keys, unlocked abilities, Star Rod pieces) will play a specific sound effect when received based on their item type (ability, door key, Star Rod...). However, you must watch the AP tracker feed to know which specific item was received, as well as what items were sent when you check locations. 

Kirby Nightmare in Dreamland automatically saves your progress after every level and boss clear. Big Switches will always appear in levels, even if their location has already been checked. Consumable items will also reappear, but not in the same play session. If you quit and begin a new session, the consumable items awarded in previous sessions will NOT be awarded again. As in, the items awarded by the client DO sync between sessions by use of in-game save RAM. 

Make sure to connect to the client before exiting the title screen / file menu. 
I canot guarantee anything in this mod is compatible with the vanilla multiplayer features. 
Finally, use savestates as your own risk!

## Implementation and Logic Details

### Notes on Ability Logic: 
- Logic will expect you to take abilities from one level to another. If you have access to an ability anywhere, the logic expects you to be able to use it anywhere
- Light is logically required for the 4-6 Big Switch, but NOT for the 3-6 1up. Of course, you can get the 4-6 Big Switch any time if you know where it is
- Items placed behind gordos or spikes will expect you to have an ability like Burning that allows obtaining them without getting hit. Damage boosts are considered OOL, even on the "Advanced Logic" setting. 

### Notes on Mixes: 
- No locked abilities can be obtained through the mix roulette, only unlocked abilities. 
- To initiate a mix roulette, the FIRST enemy inhaled of the combo must have an unlocked copy ability. Then, the mix roulette will cycle through unlocked abilities ONLY.

### Notes on Healing: 
Healing items do not take effect directly. Instead, they are added to an "HP Bank" specific to the client session. When Kirby is at less than max health and HP is available, one health segment at a time is awarded from the HP Bank until Kirby is fully healed. The amount of HP awarded to the Bank per item depends on the current max health value. 

- Pep Drinks are worth 1 HP at 3 Max HP or less, otherwise 2 HP
- Maxim Tomtos are worth N-1 HP, where N is the current Max HP.

Upon beginning a new game session, the HP Bank resets. Previously obtained healing items are not added back in. 
Finally, due to ~~technical game limitations~~ Nightmare's Dark Power, Kirby cannot heal during the Nightmare Orb phase. 

### Note on Meta Knight:
You do NOT need to have Sword unlocked to fight and beat Meta Knight in World 6. By the special rules of this fight, you can always pick up the Sword ability, and if you had no ability initially, you will keep Sword afterwards (Otherwise, you will revert to you original ability, which is Vanilla behavior). This "extra sword" from Meta Knight does NOT unlock Sword, and is NOT factored into logic. 

### Note on Goaling: 
Specifically, the client detects the Goal Event via the "moon explosion" cutscene that plays after defeating Nightmare's second phase. It does NOT trigger immediately after depleting the boss's health bar, so be a little patient at the end!

### Note on Files: 
Starting a new file with collected items will cause all collected items to be awarded to the new file as if they were newly sent, including HP items

### Notes on Offline Play
- You must be connected to receive items and send checks. Any checks performed offline will not take effect; there is no snap-back/catch-up procedure for locations.
- In-level pickup items will not respawn on the same play session. You must restart the game to collect them again. 



## Options

- `Number of Star Rod Pieces`:
    Set the number of Star Rod Pieces in the item pool (minimum 7)

- `Number of Required Star Rod Pieces`
    Set the raw number of Star Rod Pieces to unlock the World 7 boss door and complete the game.
    The cumulative requirement for every other world's boss door will be this number divided by 7, rounded down.

- `Percent of Required Star Rod Pieces`
    Set the percent of Star Rod Pieces in the item pool required to unlock the World 7 boss door and complete the game
    The cumulative requirement for every other world's boss door will be the resulting number divided by 7, rounded down.
    Set the value to "0" to use required number. Otherwise, required percent will override this

- `Advanced Logic`
    Incorporates several difficult, obscure, or unintuitive tricks into item placement logic. Examples include
    - Using a double star from inhaling two enemies at once to destroy metal blocks
    - Breaking metal blocks with inconvenient placement using unideal abilities (ie, 6-6 Big Switch with Wheel)
    - Using various abilities to break blocks through walls or from below in ways would seem impossible (ie, 2-4 laser room with cutter)

- `Lock Bonus Doors`:
    Locks all doors to minigames and other side areas (Arenas, Museums, Warp Star Stations) until the correponding key is obtained. Adds Bonus door keys to the item pool

- `Starting Vitality`:
    Number of health segments Kirby starts the game with. Can be any number from 1-6.

- `Maximum Vitality`:
    Number of health segments Kirby can possibly obtain. Can be any number of 1-6. A number of vitality items equal to this minus the starting vitality will be added to the item pool. 

