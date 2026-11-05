# Hub native layout and preserved runtime mapping

The #932/main integration grew `.text` from 0x1610 to 0x1718 bytes at
0x0815E000, overlapping fixed configuration at 0x0815F690 by 136 bytes.
Replacing only the Hub mapping switch with immutable lookup tables reduces
`.text` to 0x1648 with GNU ARM GCC 14.2.1: 72 bytes of headroom. The init hook,
volatile accesses, physical-switch visibility and native fallback are unchanged.
No new ROM allocation, item identity, mailbox offset or save field is introduced.

The linker explicitly rejects code/config overlap and writable static storage.
The four configuration words remain at 0x0815F690 (health), 0x0815F694 (color),
0x0815F698 (ability gating), and 0x0815F69C (statue pool). `rom.py` seed-token
writes retain these addresses. Existing appended color code and its bounds are
unchanged. Hook targets are resolved from ELF symbols when rebuilding the patch.

## Catalog versus compiled runtime bits

The original generated C mapping from commit `6f951f7f` used door 1 (Moonlight)
→ bit 11 and door 2 (Rainbow East) → bit 1. Later catalog edits, including
`686d8c65` and `5036d580`, changed location associations without synchronizing the
tracked C mapping. Main `99c63e3a` and published #932 `c176aa10` therefore contain
JSON catalog bits 1/11 but compiled runtime bits 11/1 for those two doors.

This optimization preserves compiled behavior; it does not establish which
association is correct gameplay semantics. The contract now records explicit
`runtime_ap_bit_index` overrides with reasons while retaining catalog
`ap_bit_index`, location IDs and client compatibility aliases. The generator uses
runtime bits for both C artifacts and validates complete door coverage, bit
uniqueness and native index bounds. Regeneration leaves the existing switch
reference byte-identical. Any future semantic reconciliation needs separate
source/runtime evidence and compatibility review.

Tests compare all generated files, preserve a frozen original switch fixture,
and exhaust every uint16 input with null and aliased output-pointer cases
(524,288 comparisons). Native ownership/visibility tests exercise the actual
runtime mapping. Missing entries, invalid indices, duplicate runtime bits and
unexplained overrides are rejected. Removing the explicit overrides cannot pass
the frozen compiled-behavior regression silently.

## Acceptance boundaries

The rebuilt 6,303-byte patch was regenerated identically and applied back to the
unchanged lawful original ROM; output exactly matches the builder's temporary
ROM, which is deleted. Only the patch is publishable, never the original or
patched ROM. Local toolchain coverage is GNU ARM GCC 14.2.1; hosted toolchain
coverage is reported separately by exact-head CI.

The directed 192→801→592 route remains proven under controlled QA only. The
reverse direction and 11 other original disputed pairs remain unproven. Fresh
combined-seed natural gameplay, reconnect and native persistence remain separate
acceptance. All v0.4.1 limitations and partial security coverage remain; #979's
hardening stack is separate and no live signing/protection configuration is
claimed. Version metadata is not bumped by this work.
