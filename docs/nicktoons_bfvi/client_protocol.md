# BizHawk Client Protocol

## Purpose

### Plain English

The client turns in-game events into Archipelago location checks and turns received Archipelago items back into game progression.

### Engineering Notes

The client registers as a generic `BizHawkClient` for `Nicktoons: Battle for Volcano Island` on `GBA`. It validates the ROM title `NICKTOONSBVI`, requests slot data, and polls every 0.125 seconds.

## Read/write cycle

1. Read the current stage, in-level heart count, game state, ability byte, and character-unlock byte.
2. Apply any newly received Archipelago items to the internal authoritative counters.
3. On a non-complete frame, cache the current stage and heart count.
4. On the edge into the stage-complete state, send the stage's Rip Zipper Piece, earned Golden Hearts, and story checks whose vanilla state is now confirmed.
5. Detect newly observed vanilla ability or character transitions and send the corresponding story check.
6. Write total hearts, Rip Zipper bitfields, character unlocks, and ability bits back to RAM.
7. Use stage-complete/final-boss events as a recovery path when an Archipelago item arrived before its matching vanilla pickup and therefore pre-set the same RAM bit.
8. Report final-boss or all-Rip-Zipper completion according to slot data.

## Failure handling

Read/write failures return from the current poll and retry on the next poll. Location checks are de-duplicated against both server-confirmed locations and a local sent set. Received items are applied using a cursor, so reconnecting and replaying the server's item list reconstructs the same authoritative state.

## Deliberate limitations

The client does not write the per-stage Golden Heart save bytes, health, or stage selection. It only writes state that is randomized by this world. The final-boss event is reported through `StatusUpdate`; its event location has no numeric location ID. The ability and character story checks share their vanilla unlock bytes with received-item delivery, so the client filters AP-forced transitions and confirms them from the associated story completion event.
