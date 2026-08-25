# SEUM: Speedrunners from Hell

## What does randomization do to this game?

The main campaign has 91 levels: 8 floors of 11 slots (9 normal levels, 1 boss, 1 taunt
level) plus 3 final-floor levels. Every level except F1-1 Labyrinth is locked behind a
**Level Unlock** item that is shuffled into the multiworld item pool. The client mod
locks and unlocks levels in the level-select hub accordingly.

## What is the goal?

Beat **F9-1 S(A)TAN**, the final boss.

## What are the items?

- **Level Unlock** (progression): unlocks one specific level, e.g. `F3-Boss Pyramid Unlock`.
  90 items total.
- **Pile of Skulls** (filler): no effect, just skulls.

## Extra requirements

Boss and taunt doors keep their vanilla requirements on top of the unlock item:

- **Boss levels** also require earning **8 skulls** on their floor (beat par times).
- **Taunt levels** also require finding **8 taunts** on their floor.

The randomizer logic models both as "8 of the 9 normal levels of that floor are
completable", so seeds are always beatable under the assumption that you can earn
the skull and find the taunt in any level you can play.

## What are the locations (checks)?

- One check per level, sent by the client mod when you finish it, e.g. `F2-4 Make Way`.
  91 checks total.

## Notes

- Floors can be travelled freely with the elevator; individual levels are gated instead.
- Secret levels, Helliku levels, Extended Play floors and the DLC are not randomized.
