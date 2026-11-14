# Mini recovery for traversal

Native ability-star swallowing at US ROM `0x0809C69C` loads the raw ability
from `r5 + 0x84`, ORs `0x80`, then calls the transition request. The assembly
entry forwards r1 unchanged. The patch builder now verifies those instructions
and the original BL target before patching. Object type `0xA3` or `0xA4` at
`+0x82`, a readable aligned EWRAM/IWRAM pointer, the verified caller, the native
star flag, and raw ability 23 (Mini) are all required for the exception.

A qualifying Mini star preserves its raw ability and other flags without RNG
consumption. The request gate still removes locked Mini, and the existing
`ap_on_commit_copy_ability_transition` gate remains authoritative immediately
before native commit. Off and Shuffled behavior is unchanged. Other stars,
unknown callers, invalid pointers, and ordinary enemies granting Mini retain
their existing behavior, including randomized Mini results from another star.
The exception does not depend on statue randomization or its ability pool.

For Olive Ocean room 134, native Droppy stores the stolen ability and, for
Mini, releases `OBJ_MINNY` (`katam/src/droppy.c`, `DroppyObjectTypes` and
`sub_080A05C8`). Fixed Minny supplies that recovery route. A dropped Mini star
is an additional recoverable route; swallowing a holding Droppy is still an
ordinary enemy request and is not covered by the star exception.

## Existing distinction deliberately preserved

The existing payload star detector uses `0x20`, while this native caller uses
`0x80`. No trampoline normalizes the flag. Consequently its advertised
no-Normal-weight behavior does not apply to this native caller. This change
uses the verified native flag only for Mini recovery and leaves other-star
weighting and telemetry unchanged. Correcting that broader behavior is outside
this traversal patch.

## Verification and limits

`test_mini_star_runtime.py` compiles and executes the actual C request hook on
Windows or Linux with only memory/mailbox/native-transition IO stubbed. It
covers all three modes, both star types and RAM allocation regions, locked and
unlocked Mini, retained upper flags, RNG stability, invalid pointers, unrelated
callers, other enemies granting Mini, other stars rerolling to Mini, gated
random outputs, and unchanged Normal weighting. The patch-validator test
rejects mutations to each byte of the verified source/flag-load and BL sequence.
The existing commit hook and its gate are unchanged.

These are native source and ROM-instruction checks, not emulator gameplay
acceptance. A fresh seed must still be played through room 134 with Mini
unlocked, obtaining Normal to inhale the block and recovering Mini via both
Droppy and a dropped star. Repeat with gating locked, each randomization mode,
and save/load. Record emulator version, seed and build SHA before claiming a
gameplay pass. Do not publish full ROMs or emulator saves.

ARM GCC 14.2.1 built the changed payload without warnings. Applying the rebuilt
BSDIFF to the verified US ROM (SHA-1 `274b102b6d940f46861a92b4e65f89a51815c12c`)
reproduced the 6,816-byte main payload and 65,536-byte extension byte-for-byte.
The focused suite passed 16 tests, with two older Linux-only harnesses skipped
on Windows. The new actual-C Mini-star harness ran successfully on Windows.
