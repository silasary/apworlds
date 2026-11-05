# Directed West Rainbow → West Cabbage route

Local correction based on published draft #932 at
`c176aa10758998d58b600b817845d34c96713519`. No campaign merge or publication.
This supersedes the selected-pair unknown in the earlier four-object checkpoint;
it does not retroactively turn that earlier evidence into a complete proof.

## What is proven

The directed native path is **192 → 801 → 592**, with a descent inside room 801.
There is no native direct192→592 transition. Normal Kirby can fly up from the
right-hand floor of192 to the exit; arrival in room 801 is on its left middle platform.
Walking left off that platform, falling, moving right and pressing Up reaches
the lower-left mirror. No reverse path is inferred.

| Segment | Exact evidence | Required gate |
|---|---|---|
|192 right floor to exit|QA starts x200,y123.754 in clean ROM; ordinary Up flight reaches tile(12,3). Width16,height13; right corridor x12 is clear from y1..8, with floor at row9.|Intrinsic Normal Kirby flight; no special copy ability used.|
|192→801|Object0x8BB3E4; mutation0x8821A8; selected pointer0x088821BA; destination801, spawn(8,12), observed fixed-point placement(120,184.996) pixels.|WORLD32-bit slot9, West Rainbow.|
|801 middle→lower|31×23 collision grid; one-way middle platform cells x5..7,row13. Continuous ordinary movement from x120,y200.996 goes left past its edge, falls to lower-left platform, then reaches x90.375,y280.480. No position/room writes.|No additional item; a directed descent, not an inferred upward connection.|
|801→592|HubMirror0x8B4B20/type0x8C; center-bottom mutation0x873576; selected pointer0x08873588; destination592, spawn(9,3), observed placement(136,40.996).|WORLD slot7, West Cabbage; combined Area Key3.|
|592 arrival identity|16×13 grid; spawn is in open upper interior at tile(8,2), above the middle ledge, not an invented lower compartment. Native doors_idx219 maps uniquely to ROOM_3_HUB_3 in the inspected room catalog.|No additional arrival gate.|

Identity:192 doors_idx59 maps to ROOM_1_HUB_3;801 doors_idx0 maps to Central
Circle. Its existing MIDDLE_PLATFORMS and root/lower graph nodes describe physical
platforms of this same native room. The landing and observed descent establish
which existing nodes this route uses; no new compartment or visit-bit ID is added.

The local graph edit removes only the compressed192→592 shortcut, directs192's
Central Circle exit to the existing middle node with West Rainbow + can_fly,
retains the existing middle→root descent, and gates root→592 with West Cabbage
instead of South Rainbow. Other source192 exits and the reverse592→192 claim
remain unchanged. `can_fly` retains the existing capability notation; this is
not a general implementation or validation of every pending ability predicate.

## Source, geometry and native consumer checks

USA ROM SHA1 `274b102b6d940f46861a92b4e65f89a51815c12c`.
Object/solidity/foreground tables:0x08D637AC/0x08D63330/0x08D64520.
Collision attribute table0x082D88B8: byte0→0x1,13→0x200,15→0x4,
255→0x4001. The observed physics corroborates the middle one-way platform and
lower floor; no generic flood-fill was used as a substitute for Kirby movement.

Source snapshot is pinned by the hashes in hub-object-evidence.md; additional
`src/special_hub_mirror.c` SHA256 is
`b3535e446105eee889e35a293534afc517b012be51563fd39afbc69cd074c541`. Constructor
0x0801E2CC corresponds to type8C dispatch entry0x083512AC. Init0x0801E590 reads
WORLD scope2/template+4; ClearTiles0x0801E450 applies the nine surrounding
coordinate/state records. Only the center-bottom collision becomes255.
DoorToHub0x0802AAF8 and closed handler0x0802AD00 supply the first hop.
Lookup0x080025AC matches current collision byte plus coordinates; consumer
0x08056348–0x08056392 applies destination/spawn. Every selected pointer agrees
between the ROM decoder and observed runtime.

Native gates test **zero versus nonzero**, not equality to1: QA observed both
slot9=2 and slot7=2 change the relevant runtime collision byte0→255. Slot7 alone
does not open192; South Rainbow slot6 alone does not open801's West Cabbage exit.
Once a loaded room's tile has opened, clearing a slot does not close that tile.
Negative initialization tests therefore re-enter192 with slot9=0; they do not
pretend item revocation resets an already-open native door.

