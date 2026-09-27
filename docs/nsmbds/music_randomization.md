# NSMBDS music randomization notes

## Selection path

The USA A2DE course files store 16-byte view records in level block 7. Byte 10
of each view is the BGM sequence ID. The patch assigns one destination sequence
to each of the 80 story levels and replaces only view values that belong to the
verified normal-level pool. This keeps deliberate boss and ambient views in
Towers and Castles unchanged while making ordinary areas of a level consistent.

The eight ordinary world-map sequence IDs are the first eight 32-bit entries of
a ten-entry table in ARM9 Overlay 8 at decompressed file offset `0x1A22C`. The
last two entries are validated and preserved. Overlay identity, RAM address,
expanded size, file ID, table contents, FAT bounds, and available ROM-tail space
are checked before writing.

## SDAT compatibility

The patch redirects complete sequence IDs; it does not exchange raw SSEQ data.
The normal level sequences are IDs 1, 6, 9, 10, 11, 12, 14, 16, 17, 24, and
26. Inspection of `sound_data.sdat` found a valid sequence entry, bank, wave
archive, player 0 assignment, and volume metadata for each. World-map sequences
100 through 107 share their world-map bank and wave archive. The mixed mode
combines these sets into one 19-track destination pool for all 80 levels and
all eight world maps. This deliberately permits level sequences on world maps
and world-map sequences in levels. No copyrighted audio data is stored in the
project.

Included categories are normal level themes and world-map themes. Bosses,
temporary Star/Mega themes, jingles, ambience, menus, minigames, credits, sound
effects, and unknown sequences are excluded.

## Proof of concept and validation

The ROM patch tests construct a W1-1-style course view block, redirect its
normal theme to a different eligible sequence, and prove boss and ambient IDs
remain byte-for-byte unchanged. A separate Overlay 8 test proves that only the
first eight world-map entries change. The production patch applies the same
operations to every serialized per-level assignment.

Manual emulator acceptance checklist:

- overworld, underground, underwater, athletic, Ghost House, Tower, Castle,
  multi-area, pipe/door, secret-exit, and special-stage transitions;
- death, normal restart, checkpoint restart, save/load, and savestates;
- timer hurry-up and Star/Mega interruption followed by normal-theme recovery;
- level completion and return to each of the eight maps;
- offline launch without an Archipelago server;
- unchanged sound effects, boss music, and jingles.

This checklist must be completed on BizHawk before declaring the destination
pool emulator-verified. Automated tests establish file structure, bounds,
determinism, pool separation, and byte-level patch behavior only.
