# Splasher

## What is this game ?

**Splasher** is a 2D-platformer game created by Splashteam, in which you control a brave prisoner of a scummy company, Inkorp, which crafts mysterious ink with surprising powers.

### What does randomization do to this game ?

The basic idea is to break the linearity of the base game to create a new experience, and you have a few options to do so :

- You can choose to unlock every level from start, or lock each level behind a key obtainable as an *Archipelago* item.
- You can choose to lock you power unlocks behind *Archipelago* items, so you'll have to be a bit more creative to progress

As for locations, game's collectables (mainly, *Splashers*) are randomized and reward a random Archipelago item upon collecting them. Notice locations validate upon reaching a checkpoint !

### What is the goal ?

As in vanilla, you need to imprison Inkorp's main scientist and set all prisoners free ! Reaching the last level is locked behind a customizable amount of *Splashers*.

## Options

Except for splashers goal amount, options are not implemented yet, meaning you'll need to use the default choice for every option. Though you can generate a template option to check out planned options !

## Quirks on the current implementation

- Logic is unstable (not tested exhaustively), meaning you *may* be stuck on unreachable checks in logic.
- You'll need to reload the Hub (e.g. enter/exit a level) to update your Splashers count.
- No tracker is available at the moment
- The starting inventory is not tested properly, though giving powers works