## Controlled QA, not natural progression

An existing legitimate native save from the stock-Qt reconnect QA was copied,
never overwritten. SHA256:
`b54d8e5d25c4026d1d710a3a1d64b33a97abf09aade55d7af27baee1ea1a7868`.
That save originated in an earlier AP seed and recovers Central Circle. The
probe opens ROM read-only and keeps save writes and checkpoints in memory.

Two inputs were tested: the unchanged retail USA ROM, and a private copy patched
with the already-reviewed historical combined tree
`ed5b56b5e0f35d2b37776c43a5374c6e405cbbc3`. Patch SHA256:
`fb18887aadb0f49dcac2f8276fb85e2a5e4017edfb5d9155d146f5629579aea7`.
This is an unseeded combined base-patch probe, not current-draft full integration.
No original ROM, save or binary dump is included in the source correction.

Explicit QA writes initialize native slots or combined ownership mailboxes;
ability gating is disabled for this Normal Kirby movement experiment. No player
coordinates, room IDs, completion checks or selected-record pointers are written.
For the missing-West-Rainbow case, ownership and native slot9 are reset before
re-entering192 through an already-open801 mirror. This is scene setup, not
natural acquisition/revocation evidence. Save-state restore is only a repeatable
QA checkpoint, not persistence acceptance.

Combined mask0x220 at0x0203B134 owns door5+door9; key bit0x8 at0x0203B0C0
owns Area Key3. The historical payload resolves native areas192=0,801=0,592=2
and gates the inter-area second hop. Mailbox layout is unchanged. Physical Hub
switch flags0x0203B04C remained zero throughout all six cases.

| Controlled case | Observed result |
|---|---|
|Both Hub items + Area Key3|192→801→592; both pointers and both spawns match.|
|Both Hub items, no Area Key|First hop succeeds, second blocked in room 801.|
|Both Hub items, unrelated Area Key4|Second hop blocked in room 801.|
|West Rainbow + South Rainbow + Area Key3|Second hop blocked; slot7 remains0.|
|Key-first mailbox initialization|Full directed chain succeeds. This is not a network receipt-order test.|
|West Cabbage + Area Key3, fresh192 slot9=0|First hop blocked; collision remains0.|

The six cases were replayed automatically from the same private input files;
all426 recorded frame states match the interactive run exactly. All owned
emulator processes exited normally. Original ROM, original save and private
save-copy hashes were reverified unchanged.

## Validation and limits

86 focused graph/rule/native-evidence tests and483 reachability subtests pass.
The new graph regression checks both Hub acquisition orders, missing-item and
South Rainbow negatives, logical removal/re-addition, exact arrival node and
unchanged visit IDs. One existing exact gate expectation is corrected; no broad
reachability assertion is weakened.

Generation:24 cases (three goals×Room Sanity on/off×ability gating on/off×two
seeds) were run against both this correction and its unchanged publication
baseline. Each has12 passes and12 identical failures: Room Sanity-on cannot access
Room2-06,5-13,6-05,8-09,9-CHEST_2. These are inherited acceptance gaps; this local
correction is not a claim that standalone932 is merge-ready.

One disputed directed pair is now reconstructed as the proven gated multi-hop
route and represented locally. Eleven other pairs remain unproven:
192→490,192→225,592→526,592→129,592→192,193→211,193→215,225→192,
526→592,129→592,490→192. Carrot's alias and Moonlight RIGHT proof remain open.
All v0.4.1 limitations, partial #980–#983 coverage, #993+#994 dependency, pending
metadata and live signing/protection gaps remain. No new release acceptance.

Fresh generated combined-seed/client gameplay, actual network delivery orders,
reconnect, native save/load persistence, and broader ability/player states remain
separate acceptance work. The graph correction changes no item identities,
mailbox offsets, native payload, patch bytes or AP-global code. Standalone932's
ID/mailbox collisions with908 still require deliberate later integration.

Reproduction artifacts are retained in the private phase5 QA checkpoint: probe.c,
combined-setup.txt, combined-cases.txt, verify-qa-traces.py, collision-geometry.json
and provenance JSON. Build with the existing mGBA0.10.5 headers/library; execute
with a55-second process bound and the input file. Keep the lawful ROM and copied
QA save private. The public-safe source tests run without either private input.
