# Idle Loops

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a config file.

## What does randomization do to this game?
Action unlocks are randomized, your count of 'Lootable' actions are randomized, as is what gaining another Lootable count actually gives. Nothing inside a loop is randomized, i.e. you always get supplies from "Buy Supplies" and always need supplies to leave Z1.

## What is the goal of Idle Loops when randomized?
Finishing each Zone, you can pick which one is the goal.

## Which items can be in another player's world?
All Actions, all Lootable counts (i.e. 50 "Mana Pot"s). Non-vanilla items include "Progressive Lootable" (Acts as another of your lowest non-capped Lootable), +0.1 Game speed and +0.1 Exp Multiplier. Filler items are Extra Mana Pots/50 Starting Mana/1 Starting Gold/Nothing which fill out the rest of the pool. 

## What locations can have items?
- Finishing an action for the first time
- Progress in progress bar actions (at 1%, 10%, 25%, 50%, 75%, 90%, 95%, 99%, 100%)
- Gaining a lootable count (i.e. how many pots you can smash)
- First 10 and then and then every 10 levels in a skill (Except for Alchemy and Crafting which is every 5)
- Reaching new highs for actions like "Fight Monsters" or "Small Dungeon"

Actions are combined in cases where there's overlap (such as finishing an action for the first time giving 1% progress), or even similar-in-spirit-but-not-technically-overlapping (such as finishing an action for first time and gaining a lootable count, which happens after the first x finishes)

## What does another world's item look like in Idle Loops?
What item you will get for checking a location will be shown on relevant tooltips.

## When the player receives an item, what happens?
Most items will only take effect starting on the next loop. For example, consider "Smash Pots". Behind the scenes when you gain a Pot, you instantly gain a "good" pot, but the in-loop "goodTempPot" is unchanged.

## How many items can I find or receive in my world?
~250 per zone.