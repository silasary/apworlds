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
- Starters (`randomize_starters`) and the starting town
  (`randomize_start_location`).
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

- **Both HeartGold and SoulSilver are supported.** Either US ROM can be
  patched, but you must set the `game_version` option to match the ROM
  you actually plan to patch (wild encounters genuinely differ between
  the two versions -- generating with the wrong `game_version` produces
  a patch that refuses to apply to a mismatched ROM rather than silently
  writing the wrong version's data into it).
- **Gym badges are items.** Beating a Leader is a check, and the badge
  itself can be anywhere in the multiworld. Field moves still need their
  badge, as in the game.
- **Optional checks**, off by default: Trainersanity (a check for every
  trainer battle won) and Dexsanity (a check for every species caught).
- **Quality of life**, off by default: fast text, battle animations
  skipped, Running Shoes, Map Card and Johto Fly points from the start,
  on-screen messages for received items, and more (see the YAML options).
