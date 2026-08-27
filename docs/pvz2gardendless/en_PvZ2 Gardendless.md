# PvZ2 Gardendless

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to
configure and export a config file.

## What does randomization do to this game?

Every plant is taken away from you. Plants normally handed out by beating levels — and the four the
game grants at the very start — are instead scattered across the multiworld, and the game refuses to
let you use one until Archipelago actually sends it to you. You are guaranteed one cheap attacking
plant at the start of the run so you always have something to place.

**Starting Plants** raises that from 1 to as many as 10. The first is always the cheap attacker, so
the guarantee holds whatever you set; the rest are drawn at random from the roster.

No plant that logic asks for is ever given away, at any setting: not a sun producer, and not a
world's entry plant (Lily Pad, Blover, Perfume-shroom, a Jester answer or a warming plant). A plant
you are handed at generation time satisfies the rule naming it before that rule is ever checked, so
giving one away would just make the requirement decorative. Finding those stays part of the run.
Plants you start with are removed from the item pool rather than shipped twice.

Each world other than Ancient Egypt is locked behind its own **Progressive <World>** unlock, so the
order you see the game in is decided by the multiworld rather than by the map. For most worlds that
unlock is the whole requirement: hold one and that world's opening is open.

**Every world but Ancient Egypt also wants a sun producer.** Nothing but sunlight pays for
anything, so a world you cannot make sun in is a world you cannot play. This is what guarantees a
sun producer turns up early: every way out of the opening runs through one, so the generator has to
place one where you can reach it.

Five worlds want a further plant on top of that, because they are the ones you cannot sensibly play
without it:

| world | wants |
| --- | --- |
| Big Wave Beach | Lily Pad |
| Far Future | Blover |
| Jurassic Marsh | Perfume-shroom |
| Dark Ages | one plant whose shots the Jester cannot turn back on you: Banana Launcher, Electric Peashooter, Magnifying Grass, Missile Toe, Sap-fling or Strawburst |
| Frostbite Caves | a plant that gives off standing heat: Fire Peashooter, Hot Date, Jack O' Lantern, Lava Guava or Torchwood |

So Big Wave Beach 1 needs Lily Pad **and** a sun producer **and** one Progressive Big Wave Beach,
not any of them on its own,
and the requirement covers the whole world rather than only its opening. This is a logic
requirement, which means the multiworld will not hide anything behind a world you cannot really
play, but the game itself does not stop you starting those levels. Frostbite Caves asks for no
plant.

Ancient Egypt is the exception and the place every run starts. Its first five levels need nothing but
the plant you begin with; from **Egypt level 6** onward it wants a sun producer and a cheap attacker,
which is the game's own expectation and the one plant requirement still in force anywhere.

Modern Day works exactly the same way, and so does every other world: what you are looking for is
three copies of **Progressive &lt;World&gt;**.

The first opens the world — that is the item the old World Key became. The second and third open its
later stretches, because a world is cut into three and you get them one at a time. **The game
enforces this**: a level you have not unlocked cannot be started at all, not just cannot be logically
required.

The cuts are the world's own milestones: its World Key level, then its Zomboss, then the rest. Every
world splits at the same two places, which are the same levels the goal is measured on, so working
toward the goal is always working toward your next unlock.

Two worlds have no such milestone to use. Kongfu Temple has no Zomboss level, so its second cut is
the midpoint of what is left; Aerial Fortress has neither, so it is cut into equal thirds.

Ancient Egypt has no key, so its opening is where every run starts — and it has one extra gate the
other worlds do not: **from Egypt level 6 you need a sun producer and a cheap attacker.** That is the
game's own expectation (it is where the store unlocks too), and it is a logic requirement rather than
an unlock, so nothing blocks you from starting those levels. Egypt 1-5 need nothing at all, which is
what every seed opens with.

## Do I have to play all thirteen worlds?

No. **World Count** sets how many worlds the seed uses — all of them count, Ancient Egypt and Modern
Day alike — and the generator picks the rest at random. Set it to `random` and it picks the number too.
Use **Enabled Worlds** to name worlds you definitely want; any remaining slots are filled at random
around them, and naming more worlds than the count asks for keeps all of them.

Ancient Egypt is always in, since it is the only world playable with no items. Set World Count to 1 and
Ancient Egypt is the whole seed. Modern Day is an ordinary entry: leave it out and the seed has none.

Worlds left out are gone completely: their levels are not locations, their unlock items are not in the
pool, and they stay locked for the whole run. Everything outside the main worlds — the side paths, the
Danger Rooms, the store — is unaffected.

