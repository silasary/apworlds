# Castlevania: Aria of Sorrow

## Quick Links
- [Setup](/tutorial/Castlevania%20-%20Aria%20of%20Sorrow/setup/en)
- [Options Page](/games/Castlevania%20-%20Aria%20of%20Sorrow/player-options)

## What does randomization do to this game?

The one-time items sitting on the ground throughout Dracula's castle have had their contents
shuffled. That covers 115 pickups on a normal file, plus 5 more that only exist in Hard Mode. Money
pickups are shuffled along with everything else, so a candle that held 500 gold in the vanilla game
may now hold a soul, a weapon, or another player's item.

Souls dropped by enemies are **not** shuffled. You still farm those from the enemies that drop them,
exactly as in the vanilla game. Only the ground pickups become Archipelago locations.

Nothing else about the castle changes: room connections, enemy placement, and boss fights are all
vanilla.

## What is the goal?

Set by the "Goal" option.

- **Chaos** (default): reach and defeat Chaos's second form — the true ending. As in the vanilla
game, this requires all three Ancient Books plus the Flame Demon, Succubus, and Giant Bat souls, and
you must have beaten Graham.
- **Graham**: defeat Graham with whatever equipment you have — the bad ending. A much shorter seed.

## What items can appear in other players' worlds?

Anything that can be found on the ground: souls, weapons, armor, accessories, consumables, the
Ancient Books, the Castle Maps, and gold.

## What does another world's item look like?

It looks like a **Skull Key**. Aria of Sorrow has to hand Soma something physical when a pickup is
collected, and there is no "empty item" in the game data, so a Skull Key stands in. The Skull Key is
not otherwise obtainable, which makes it an unambiguous marker.

Collecting it still sends the check. The client trims your Skull Key count every tick so the
9-consumable cap can never block you from collecting more pickups.

## Which souls does the logic care about?

Logic tracks the movement souls, since they are what gate the castle: Flying Armor, Skeleton Blaze,
Malphas, Hippogryph, Undine, Skula, Black Panther, Giant Bat, Grave Keeper, Kicker Skeleton, and
Galamoth.

Flame Demon and Succubus are enemy drops rather than ground pickups, so logic instead checks whether
you can *reach* an enemy that drops them. Transformation souls (Devil and Manticore) work the same
way. Curly is deliberately not modelled, which keeps logic conservative.

## Logic difficulty

Some routes in the castle need execution skill on top of the right soul. The "Logic Difficulty
Preset" option decides how much of that logic may expect, and each tier includes the ones below it:

- **Canonical** (default): developer-intended routes only.
- **Standard**: may expect launching off a kickable enemy.
- **Advanced**: may also expect platform clips.
- **Expert**: may also expect pixel-perfect platforming.

Quick-save resets are never expected by any preset. Each technique also has its own override, so you
can force one in or out of logic independently of the preset you chose.

## Item smoothing

By default the world biases placement so that weaker items turn up early and stronger ones turn up
late, using aggregated community tier-list data. This only moves items that are not needed for
progression, so it can never make a seed unwinnable. Set "Item Smoothing" to `off` if you want
placement to be genuinely uniform.

Two axes control how "early" is measured:

- **map_distance** (default): structural distance from the start in the unrandomized castle. A room
is always as early as its position on the map makes it, regardless of where progression landed. This
means you can still find something useful if a seed pushes you into a hard area early.
- **spheres**: logical reachability order within *this* seed.

The three Ancient Books are spread across early, middle, and late rather than being treated as junk.
With **Ancient Book Soul Drops** (on by default), holding a book makes the enemy that drops the soul
it describes (Flame Demon, Giant Bat, or Succubus) always drop it.
The vertical mobility souls have their own option ("Early Mobility Souls"), because they gate
movement rather than power; by default one of them is usually pulled early so you do not start
completely mobility-starved. Black Panther has a similar toggle of its own.

## Gameplay options

- **Skull Key Warp** (on by default): using a Skull Key from the Consumables menu teleports Soma to
the starting room.
- **Hard Mode**: shuffles the five Hard Mode-only pickups into the pool, and the client forces the
difficulty so they spawn. Enemies take less damage.
- **Study Sealswitch**: normally the Forbidden Area gate at the bottom of the Study can only be
opened by a button on the far side. By default that button is replaced with a shuffled "Study
Sealswitch" item, so the gate opens once you receive it.
- **New Soul Pause** (on by default): a soul from another world that you do not already own shows
the game's first-soul box and stops the action until you press A, the same as absorbing one
yourself. Turn it off and every received soul gets the short banner a duplicate gets, so play is
never interrupted by something another world sent.
- **Single-Jump Divekick** (on by default), **Classicvania Movement**, and **Oops! All Whips** are
optional gameplay tweaks ported from Xanthus's public Aria of Sorrow patch collection.

## Does DeathLink work?

Yes. Enable the "Death Link" option. Soma's death is broadcast the moment the game enters its death
state, and an incoming death runs the game's real death routine rather than simply zeroing your HP.
