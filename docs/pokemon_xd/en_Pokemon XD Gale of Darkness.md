# Pokemon XD: Gale of Darkness

## Where is the options page?

The player options page for this game contains the options you need to configure and export a config file.

## What does randomization do to this game?

AP client talks to a Dolphin process over its
memory -- see the setup guide for what it can and can't do automatically. Several kinds of check are shuffled:

- **Overworld items** -- chests, NPC gifts, and found items in the field.
- **Opening a chest** -- unique per chest location.
- **Trainer defeats** -- defeating a unique trainer, or, in Cumulative mode, "Defeat 1 Trainers" through "Defeat
  X Trainers".
- **Catching a species** -- one check per species you can actually obtain in your seed (its Shadow Pokemon, its
  Poke Spot species and your starter), the first time that species is seen owned, live-detected off the game's
  own memory.
- **Purifying a Shadow Pokemon** -- Cumulative checks, "Purify 1 Shadow Pokemon" through "Purify X Shadow
  Pokemon", one per Shadow Pokemon your seed holds that can be had before the goal. Greevil's Shadow Pokemon and
  Miror B.'s post-game Dragonite have no checks.
- **Shop purchases** -- shelf slots in the shops, when shop randomization is on.

Every check grants an ordinary shuffled item from the multiworld.

## What is the goal of Pokemon XD?

Chosen with the Goal option:

- **Defeat Greevil** (default) -- reach Citadark Isle and defeat Cipher's boss, Greevil, having gathered the key
  items (or Robo Kyogre Parts) needed to get there.
- **Win Mt. Battle** -- defeat the final trainer on Mt. Battle.

## What does another world's item look like in this game?

Not yet defined -- the client doesn't currently render a distinct "foreign item" indicator in-game.

## Known issues

- Location shuffle is experimental. Issues and softlocks are definitely possible. Please report all bugs if you can.
