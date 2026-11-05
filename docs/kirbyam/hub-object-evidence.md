# Four native Hub objects: bounded evidence

Evidence originally reviewed on PR #979 `54f8d707a5d42f2defd57a3ec6821481a7b95da3`.
Publication applies only these four evidence files to existing draft #932
`96d3dbce73330395bfd18404cc2e0dec40f4a7b6`; no #979 history is imported.
This slice changes evidence tooling/tests/docs only. It adds no graph edge,
item, mailbox, payload, patch or release metadata. Native endpoints are not proof
of complete AP reachability or fresh-seed emulator acceptance.

USA ROM SHA1: `274b102b6d940f46861a92b4e65f89a51815c12c` (16 MiB).
Offsets below are file offsets; ROM addresses add `0x08000000`.
No ROM fixture or native source copy is distributed.

| Native room / object offset | Lookup tile | Closed → open record | Destination / spawn tiles | Unlock slot / native door / physical AP bit | Historical combined item ID |
|---|---|---|---|---|---|
| 192 / `0x8BB3E4` | (12, 3) | `0x8821A8` → `0x8821BA` | 801 / (8, 12) | 9 / 5 / 4 | 3860405 |
| 192 / `0x8BB408` | (3, 3) | `0x882188` → `0x88219A` | 193 / (9, 3) | 10 / 6 / 5 | 3860406 |
| 592 / `0x8CEF38` | (8, 8) | `0x8A87D2` → `0x8A87E4` | 690 / (9, 3) | 8 / 10 / 9 | 3860050 |
| 592 / `0x8CEF5C` | (8, 3) | `0x8A8796` → `0x8A87A8` | 801 / (7, 17) | 7 / 9 / 8 | 3860049 |

All four initial collision bytes are 0; their unique kind-1 mutation records
replace them with 255. Attribute 255 has transition flag `0x4000`; the unique
matching kind-3 record then supplies the destination and spawn. An unlock slot
of zero leaves the closed handler unchanged; nonzero applies the mutation.
An already-open tile takes the constructor's open path and does not need another
mutation. The tool deliberately rejects initially-open input because its scope
is the pinned ROM's initial state, not arbitrary saves or patched-ROM state.

The item column refers ONLY to the historical combined tree
`ed5b56b5e0f35d2b37776c43a5374c6e405cbbc3`, `data/items.json` and
`kirby_ap_payload/ap_payload.c:344–389`. That code maps the native door mask to
GetStateSlot(WORLD, index), then writes 1. These Hub items are not present in
the original #979 baseline. The publication branch #932 does contain Hub items,
using its standalone IDs; its door 5/6 IDs collide with #908; retain the
combined IDs above when integrating later. Physical switch bits are separate
from owned-item bits. Do not treat receiving a Hub item as collecting its switch.
Combined ownership mailbox `0x0203B134`, scratch `0x0203B138`, all 92 baseline
IDs, and trap reservation 3860300 remain historical combined contracts;
this evidence-only slice does not integrate or alter those layouts on #932.

## Consumer trace and provenance

Native source snapshot: `jiangzhengwenjz/katam` layout, local snapshot without
Git metadata. Exact SHA256 hashes are recorded below; no revision is inferred.

- `include/data.h`, ObjectTemplate: spawnTable +0, size +1, unlock +4,
  signed pixel x/y +6/+8, type +0xC, subtype +0xE, flags +0x22.
  `include/constants/object_types.h:155`: DoorToHub=0x97.
- `src/code_080023A4.c:6112`, CreateObject: table 1, indexed by type.
  ROM `0x0800A878–0x0800A89E` uses table `0x0835107C`;
  entry `0x083512D8` is Thumb handler `0x0802AAF9`.
- `src/object.c:2026`, InitObject: pixels multiplied by 256;
  ROM `0x0809F030` constructor initializer. Door lookup therefore uses
  x/16 and (y-8)/16; presentation lookup (fixed y-0xFFF)>>12 agrees for all four.
- `src/level.c:167–176,221,352`: foreground dimensions, record-list pointer,
  and RL decompression. ROM `0x08000B1A–0x08000B36` uses foreground table
  `0x08D64520`; both rooms are 32×26 8-pixel tiles, hence collision grids16×13.
  Solidity headers: room192 `0x088821EC`; room592 `0x088A87FC`.
- `src/special_doors.c:56–154`, CreateDoorToHub/sub_0802AD00:
  constructor `0x0802AAF8`, flag branch `0x0802ABB0`, collision check
  `0x0802ABD0–0x0802ABF8`, closed handler `0x0802AD00` reads template+4;
  `0x0802AD22–0x0802AD2C` calls GetStateSlot(scope2) and tests the value;
  `0x0802AD46` calls lookup, `0x0802AD52` applies mutation,
  `0x0802AD7E` re-resolves for presentation. No destination is taken from subtype1.
- `src/code_080023A4.c:1450`, GetStateSlot at `0x08002888`:
  scope2 returns `0x02028C10 + 4*index` (32-bit slot, not a byte).
