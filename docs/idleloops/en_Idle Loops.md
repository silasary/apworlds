# Idle Loops

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a config file.

## What does randomization do to this game?
Action unlocks are randomized, your count of 'Lootable' actions are randomized, as is what gaining another Lootable count actually gives. Nothing inside a loop is randomized, i.e. you always get supplies from "Buy Supplies" and always need supplies to leave Z1.

## What is the goal of Idle Loops when randomized?
Finishing each Zone, you can pick which one is the goal.

## Which items can be in another player's world?
All Actions, all Lootable counts. For Filler items there are Mana Pots, Starting Mana/Gold and Gamespeed. Having Gamespeed as a filler item makes Z4+ reasonable in a week long async, maybe I should add similar filler items such as +0.1 exp mult? And have that bring Z5+ reasonable?

## What locations can have items?
- Finishing an action for the first time
- Progress in progress bar actions (at 1%, 10%, 25%, 50%, 75%, 90%, 95%, 99%, 100%)
- Gaining a lootable count (i.e. how many pots you can smash)
- First and then every 10 levels in a skill
- Reaching new highs for actions like "Fight Monsters" or "Small Dungeon"

Some of these will have options in the future.

Actions are combined in cases where there's overlap (such as finishing an action for the first time giving 1% progress), or even similar-in-spirit-but-not-technically-overlapping (such as finishing an action for first time and gaining a lootable count, which happens after the first x finishes)

## What does another world's item look like in Idle Loops?
There is very basic proof of concept scouting, where the item's name and its player are shown on hover tooltips, but which tooltip has this information is currently inconsistent across types.

## When the player receives an item, what happens?
Most items will only take effect starting on the next loop. For example, consider "Smash Pots". Behind the scenes when you gain a Pot, you instantly gain a "good" pot, but the in-loop "goodTempPot" is unchanged.

Right now, if the last action you take in a loop grants an item (and it's your own), you *won't* get it in the next loop, because the next loop has already started by the time the server sends the item back. This seems scary to fix.

## How many items can I find or receive in my world?
~250 per zone.