# Yu-Gi-Oh! Legacy of the Duelist: Link Evolution

## Where is the options page?

The [player options page for this game](../player-options) contains
all the options you need to configure and export a config file.

## What does randomization do to this game?

The 175 named campaign duels (across the six series: YuGiOh, GX, 5Ds,
ZEXAL, ARC-V, VRAINS) are gated behind **Unlock items** in the
multiworld. You can only play a duel once its Unlock arrives. Winning
a duel sends two checks (Win + First Clear Bonus), which release
more items — including more Unlocks.

Your **card collection** is also fully managed by AP. The game's
default starter decks and unlocks are suppressed; your trunk only
contains cards that AP has granted you. Cards arrive in two ways:

- **Shop pack unlocks** — Archipelago items that unlock individual
  character packs (Yugi, Kaiba, Joey, Jaden, Yusei, Yuma, Yuya,
  Playmaker, etc.) in the in-game card shop. You spend Duel Points
  (earned from duel rewards) on packs to pull cards.
- **Direct card items** — staple cards (handtraps, generic
  negations, removal, etc.) are seeded into the multiworld as
  individual items.
- **Crafting** — the client adds a Crafting tab where you can
  directly buy any card in the LE-v2 cardpool by spending DP.
  Non-staples are cheap; staples cost a premium.

The first time you connect to a seed, you also get a **starter
archetype bundle**: 8 random cards (×3 copies each, 24 total) from
a curated archetype tied to your precollected character pack. If
the pack maps to multiple archetypes, you pick one from a popup.

## What is considered a "check"?

Winning a named campaign duel for the first time. Each duel awards
two checks (`Win` + `First Clear Bonus`) that both fire on the same
win event — you don't need to win the duel twice.

Tutorials (slot 1 of each series) and a couple of the VRAINS duels 
that have an issue are excluded. I'm working on that. 

## What does another world's item look like in this game?

Items received from other worlds appear in the client's tab UI and
the Archipelago Launcher console log. There's no in-game item
appearance — Archipelago state lives entirely in the client window,
and is applied to the game via direct memory writes (card grants,
pack unlocks, duel unlocks, DP grants).

## What is the goal?

Two goal modes are configurable per seed:

- **Duel count** (default) — complete N duels in any combination,
  where N is set by the `goal_duel_count` option (default 20, range
  2–175).
- **Any series finale** — complete the highest-numbered duel in any
  one of the six series. So beating Yugi's final duel, or Yusei's,
  or Playmaker's, etc., wins the seed.