- Same source: `sub_080025AC` at `0x080025AC` matches current collision byte
  AND x AND y, advancing by record size. `sub_08001408` at `0x08001408`
  changes graphics and collision byte from kind1+0x10 (kind2+0xC).
  Native lookup is unbounded; this offline decoder bounds traversal and rejects
  ambiguous records instead of silently emulating a first-match ambiguity.
- `src/kirby.c:12419`, sub_080552A8 selects the tile record;
  `src/kirby.c:12851`, sub_080562D0 consumes it. ROM
  `0x08056348–0x08056392` reads destination+8 and spawn+0xA/+0xB,
  writes room and coordinates, and updates spawn when flags lack0x80.
  All four selected records lack0x80. Stored spawn tiles are not pixel coordinates.
- `data/hub_switch_contract.json`: unlock9→door5/physicalbit4 (West Rainbow),
  unlock10→door6/bit5 (Carrot), unlock8→door10/bit9 (Radish),
  unlock7→door9/bit8 (West Cabbage). The labels describe the unlock contract,
  not an inferred destination.

## Directed-pair accounting and remaining proof

Four objects establish four distinct *static native directed transitions*:
192→801, 192→193, 592→690, 592→801. Zero of those four pairs is in the
original twelve disputed logical pairs. Therefore **0 of 12 mapping gaps are
closed by this slice**. Two receive stronger negative evidence: neither of
room192's DoorToHub objects targets592; neither of room592's targets192.
This does not prove those logical routes are impossible, nor authorize deleting
an abstraction that might represent a multi-hop route. Each direction remains
separately unproven. No reciprocal edge is inferred.

The original twelve remain: 192→592,192→490,192→225,592→526,592→129,
592→192,193→211,193→215,225→192,526→592,129→592,490→192.
Ten were outside the chosen directed-pair investigation, not ten total remaining.
Missing link for the selected two: a source-backed full route/compartment mapping
through intermediate rooms (including Central Circle801 if that is the intended
abstraction), with every transition and gate independently established, or an
emulator trace identifying room, collision state, selected pointer, destination,
spawn and ownership at every hop. All needed native inputs for further static
analysis remain available; no owner upload is presently required.

Carrot's legacy UPPER alias/canonical ENTRY_FROM_5_14 contract and Moonlight's
RIGHT compartment/internal passage proof are unchanged. Neither historical
reachability failure is repaired or hidden. All v0.4.1 limitations remain;
security #980–#983 coverage remains partial and #993 requires #994. Live signing,
protections and v0.5.0 metadata are not configured or completed by this work.
Fresh-seed transition, negative ownership controls, reconnect and save/load
acceptance remain separate from static evidence.

## Reproduce

From the repository root, with the lawful ROM kept private:

```sh
python worlds/kirbyam/tools/trace_hub_objects.py "$PRIVATE_USA_ROM" > /tmp/hub-evidence.json
cmp /tmp/hub-evidence.json worlds/kirbyam/test/data/hub_object_evidence.json
AP_TEST_WORLDS=kirbyam python -m pytest worlds/kirbyam/test/test_hub_object_evidence.py worlds/kirbyam/test/test_room_evidence.py worlds/kirbyam/test/test_hub_switch_contract_generation.py test/general/test_reachability.py -q
```

The fixture contains interpreted metadata only. Synthetic tests cover collision
state/coordinate mismatch, duplicate selection, wrong mutation target/kind,
RL literals/runs, truncation, bad header, output overrun, malformed records and
wrong-ROM rejection. Existing room decoder tests cover pointer/bounds failures.
No generation behavior changed; broad generation, packaging, native rebuild,
CI and emulator tests are intentionally not run for this evidence-only slice.
Publication home: existing draft #932, cross-reference #914 and the original
#979 evidence baseline. This is evidence-only testing coverage, not acceptance
of the twelve disputed logical routes. No duplicate PR is needed.

### Source SHA256

- `src/special_doors.c`: `8670e2b893d599fdbbdc488fd1bbc6d335788f9e5c773d08342dbdc9b9a53479`
- `src/code_080023A4.c`: `4f78b2f2a24dbed8aa18f7f74569d8dc6cc02b33c49733809f275f5d3edf3d56`
- `src/level.c`: `fb2b396338b76e9d9c72e0a2a1ec245d2193818308c8746353212af52ddd0d85`
- `src/object.c`: `a8dafe88feef039bf1e707a8f238283e9e753029198f7fb613fbe9837b9be645`
- `src/kirby.c`: `041be2e8ff2c61026179d8c840b4680c9daa7308ecb76e0567c911d60efbf722`
- `include/data.h`: `02ca9bb101debdcc792e46cd00f413c660c866bd35758f81ff0a1d86d1440df1`
- `include/constants/object_types.h`: `b4faa1b6ca67d6f70b7be0aba5e1fd37e8529acf6b0b4ecfe88331df862a4fc3`
