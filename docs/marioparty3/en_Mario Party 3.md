# Mario Party 3

## Where is the options page?

Simply press "generate options template in the archipelago launch and edit the yaml for "Mario Party 3"

## What does randomization do to this game?

Players select the Boards they want to play and load them via Party Planner 64, turning Mario Party 3 into an expansive world limited only by the number of boards made for AP.
Current Boards:
-AP Test Board(v0.0.2, not intended for final release)

## What is the goal of Mario Party 3 when randomized?

The current goal is to be able to reach the final zone or the last turn, depending of if the "Progressive Turns" Option is set.

## What items and locations get shuffled?

Locations:
-Each Space except happing spaces send a "Space xx" check when passed
-Happening Spaces send a check when landed on
-Being in first place when the turn changes will grant a check for the turn you just left

Items:
-In game items such as mushrooms have been shuffled(note: Warp Blocks, Magic Lamps and Reverse Mushrooms are "Illegal" and will not be given, and any earned natually in game will be rolled out before they are usable. this is to prevent progression breaking and soft locking)(Wacky Watches are not included either and are their own item)
-Progressive Shroomment will give the play a Mushroom or Golden Mushroom at the start of their turn
-Keys for each Zone, in order to move through the map the player must have the required key
-Filler "Coins +3"
-Progressive Wacky Watches limit the range of turns the player is allowed to skip to, the player may still normally progress through turns
-Progressive Turns limit the turns available to the player, the game won't move into the next turn without enough Progressive turns(if the option is set)

## Which items can be in another player's world?

Any shuffled item can appear in another player's world.

## When the player receives an item, what happens?

Items are applied by the BizHawk client and Lua connector and show up in-game at the start of your next turn. If a player has any items gained either in game or via archipelago, then the game harvests your ingame inventory and the custom inventory menu opens at the start of your turn and allows you to select an item to put into slot 0 for the turn. 
Currently warp blocks and magic lamps and Reverse Mushrooms are illegal due to progression balancing, so they are re rolled into a legal item. NPCs still can use Magic Lamps and Reverse Mushrooms, as they don't affect the player.

## QOL
Pressing L and Z alongside a combo button will allow some QOL/testing features:
-Dpad: Manipulates the turn. NOTE: will snap the turn within the turns allowed with the wacky watch, so if you have no waky watches, and are turn ten, manipulating the turn will automatically snap you to turn 5 then offest from there (you get the first 5 turns for free)
--L/R: Will increment or decrement the current turn
--U/D: Will increment or decrement  the current turn by 10
-R: Brings up some debug overlay, allowing for the player to see some stats and values. this debug overlay is not static and changes as i need it, and is not intended to be party of the final release
Additionally, the player is give a lua gui text telling them the current/max turns for skipping. current can be greater than max if you let the game change turns normally, and dont have enough Wacky Watches