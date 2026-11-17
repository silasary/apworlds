# Spec: the game owns the item delivery cursor

Status: ready-for-agent. Branch: `v0.3.0` (apworld) and `0.3.0` (Ageipelago). Nothing is
committed as part of this work. Vocabulary follows `worlds/age2de/CONTEXT.md`.

Implementation tickets: `.scratch/item-delivery-cursor/issues/`.

## Problem Statement

Three playtest reports are one bug. Delivery state that has to survive a save or a reconnect
is kept in client memory instead.

- **`.scratch/playtest/issues/06`** — a scenario resumed from a mid-scenario save never sees
  items received while another scenario was running. `ConnectAP` disables itself after its
  first successful read and a save restores it disabled, so the scenario item file is never
  reread; the shared window acked those items against whichever scenario happened to be
  running, so they are never resent either.
- **`.scratch/playtest/issues/08`** — `ClientStatus.acked_items` is wiped by
  `Age2GameContext.disconnect`, so a reconnect restreams every item from index 0 and every
  trap fires again.
- **`.scratch/playtest/issues/02`** — `AP_Read` compares the scenario id before anything else
  and returns, so a save/load switch prints a red install-error pair on every read for the
  whole recovery window, and the real identity checks never run at all.

A fourth problem was found while auditing the above and is fixed here too: `StartingResources`
and `SeedResources` go out through both `startup.xsdat` and the item window, so the first
scenario of a session can be paid its starting pile twice.

## Solution


Scoped 2026-10-20. Supersedes the "reread the scenario item file" sketch below, and subsumes **08**
(traps resent on server reconnect) and **02** (scenario mismatch on save/load switch). All three are
the same root cause: state that must survive a save or a reconnect is being kept in client memory.

### Why "reread on reconnect / new session" was rejected

It fixes the symptom in the wrong place. The scenario item file is only one of the channels a
reloaded scenario is missing — ages (25-29) arrive through the shared window and through no bulk
file at all, so rereading `GEN1.xsdat` would still leave a loaded save without them. And rereading
on a *client* event cannot work: the client has no idea a save was loaded, and XS has no `onLoad`,
so the game cannot tell it.

### The mechanism

Move the cursor into XS state, where the save file already preserves it.

1. **`appliedItemCount` — new packet field, game → client.** How many entries of the client's item
   stream *this XS state* has consumed. A plain `int` global, so it saves and restores with
   everything else fixed this round. Fresh scenario start: 0. Loaded save: its value at save time.
2. **The client streams from it, not from memory.** `send_items` takes its window base from
   `packet.applied_item_count`. `ClientStatus.acked_items` becomes derived
   (`min(packet.applied_item_count, len(unlocked_items))`).

That alone fixes 06 and 08:

- **06** — a loaded save reports a cursor behind the stream, so the client replays the gap into
  *that* scenario's state. Every band is covered, not just scenario items.
- **08** — a reconnect no longer resets anything. The game is the authority, and it did not forget.

The index is stable across reconnects: the server replays `ReceivedItems` from 0 in the same order
every time, and `_handle_received_items` appends in that order, skipping only ids absent from
`ID_TO_ITEM` — deterministic for a given apworld version, which the packet already version-checks.

### Replay has to be idempotent, and it is — except for four categories

Checked every `GiveItem` branch. `UnlockAge`, `UnlockBuilding`, `UnlockTech`, `UnlockUnitItem`,
`GiveMercenary` and the flag half of `GiveProgressionItem` all either set a bool that is already set
or early-return on a state check. None announce, so a replay is silent. Safe to re-apply.

The exceptions are additive, and they split into **two kinds with two different skip rules**:

| Kind | Categories | Ids | Rule |
|---|---|---|---|
| Fires once, ever | `Resources` (filler), `Trap` | 1-12, 5000-5008 | skip if index < the global spent mark |
| Fires once per scenario run | `StartingResources`, `SeedResources` | 13-24, 1000/1001/1024, 1032-1035 | never skipped; the window is their only path |

Mercenaries are *not* in either list despite being single-use. `GiveMercenary` only sets a
per-scenario flag; "spent" is a pavilion concept the client already tracks in `MercenaryHandler` /
`StorageHandler` and filters out of `mercenary_queue.xsdat`. Replaying the flag is harmless.

