# Super Mario 64 OMM

This is a fork of the Super Mario 64 EX world for a build that includes **Odyssey Mario's Moveset** (OMM).
It is the stock world, plus items for OMM's own moves and for capturing enemies.

## Where is the options page?

The player options page for this game contains all the options you need to configure and export a config file.
Player options page link: [SM64 OMM Player Options Page](../player-options).

## What does randomization do to this game?
Everything from the stock Super Mario 64 world applies: all 120 Stars, the 3 Cap Switches, the Basement and
Second Floor Key are location checks, and the optional move randomizer, entrance randomizer, locked paintings, ...

On top of that:

- **OMM Move Randomizer** locks Odyssey Mario's Moveset moves until you find the item: Spin Jump, Midair Spin, Roll,
  Cappy Throw, Cappy Bounce, Cappy Vault and Water Dash. (The spin pound is unlocked by the Ground Pound item and the wall slide by the Wall Kick item.)
- **Capture Randomizer** locks each enemy type (Goomba, Koopa, Bob-omb, ...) until you find its capture item.
  Variants of an enemy share an item (for example huge and tiny Goombas are covered by "Capture Goomba").

None of these items are required to reach a location, with one exception: **every Bowser fight needs Cappy Throw and Capture Bob-omb**,
because OMM's Bowser is beaten by capturing a flaming Bob-omb, which starts with a Cappy throw. This covers the three regular
Bowsers and the two Sparkly Stars fights, and so every goal. If you do not randomize those two items, you have them from the start
and nothing is asked of them.

## What happens to the item pool?
OMM has no lives, so these items take the place of 1Up Mushrooms first. If there are not enough 1Up Mushrooms,
the total number of Power Stars is reduced to make room, and a warning is printed when the multiworld is generated.
Use `start_inventory_from_pool` to start with some of them.

## Toad
A captured Toad can walk through star doors, skipping their star requirement (key doors still stop him). By default
the Toad capture is therefore disabled in the game and has no item. Turn off the "Disable Toad Capture" option to treat Toad like any
other capture (it is then logic-breaking if it can be captured freely).
