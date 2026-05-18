# Monster Hunter Rise

## Where is the options page?

The [player options page for this game](../player-options) contains all
the options you need to configure and export a config file.

## What does randomization do to this game?

Hunting a large monster requires its **license**. Licenses are scattered
across the multiworld as Archipelago items. Hunting a licensed monster
sends a check to the AP server, which causes the multiworld to release
more items — including more licenses.

The license requirement is a **soft gate**: the player can fight any
monster, but the check only sends when the player holds the
corresponding license. Hunting an unlicensed monster simply does
nothing from Archipelago's perspective.

## What monsters are randomized?

A random subset of large monsters is drawn into the world at generation
time. The size of this subset is set by the `MonsterCount` option
(default 15, range 2–72). Two option toggles control which monsters are
eligible:

- `IncludeSunbreak` (default **on**) — adds the Sunbreak roster.
- `IncludeRisen` (default **off**) — adds the five Risen elder dragons
  from Anomaly endgame. Has no effect when Sunbreak is disabled.

From this subset, two monsters are picked with special roles:

- A random **starter monster** — its license is precollected, so the
  player has something huntable from the start.
- A random **goal monster** chosen from the elder dragons in the
  subset. Hunting it (specifically, completing both of its hunt
  locations) sends the Victory item and finishes the world.

Each monster contributes **two** AP locations (`Hunt X (1/2)` and
`Hunt X (2/2)`). Both fire on the same in-game hunt event — you do not
need to hunt a monster twice.

## What about weapons?

The `IncludeWeapons` option (default **on**) adds weapon licenses. 
When enabled, a hunt also requires that the player hold a
license for their currently-equipped weapon type. There
are 14 weapon types in the game, so 14 possible weapon licenses.

One random weapon license is precollected at world start so the player
can hunt with at least one weapon from the start. The remaining weapon
licenses fill spare slots in the item pool alongside filler.

Completing a hunt with an unlicensed weapon simply means the hunt 
won't send a check.

## What does another world's item look like in Monster Hunter Rise?

Items received from other worlds appear as in-game chat lines
(`[AP] Received: <item name>`). Items the player sends to others are
announced with `[AP] Sent <item> to <player>`. There's no in-world item
appearance — Archipelago state lives entirely in chat and the in-game
tracker overlay.

## What is considered a "check"?

Slaying or capturing a large monster in **single-player** while the
player holds the relevant licenses (the monster's license, plus the
current weapon's license when `IncludeWeapons` is on). Additional
checks may be added in the future.