### Skipping without breaking the index

The cursor counts stream entries, so an entry cannot simply be dropped — that would desync every
later index. The client substitutes `AP_ITEM_SKIP = -2`, which the game counts and ignores. (`-1` is
not available; it is the empty marker elsewhere in the protocol.) `GiveItem` gets an explicit early
return for it rather than relying on the band dispatch falling through.

### Retire `startup.xsdat`, so starting resources have one path

`startup.xsdat` was a second path for starting resources: `GiveStartupItems` applied it at every
`ConnectAP`, and the window sent the same items as well. That is a live double-grant, and on every
scenario start, not only the first: the cursor starts at 0 in each new scenario, so the window
replays the whole stream there.

That replay is also why the file is redundant. Each case already comes out right through the window
alone:

- **Scenario start**: the cursor is 0, so every starting resource in the stream is paid once. The
  next scenario starts at 0 again and pays the whole pile again.
- Received **mid-scenario**: it lands at the cursor, immediately.
- **Loaded save**: the save carries its own cursor, so the replay pays out exactly what that
  scenario run never saw.

So `startup.xsdat` goes, and with it `GiveStartupItems` and the client's `sync_starting_resources`.
Starting resources are not added to `ONE_SHOT_ITEMS`: they are owed again in every scenario run.

The cost is latency. The pile landed at `ConnectAP`; the window pays `ITEM_WINDOW` entries per
`ReadItems` pass, so a starting resource deep in a long stream arrives some seconds into the
scenario rather than at its first second.

A `startupBaseline` (a leading `startupBase` in the file, echoed in the packet, with the client
sentinelling starting resources below it) was designed and built first. It works, but it only
coordinates two paths where one will do, and it needs a not-yet-read state to close a race against
the packets `WriteAP` sends before `ConnectAP` reads the pile.

### Window base, so the cursor and the stream cannot drift

`items.xsdat` gains a leading `windowBase` int. The game applies the window only when
`windowBase == appliedItemCount`, all of it or none, then advances by the count it read. Re-reading
the same file is a no-op because the base no longer matches.

That makes the echo ring redundant, and it goes: **`itemArray`, `free_items.xsdat`, the `FreeItems`
rule, the `Free Items` flag in the client → game packet, and `ack_items` / `in_flight` /
`free_items()` on the client all get deleted.** One cursor, one rule, nothing to desync — and it
retires the `xsArray` that `InitAP` already carries an "AP session state was lost" path for.

The twelve item ints stay in the game → client packet, written as `-1`. They are dead weight, but
`ScenarioId` has to stay at byte offset 72 for `find_active_campaign`'s hardcoded `skip_int(fp, 18)`.

**Window size stays capped, at 64.** Unbounded was considered and dropped: `UnlockUnitItem` calls
`refreshUnitLocks()` and `GiveItem` then calls `RefreshProfessions()`, each a full walk of the unit
table, so a few hundred unit items in one tick is quadratic. A cap keeps every tick small without
needing a batch/defer mechanism. Shared constant on both sides, declared once per repo and
kept in step by hand.

### 02: quiet the switch, and check identity *harder*

`AP_Read` compares the scenario id first and returns, so during a save/load switch the incoming
scenario prints the red `Wrong Scenario ID` pair on every read for the whole recovery window, and the
genuine identity checks never run at all.

- **Reorder.** Validate world version, slot id and seed halves *first* — they are per-install, not
  per-scenario, so they are meaningful even while the client is attached to another scenario. They
  keep routing through `ReportMismatch`, keep disabling `ReadAP`, and keep the "reinstall the files
  generated for this slot" wording. This strictly improves wrong-seed detection: today a wrong-seed
  install that is also mid-switch reports the wrong error.
- **Downgrade the scenario id check** to a quiet "not addressed to me" return, with a single
  one-shot yellow line so the player knows the scenario is waiting rather than broken.
- **Find the switch faster.** The client re-scans the unlocked scenario files for a fresher ping on
  every pass while the packet is a repeat, instead of waiting for the 10-repeat (~5 s) threshold.

### Persistence

