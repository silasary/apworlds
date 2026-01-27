# Cobalt Core (PC)

## Where is the settings page?

The [player settings page for this game](../player-settings) contains all the options you need to configure and export a
config file.

## What does randomization do to this game?

On default settings, you will start with three randomly chosen characters and
a randomly chosen ship. Starting cards for each character are randomized as well.
Aside from the starting cards, most of the cards and artifacts you will find will
be unplayable until they are unlocked by you or another player.

The goal is to accumulate a certain amount of memories (1 for each character by
default), which unlocks the Future Memory sequence. Finishing this sequence
completes the game.

There are more details in the `.yaml` settings as well as in the in-game
mod settings (such as Deathlink).

## What items and locations get shuffled?

Usual character and ship unlock conditions are removed.
In order to unlock ships, characters, cards, artifacts, or items for other
games, you will find new cards and artifacts which unlock an item when played.
Which items you find will depend on which characters you have in your run.

The `.yaml` settings allow you to avoid shuffling either cards or artifacts.

## Which items can be in another player's world?

Specific ships, characters, cards and artifacts will be locked and unusable until you or
another player finds them. Additionally, it is possible to shuffle the character's
memories, which turns this randomizer into a "mcguffin hunt".

## When the player receives an item, what happens?

Ships and characters that are found will be selectable the next time you start
a new run. Cards and artifacts will be usable the next time you find them during
a run. If you are currently playing, you will immediately receive
a copy of the cards and artifacts that you received. This behavior can be
configured in the `.yaml` settings.

## What happens if a player dies in a run?

When you die, you will have to restart a run from the beginning like normal.
If you have deathlink active in the in-game settings, all other
players with deathlink will die as well.
