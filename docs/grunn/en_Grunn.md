# Grunn

## What is this game?

Grunn (Sokpop Collective, 2024) is an eerie first-person gardening adventure set in a looping
in-game week. You tend a garden, uncover a village full of unsettling secrets, and try to reach
one of its 11 endings.

## What does randomization do to this game?

The key items - tools, keys, idols, instruments, soul fragments and the rest - are shuffled into
the multiworld. Instead of finding them in their vanilla spots, obtaining each one sends a check,
and your own items arrive from the multiworld.

Plenty of other things become checks too, most of them on by default: the 32 polaroids scattered
around the world, the 7 ghosts you can calm, 7 good deeds (returning the severed hand, awarding
the medal to the snail, completing the school band…), 6 maintenance chores, the endings you
reach, and - if you turn on `coinsanity` - the 15 gulden placed in the world.

Items and progress carry across runs: when the week resets, whatever the multiworld has given you
is handed back automatically.

## What is the goal?

Set by the `goal` option:

- **good_ending** - defeat the End Demon with the Magic Sword and the Purified Stone, then leave
  through the front gate.
- **true_ending** (default) - the Good Ending, after restoring the owner's soul with the 3 Soul
  Fragments.
- **all_endings** - witness all 11 endings (the demo ending is excluded).

## Buffs and traps

Besides the game's own items, the pool holds things Grunn never had.

**Buffs** are progressive: each copy stacks with the previous ones, and they are re-applied
automatically after a run reset or a reconnection. `buff_count` sets how many copies of each go
into the pool.

| Buff | Effect per copy |
|---|---|
| Move Speed Boost | +15 % movement speed |
| Cutter Range Boost | +25 % secateur range |
| Cutting Rate Boost | +25 % swing speed |

**Traps** come in two flavours. The first three are temporary - they last **2 in-game hours** and
also expire on a day change or a run reset:

| Trap | Effect |
|---|---|
| Speed Trap | Halves your movement speed |
| Size Trap | Shrinks you down |
| Inverted Controls Trap | Inverts both the camera and your movement |

The last five hit once, and hurt in ways that outlive their instant:

| Trap | Effect |
|---|---|
| Garden Reset Trap | Wipes the Start Garden back to 0 % - every job to do again |
| Church Reset Trap | Same, for the church grounds |
| Park Reset Trap | Same, for the park |
| Night Trap | Throws the clock to 03:00, inside the Darkness window - being outside then is a death ending |
| Sacred Flower Trap | Cuts 4 graveyard flowers for you. The fifth triggers the Sacred Flowers ending, so you end up one careless cut away from dying - or dead on the spot if you had already cut one |

`trap_percentage` decides how much of the filler is replaced by traps.

## Options worth knowing

The full list with every description lives on the options page; these are the ones that shape the
run the most.

**On by default**

- `exclude_bridge_key` - the Bridge Key stays in its vanilla spot. It is *the* first key of the
  game: it opens spawn into the garden, and the bus blocks every other exit. Shuffling it leaves
  sphere 1 with a single check, which is discouraged for async play.
- `lock_player_hut` - the player hut is locked behind the Abandoned Key, an item that unlocks
  nothing in vanilla. This gates more than the hut: the only usable bed is inside, so the key also
  gates **sleeping**, and with it day 2 and beyond. It becomes an early, high-value progression
  item - especially in multiworld, where someone else may be holding it.
- `polaroid_checks`, `ghost_checks`, `chore_checks` - polaroids, ghosts and maintenance jobs send
  checks. The five garden chores normally pay 2 gulden the first time; with checks on, that money
  comes back as shuffled Golden Gulden items, so the economy is unchanged.
- `exclude_bad_endings` - removes the checks of the 8 endings that kill you, so you are never
  forced to die (and, under DeathLink, to kill everyone else) just to collect a check. The endings
  stay reachable, they simply stop being locations. Ignored when the goal is `all_endings`.

**Off by default**

- `keep_vanilla_shears` - leaves the Shears in the player hut for a smoother start. Note that with
  `lock_player_hut` on, they still sit behind the Abandoned Key.
- `coinsanity` - the 15 placed gulden become checks, and buying things means receiving Gulden
  items from the multiworld instead of cutting grass for money.
- `persistent_shortcuts` - comfort shortcuts stay unlocked across run resets. No logic impact.
- `mask_items` - every location shows an Archipelago model coloured by its content's class
  (progression, useful, filler) instead of the item itself, Grunn's own items included: you can
  tell how valuable a check is, never what it is. Traps borrow one of the three models, always
  the same one for a given spot, so a relaunch never gives them away. Purely cosmetic - nothing
  moves in the logic, and the pickup message still names what you actually got.
- `death_link` - every death ending you reach (anything except Bus, Picnic and the good/true
  ending) sends a DeathLink. Receiving one shows a nightmare jumpscare and resets your current
  week: no ending fires and no check is granted, so nobody can farm your endings for you.

**Tuning**

- `buff_count` (default 3) - copies of each progressive buff in the pool.
- `trap_percentage` (default 20) - share of filler replaced by traps.