One playthrough-state file replaces the mercenaries one:
`APData/state_<tag>_<player>.json`, built through `Identity.storage_file_name` as before, holding
both the spent-mercenary records and the global one-shot mark.

- The old `APData/mercenaries_<tag>_<player>.json` is **deleted on sight, not migrated.** Spent
  mercenaries already live in AP data storage, and `reconcile_spent(None, server)` already treats a
  missing local file as a fresh playthrough, so the server reseeds it on connect.
- The mark is also a server key, `{team}_{slot}_items_spent`, written with `{"operation": "max"}` —
  atomic, monotone, and `set_notify`'d alongside the existing two. Same belt-and-braces shape as
  spent mercenaries.
- It advances to `max(spent, applied_item_count)` on every packet that moves the cursor.

A high-water mark is sufficient because the game consumes the stream strictly in order. Worked
example: A reaches 50, mark = 50. B loads at 10 → the client replays 10-49, one-shots in that range
sentinel'd, flags re-applied. The trap at index 50 fires once in B, mark = 51. Reload A at 50 → index
50 is now below the mark and is skipped.

**Ordering hazard:** `send_items` must not write anything until the `items_spent` reply has landed,
or a reconnect re-fires traps in the gap. Gate it on a `storage_ready` flag set in
`_handle_set_reply`.

#### Merge policy (ticket 09)

Ticket 03 made the spent bitmask (`{team}_{slot}_spent`) one record merged by `replace`, with the
local file authoritative. **That rule is superseded.** Every serious failure under it was a local
mask missing bits overwriting a server mask that had them: a stale file on a second machine, the
empty mask `/install` leaves behind, a mercenary marked before the server's record arrived.

The rule now: **the server's item stream says what exists, and the union of every copy says what
has been used, limited to what exists.**

- **Received:** `ReceivedItems` decides which indices exist. Bits past its end are cut away, as in
  ticket 03's amendment.
- **Used:** no copy is authoritative. The local file, the server record and every other machine that
  has pushed are witnesses; if any says an index was spent, it was spent. A witness can add bits,
  never remove them. A null local record is no copy and contributes nothing.

Reconcile computes `(local | server)` cut to the stream length. When that equals the server's value,
nothing is pushed, so a reply to the client's own push ends the exchange. Otherwise the push is `or`
and the server does the union. `replace` is sent only when the cut cleared bits the server holds,
after a reset or rollback left a shorter stream.

The only thing that un-spends an item is the stream getting shorter; there is no player-facing reset.
Two clients on one slot converge: each pushes at most once, and both settle on the union.

### Version

Stays **0.3.0**; this is in-development, so a stale install is fixed by rerunning `/install` rather
than by a bump.

One hazard worth a cheap guard: a stale 0.3.0 install would read `items.xsdat`'s new `windowBase`
header as an item id, and bases like 12 or 24 are real resource items, so forgetting `/install`
would hand out spurious resources. Write the header **negative-encoded** (`-(base + 1)`): every
negative value falls through the old `GiveItem` band dispatch as a no-op, so a stale install does
nothing instead of something confusing.

### Assumption, confirmed

A plain `int` global survives a save the way `scenarioItemsRead` does. Confirmed in game
2026-10-20. Both new counters rely on it.

## Implementation

Five vertical slices, one ticket each, reviewed in game between every one. Ordering matters:
slice 02 makes slice 03 safe, because once the cursor can rewind, anything additive would
otherwise replay.

| # | Slice | Fixes | Halves | Packet |
|---|---|---|---|---|
| 01 | Quiet the switch, check identity harder | playtest 02 | XS + client | — |
| 02 | Persist the one-shot mark | playtest 08 | client only | — |
| 03 | One spent record, as a bitmask | — | client only | — |
| 04 | The cursor | playtest 06 | both | 27 → 26 |
| 05 | Retire the echo ring | — | both | — |
| 06 | Move item delivery into `ItemHandler` | — | client only | — |
| 07 | Retire `startup.xsdat` | the double-grant | both | — |

Version stays 0.3.0 throughout; slice 04 moves the packet and slice 07 changes what the game
reads at `ConnectAP`, so each needs a `/install` and a fresh scenario start. Slice 06 is a pure refactor, placed after 05 so it moves only the
code that survives, and before 07 so the last functional change is written in its final home.