A seed that small has fewer places than the item pool would like, so it ships fewer plants: the ones no
rule needs go first, then the rest down to a floor of one sun producer and one cheap attacker, which is
all the logic can ever ask for. An Egypt-only seed is about 50 locations.

**Worlds Required** shrinks to fit. Ask for 4 world keys in a 3-world seed and the run needs 3.

## What does Randomize Conveyor Plants do?

Conveyor levels hand you plants on a belt instead of letting you pick a seed bank. With this on, the
plants on that belt are replaced at random, drawn from the whole roster.

Each belt entry keeps the level's own drop weight and counts, so the level runs at the pace it was
designed to — only the plant changes. The roll is fixed per level, so retrying is not a reroll.

Bowling, power-tile and potion levels are left alone. Their belts deliver projectiles and tools rather
than plants, and swapping those out would make the level unplayable.

This does not leak progression. Conveyor levels already hand out plants regardless of what
Archipelago has sent you, and you do not keep what comes down the belt.

## What does Shuffle Zombies do?

Every level fields a different set of zombies. A level that sent Mummies might send Cowboys, Pirates
or Jetpack Zombies instead.

Swaps stay inside a tier, so a level keeps the difficulty it was built around. The tier comes from the
game's own wave-point price for each zombie — what its wave generator pays to field one — so a basic
zombie is traded for another basic zombie, never for a Gargantuar. Gargantuars only become
Gargantuars, water zombies only become water zombies, and Zombosses are never touched, so every boss
fight is the one the level intended.

Zombies that need a specific plant to answer them stay where they are. The Jester still only turns up
where a Jester turned up, and the ice-block carriers only where they already were. That is what keeps
Dark Ages' Jester requirement and Frostbite Caves' warmth requirement meaningful — the shuffle cannot
drop a threat into a world you have no answer for, and it cannot take one out of a world whose logic
is built on it. Nothing about item placement or logic changes when this is on.

Levels built around particular zombies are skipped entirely — the camel matching games in Ancient
Egypt, the Pirate Seas cannon levels, Beghouled, bowling, Last Stand and the other set pieces. Those
levels are won on their specific zombies rather than just spawning them, so a swap could leave one
unbeatable. That is 84 of the game's 1134 levels; everything else shuffles.

The roll is fixed per level, so retrying is not a reroll, and two players on the same seed get
different lawns.

## What is the goal?

Collect **Worlds Required** goal items. Which worlds they come from is up to you — any of them
count, Modern Day included — and the run ends the moment the last one lands.

Every world's goal level carries one, and it is the only thing on that level:

- **Time Key** under the World Key goal
- **Trophy** under the Zomboss goal
- **Gold Medal** under the Completion goal

They show up in the AP panel as `2/3 Time Keys`, and `!hint Goal` finds whichever one your seed
ships. Because the win counts items rather than levels, a goal level someone else checks for you
still counts — you just have to end up holding the item.

**Goal Type** decides which level carries it:

- **World Key** — clear that world's World Key level (`egypt8`, `dark10`, `modern16`). The shortest,
  and the default. It is not the same stage in every world; hint the `World Key Levels` group to see
  them all.
- **Zomboss** — beat that world's Zomboss, the boss fight partway through it (`egypt25`, `dark20`,
  `dino32`). Kongfu Temple has no Zomboss level in the game data, so it can never count toward this
  one.
- **Completion** — clear that world's final level (`egypt35`, `kongfu48`, `modern44`). The longest.

Asking for more worlds than the seed contains is not a mistake — it clamps down to what is actually
there, so a three-world seed asking for eleven needs three.

Aerial Fortress is playable but never counts: it has neither a World Key level nor a Zomboss.

*Changed in this version.* The goal items are new: the win used to be measured off the goal
locations directly, with nothing on them to collect.

*Changed in an earlier version.* The run used to end on one specific Modern Day level, with everything above
deciding how much of the game you needed before Modern Day opened at all. A seed generated before the
change still plays the old way — the client handles both.

## What items and locations get shuffled?

**Locations** are the levels themselves — 531 by default, or 755 with Side Paths and Danger Rooms
both enabled — plus, with Shopsanity enabled, 39 one-time store purchases. Lowering **World Count**
removes the levels of the worlds it leaves out. A Danger Room is in logic only once the level that
unlocks it is, matching the game.

**Items** are:

