# Monster Hunter Rise

## Where is the options page?

The [player options page for this game](../player-options) contains all
the options you need to configure and export a config file.

## What does randomization do to this game?

There are **two game modes**, selected by the `Mode` option. They are
mutually exclusive — a seed is one or the other. The Hunt-a-Thon mode is 
intended for **existing nearly complete saves** while the Quest Randomizer
is for **fresh saves** with nothing unlocked.

### Hunt-A-Thon (`hunt_a_thon`, default)

> **Play Hunt-A-Thon on an existing save.** The randomizer will
> assign you targets based on your options and they could come from
> end game. This mode can be made short and sync viable using the 
> MonsterCount option.

Hunting a large monster requires its **license**. Licenses are scattered
across the multiworld as Archipelago items. Hunting a licensed monster
sends a check to the AP server, which causes the multiworld to release
more items — including more licenses.

The license requirement is a **soft gate**: the player can fight any
monster, but the check only sends when the player holds the
corresponding license. Hunting an unlicensed monster simply does
nothing from Archipelago's perspective. Goal: hunt the goal elder
dragon.

### Quest Randomizer (`quest_rando`)

> **Play Quest Randomizer on a fresh save.** Clears are recorded
> at the moment a quest is cleared, so a save that has already 
> cleared quests will need to redo them.

Every village quest in the pool has its **boss monster swapped** to a
random other monster (chosen at generation time, applied in-game when
you connect). So you might fight a Magnamalo quest and a Rathalos shows up
instead.

Each quest also gets an `Unlock: <quest>` Archipelago item. Clearing a
quest sends **two AP checks**, but only when you hold that quest's
`Unlock:` item (and, when weapons are enabled, the license for your
equipped weapon type). This is a **soft gate** like Hunt-A-Thon: the
game's own progression decides which quests are visible and clearable;
Archipelago only registers the checks once you hold the correct items.

The **goal** is clearing the village urgent quest,
**Comeuppance** (vanilla Magnamalo) — its boss is randomized too when
quest-monster swapping is on.

The `RandomizeQuestMonsters` option (default **on**) controls the swap.
Turn it off and the quests keep their vanilla bosses — the mode reduces
to gating clear-checks on the `Unlock:` items without changing any
fight. `MonsterCount` is ignored in this mode.

## What monsters are randomized?

A random subset of large monsters is drawn into the world at generation
time. The size of this subset is set by the `MonsterCount` option
(default 15, range 3–72). Two option toggles control which monsters are
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

- **Hunt-A-Thon:** slaying or capturing a large monster
  while holding the relevant licenses (the monster's
  license, plus the current weapon's license when `IncludeWeapons` is
  on).
- **Quest Randomizer:** clearing a pool village quest
  while holding that quest's `Unlock:` item (plus the
  current weapon's license when `IncludeWeapons` is on). Each clear
  sends two checks.
