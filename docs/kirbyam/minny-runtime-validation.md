# Minny runtime exception (#997)

Completely Random used to reroll before resolving the source, bypassing the
static Minny exclusion. Generated ROMs now store Minny inclusion at file offset
`0x15F68C`; the existing four configuration words retain their addresses.
Regenerate the ROM patch to receive this fix. The client protocol is unchanged.

The assembly entry captures r5 and LR before C can reuse either register. The
exception requires the ordinary object swallow callsite `0x0809C6AA`, an aligned
source pointer whose type byte is inside EWRAM or IWRAM, and object type `0x27`.
The patch builder verifies the source-load instructions and original BL target
against the clean US ROM. The game allocator can fall back to IWRAM.

Excluded Minny consumes no RNG and emits no reroll event, then passes through
normal ability gating. Included Minny and other enemies still reroll. Ability
stars, other callers, and unknown/invalid sources retain existing behavior;
Mini as an ability value never identifies Minny. This change does not revise
other source-inclusion options or ability-star weighting semantics.

## Automated evidence

`test_minny_runtime.py` compiles and executes the actual C transition hook with
memory/mailbox stubs, covering both Minny settings, both allocation regions,
other enemies granting Mini, star/unknown callers, invalid pointers, gating,
Normal weighting, transition flags, telemetry, and off/Shuffled modes. ROM-token
tests cover both settings and the legacy structured-policy default. Patch-tool
tests reject a changed source-load instruction.

ARM GCC 14.2.1 builds the payload without warnings. Applying the rebuilt
`base_patch.bsdiff4` to the local clean ROM reproduces `payload.bin` and the color
extension byte-for-byte. The fixed main payload window remains 5,792 bytes;
code/data use 5,760 bytes, followed by 12 bytes of space and 20 configuration
bytes. No full ROM is published.

## Gameplay acceptance still required

Automated/native tests and instruction inspection are not a gameplay pass.
Record the emulator/version, seed, build SHA and observed result for:

1. Completely Random, Minny off: swallow Minny repeatedly and retain Mini.
2. Minny on: repeat with a restricted non-Mini pool, then 100% Normal weight.
3. Swallow an ordinary enemy carrying Mini and re-collect a dropped Mini star;
   both must remain eligible for rerolling.
4. Exercise locked/unlocked ability results and repeat after save/load and
   reconnect. Check off/Shuffled seeds retain their existing behavior.

No fresh emulator gameplay acceptance has been recorded for this PR.