- **Plants** — the full roster. A handful are required by logic: a sun producer and a cheap attacker
  for Ancient Egypt from level 6, then Lily Pad for Big Wave Beach, Blover for Far Future,
  Perfume-shroom for Jurassic Marsh, a Jester answer for Dark Ages and a warming plant for
  Frostbite Caves (see above). However small the seed, one plant for each of those requirements
  always stays in the pool.

  Forty-seven plants qualify as a cheap attacker, but each seed picks **ten** of them at random to
  be the ones logic asks for; the rest are ordinary plants. Only the worlds your seed actually
  contains contribute a requirement, so an Ancient Egypt run treats Lily Pad like any other plant.
  This keeps the required-plant list short enough to leave room for everything else.

  `!hint Sun Plants` asks about the five sun producers on their own. That is usually the hint you
  want: a sun producer is the one plant every seed needs, Ancient Egypt expects one from level 6,
  and it is the one plant **Starting Plants** will never hand you. `Sun`, `Sun Producers` and
  `Sun Plant` all work too.
- **150 Gems** — **with Shopsanity on**, one of them in every seed no matter how small, always on a
  check you can reach before Ancient Egypt 9. Gems are the shop's only currency and the game hands
  out none of them under Archipelago, so this is the guaranteed floor for buying anything. Larger
  seeds also scatter 10/20/50 Gem filler; a one-world seed has room for none, which is why this one
  is not filler. With Shopsanity off nothing you need costs gems, so it is not included and the
  slot goes to a plant instead.
- **Progressive World Unlocks** — three per world (two for Ancient Egypt, which needs none to enter).
  The first opens the world, the second and third its middle and last stretches. `!hint World
  Unlocks` answers where all of them are.
- **Upgrades** — the fourteen permanent ones, with **Shuffle Upgrades** on. Nine of them are normally
  level rewards and five are store purchases; with the option on, clearing that level or making that
  purchase still sends the check, but the upgrade itself goes into the multiworld and only takes
  effect once you receive it. With the option off they are handed out as they always have been and
  are not items at all.

  The tiered ones are **progressive**, because each level of a tier does the same thing and the game
  simply adds them up — there is no "level 2" to receive out of order:

  | Item | Copies | Each copy gives |
  | --- | --- | --- |
  | Progressive Starting Sun | 2 | +25 starting sun |
  | Progressive Plant Food Slot | 2 | +1 plant food held (base 3) |
  | Progressive Seed Slot | 2 | +1 seed slot (base 6) |
  | Progressive Sun Shovel | 3 | +0.25 sun shovel rate |
  | Progressive Manual Mower | 2 | +1 manual mower |
  | Wall-nut First Aid | 1 | — |
  | Plant Food Refresh | 1 | — |
  | Sky Shield | 1 | — |
- **Coins and gems** — filler, and the currency the store runs on.
- **Random Plant Costume** — filler. Each one dresses a plant you already own in
  a costume you do not have yet, picked at random from the 309 the game has
  across 120 plants. Purely cosmetic. One arriving before you own any plant is
  held and applied once you do.
- **Lawn Mower Trap** — sets off every lawn mower on the field at once. They roll out and are spent,
  leaving those lanes with no last line of defence for the rest of the level. A trap received while
  you are not in a level is held and applied when the next one starts.
- **Costume Shuffle Trap** — re-rolls what every dressed plant is wearing, including taking some
  costumes back off. It never takes a costume away from you: only what is worn changes, so anything
  scrambled can be put back on from the almanac.

## Which items can be in another player's world?

Any of them. All plants, world keys, upgrades, filler and traps can land in any world in the
multiworld.

## What does another world's item look like in PvZ2 Gardendless?

Nothing in-game marks it. Completing a level sends the check and the Archipelago client reports what
was found there, so the item text arrives through the client rather than through the game.

## When the player receives an item, what happens?

The client grants it immediately and shows a toast. Plants become placeable from that moment on;
before then the game hides them and suppresses their description tip. Coins and gems are added to
your balance. Traps fire at once if you are in a level, or the next time you start one.

## Notes on Shopsanity

Enabling Shopsanity turns the store's 39 one-time, gem-priced purchases into checks. Buying a plant
still will not grant it — plants only ever come from Archipelago — so a purchase spends the currency
and sends the check.

The repeatable gem, coin and sprout bundles are excluded because they can be bought over and over,
and four ticket-priced plants are excluded because tickets have no Archipelago source and would be
pure grind.

Because a card is a location rather than a purchase, each one is **labelled with the item the
multiworld actually has there** instead of with the plant pictured on it, and the plant or trophy
artwork is replaced with the Archipelago logo for the same reason — the plant on the card is not what
you are buying. Your own items show as just the item name; another player's show as `player: item`.
The client scouts these on connect without spending or announcing hints. A card falls back to its
normal name and artwork if the scout has not come back yet.