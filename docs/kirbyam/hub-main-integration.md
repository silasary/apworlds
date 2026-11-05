# Hub Connection integration with main

The subsequent graph, saved-check and protocol corrections are documented in [Hub traversal and physical-check persistence](hub-save-and-graph.md). The local verification numbers below describe the earlier integration candidate, not the subsequent correction.

The October 31 candidate integrates main `32288a744c1c435f9c3e5f3dc334984fc3ac25a8` into #932 `843208e892ce791b935603ac66a2f0c928a4c6cd`. Main's workflow pins, Minny exclusion, goal modes, deferred Hub Teleport Trap and reconnect/hardening changes are retained. No Area Key feature from #908 is imported.

## Draft compatibility and native layout

Hub items now use 3860401–3860415, with native door index `item_id - 3860400`. This avoids #908's 3860041–3860048 allocation. The complete ownership mask moves to `0x0203B134` and the physical-switch initializer scratch word to `0x0203B138`, beyond #908's `0x0203B0C0..0x0203B133` Area Key/transition telemetry range. The inspected #908 source is head `ba2310debd40bbbb650f836c218a961da7de8699`. These are reservations, not inclusion of #908 behavior. Old draft seeds and patches must be regenerated together. Stable main item identities and native save fields remain unchanged.

The combined code initially exceeded the fixed configuration boundary by 52 bytes. The physical-switch initializer now consumes the generated constant mapping arrays directly rather than rebuilding identical stack arrays. Ownership restoration uses the existing appended `.aphub` ROM extension with an explicit long call. No configuration addresses move: Minny remains at `0x0815F68C`, followed by health, color, ability gating and statue settings through `0x0815F69F`. The linker still rejects overlap and writable static storage.

## Current graph and bounded route evidence

Main #914 removed the logical middle-platform node and replaced obsolete compressed exits. This integration preserves main's room identities, locations and edges, applies surviving Hub requirements to those edges, and represents the observed 192→801→592 chain through main's Central Circle node. It does not restore the obsolete direct 192→592 edge.

The four decoded native objects additionally distinguish the Carrot item on 192→193, the Radish item on 592→690, and the West Cabbage item on 592→801. These endpoint and gate facts do not prove a complete reverse 592→801→192 traversal. The reverse and eleven other disputed route pairs, Carrot alias and Moonlight RIGHT remain unproven. Existing broader route assumptions remain subject to those limitations.

## Historical emulator evidence recovered

The PR body previously stopped at the failed October 27 reconnect attempt. A later local run on the same published source tree `fcb84f22b4a650d1896a298bcd05b2d7cb0b3225` continued authored seed `07995310673587376825` in stock mGBA Qt 0.10.5. It recorded offline cold-save restoration, 801→592 traversal, server-only reconnect, second cold restore, connector reconnect and post-reconnect 801→592 traversal. Physical-switch flags stayed zero and no new Hub or Big Switch awards appeared. The server-only reconnect left the native receipt counter unchanged; cold replay restored Hub ownership idempotently. This is historical continuation evidence, not a fresh-seed or refreshed-candidate pass. The earlier unexplained transport loss was not reproduced or causally resolved by that run.

The original ROM and owner save remained unchanged; private ROMs, saves, server state and screenshots are not repository artifacts. General consumable exactly-once delivery, arbitrary seeds/multiplayer, long-duration transport failure, and every historical v0.4.1 limitation are not established by this bounded acceptance.

## Local verification

GNU ARM GCC 14.2.1 builds the native payload with four bytes of free space before the fixed config tail. Payload window: 5,792 bytes; appended palette/Hub extension: 1,680 bytes. Repeated patch generation is byte-identical: 6,793 bytes, SHA-256 `fad609c40ca258ccbff2368acbcf6bbb3b9a1701160d1c2704d8fe66f856b2cf`. Applying the bsdiff to the clean private USA ROM exactly reproduces the builder's in-memory ROM. Five mutated native callsite cases fail before mutation; separate linker probes reject config overlap and writable static storage.

The final non-matrix Kirby suite passes 2,772 tests. The unchanged 1,840-case health-option matrix passed in the earlier aggregate run. Two additional stock-server item-history tests pass. The earlier aggregate's failures were repaired graph fixtures, a missing Hub Trap target in a synthetic patcher fixture, a test walker treating item names as individual capability characters, and localhost restrictions; the final suite runs with localhost available. No production capability policy was loosened to satisfy those tests.

All 24 APWorld generation cases pass (36 slots, seed 932; bounded option cases, not exhaustive seeds or options). The package contains the exact rebuilt patch and no full ROM, save, ELF, object or receipt database. Required syntax/undefined-name lint passes. Global pyright is byte-for-byte equal to the prior-head baseline after path normalization: 35 errors and seven warnings. Local strict mypy retains pre-existing test-typing diagnostics; it is not reported as globally green. Hosted CI and refreshed emulator acceptance must be recorded separately.
