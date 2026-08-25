# Pokémon HeartGold

## What Gets Randomized

- Wild encounters (grass, surf, fishing, rock smash, headbutt -- with
  HGSS's morning/day/night tables preserved).
- Trainer parties, including the Elite Four and Red.
- Evolutions -- the *method* a species evolves by (level, stone, trade,
  friendship, ...) is preserved; only the *target* species is randomized,
  so a Pokémon that used to evolve by leveling up still evolves by
  leveling up, into something else.
- Base stats -- each species keeps its own total stat budget, only
  redistributed across HP/Attack/Defense/Sp. Attack/Sp. Defense/Speed.
- Move stats -- Power, PP, and Accuracy, with Type optionally randomized
  too (off by default, see `randomize_move_types`).
- Ground items, hidden items, NPC gifts, HMs/TMs, and badge-gated key
  items.
- Apricorns & Berries.
- Victory condition (Elite Four, Red at Mt. Silver, or a configurable
  number of badges -- your choice, see the YAML options).
- Optional extras, off by default: trainer level scaling
  (`trainer_level_scaling`), move type randomization
  (`randomize_move_types`), species type randomization
  (`randomize_species_types`).
- Two Nuzlocke aids, off by default (see "Nuzlocke Aids" below):
  `disable_ohko_moves`, `disable_trapping_abilities`.

## Nuzlocke Aids

These are optional balance aids for players running an honor-system
Nuzlocke ruleset -- this world does **not** enforce permadeath or
catch limits itself; that stays tracked externally (e.g. a tracker app).
Both default to off.

- **Disable OHKO Moves** (`disable_ohko_moves`): neutralizes Guillotine,
  Horn Drill, Fissure, and Sheer Cold into ordinary 60 power / 100
  accuracy moves with no special effect, instead of an RNG-based instant
  KO -- a bad interaction with permadeath.
- **Disable Trapping Abilities** (`disable_trapping_abilities`): removes
  Arena Trap, Shadow Tag, and Magnet Pull from every Pokémon that has one.
  A species with a second, non-trapping ability gets that ability copied
  into both slots; a species whose only ability traps (e.g. Wobbuffet's
  Shadow Tag) gets Run Away instead. An inescapable wild battle is a bad
  interaction with permadeath.

## Notable Differences from Base Game

- **Starters are not randomized.** Extensive investigation could not
  locate a patchable source for the vanilla starter species in the ROM --
  see the project's `docs/architecture.md` for the full write-up. You'll
  always be offered the vanilla Chikorita/Cyndaquil/Totodile choice.
- **Both HeartGold and SoulSilver are supported.** Either US ROM can be
  patched, but you must set the `game_version` option to match the ROM
  you actually plan to patch (wild encounters genuinely differ between
  the two versions -- generating with the wrong `game_version` produces
  a patch that refuses to apply to a mismatched ROM rather than silently
  writing the wrong version's data into it).
- **Gym badges are not randomized.** HGSS represents badges as a
  save-data flag rather than a bag item, so (unlike some other Pokémon
  worlds) they can't currently be shuffled into the general item pool --
  each badge is still earned from its usual gym, in the usual order, and
  only tracked internally for logic purposes (e.g. gating which HMs you
  can use in the field).
- Trainersanity (a check for every trainer battle won) is available as
  an optional, off-by-default toggle (not yet wired up to real
  generation/gameplay -- see the project's `docs/scope.md`).
