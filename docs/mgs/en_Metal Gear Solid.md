# Metal Gear Solid

## What is this game?

Metal Gear Solid is a 1998 action-adventure stealth game developed and published by Konami for the PlayStation. It was directed, produced, and written by Hideo Kojima. Metal Gear Solid received unanimous acclaim. Regarded as one of the greatest and most important video games ever made, it helped popularize the stealth genre and in-engine cinematic cutscenes. The player must navigate the protagonist, Solid Snake, through a nuclear weapons facility without being detected by enemies. When Snake moves into an enemy's field of vision, he sets off an "alert mode" that draws enemies. The player must then hide until "evasion mode" begins; when the counter reaches zero, the game returns to "infiltration mode", where enemies are no longer suspicious. The radar cannot be used in alert or evasion mode. In addition to the stealth gameplay, set-piece sequences entail firefights between the player and enemies.

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a config file.

## What does randomization do to this game?

Most item pickups in the game will result in a radomized item being awarded instead. The player will still progress through the story and game areas as in the vanilla version.

## What is the goal of Metal Gear Solid in Archipelago?

Players can choose one of three goals for their world.
1. Game Completion: Beat the game as normal.
2. Boss Blitz: Defeat a certain number of the 14 in-game bosses.
3. Dogtag Collection: Collect a certain number of 'Dogtag' items which will be added to the randomized item pool.

## Which items can be in another player's world?

Most items that the player can pickup and use in-game can be randomized to another player's world. Some examples include: weapon ammunition, rations, key cards, and cardboard boxes.

## What is considered a location check?

Picking up or recieving items in-game will trigger location checks, like picking up a Ration or SOCOM ammo, or receiving a Key Card during a cutscene. Defeating a boss will also trigger a location check.

## When the player receives an item, what happens?

The item received will be instantly added to the player's inventory.

## Why are location checks limited per region?

In Metal Gear Solid, item pickups respawn infinitely. It would be possible for a player to pickup all the items in a region, leave, return, and pickup all the items once again. This would allow infinite location checks without much issue. To make things more interesting, this Archipelago mod only allows a certain number of location checks per in-game region and won't send any more location checks to the Archipelago server after the region limit is met.

## Why can't I find this location check?

In Metal Gear Solid, certain item pickups will only spawn if the player doesn't already have that item. If you have received the item from another location check, then it is possible you won't be able to collect that item's location check. These locations are 'missable'. For example, the Mine Detector pickup will only spawn if the player does not have a Mine Detector in their inventory. If a player receives a Mine Detector before they get to the region with the Mine Detector pickup, then the pickup will not spawn and the player will be unable to check the Mine Detector location. To prevent softlocking, the Archipelago randomizer will only ever fill 'missable' locations with filler items. All progression items will be found at locations which always spawn.

## How do I defeat Psycho Mantis?

The controller must be plugged into the second controller port. I honestly cannot figure out how to emulate this with the BizHawk emulator, so I added a command that can be entered into the Archipelago BizHawk Client that will set his health to 0, effectively allowing players to skip this boss fight. While it is possible to get lucky and hit Mantis while using the first controller port, it is very difficult. The player will still need to hit Mantis at least once while he is at 0 HP to trigger the ending cutscene.

## How do I contact Meryl?

Her frequency is located on the back of the CD case.

## Unique Local Commands

The following commands are only available when using the BizHawk Client to play Metal Gear Solid with Archipelago.
- `/check_goal` Prints the progress towards the world's selected goal.
- `/check_collection <region>` Prints which items have been collected in the provided region. By default, the region the player is currently in will be used. 'all' can also be used to print every region.
- `/kill_mantis` A cheat that reduces Psycho Mantis' HP to 0 in case the player has difficulty switching controller ports in the BizHawk emulator.