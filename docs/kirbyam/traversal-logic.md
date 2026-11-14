# Source-backed traversal (draft)

The current candidate precollects only Beam. Stone, Burning, Cutter, Mini and Wheel
use progression permissions and reviewed physical sources. Historical acceptance
checkpoints below retain their original fixture and test scope; current inventory
and release qualifications are summarized in
[the source-backed release review](../dev-docs/reconstructed-release-review.md).

## Copy Ability Room access and source contract

[PR #1025](https://github.com/hasherwi/Archipelago-kirbyam/pull/1025), merged as
`06ab91f55e37bce254a9e51ca43901d36d31b911`, supplies the runtime gate for native
room 970. `Copy Ability Room Access` (item ID `3860500`) is one progression item
replacing filler. It is unowned by default and supports explicit precollection.
The item alone opens the special mirror from Central Circle (801) to 970; all Hub
Connection items, all 15 physical switches, and legacy WORLD word 18 never grant
it. Ownership is grant-only within the authenticated seed and selected native
save file. The original three-file selector and native save layouts are retained.
See [native-save acceptance](../dev-docs/copy-room-native-save-acceptance.md) for
the separate room-access feature's evidence and limits.

Access is permission to enter, not equipment or an ability-unlock grant. The
nineteen room 970 statue sources are owned by `REGION_COPY_ABILITY_ROOM/MAIN` and
shared by four traversal consumers: the Wheel108 chest, Smash149 peg, joint
Hammer228 chest and joint Hammer229 left1Up carriers. Each consumer requires independently reachable room 970; the shared source set
also requires the access item at acquisition. Actual statue assignments, category
inclusion/exclusion, eligible output pools, and ability-item gates still apply.
Fixed excluded statues supply their native Wheel/Smash grants only after reaching
970 with the corresponding ability permission when gating is enabled. They do
not bypass the carrier's Hub Connection, Area Key, obstacle, or reset requirements.

The earlier draft correctly rejected all-switch reachability as a substitute for
runtime access. The native setter is
[`pause_world_map.c:1345-1357`](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/pause_world_map.c#L1345-L1357),
but the pre-integration AP physical-switch intercept recorded the physical bit
and continued at `0x08039671`, bypassing its unlock callback. Hub receipt handling
wrote WORLD slots 1..15 without replacing the word 18 setter. The former
`source_sets.statues_970.unavailable` restriction recorded that gap. The merged
item-gated feature supersedes that restriction, not the historical finding that
all-switch or legacy-word access was unsound.

The native geometry and source evidence below support the room-owned carrier
rules. Controller-only Wheel and Smash carriers, the Olive Mini sequence, and
entry-specific Mustard Mini routes now pass under the controlled fixtures below.
The Mustard runs take damage and do not establish one-hit or low-health safety.
Ordinary-enemy retry loops, cannon timing, and the other listed acceptance gaps
remain separate from those results.

## Generation and accessibility

Every enabled Kirby check must be reachable in a generated seed, including when
`accessibility: minimal` is selected. Static source-assignment validation uses
the same bounded search for full and minimal; it does not change the option
value or force individual grants. The selected AP accessibility still controls
normal fill. A Kirby-specific final audit therefore runs after every world's
finalizer and progression balancing, before output, including `--skip-output`.
It sweeps actual reachable progression across the whole multiworld and rejects
stranded Kirby checks with their names and player. An all-inventory state is
used only to distinguish source/graph failures from actual placement cycles.
It is not accepted as proof that the player can acquire those items.

This safety check does not make every minimal seed generate successfully. Use
full accessibility for stronger fill guarantees; other players may keep their
own selected accessibility. Unsupported source assignments or fills fail
clearly rather than producing an unsafe archive. Missing native rules remain a
separate coverage issue that neither state audit can detect. See the
[starting-permission dependency audit](../dev-docs/starting-permission-removal-audit.md)
for the exact baseline matrix, examples, benchmarks and remaining blockers.

With 100% Normal included enemies and fixed excluded statues, room 970 can
supply the Wheel/Smash witnesses after item-gated access and the relevant ability
permissions. Fill must still place progression without requiring a source
behind its own target.

Historical pre-integration regression evidence comes from [CI run 42378067551](https://github.com/hasherwi/Archipelago-kirbyam/actions/runs/42378067551),
[artifact 13576028492](https://github.com/hasherwi/Archipelago-kirbyam/actions/runs/42378067551/artifacts/13576028492):

- Case 69, seed `108836542`, uses minimal accessibility and a seven-area-boss goal.
  A follow-up replay with only the unconditional preflight rejection deferred
  generated successfully with the real peg and Wheel gates still closed. All
  eight area bosses were reachable, the goal and minimal accessibility passed,
  and exactly two unreachable chests held filler.
- Case 95, seed `321375454`, uses full accessibility. With the same preflight-only
  deferral, Dark Mind was beatable, but the real `fulfills_accessibility` check
  raised `FillError` for the Moonlight Mansion 2-20 and Rainbow Route 1-06 Lower
  chests. Beating the goal does not satisfy full accessibility.

These historical results describe the previous goal-only minimal policy. After
the Copy Room integration, case 69 and case 95 both passed the configured AP
accessibility and an all-inventory reachability check. That was not proof of
actual progression accessibility. The later fresh-state audit finds 19 stranded
checks in case 69's solo fill, and 16 or 2 in its default/95 mixed-world variants.
Those exact fixtures now fail clearly before output. Case 95 full still passes.
Case 69 retains its original live-random policy seed `4994526115634732429`; the
failure is placement reachability, not a missing theoretical Copy Room source.
The tests retain the per-player room-access negatives on the captured final
world while requiring the unsafe fill to be rejected, not silently accepted:
[`test_traversal_accessibility.py`](../test/test_traversal_accessibility.py).

The initial focused integration suite passes all 325 tests, including these exact
replays and true zero-item negatives. Installed-APWorld generation on runtime
0.6.8 succeeds for 34 archives / 51 slots: 32 archives / 48 slots in the main
matrix and 2 archives / 3 slots for explicit precollection. The matrix's former
two source rejections no longer occur. These outcomes use the real room-access
item and actual statue grants, not relaxed target rules or invented equipment.
The first full world run finished with 6,093 passed and one hosting failure from
an environmental `AF_UNIX` socket-path length limit in the temporary directory.
The unchanged hosting test passes when retried under a shorter temporary path;
the subsequent clean full run passes all 6,094 tests with zero failures in 18:24.
The later Mustard cross-side recovery metadata correction adds eight regressions:
339 focused tests pass and independent review finds no issue. Its full run
finishes with 6,101 passed, one failed, and six warnings in 1952.81 seconds. The
failure is the unchanged hosting harness at `ready.wait(30)`:
`TimeoutError: Timed out waiting for local MultiServer startup`. This startup
timeout is distinct from the earlier socket-path failure. An unchanged isolated
hosting retry then passes: `1 passed in 13.46s`. The earlier clean 6,094-test pass
does not cover the later metadata correction. The follow-up run and isolated
retry are separate results, not a clean 6,102-test full-suite pass.

The CI snapshot for head `82a0f92432b5f67e9de68776448be5e881aea0f6` has eight green
workflows, a 500/500 fuzz pass, and all six actual unit jobs passed. Two preexisting
Python 3.11 setup/dependency failures remain distinct from unit-test failures.
Checks for the final follow-up commit must be verified separately.

## Contract

An ability item permits acquisition; it does not equip Kirby. `traversal.py`
models a directed entrance/compartment-to-exit/check graph, one equipped ability,
physical source identities, source consumption, and transient opened obstacles.
A fuse route abstracts an available cannon with a current fuse signal, possibly
after clearing its occupant; it never grants a permanent opened switch.
Capability providers are separate from room records. The policy resolver uses
`build_enemy_copy_runtime_patch_writes`, the same assignments and eligibility
bitmap as the ROM. Excluded categories keep their native grants.

A source behind its own obstacle cannot solve it. Copying another ability replaces
current equipment. Mini disappears on a transition, including a same-room cannon.
A transition and a room-instance reset are distinct. Only an evidenced reset
renews consumed identities through a transition, and a reset loses opened pegs
and ropes. Separately, the four documented fuse-source viewport loops and the
local Wheelie140/Giant Rocky149 loops below prove their exact original ordinary
enemy templates can respawn in place; this does not make
other enemies renewable or establish a fresh room instance. Multiple rows for
one physical source share its stable identity. No permanent AP peg event is used.

Live random grants expose outcome sets, not the deterministic fallback hash.
A single-use random source proves a capability only when every possible output
solves it and no Normal result is possible. Sequential capabilities cannot select
different favorable outputs from the same consumed source. Explicit renewable
placements can instead use possible-acquisition semantics: repeated attempts are
assumed eventually to produce a positive-support eligible output. This is a
fairness assumption, not a first-inhale or bounded-attempt guarantee. A full-period
PRNG alone does not prove it because grants consume differing numbers of draws.

The reviewed hub190 regular statue is renewable in place: native
`ability_objects.c:sub_080AA588` grants an ability without consuming the statue.
Kirby can drop an unwanted result and touch it again. Ordinary enemies and ability
stars do not inherit this renewable classification. The exact Hot Head/Foley
loops under fuse cannons and the local Wheelie140/Giant Rocky149 loops have
separate ordinary-enemy lifetime evidence; Boxy and Batafire remain finite defeated-midboss sources. Enemy weight100 removes
random enemy outputs; statue output pools ignore that enemy weight. All gateable
outputs still require their unlock items.

## Room-owned traversal schema

`data/regions/rooms.json` stores executable traversal metadata alongside each
target's ordinary exits and locations. `data.py` retains the optional version-1
`traversal` object on its owning region; `traversal_data.py` loads and validates
the catalog. A `targets` entry names exactly one existing directed `exit` or
`location`, its `native_room`, its `kind`, and its reviewed witness `graphs`.
The graph's `nodes`, `routes`, `starts`, and `required_targets` retain the exact
compartments, transitions and bypasses. A start is Normal, never free equipment.

Each graph uses the same `compile_traversal_graph` compiler. Route `items` are
unconditional prerequisites; `area_key_items` are added only with Area Keys on.
`allowed_abilities` may narrow, but cannot expand, the separate capability
providers in `traversal.py`. `room_transition` also covers a same-room cannon.
Only `room_instance: reset` renews consumed sources on a transition, and it
requires explicit `reset_evidence`; preserve and unknown lifetime remain distinct.
A doorway alone proves neither a fresh instance nor replenishment. The separately
reviewed fuse-source and local Wheelie/Giant Rocky viewport retries use explicit
placement/retry evidence, not
an automatic reset annotation.

Local `sources` name exact acquisition nodes, physical identities and evidence.
Shared `source_sets` live with their hub region, name their native room, and are
referenced by ID and compartment in a witness. The nineteen room 970 statues are
defined once under `REGION_COPY_ABILITY_ROOM/MAIN`; their shared `items` requirement
is `Copy Ability Room Access`. The compiler unions source-set requirements with
each physical placement's requirements. Preflight and runtime source checks both
include these requirements alongside route items. The source set's native room
must match the receiving compartment. A renewable placement needs repeatability
evidence, and possible-acquisition retries additionally need the witness's
`retry_evidence` and an explicit evaluator opt-in.

Reviewed `graph_parts` can share nodes, routes, sources, and source-set references.
They cannot supply or override a consumer's starts, required targets, or access
requirements. `ordinary_hub_statues` is one such shared part, expanded before
compilation without adding room-reset credit. An unavailable source set makes
every dependent graph unavailable, including static-assignment validation; it
cannot be recovered through a different consumer of the same shared records.

The graph's `access.region` is an independently reachable source region. Both
970 consumers require `REGION_COPY_ABILITY_ROOM/MAIN`, not merely Central Circle.
The optional `access.all_hub_switches` mechanism requires each physical switch
location, not owned connection items or an area event; it is not used to unlock
970 or either of its consumers. The shared runtime helper also registers access
regions as indirect dependencies for entrance rules.
Mini, peg, Wheel, rope, and fuse targets use room-owned witness metadata and the
resolved source policy, rather than parallel route/source catalogs. Research-only
non-AP pegs and rope platforms belong in the evidence censuses below, not
executable AP targets. Burning, Stone, and Cutter are progression unlocks; only Beam is automatically precollected.

## Ordinary hub statue network

The reviewed `ordinary_hub_statues` prefix starts Normal at independently reachable
Central Circle (native801). It covers 15 ordinary hub rooms plus Central, 30
physical permanent statues, 15 native grant-table slots, and 30 directed mirrors.
It has no room970 node, all-switch requirement, or source-respawn assumption.
Owning the ability item alone never supplies equipment.

### Physical access and grants

Ordinary-body connectivity was checked from all21 hub-to-hub arrival positions.
Both statues and every relevant return/inter-hub mirror are reachable on unchanged
terrain. No bomb, rope, Mini corridor, metal destruction, boss, or ability swap is
needed. Ordinary flight reaches upper statues around the central Big Button
without activating it. All nine arrivals back into801 also reach its ordinary
hub mirrors with normal flight. This is body/terrain verification, not a complete
emulator flight replay.

Each physical object's native address remains its stable source identity. Source
keys are the native table addresses derived from statue family and subtype index,
checked against `enemy_ability_runtime_patch._STATUE_TABLES`. The 30 placements
cover these15 native grants: Beam, Burning, Laser, Fire, Stone, Fighter, Bomb,
Tornado, Ice, Spark, Missile, Parasol, Sword, Cutter, and Cupid. **Fixed Wheel,
Smash, Throw, and Hammer are absent from these ordinary hubs.** No graph may
manufacture those grants from inventory permission or from another statue's slot.

The pinned [statue touch routine, `sub_080AA588`](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/ability_objects.c)
does not consume the object. Drop an unwanted live-random result and retouch
before departure. Eligible positive-support acquisition uses the existing
fairness assumption, not a finite-attempt guarantee. Actual static assignments,
excluded categories' native grants, ability unlocks, and live output pools still
apply. Enemy no-ability weight does not apply to statues, and this evidence does
not make ordinary enemies renewable.

### Directed mirror guards

The following15 bidirectional pairs provide30 separately guarded edges. Each
traversed direction requires its listed owned Hub Connection item. A cross-area
edge also requires the destination Area Key when Area Keys are enabled. Only the
connections and keys used by the chosen path are required, not the entire set.

| Native room pair | Hub Connection item prefix |
| --- | --- |
|801 ↔190 | Rainbow Route East |
|801 ↔191 | Cabbage Cavern East |
|801 ↔192 | Rainbow Route West |
|192 ↔193 | Carrot Castle |
|801 ↔194 | Rainbow Route South |
|194 ↔591 | Cabbage Cavern Center |
|801 ↔290 | Peppermint Palace East |
|290 ↔291 | Peppermint Palace West |
|801 ↔590 | Rainbow Route North |
|590 ↔390 | Mustard Mountain |
|801 ↔490 | Candy Constellation |
|801 ↔592 | Cabbage Cavern West |
|592 ↔690 | Radish Ruins |
|801 ↔790 | Moonlight Mansion |
|191 ↔890 | Olive Ocean |

In particular,890 ->191 and690 ->592 require the Cabbage Cavern Area Key when
enabled. Return to Rainbow Route needs no Area Key item. Other cross-area forward
edges require their destination keys. The290 ↔291 pair stays within Peppermint
and has no additional area guard. Item names in the table use the suffix
` - Hub Connection` in the executable records.

### Reviewed continuations

After acquiring an actual eligible provider, the shared prefix feeds these
existing target-specific paths. It does not replace their obstacle or timing
requirements:

- Rope143: depart190 into the left approach.
- Rope217: depart291 through215,212,216 to217's right arrival.
- Rope227: depart290 through210's lower route and227's lower arrival, avoiding
  Box Boxer.
- Rope228: depart290 through210 and205, then the reviewed right-hand bomb approach.
- Rope316: depart390 through304 and321's left upper exit to308, then its
  single-bomb route to316.
- Rope553: depart890 through811,551,815's underwater bypass, and553.
- Mandatory fuse126: join the reviewed194 ->137 ->136 ->126 carrier.
- Mandatory fuse827: join the reviewed890 ->823 ->828 ->827 carrier from below.
  The optional323/502 cannon routes do not gain an unproved remote carrier.
- Wheel108: join the existing carrier through140; retain `wheel_race` and the
  explicit fresh108 return opportunity from110. The prefix adds no reset claim.
- Smash149:190 ->143 ->145 ->146 ->147 ->148 ->149, retaining the documented rope
  cut, ordinary-movement timing assumptions, and final `allowed_abilities` limit
  to Smash for the peg action.

The six rope graph sets, two mandatory fuse graph sets, Wheel108, and Smash149
therefore gain source-aware ordinary-hub alternatives. They still need an actual
reachable grant. With fixed excluded statues and100% Normal included enemies,
this ordinary-hub network provides neither Wheel nor Smash. The separate room 970
source set can supply them through item-gated room access and actual eligible
statue grants. It does not make ordinary-hub fixed statues gain those outputs or
rescue a missing access item, ability permission, or carry requirement. Both full and minimal
Kirby seeds must pass the final all-check audit; a missing necessary source or
stranded access item causes generation to fail before output.

### Network regression contract

Check that zero hub items expose no network source; a statue pair opens only with
its exact mirror item and conditional Area Key; reverse directions retain their
guards; unrelated keys are unnecessary; and an ability item without a reachable
source fails. Test actual shuffled assignments, fixed excluded native outputs,
positive-support statue retries, and empty-pool failures. Both970 consumers must
reject missing room access and all-hubs/all-switches substitutes, plus missing
ability permission when gating is enabled. Fixed excluded room 970 statues retain
native grants; included statues use
their actual static assignments or live pools. Test source requirements in static
validation as well as runtime rules. Shared parts must not override starts/access
or add reset credit. These are required checks, not a claim that the final full
test suite or patched-ROM acceptance is complete.

## Mini

The exhaustive native collision0x59 census contains only rooms134,312,321,736.
All four rooms have source-aware routes in every randomization mode:

- Olive6/134: lower Ocean Spray route, with local Minny and the drop/inhale/recover
  sequence before the final throat. Upper Goal1 remains independent.
- Mustard18/312: Warp branch. Ordinary Room19 remains independent.
- Mustard5/321: both lower Room6 routes require Mini. Each side's upper Room9
  exit stays independent. The Room5 chest is reachable with Normal from the
  right arrival; the left arrival must first cross the Mini corridors.
- Carrot10/736: down-cannon compartment to Chest1. Upper Room11 is independent.

Canonical Minny placements precede their throats; unrelated room-wide enemies
are not credited. In particular, a source across a cannon transition cannot carry
Mini back through that transition. The room-owned traversal records in `data/regions/rooms.json` hold the
executable routes; the Mini appendix below preserves source addresses and the
native evidence contract.

Minny always grants Mini. Only the Minny carve-out option was removed; general
randomization, statue, miniboss, boss-spawn and non-ability-enemy options remain.
Mini can still appear from other randomized enemies. Statue pools preserve the
former default exclusion of Mini. Mini remains gated and is no longer precollected.
Wheel and Stone are also gated progression permissions and are no longer automatically precollected.

Raw Mini ability stars recover Mini under the same unlock gate in every mode.
Other stars preserve existing behavior, including the existing native0x80 versus
legacy0x20 detector mismatch. Do not assume ordinary stars suppress no-ability
weight. See `mini-star-recovery.md` for actual-C tests and patch verification.
Old Minny policy keys are ignored for newly generated patch plans. This does not
repair an old ROM whose static Minny grant was already changed: regenerate and
repatch from the supported original ROM.

### Mustard 5 entry compartments

Native 321 has two distinct arrivals: 304 / Room4 enters the left side at tile
`(2,22)` (`0x0888FB12`); 546 / Room8 enters the right at `(30,19)`
(`0x0888F6B0`). The right arrival now enters `RIGHT_ENTRY`, which owns chest
`0x088C4DFC` at pixel `(184,248)`. Both sides retain their upper Room9 exit and
their own source-backed Mini route to the lower Room6 exit, record `0x08891758`
at tile `(5,39)` to native 544 spawn `(3,2)`. The physical RoomSanity check is
shared without connecting the compartments through it.

From the right arrival, an ordinary terrain body `[-6,-5,+6,+7]` has this
pixel-coordinate path using only air, platform `0x0E`, and door `0xFF` terrain:
`(472,296) -> (358,296) -> (358,216) -> (248,216) -> (248,248)`.
Facing left, an ordinary puff activates bomb `0x08891722` at tile `(14,15)`.
Its connected `0xF2` records at x9..13 in rows14/15 replace their collision with
air. Then `(248,248) -> (184,248)` reaches the chest without Mini. The same
ordinary body can cross to the left after opening the bomb:
`(184,248) -> (136,248) -> (136,344) -> (24,344)`.

The left-to-right witness instead acquires left Minny `0x088C4DB4` at
`(24,280)` and crosses the first Mini throat `(12..13,26)`. The controller-tested
route then drops Mini, inhales and spits out the Flamer as Normal, recovers the
dropped Mini star, and uses stepped jumps to reach the second throat `(19..20,19)`.
The spit faces right, away from the stored Mini star on the left. The chest
continuation on the right uses ordinary flight/puff after returning to Normal. The right lower
exit witness uses right Minny `0x088C4DD8` at `(472,232)`. The sources are
inhaled from their approach alcoves; neither is a global room-wide source.
The cross-side tile route is `(1,21) -> (8,21) -> (8,24) -> (9,25) ->
(11,26) -> (14,26) -> (19,26) -> (19,22) -> (16,22) -> (16,19) ->
(21,19) -> (24,19) -> (24,18) -> (29,18)`, including both Mini throats.

The coordinates above are native terrain/body and point/slope topology evidence,
not a complete controller recipe. The actual stepped ascent and enemy handling
are recorded below. The earlier claim that the upper halves freely reconnect
was incorrect: a wall reaches the top boundary, and the bomb approach is initially accessible only from the
right. Normal cannot reach the lower exit from either side even when ordinary
bomb/F0 mutations and slopes are granted in the optimistic topology model.
The [WiKirby Room5 description](https://wikirby.com/wiki/Mustard_Mountain_-_Room_5)
corroborates cross-side Mini travel and a 1-Up chest, but does not by itself prove
these entry-specific rules or the exhaustive native corridor census.

#### Combined Mustard 5 acceptance

Three entry-specific routes have completed cold-start controller witnesses:

- Left arrival: actual left Minny acquisition and the first throat lead to the
  native 321 -> 544 transition at frame 3268.
- Right arrival: actual right Minny acquisition and the second throat lead to
  the same lower destination at frame 3801. Both exits use record `0x08891758`,
  not a transition to room 323.
- Left to right to chest: one uninterrupted run crosses both throats, then opens
  bomb `(14,15)` with ordinary flight/puff and records the chest counter 0 -> 1
  for native source `0x088C4DFC` at frame 4088. A second cold replay reproduces
  the cross-side run with additional read-only observations.

The cross-side ascent is not a single 64-pixel Mini jump. Measured Mini jump rise
is about 52 pixels; the successful route uses neighboring stepping ledges, with
landing heights 425 -> 393 -> 361 -> 313. Between throats, Select deliberately
drops Mini, Normal inhales and spits the Flamer away from the stored star, and
the observed type `0xA3` / raw-ability 23 star restores actual Mini equipment.
`mini_321_cross_to_right` therefore sets
`recover_dropped_ability: true`. This is one sufficient witness, not a claim that
every possible cross-side route requires recovery.

The preferred inhale-and-spit witness completes a fresh 4,206-frame run. Its
controller history differs from the original swallowing witness in exactly one
frame: input start 2324 uses B (`2`) instead of Down (`128`), facing right. Native
spit state `0x0805509D` is observed at frame 2325; its initializer
`sub_08054F90` clears `transitioningAbility` without an enemy ability grant.
There is no Flamer swallow/grant between capture and recovery.
The later Down input swallows the recovered Mini star, restoring Mini 23 at frame
2473. Room, ability, HP, and chest-event histories match the original, including
the chest at frame 4088. Avoiding the enemy grant removes reliance on the Flamer
granting Normal under other source policies; the actual emulator run still uses
mode 2 / 100% Normal, not an all-policy gameplay matrix. The original swallowing
witness is retained as policy-specific evidence, not the source-neutral recipe.

All accepted complete Mini 321 runs take damage. The cross-side run takes one hit before
acquisition, retains 5 HP from acquisition through both throats, then takes three
more hits on the ordinary chest approach and finishes at 2 HP. The first of those
later hits removes Mini. Both lower routes
also finish at 2 HP and enter 544 as Normal after Mini was lost or dropped; they
do not independently demonstrate Mini stripping on the transition. No one-hit or
low-health acceptance is established. Observed hits do not prove that damage or
a damage boost is required; partial avoidance trials are not complete no-hit
witnesses.

A separate right-arrival Normal chest run receives no items and keeps unlock
mask zero and equipment Normal 0 throughout. The same chest source records
counter 0 -> 1 at frame 2070 without any Mini acquisition. It takes one ordinary
hit on the upper approach at frame 1413 and finishes at 5 HP. This preserves the
ungated right-arrival alternative, but is not a damage-free or one-hit witness.

The Mini entry fixtures change only Kirby 0's initial room and coordinates to
321 left `(24,344)` or right `(472,296)`; the other three Kirby slots retain room
803 and their original coordinates. These are controlled arrivals, not played
304/546 ingress. Each uses a blank battery and no state reload, death, forced
transition, or gameplay position/equipment/health injection. The real production
client `ReceivedItems` path supplies only Mini permission `3860123` before
movement, through simulated history and an in-process transport. Equipment stays
Normal until actual acquisition. Mode 2 emits 73 Normal enemy assignments;
Minny remains fixed at native ability 23, native statues are unchanged, ability
gating is on, and Area Keys are off. There is no fixed Mini statue in room 970.
These runs do not cover an external server, full campaign, locked Mini, save/load,
other modes, or every source alternative. Earlier four-Kirby calibration is
excluded.

The patch and production-origin identities are shared with the combined-build
identities below. Mini-specific SHA-256 identities are:

- Left arrival: `ac75b40b4b8a9b0150a78488bb9a19e82c54c864be5aafd289e08bcb0c0d3c55`.
- Right arrival: `4f3adda0b42747979fe34a91d74fffda78077bde9df3393dfba8059688bb34c0`.
- Source configuration: `01ba62147d0c50c223c17f072bcbda53d2ca22d956be74488ef5b221e5635429`.
- Headless libmGBA 0.10.5+dfsg-1 library:
  `6a74d94811fc418ccb47c101aa3cdaa5a639a0484368d46d966b0fee87b5ae5c`.

### Combined Olive 6 acceptance

A complete cold-boot controller replay acquires Mini 23 from local Minny
`0x088CBD88`, crosses the first two `0x59` throats, and drops Mini before the
star-stone. Normal suction **pulls**, rather than swallows or destroys, movable
type `0x79` star-stone `0x088CBD40` from x = 712 to x = 693.75. The actual emitted
type `0xA3` / raw-ability 23 star is observed before capture and restores Mini
after inhalation and swallowing, despite the 100% Normal generic-enemy policy.
Kirby jumps over the moved stone, crosses the final throat at tiles 45..46 in
row 15, and opens the chest at frame 2749: counter 0 -> 1, native source
`0x088CBDAC`, AP `3960506` (Olive Ocean 6-06 - Spray Paint #7 Chest). All 6 HP
remain throughout gameplay; Mini remains equipped at the chest event.

The controlled fixture changes only Kirby 0's initial room/spawn to 134 at actual
pixel `(24,104)`, matching native 133 -> 134 spawn `(2,7)`; it does not play the
preceding room 133 journey. Other Kirby slots remain in 803. A blank battery and
fresh native File 1 are used. The production client configuration routine receives
only Mini permission `3860123`; all eight guarded writes finish before movement,
with equipment still Normal. There are no later harness writes, state reloads,
or position/equipment/health/completion/ownership injections during the route.
The emitted policy is mode 2 with 73 included enemy assignments Normal, fixed
Minny and native statues, gating on, and Area Keys off. This is simulated receipt
history and in-process transport, not an external server or full campaign.

The instrumented route and final cold replay use identical inputs and events
through frame 2715; the final replay then completes the chest input. Damaged and
star-loss calibration attempts are excluded. This proves one sufficient route,
not mandatory recovery on every possible route, Droppy recovery, locked Mini,
other modes, save/load, or reconnect behavior. Patch, clean input, production
origin, and bridge identities match the shared identities below. Unique SHA-256
values are:

- Entry fixture: `c6dc1b0e6825752e423add5ad72e7faaf2417fbbca9a0592f30e26513b1dbe07`.
- Configuration manifest: `948c88d18028d12669efdb568945a5d2d6aac69e4d24f48fc7968553b3e99f77`.

## Peg coverage

The peg census appendix below records all 14 pegs in 13 native rooms. An audit record is
not automatically an executable route. Production source-aware gates currently cover all eleven AP peg targets:

- 149 peg35,18: chest, with a local Giant Rocky or a carried Smash. The carry
  runs190 -> 143 -> 145 -> 146 upper exit -> 147 -> 148 right entry -> 149.
  Smash Up+B cuts the143 star-platform rope; Stone cannot substitute there.
  A 190 statue may supply Smash under its actual assignment. The room 970 alternative
  additionally requires `Copy Ability Room Access`, reachable room 970, an actual
  eligible Smash grant, and Smash permission when gating is enabled; all 15
  physical switches and Central access are not substitutes. The carry retains
  the East Hub Connection and conditional Moonlight Mansion Area Key requirements.
  Smash's down attack clears the 149 ordinary floor. The complete combined-patch
  carrier below now includes a controller replay of room 147's timed run.
- 510 peg7,7: chest; Stone592 -> 528 -> 513 upper -> 509 upper-right -> 510 upper.
  The final segments need no peg, metal or rope clearing. The UFO inside the chest
  chamber is never used to bootstrap entry. A lower horizontal-metal alternative
  remains uncredited; the implemented peg route is a sufficient witness, not a
  claim that every other attack is impossible.
- 401 peg28,30: right shaft to406 Sound Player; local Rockys or explicit Stone
  carry190 -> 801 -> 490 -> 407 -> 401. The407 bomb is approached from above with Stone.
- 411 peg4,3: revealed405 doorway; Stone190 -> 801 -> 490 -> 411. Other exits stay free.
- 221 peg41,12: Pink chest tunnel; local Giant Rockys or Stone
  190 -> 801 -> 290 -> 291 -> 215 -> 212 -> 216 -> 217 -> 221. The carry avoids rock bodies,
  ordinary blocks, and the star platform rather than assuming them absent.

- 816 peg26,3: Olive Map; local Bonkers or Stone592 -> 801 -> 191 -> 890 -> 811 -> 830 -> 810 -> 802 -> 816. The reviewed carry avoids rock bodies and opposing currents; ordinary underwater puffs activate the811/802 bombs without dropping Stone.

- 204 peg62,4: alternate227 entrance to Happy Notes; Stone190 -> 801 -> 290 ->
  210 -> 227 main -> 204. Ordinary BoxBoxer combat retaining Stone is assumed.
  Native damage eligibility accepts Stone. The post-boss puff and transition
  retaining Stone were replayed, but the fight itself was not.
- 605 peg12,24: revealed610 door; Stone592 -> 690 -> 611 -> 601 upper exit -> 605.
  Standing untransformed on two native0x74 crumble objects removes the F7 floor
  layers without discarding Stone. The601 bomb uses an ordinary puff.
- 513 peg4,7: upper-to-lower passage, then ordinary bomb5,18; Stone592 -> 528 ->
  513 upper arrival. The528 wall puff and transition retaining Stone were replayed.
  Reverse lower-to-upper movement can activate the bomb without the peg; the
  directed0x0F platform prevents that reverse bypass from opening a forward route.
- 527 peg18,13: Sapphire, after the timed gate and bomb38,8; Stone592 -> 528 ->
  527. The documented vanilla timed run is assumed executable with untransformed
  Stone, which shares ordinary movement. Native timing and gradual door animation
  agree with that route; no exact frame schedule or emulator timing replay is claimed.
- 527 peg56,16: lower515 entrance only; Stone592 -> 528 -> 527. This carry avoids
  the timed gate and rock body. Its narrow ordinary corridors fit native flight
  terrain bounds. The independent upper exit is not gated by this peg.
  A segmented native replay verifies this peg, lower door, bomb and chest with
  Stone retained and no Mini. It does not verify the full randomized source carry.

Carrier witnesses require an independently reachable source hub, actual Hub
Connection items, and destination Area Key when that option is enabled. Static
assignment validation accepts reviewed local or carrier witnesses rather than
rewriting individual randomized outputs. For full and minimal accessibility, static policies,
including shuffled weight100/statue configurations, get at most 8192 assignment
attempts without forcing individual outputs. The larger bounded
search accommodates the rare joint Wheelie/peg-source assignment when ordinary
hub statues remain fixed; the previous 1024-attempt budget rejected some ordinary
55% no-ability seeds despite valid later candidates in the same deterministic
stream. If that budget finds no Wheel-validated assignment, generation fails that
seed with a precise
search-budget diagnostic, not a claim that the configuration is impossible.
A Wheel-valid candidate without all reviewed peg witnesses also fails after the
bounded search. Minimal keeps its selected AP option but uses this same source
validation. Normal fill and goal-accessibility validation still apply, followed
by the Kirby all-check audit of actual placed progression. No target rule
silently becomes permissive. Live-random rules retain positive-support renewable
source requirements; any checks left closed must still pass the final audit. Unknown
alternatives are not declared impossible; the diagnostic describes this seed and
reviewed witness set, not global configuration impossibility.
The current repository has no entrance
shuffle option; RoomSanity adds checks, not shuffled transitions.

204 -> 227 Happy Notes has a one-way target compartment: regular227 entry cannot
reach it through the nondroppable0x0F platform. The upper compartment can exit to
main. Its exact peg-side entrance now has source enforcement.

515 also has directed compartments: only the527 lower arrival reaches its chest.
The527 upper arrival can reach the common exits but not that chest. The513 arrival
occupies a separate shaft that can return to513 but cannot reach the chest or
bottom500 exit. No Mini requirement is inferred from an ordinary16px corridor.

509 and218 gate food rather than AP exits;741 gates a loose1-Up, not its room exit.
527 Sapphire requires bomb38,8 then peg18,13; an earlier bomb24,14-only bypass was
invalidated by directed0x0F analysis. Its timed gate uses the qualified ordinary-movement assumption above. The816 remote bomb alternative remains unresolved. Ordinary underwater
weapons and puffs cannot break149's alternate F7 ceiling because they lack the
required attack flag; environmental large-block/cannon alternatives are not claimed.

## Destructive chains and remaining acceptance

A closing chain is not automatically a Wheel gate. Candy424 Music Scores was
collected with Normal in an isolated native replay. Moonlight708's secret22,28
exit was reached with Normal from the743 return entrance30,29. These successes
must not be gated on Wheel. Other708 entrances need separate analysis.

Rainbow108 upper chest has an actual Wheel success witness from110 arrival34,19.
Wheel exclusivity is not established. A consolidated uninterrupted native replay
now verifies Normal140 arrival, actual Wheelie acquisition, the independent108
bomb,110 detour, fresh108 return, and chest collection. There were no RAM edits
or reloads after initial140 setup. The exact108 lower-mid -> chest route is now enforced. Wheel140 supplies an early
source when its actual output is Wheel. The 19 regular statues in room 970 provide a
separate item-gated source alternative: independently reach 970 with
`Copy Ability Room Access`, acquire an actual eligible Wheel grant with Wheel
permission when gating is enabled, then carry 970 -> 801 -> 190 -> 140 -> 108 -> 110 -> 108.
The carrier requires Rainbow Route East - Hub Connection; all 15 switches or all
hub items cannot substitute for room access. Its 970-to-140 geometry uses ordinary
flight and avoids the 190 statues. Only the final 110 -> 108 return explicitly
uses a fresh unoccupied room reset. The combined replay below witnesses that reset
in one controlled run; it is not an adversarial-AI or bounded-reset guarantee and
does not assume unlimited phone battery. Native code rebuilds original collision
for a fresh room slot. The final arrival matches the witnessed Wheel race start.
See the Wheel evidence appendix below and the room-owned traversal metadata in
`data/regions/rooms.json`. Wheel and Stone are removed from automatic starting abilities in every mode.

### Combined patched-ROM Wheel acceptance

The combined patch passes a controller-only carry from the actual fixed Wheel
statue `0x088D6078` in room 970 through 801 -> 190 -> 140 -> 108 -> 110 -> fresh
108 -> chest. Wheel (ID 4) and 6 HP remain continuous after acquisition, with no
reloads or gameplay memory edits. Both room 108 bombs at `(44,17)` and `(36,18)`
open before the detour and reconstruct as `0xF1` on return. An ordinary puff
activates the race bomb; Wheel reaches the chest, stops, and Up opens it. The
single recorded event uses native source `0x088B7288`, mapped to AP location
`3960567`.

This controlled hub fixture changes all four initial Kirby slots to Central
Circle at pixel `(96,80)`, with synthetic authentication and a blank native
battery loaded only at startup. It is explicitly distinct from the configured
production-origin ROM. Mode 2 uses 100% Normal included enemies, passive enemies
included, fixed native statues,
ability gating enabled, and Area Keys off. The emitted Minny option is false,
so Minny remains fixed; all 73 included enemy table writes are Normal. Real
production client item synchronization grants East Hub (`3860401`), Wheel
permission (`3860104`), and Copy Ability Room Access (`3860500`) using simulated
history and an in-process transport. This is not an external server session or
full-campaign acceptance. Calibration attempts are excluded from the passing run.

With only East Hub and Wheel permission, aligned Up remains outside room 970.
Receipt of the room-access item opens entry without adding ability permissions.
File 3 -> mode menu -> Back also preserves all 32,768 save bytes. A separate
controlled, checksummed File 1 fixture starts with all 15 physical hub flags and
legacy WORLD word 18 set. Production receipts of all 15 Hub Connection items
produce mask `0xFFFE`, but without Copy Ability Room Access the runtime clears
the legacy gate, ownership and ability permissions remain zero, and aligned Up
cannot enter 970. That negative has no post-start fixture writes and is not a
played 15-switch campaign.

### Shared combined-build identities

The accepted Wheel, Smash, Mustard, and Olive runs use this patch and configured
production origin, with their separately disclosed initial-entry fixtures:

- Clean input SHA-1: `274b102b6d940f46861a92b4e65f89a51815c12c`.
- `base_patch.bsdiff4` SHA-256:
  `56985f839a63505cdc1bb35c0e7332fb4444f06997f7bdbd5508fb70df380ce5`.
- Patched base ROM SHA-256:
  `0a0495c2f95af91f4433365c7b4ebb31ddd238c14b4e088541d88d0bf2bdb033`.
- Configured production-origin ROM SHA-256:
  `1c0e54360fe1558986896e6e2be6ba53c0c15f5e68e7ae4b478568a09f2879e9`.
- Controlled hub-start ROM SHA-256:
  `ac1d5caead2fc99b49060668f18569a3a722b646a25850a71ff43150f9c8b0df`.
- libmGBA 0.10.5 bridge SHA-256:
  `792606f07fac288d7a2201af1f1c5f9ac578adb4ccfcfa6c1344f93d1ce66055`.

Independent review verifies all 19 native room 970 placements against their
grant-table mappings and verifies that the reconstructed compiled payload matches
the BSDIFF patch. Cached hooks, strict mypy on the six traversal modules, and 27
release-related standalone tests pass. These checks do not establish additional
gameplay routes or turn the follow-up suite's hosting startup timeout into a full
pass. Its isolated retry is tracked above.

### Combined patched-ROM Smash acceptance

The actual fixed Smash statue `0x088D5FE8` at pixel `(312,240)` grants ability 22.
A controller-only carry completes 970 -> 801 -> 190 -> 143 -> 145 -> 146 upper
exit -> 147 -> 148 right arrival -> 149 ordinary floor -> peg -> chest. A second
cold boot reproduces the full successful input sequence with extra read-only
instrumentation. Smash and all 6 HP remain continuous from acquisition at frame
3730 through the chest event at frame 12810.

Smash Up+B cuts the room 143 rope and the lower bomb opens its ladder. Room 146
passes left/above the heavy block. The room 147 timed switch, dash/jump through
the gate, right ladder, bomb `(34,14)`, and lower spike/fireball corridor are
controller-replayed, resolving the timing assumption for this configured carrier.
Smash Down+B clears room 149 floor tiles `(37,13)` and `(38,13)`, then peg
`(35,18)` and its linked barrier. Up opens native chest `0x088BC4A0`, event counter
1, AP `3960569` (Moonlight Mansion 2-20 - Small Chest). Floor tile `(39,13)` and
the alternative underwater F7 ceiling `(42,24)` / `(43,24)` stay unchanged.

This uses the shared hub fixture, build hashes, and mode 2 policy described above:
all 73 included enemy assignments are Normal, Minny is fixed, native statues are
fixed, gating is enabled, and Area Keys are off. Production client synchronization
receives East Hub `3860401`, Smash permission `3860122`, and Copy Ability Room
Access `3860500`. Smash is the only received ability item. No Stone source or
equipment is acquired; this does not imply that starting/ungated Stone permission
was unavailable. All 12 client writes finish before pickup, with no later gameplay
memory edits, state reloads, arbitrary equipment grants, or lost-ability recovery.

East Hub plus Smash permission alone leaves the mirror closed; the room-access
grant opens it without adding other ability permissions. Native File 3 -> mode
menu -> Back preserves all 32,768 save bytes. These are simulated histories and
an in-process transport, not an external server session or full campaign.
Calibration attempts and separate PR #1025 baseline results are not counted as
this carrier pass.

### Remaining acceptance

Before treating this draft as gameplay accepted:

- Expand alternative witnesses where useful; all eleven AP peg targets have
  source-aware rules, but source availability is not guaranteed for every option
  combination. The three non-AP consumable pegs remain audit records.
- Replay the local Wheelie acquisition route on the combined randomized/gated
  ROM and investigate more speed alternatives. The passed statue carrier does
  not validate local enemy retries; the rule retains its fresh-room opportunity
  assumption.
- Establish one-hit and low-health safety for the Mustard 5 routes; all currently
  accepted complete runs take damage. The Normal right-arrival chest remains an
  independent ungated route, also currently witnessed with damage.
- Extend Mini acceptance beyond the controlled 321/134 arrivals where needed,
  including played ingress, the other corridor rooms, locked gating, and modes
  not covered by these fixtures. Olive's passing recovery does not validate
  Droppy or unrelated dropped-ability behavior.
- Keep ordinary-enemy renewal limited to the four documented fuse-source
  viewport loops and the local Wheelie140/Giant Rocky149 loops. Replay those
  static native-code/geometry witnesses on the
  patched ROM; other renewal claims still require evidence. AI occupancy can
  preserve an instance, so a doorway alone is not reset proof.
- Complete target-specific Crash cannon timing and the remaining non-rope Cutter
  dependency review before broadening those claims. That historical checkpoint
  retained Burning and Cutter starts; the current source-backed release does not.
- Verify checks against the final published commit, including hosting. The
  isolated hosting retry does not turn the preceding full run into a clean pass.
  The installed archive matrix above is complete for the earlier tested build,
  not every future change.

Research was pinned to native source commit
`7d969fbce14fdc838d2c1ea01389717fb96c3189`. Published records contain compact
facts and addresses, not full ROMs, save states, or native collision dumps.


## Evidence appendices and ownership

`data/regions/rooms.json` is the owner of executable Mini, Wheel, peg, rope, and
fuse traversal metadata. These appendices retain research provenance, native addresses, census
coverage, and limitations; they are not a second executable graph or a blanket
room gate. Capability-provider policy remains separate from room records.
Historical static-connectivity observations below do not supersede the reviewed
source/carry contracts above. In particular, a static component is not proof of
playable movement, and an untested alternative is not proof of impossibility.

All native references use commit `7d969fbce14fdc838d2c1ea01389717fb96c3189`:

- [Hammer pegs](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/hammer_peg.c).
- [Room loading and collision](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/level.c).
- [Mini collision handling](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/code_080023A4.c).

Coordinates are tile coordinates unless explicitly labeled pixels or native body
bounds. Source-object positions in the source tables are pixels. Transition
rows give the source-door tile and destination spawn tile separately. Hexadecimal
addresses are native record/object addresses, not stable shuffled assignments.

### Mini evidence: all four native 0x59 corridor rooms

Native collision `0x59` / `sub_080088CC` requires actual Mini equipment. These
reviewed routes do not exhaust source alternatives. The controlled 134/321
emulator evidence and its limits are recorded above, not inferred for every row.
Local Minny acquisition means inhaling from the approach to its pocket, not that
Kirby can stand on its spawn tile. The sufficient Olive and Mustard cross-side
witnesses explicitly use dropped-ability recovery; neither establishes recovery
as necessary on every possible route. The cannon is a transition before
acquisition, not a reset or a way to carry Mini between compartments.

| Native room | AP room and gated target | Canonical Minny objects | Additional evidence |
| --- | --- | --- | --- |
| 134 | Olive `ROOM_6_06`, `MINOR_CHEST_SPRAY_PAINT_07` (Ocean Spray) | `0x088CBD88` | Drop Mini, pull movable star-stone `0x088CBD40` with Normal suction, recover Mini; independent upper Goal1. |
| 312 | Mustard `ROOM_4_18` to `ROOM_4_WARP` | `0x088C417C` | Approach is not a transition; ordinary Room19 independent. |
| 321 | Mustard left and `RIGHT_ENTRY` to `ROOM_4_06`; left to right | Left `0x088C4DB4`, right `0x088C4DD8` | Approach is not a transition. Cross-side witness uses dropped-Mini recovery and stepped jumps. Upper Room 9 exits are independent; only the right arrival has a Normal bomb/chest witness. See entry-compartment proof above. |
| 736 | Carrot `ROOM_5_10` to `ROOM_5_CHEST_1` | `0x088D41A0` | Down cannon `0x088B2616` self-transitions before local acquisition; upper Room11 independent. |

### Peg census: 14 pegs in 13 rooms

Eleven AP targets have production source-aware routes. Three non-AP pegs remain
consumable-only evidence and impose no AP exit gate. `0x0F` platforms are
upward-only, not undirected flood-fill connections.

| Census ID | Native room | Peg tile | Coverage |
| --- | --- | --- | --- |
| `peg_149_35_18` | 149 | 35,18 | AP target; production source-aware |
| `peg_204_62_4` | 204 | 62,4 | AP target; production source-aware |
| `peg_218_9_33` | 218 | 9,33 | Non-AP consumables; no exit gate |
| `peg_221_41_12` | 221 | 41,12 | AP target; production source-aware |
| `peg_401_28_30` | 401 | 28,30 | AP target; production source-aware |
| `peg_411_4_3` | 411 | 4,3 | AP target; production source-aware |
| `peg_509_32_2` | 509 | 32,2 | Non-AP consumables; no exit gate |
| `peg_510_7_7` | 510 | 7,7 | AP target; production source-aware |
| `peg_513_4_7` | 513 | 4,7 | AP target; production source-aware |
| `peg_527_18_13` | 527 | 18,13 | AP target; production source-aware |
| `peg_527_56_16` | 527 | 56,16 | AP target; production source-aware |
| `peg_605_12_24` | 605 | 12,24 | AP target; production source-aware |
| `peg_741_27_13` | 741 | 27,13 | Non-AP consumables; no exit gate |
| `peg_816_26_3` | 816 | 26,3 | AP target; production source-aware |

#### `peg_149_35_18`

**Route observations.**

- Arrivals: Source: 148; Record: 0x8882a42; Spawn: 2, 10; Compartment: hillside.
- Target: Kind: small_chest; Object: 0x88bc4a0; Pixel position: 624, 376; Item: 1-Up.
- Peg route: hillside -> star opening -> peg -> lower-right chest pocket.
- Alternate: Obstacle: F7; Tiles: (42,24), (43,24); Approach: underwater from below; Status: Ordinary underwater attacks lack F7-required0x800; environmental large-block/cannon alternatives unverified.
- Source: Object: 0x88bc434; Kind: Giant Rocky; Vanilla: Stone; Before peg: yes.
- Exit gated: no.

**Reviewed carry evidence.**

- Path: 190, 143, 145, 146, 147, 148, 149.
- Required equipment: Smash.
- Copy Ability Room source path: 970, 801, 190.
- Access requirements: independently reachable room 970, `Copy Ability Room Access`,
  an actual eligible room 970 Smash grant, and Smash permission when gating is enabled.
  The carry retains East Hub Connection and the conditional Moonlight Mansion
  Area Key. The old all-15-switch/Central guard is historical and is not an
  alternative grant of room access.
- Qualification: Smash Up+B `0x2000` hits the 143 rope from `(344,216)`; Stone cannot replace Smash on this carry. Room 146 passes left/above the heavy block. The combined controller replay completes room 147's timed route while retaining Smash. Room 149 Down+B calls the Stone attack function and clears the ordinary floor and peg without equipping Stone or dropping Smash. The local Giant Rocky before the peg remains a separate early source.

#### `peg_204_62_4`

AP region: `REGION_PEPPERMINT_PALACE/ROOM_7_12`.

| Direction | Other room | Door tile | Destination spawn | Native record | Other native fields |
| --- | --- | --- | --- | --- | --- |
| In | 203 | 1, 18 | 73, 4 | `0x8887002` | â€” |
| In | 220 | 59, 4 | 3, 8 | `0x888a00a` | â€” |
| In | 227 | 16, 2 | 56, 9 | `0x888a310` | â€” |
| Out | 203 | 73, 3 | 3, 19 | `0x88870d4` | â€” |
| Out | 220 | 1, 7 | 59, 5 | `0x8887160` | â€” |
| Out | 227 | 56, 8 | 18, 3 | `0x888716e` | â€” |
| Out | 227 | 64, 8 | 27, 2 | `0x888717c` | â€” |

**Trigger.**

- Position: 62, 4.
- Record: 0x088870E2.
- Sprite: 0x088BEA24.
- Chain cells: 6.

**Routes.**

- From: any initial incoming port; To: door64,8 to227 spawn27,2; Requires: peg_204_62_4; Status: collision separation and opening verified.
- From: any initial incoming port; To: door56,8 to227 spawn18,3 /exit1,7 to220 /exit73,3 to203; Requires: none; Status: same initial component, movement untested.

**Source observations.**

none; Pengy/Cookin/Chip/BrontoBurt

**Reviewed carry evidence.**

- Path: 190, 801, 290, 210, 227, 204.
- Qualification: Ordinary BoxBoxer combat retaining Stone assumed; native strength/damage eligibility verified. Post-boss Stone puff and210-to227 transition replayed, not full combat. Only alternate227 Happy Notes entrance is peg gated.

#### `peg_218_9_33`

AP region: `REGION_PEPPERMINT_PALACE/ROOM_7_23`.

| Direction | Other room | Door tile | Destination spawn | Native record | Other native fields |
| --- | --- | --- | --- | --- | --- |
| In | 221 | 1, 2 | 15, 3 | `0x888c72c` | Kind 3; Collision 255; Size 14; Flags 2 |
| Out | 200 | 5, 4 | 41, 9 | `0x888c3ce` | Kind 3; Collision 255; Size 14; Flags 2 |

**Compartments.**

- Before opening: Tall upper room, incoming221 at upper-right; peg at bottom of main room(9,33).
- After opening: Six F2 tiles x8..10,y34..35 disappear, opening downward consumable shaft.

**Affected targets.**

- Kind: item; Object: 0x088C1798; Name: Pop Soda; Pixel position: 152, 600.
- Kind: item; Object: 0x088C1774; Name: Meat; Pixel position: 152, 648.
- Kind: item; Object: 0x088C1750; Name: Battery; Pixel position: 152, 696.
- Kind: item; Object: 0x088C172C; Name: 1UP; Pixel position: 152, 744.

**Independent targets.**

- Destination native: 200; Tile: 5, 4; Object: 0x088C1654; Requires: Separate bomb(2,4), not peg.

**Observed sequence.**

- From221 upper-right entrance traverse/fall down main room to peg.
- Press peg to enter treat shaft; ordinary F0 breakable rows at y38,41,44,47 separate its levels.
- Exit200 is at top(5,4), hidden by independent bomb chain at(2,4); that chain replaces ceiling x2..8,y1 with collision29 spikes.

**Source observations.**

- Room: 221; Object: 0x088C192C; Type: GIANT_ROCKY; Pixel position: 816, 160; Ability: Stone; Prerequisite: Super Inhale by holding inhale about48 ticks; carry through221 -> 218. Actual carrying route not emulator-tested.
- Room: 221; Object: 0x088C1A4C; Type: GIANT_ROCKY; Pixel position: 768, 288; Ability: Stone; Prerequisite: Same Super Inhale prerequisite; reach221 exit(1,2) through separate bomb-block route.

**Caveats.**

- No local vanilla peg-solving enemy. Local Pengy/SwordKnight/Sparky/WaddleDoo provide Ice/Sword/Spark/Beam, not the peg attack mask.
- Treat shaft is not a treasure check in native objects; only gate consumable checks if those checks are enabled.
- Strict collision graph supports separation; tile15 semantics and complete movement have not been simulated.

#### `peg_221_41_12`

AP region: `REGION_PEPPERMINT_PALACE/ROOM_7_22`.

| Direction | Other room | Door tile | Destination spawn | Native record | Other native fields |
| --- | --- | --- | --- | --- | --- |
| In | 217 | 1, 3 | 57, 19 | `0x888c04c` | Kind 3; Collision 255; Size 14; Flags 2 |
| In | 225 | 4, 88 | 58, 5 | `0x888dd76` | Kind 3; Collision 255; Size 14; Flags 2 |
| Out | 218 | 1, 2 | 15, 3 | `0x888c72c` | Kind 3; Collision 255; Size 14; Flags 2 |
| Out | 225 | 58, 4 | 6, 89 | `0x888c7ee` | Kind 3; Collision 255; Size 14; Flags 1 |
| Out | 217 | 57, 18 | 3, 4 | `0x888cdc0` | Kind 3; Collision 255; Size 14; Flags 1 |

**Compartments.**

- Before opening: Right main chamber includes incoming225 upper-right and217 lower-right, two Giant Rockys, and bomb-block pocket leading to peg.
- After opening: Winding peg-linked tunnel leads from(41,12) down one tile, left to39, up/left via36 and33, then up to top chest pocket(39,3).

**Affected targets.**

- Kind: chest; Object: 0x088C1ADC; Pixel position: 632, 56; Subtype: 20; Name: Pink Spray (wiki identification).

**Independent targets.**

- Destination native: 225; Tile: 58, 4.
- Destination native: 217; Tile: 57, 18.
- Destination native: 218; Tile: 1, 2; Requires: Separate lower-left bombblock route; not the peg-linked chest tunnel.

**Observed sequence.**

- Reach right chamber from225 spawn(58,5) or217 spawn(57,19).
- Upper GiantRocky at(816,160) lies beside bomb(49,10). Super Inhale provides Stone without needing another ability.
- Trigger bomb(49,10) to clear(47,9),(47,10),(48,10), opening peg approach chamber x41..46,y9..12.
- Activate peg(41,12), then follow newly opened winding chain into chest at(39,3).
- Separate bomb(36,18) starts lower-left progression toward218; it does not unlock the top chest.

**Source observations.**

- Object: 0x088C192C; Type: GIANT_ROCKY; Pixel position: 816, 160; Ability: Stone; Prerequisite: Hold inhale until strength3 Super Inhale (about48 ticks). No multi-Kirby requirement.
- Object: 0x088C1A4C; Type: GIANT_ROCKY; Pixel position: 768, 288; Ability: Stone; Prerequisite: Same. Lower-right chamber, outside peg-linked tunnel.

**Caveats.**

- Point connectivity allowing slopes passable and every OTHER mutation destroyed still leaves top chest disconnected until peg chain removed. This is a useful no-other-bomb-bypass proof under that model, not movement feasibility.
- GiantRocky availability is native-vanilla; ability shuffling/randomization must use resolved source assignment, and Super Inhale reach geometry still needs testing.

**Reviewed carry contract.**

Actual resolved statue slots STATUE:353900 and STATUE:3538FC; independently reachable hub190; explicit hub/area requirements. Renewable randomized statues use documented possible-acquisition assumption.

#### `peg_401_28_30`

AP region: `REGION_CANDY_CONSTELLATION/ROOM_9_06`.

| Direction | Other room | Door tile | Destination spawn | Native record | Other native fields |
| --- | --- | --- | --- | --- | --- |
| In | 406 | 7, 7 | 28, 49 | `0x8894bbc` | Kind 3; Collision 255; Size 14; Flags 2 |
| In | 407 | 41, 12 | 3, 49 | `0x8894f6a` | Kind 3; Collision 255; Size 14; Flags 1 |
| In | 408 | 1, 3 | 28, 4 | `0x88955c4` | Kind 3; Collision 255; Size 14; Flags 2 |
| Out | 408 | 28, 3 | 3, 4 | `0x8893010` | Kind 3; Collision 255; Size 14; Flags 1 |
| Out | 407 | 1, 48 | 41, 13 | `0x88933b4` | Kind 3; Collision 255; Size 14; Flags 2 |
| Out | 406 | 28, 48 | 7, 8 | `0x88933c2` | Kind 3; Collision 255; Size 14; Flags 2 |

**Compartments.**

- Before opening: Upper winding shaft and peg approach, reached from408 top entrance; lower-left407 entrance is separated by bomb shortcut.
- After opening: Peg clears right drop shaft x27..28 y31..45 into lower-right406 door pocket.

**Affected targets.**

- Kind: door; Destination native: 406; Destination ap: REGION_CANDY_CONSTELLATION/ROOM_9_CHEST_1; Tile: 28, 48; Object address: 0x088C5888; Check object: 0x088C644C; Check pixel position: 120, 48; Check subtype: 40; Check name: Sound Player (wiki identification).

**Observed sequence.**

- From408 spawn(28,4), descend winding upper passage; Rockys at(288,152) and(240,312) precede peg.
- Press peg(28,30), descend newly empty right shaft, enter406.
- Bomb(6,40) or(7,40) opens separate lower-left shortcut toward407, not the peg shaft. Bomb(22,23) also has a separate chain.

**Source observations.**

- Object: 0x088C5840; Type: ROCKY; Pixel position: 288, 152; Ability: Stone; Before peg: Upper passage; static map places it before peg from408.
- Object: 0x088C5864; Type: ROCKY; Pixel position: 240, 312; Ability: Stone; Before peg: Upper passage; static map places it before peg from408.

**Caveats.**

- Reverse incoming406 starts in lower-right door pocket, below unpressed shaft. Do not assume it can activate peg from there.
- Incoming407 lower-left access to upper area is bomb-shortcut dependent; abilityless bomb reach/attack angle not emulator-tested.
- Slope-relaxed connectivity overconnects this map; strict tile graph supports shaft separation but cannot prove movement or absence of bypass.

**Reviewed carry contract.**

Actual resolved statue slots STATUE:353900 and STATUE:3538FC; independently reachable hub190; explicit hub/area requirements. Renewable randomized statues use documented possible-acquisition assumption.

#### `peg_411_4_3`

AP region: `REGION_CANDY_CONSTELLATION/ROOM_9_08`.

| Direction | Other room | Door tile | Destination spawn | Native record | Other native fields |
| --- | --- | --- | --- | --- | --- |
| In | 405 | 74, 8 | 3, 8 | `0x8894922` | Kind 3; Collision 255; Size 14; Flags 1 |
| In | 418 | 1, 4 | 28, 7 | `0x8898fda` | Kind 3; Collision 255; Size 14; Flags 2 |
| In | 490 | 14, 5 | 3, 19 | `0x889b438` | Kind 3; Collision 255; Size 14; Flags 1 |
| Out | 418 | 28, 6 | 3, 5 | `0x8895aa8` | Kind 3; Collision 255; Size 14; Flags 1 |
| Out | 405 | 2, 7 | 74, 9 | `0x8895ac8` | Kind 3; Collision 255; Size 14; Flags 2 |
| Out | 490 | 1, 18 | 14, 6 | `0x8895b0c` | Kind 3; Collision 255; Size 14; Flags 2 |

**Compartments.**

- Before opening: Main sloping route connecting490 bottom-left hub entrance and418 right entrance; peg on upper-left ledge. Hidden405 door pocket remains blocked.
- After opening: Peg chain clears x4..5 y4..7 wall and hidden-door tiles x2,y6..7 and x3,y7; changes(2,7) to exit collisionFF.

**Affected targets.**

- Kind: door; Destination native: 405; Destination ap: REGION_CANDY_CONSTELLATION/ROOM_9_09; Tile: 2, 7; Object address: 0x088C6AF0; Door subtype: 1.

**Independent targets.**

- Destination native: 418; Tile: 28, 6; Object: 0x088C6B14.
- Destination native: 490; Tile: 1, 18; Object: 0x088C6B38.

**Observed sequence.**

- Enter from490 or418, climb main slope to peg ledge(4,3).
- Press peg to reveal upper-left405 exit;418 and490 exits are independent of peg.

**Source observations.**

- Room: 490; Object: 0x088C8C3C; Type: ABILITY_STATUE_1; Pixel position: 64, 32; Subtype1: 2; Subtype2: 1; Ability: Laser; Randomized slot: STATUE:3538FE.
- Room: 490; Object: 0x088C8C60; Type: ABILITY_STATUE_4; Pixel position: 200, 32; Subtype1: 2; Subtype2: 0; Ability: Cupid; Randomized slot: STATUE:35390E.

**Caveats.**

- No enemies or ability sources inside411. Neighboring490 hub statues grant Laser and Cupid in vanilla, neither solves peg. Randomized statue assignments may supply a solver; must resolve actual mode/seed and gating.
- Incoming405 spawn(3,8) puts center near blocked hidden-door(2,7). Native initialization may clear entry-adjacent tiles; reverse traversal needs separate engine/emulator verification.

**Reviewed carry contract.**

Actual resolved statue slots STATUE:353900 and STATUE:3538FC; independently reachable hub190; explicit hub/area requirements. Renewable randomized statues use documented possible-acquisition assumption.

#### `peg_509_32_2`

AP region: `REGION_CABBAGE_CAVERN/ROOM_3_10`.

| Direction | Other room | Door tile | Destination spawn | Native record | Other native fields |
| --- | --- | --- | --- | --- | --- |
| In | 127 | 10, 17 | 21, 8 | `0x887a068` | â€” |
| In | 508 | 44, 27 | 4, 19 | `0x889b79e` | â€” |
| In | 510 | 2, 5 | 41, 4 | `0x889bd08` | â€” |
| In | 513 | 8, 2 | 43, 17 | `0x889d458` | â€” |
| Out | 510 | 41, 3 | 4, 6 | `0x889b9ac` | â€” |
| Out | 127 | 19, 7 | 12, 18 | `0x889bac8` | â€” |
| Out | 508 | 2, 18 | 43, 28 | `0x889bbd2` | â€” |

**Trigger.**

- Position: 32, 2.
- Record: 0x0889B940.
- Sprite: 0x088C9080.
- Affected: Battery0x088C9038 and meat0x088C905C pocket only.
- Not affected: all three exits.
- Chain cells: 25.

**Routes.**

- From: any initial incoming port; To: battery/meat pocket; Requires: peg_509_32_2; Status: collision separation verified; movement not emulated.

**Source observations.**

none; only Blippers in room

#### `peg_510_7_7`

AP region: `REGION_CABBAGE_CAVERN/ROOM_3_09`.

| Direction | Other room | Door tile | Destination spawn | Native record | Other native fields |
| --- | --- | --- | --- | --- | --- |
| In | 501 | 14, 3 | 24, 29 | `0x889cd08` | â€” |
| In | 509 | 41, 3 | 4, 6 | `0x889b9ac` | â€” |
| Out | 509 | 2, 5 | 41, 4 | `0x889bd08` | â€” |
| Out | 501 | 24, 28 | 14, 4 | `0x889c694` | â€” |

**Trigger.**

- Position: 7, 7.
- Record: 0x0889BD16.
- Sprite: 0x088C90F0.
- Chain cells: 17.

**Routes.**

- From: 509 via spawn4,6 upper; To: chest0x088C9114 at96,456; Alternatives: (peg_510_7_7) OR (ordinary blocks x24..26,y10..26, then bomb_510_21_28, then metal x8..17,y28); Status: peg shaft and metal barrier verified; alternate route movement untested.
- From: 501 via spawn24,29 lower-right; To: same chest; Alternatives: (bomb_510_21_28, then metal x8..17,y28) OR (bomb_510_21_28, then peg_510_7_7); Status: static action-graph alternatives; traversal untested.
- From: upper; To: exit24,28 to501; Requires: ordinary block shaft, independent of peg; Status: collision route verified, movement untested.

**Source observations.**

- Source: HeavyKnight; Pixel position: 216, 112; Record: 0x088C91A4; Compartment: upper; vanilla Sword does not pound pegs.
- Source: Sparky; Pixel position: 56, 120; Record: 0x088C9180; Compartment: upper-left side pocket; interaction reach unverified.
- Source: UFO; Pixel position: 40, 440; Record: 0x088C91C8; Compartment: lower-left chest chamber; do not use to justify own gate.

**Reviewed carry evidence.**

- Path: 592, 528, 513, 509, 510.
- Qualification: 528 wall puff and upper513 transition retain Stone.513 exit0889D458 ->509spawn43,17;509 exit0889B9AC ->510spawn4,6. Exact13px-body initial-map paths reach upperpeg with no prior peg/rope/metal. ChestUFO cannot bootstrap. Horizontalmetal alternate uncredited, not declared impossible.

#### `peg_513_4_7`

AP region: `REGION_CABBAGE_CAVERN/ROOM_3_13`.

| Direction | Other room | Door tile | Destination spawn | Native record | Other native fields |
| --- | --- | --- | --- | --- | --- |
| In | 501 | 2, 28 | 27, 5 | `0x889cef8` | â€” |
| In | 515 | 10, 2 | 27, 19 | `0x889dad0` | â€” |
| In | 528 | 21, 31 | 4, 6 | `0x889cbac` | â€” |
| Out | 509 | 8, 2 | 43, 17 | `0x889d458` | â€” |
| Out | 501 | 27, 4 | 5, 29 | `0x889d466` | â€” |
| Out | 528 | 2, 5 | 21, 32 | `0x889d474` | â€” |
| Out | 515 | 27, 18 | 12, 3 | `0x889d7e2` | â€” |

**Trigger.**

- Position: 4, 7.
- Record: 0x0889D482.
- Sprite: 0x088C9A30.
- Chain cells: 17.

**Routes.**

- From: 501 spawn27,5 or528 spawn4,6 upper; To: exit27,18 to515 spawn12,3; Requires: peg_513_4_7, then bomb_513_5_18; Status: ordered collision action graph; movement untested.
- From: 515 spawn27,19 lower; To: upper exits; Requires: bomb_513_5_18; Note: opens alternative middle passage without activating peg; Status: optimistic reverse bypass; physical movement untested.
- From: upper; To: 509 exit8,2 /501 exit27,4 /528 exit2,5; Requires: none; Status: same initial collision component.

**Source observations.**

none; upper Haley/Foley/Chip, lower Shooty/Foley

**Reviewed carry evidence.**

- Path: 592, 528, 513.
- Qualification: 528 ordinary wall puff and transition retain Stone.513 upper arrivals4,6/27,5 require peg4,7 then bomb5,18 to descend. Lower arrival27,19 can activate bomb then ascend without peg. Exact native terrain body[-6,-5,6,7] and upward-only0F preserve this directed distinction.

#### `peg_527_18_13`

AP region: `REGION_CABBAGE_CAVERN/ROOM_3_14`.

| Direction | Other room | Door tile | Destination spawn | Native record | Other native fields |
| --- | --- | --- | --- | --- | --- |
| In | 528 | 22, 47 | 3, 17 | `0x889cbc8` | â€” |
| Out | 515 | 69, 5 | 2, 3 | `0x889e62c` | â€” |
| Out | 528 | 1, 16 | 22, 48 | `0x889e820` | â€” |
| Out | 515 | 69, 17 | 5, 24 | `0x889e918` | â€” |

**Trigger.**

- Position: 18, 13.
- Record: 0x0889E736.
- Sprite: 0x088CA7F0.
- Chain cells: 10.

**Routes.**

- From: 528 spawn3,17 main; To: lower exit69,17 to515 spawn5,24; Requires: peg_527_56_16; Status: initial tile separation and peg opening verified.
- From: 528 spawn3,17 main; To: upper exit69,5 to515 spawn2,3; Requires: none; Note: no peg tile separates this port; dynamic gate/movement constraints separate; Status: static component only.
- From: upper-left peg approach; To: Sapphire chest0x088CA520 at224,280; Requires: peg_527_18_13; Status: opened local approach verified.
- From: main lower passage; To: Sapphire; Requires: reach bomb_527_38_8 via timed gate, bomb_527_38_8, peg_527_18_13; Note: Prior bomb_527_24_14 bypass disproved by directed0F platform graph. Dynamic gate timing still not simulated.; Status: directed tile separation verified; full movement/timer untested.

**Source observations.**

- Source: GiantRocky; Pixel position: 752, 288; Record: 0x088CA568; Vanilla: Stone; Status: same optimistic main lower component before second peg; dynamic/movement confirmation pending.

**Timed gate.**

- Switch: 0x088CA544.
- Position: 856, 192.
- Door: 0x088CA6F4.
- Door xy: 808, 144.
- Shared room state slot: 1.
- Switch unk18: 100.
- Door initial bounds: -8, -32, 8, 0.
- Note: time-bounded gate; complete timing route not simulated; door absent from point graph.

**Reviewed carry evidence.**

- Path: 592, 528, 527.
- Sequence: ordinary timed switch route, bomb38,8, peg18,13, Sapphire.
- Qualification: Wiki Room14 documents ordinary run through gate. Native timer100 loads102, gradual4px/7-update door animation, ordinary jump/horizontal movement shared by held Stone,176px clear waypoint route. Vanilla timed traversal assumed; no integrated frame schedule or emulator timing replay. No forced damage or ability drop.

#### `peg_527_56_16`

AP region: `REGION_CABBAGE_CAVERN/ROOM_3_14`.

Shares arrivals, exits, Giant Rocky, timed-gate observations, and route alternatives with `peg_527_18_13` above. Its own trigger and carry qualification follow.

**Trigger.**

- Position: 56, 16.
- Record: 0x0889E89A.
- Sprite: 0x088CA814.
- Chain cells: 2.

**Reviewed carry evidence.**

- Path: 592, 528, 527.
- Qualification: Lower515 entrance only. Carry avoids timed-door and rock-body envelopes. Flight terrain bounds(-6,-5,6,7) fit ordinary16px corridors.515 lower chest separate from common exits and isolated513 arrival.

#### `peg_605_12_24`

**Route observations.**

- Arrivals: Source: 601; Record: 0x88a8ede; Spawn: 4, 25; Compartment: peg_platform / Source: 601; Record: 0x88a8a30; Spawn: 3, 18; Compartment: upper_left; Obstacle to peg: F7 x11..13,y18..19 / Source: 606; Record: 0x88aa2c6; Spawn: 7, 17; Compartment: upper_left; Obstacle to peg: F7 x11..13,y18..19 / Source: 621; Record: 0x88ab6e8; Spawn: 44, 5; Compartment: main_maze; Obstacle to peg: separate bomb triangle with F1 at28,27.
- Target: Kind: activated_door; Record: 0x88aa0c4; Tile: 11, 28; Destination: 610; Spawn: 42, 4; Mutation: 0x88aa0b2; Replacement: FF; Then chest: Object: 0x88cfd64; Pixel position: 552, 96; Subtype: 6; Item: Vitality.
- Peg route: peg platform -> peg -> F2 door tile becomes FF -> Chest1 arrival chamber -> Vitality.
- Alternate: No alternative incoming transition to610 found; separate bomb triangle not linked to peg chain.
- Local peg solver: none in inspected vanilla objects; not exhaustive remote ability search.
- Other exit gated: no.

**Reviewed carry evidence.**

- Path: 592, 690, 611, 601, 605.
- Qualification: 601 upper exit112,3. Ordinary puff activates601 bomb5,8. Standing untransformed on0x74 objects088CF8DC and088CFA8C removes605 F7 layers12,18/19 after native delay; no ability drop.

#### `peg_741_27_13`

**Route observations.**

- Arrivals: Source: 712; Record: 0x8884640; Spawn: 4, 39; Compartment: main_bottom / Source: 742; Record: 0x888554e; Spawn: 11, 8; Compartment: isolated_top_annex.
- Target: Kind: loose_1up; Object: 0x88bd984; Pixel position: 440, 264.
- Peg route: main_bottom -> bomb-chain ascents -> upper corridor -> peg -> optional 1-Up cage.
- Annex can reach peg: no.
- Source: Object: 0x88bda80; Kind: Bonkers; Vanilla: Hammer; Before peg: conditional; Obstacle: F5 wall x14..20,y22..23 except17,23; Status: geometry verified; exact playable entry/attack route untested.
- Exit gated: no.

#### `peg_816_26_3`

**Route observations.**

- Arrivals: Source: 802; Records: 0x88a72ba, 0x88a72c8, 0x88a72d6, 0x88a72e4, 0x88a72f2, 0x88a7300; Spawn: 2, 4; Compartment: water_inlet_to_upper_hall.
- Target: Kind: big_chest; Object: 0x88ce86c; Pixel position: 632, 240; Item: Olive Ocean Map.
- Peg route: upper hall -> peg shaft -> lower map pocket.
- Alternate: Obstacle: bomb_wall; Bounds: 44, 12, 50, 13; Bomb: 44, 13; Status: remote/piercing activation from far side or above untested; no ordinary walking bypass.
- Source: Object: 0x88ce8fc; Kind: Bonkers; Vanilla: Hammer; Before peg: yes; Note: normal fight/arena behavior applies.
- Exit gated: no.

**Reviewed carry contract.**

592 ->801 ->191 ->890 ->811 ->830 ->810 ->802 ->816; resolved Stone from either592 regular statue. Avoids rock bodies and opposing currents; ordinary underwater puff activates811/802 bombs while retainingStone. Requires CabbageWest/East andOliveHub connections, Cabbage/OliveAreaKeys whenenabled. No full emulator carry replay claimed.


### Wheel evidence: Rainbow108 race and source carry

The reviewed `wheel_race` provider is Wheel. Its sufficiency is witnessed;
alternatives have not been exhaustively excluded. The enforced AP segment is
`REGION_RAINBOW_ROUTE/ROOM_1_06_LOWER_MID` to
`REGION_RAINBOW_ROUTE/ROOM_1_06_LOWER_CHEST`.

| Evidence point | Native detail |
| --- | --- |
| Race arrival | Room110 return to room108 spawn `(34,19)` |
| Race trigger | Bomb `(36,18)` |
| Target | Chest at pixel `(40,216)` |
| Local source | Room140, `WHEELIE`, stationary subtype2 object `0x088B765C`, pixel `(680,56)` |
| Source approach/departure | Ordinary flight; exit `(1,8)` to room108 spawn `(58,12)`; original-template retry is proved by the local Wheelie loop below |
| Independent opening | In108 an ordinary air puff activates bomb `(44,17)` while retaining equipment, opening the right wall |
| Detour | Activate `(36,18)`; after mutation use door `(34,18)` to110, to the right of the final closing pillars |
| Return | Room110 door `(7,7)` to108 spawn `(34,19)` with Wheel |

The consolidated uninterrupted native replay began Normal at room140 hub arrival
`(43,9)`, acquired the actual Wheelie, traversed108 right/bomb44/bomb36, entered110,
returned to fresh108, and collected the chest. Every post-copy checkpoint retained
Wheel and6HP. No RAM edits or reloads occurred after initial140 setup. This is a
fixed vanilla replay, not acceptance of every randomized grant or the patched ROM.

Only110 ->108 requires the explicit fresh, unoccupied room-instance opportunity.
Native `level.c:318-358` rebuilds original collision with `RLUnCompWram` for a fresh
room slot; `kirby.c` transitions retain non-Mini equipment. Ordinary single-player
play is assumed able to obtain the opportunity. It is not guaranteed on every door
use, under adversarial AI occupancy, or within bounded attempts; unlimited phone
battery is not assumed.

### Local Wheelie and Giant Rocky retries

Two additional original-template sources have reviewed local renewal evidence.
This supersedes the earlier single-use classification of Wheelie140; it does not
extend to other Wheelies, Giant Rockys, or ordinary enemies by type alone.

| Source | Native object and placement | Exact retreat, in pixels |
| --- | --- | --- |
| Wheelie140, stationary variant2 | `0x088B765C`, `(680,56)` | `(672,40)` -> `(624,40)` -> `(624,56)` -> `(400,56)`; reverse to return |
| Giant Rocky149, stationary variant2 | `0x088BC434`, `(344,64)` | `(328,56)` -> `(328,40)` -> `(96,40)`; reverse to return |

Both paths fit the native ordinary-body bounds `(-6,-5,+6,+7)` entirely through
air. After consuming the source, discard an unsuitable grant, retreat along the
listed route, and return. `ObjectDestroy` clears the original template's spawn
bit for both objects: neither is a retained type. Giant Rocky's `unk22=1`
kill-counter bookkeeping does not preserve that spawn bit. The camera-edge
spawner can recreate the original source template on return.

The original template scope/index is `(0,5)` for Wheelie and `(0,17)` for Giant
Rocky; both have `unk5=0`, selecting ordinary viewport spawning. `ObjectDestroy`
passes `sb=0` because neither type belongs to `ObjType38To52` or its exceptions.
`sub_08001678` clears the original bit; `InitObject` saves the template pointer
and reoccupies that same bit when the source is recreated.

Camera following targets Kirby's x minus120, subject to room bounds. Let
`q = floor(viewportX / 16)`. The full horizontal spawn window is `[q-3,q+19)`;
the rightward edge spawns column `q+17`. Settle the camera at the retreat point
before returning:

| Source | Settled retreat camera | Why the template is outside | Return edge |
| --- | --- | --- | --- |
| Wheelie140 | Kirby x400; viewport x280; q17 | Window `[14,36)` excludes source column42 | q25 / viewport x400 spawns column42 |
| Giant Rocky149 | Kirby x96; viewport clamps to0; q0 | Window `[-3,19)` excludes source column21 | q4 / viewport x64 spawns column21 |

Source rows3 and4 remain inside the vertical spawning band. Every pixel of each
listed path keeps all ordinary-body collision cells at `0x00`. Giant Rocky's
corrected approach stays left of its crown pillar: Kirby's body right edge334
is clear of the Giant's left edge336, with `0x0D` support below. The reviewed
retreat/return is a500-pixel route. Use ordinary strength3 Super Inhale for Giant
Rocky; no frame-perfect acquisition claim is needed.

This is a single-human-player witness. Another human player's viewport can
suppress spawning; CPU presence is irrelevant to that viewport check. These
loops require no room reset, AI vacancy, phone battery, helper, ability, or
barrier clearing. They prove original-template retry from native code and
geometry, **not an emulator replay**. They do not renew another consumed source,
preserve a transient opening across a reset, or establish a fresh room instance.
The local source remains before its own obstacle, with its existing acquisition
and target-route requirements unchanged.

For live randomization, a retry is useful only with an unlocked eligible output
of positive probability. Repeated eligible draws use a conditional eventual-draw
fairness assumption, never a bounded-attempt guarantee. Empty output pools and
100% Normal included-enemy settings still fail these local source witnesses.
Fixed ordinary-hub statues cannot supply the missing Wheel/Smash grants. The
separate room 970 statues can supply them only with room access and, when gating is
enabled, the relevant ability permission; their availability does not change
these local enemy witnesses. If
no reviewed source succeeds, full accessibility rejects the seed early. Minimal
may defer that error, but cannot emit a seed with unreachable enabled checks: the
final all-check audit rejects it before output. Static assignments and excluded categories must retain
their actual grants.

Pinned native evidence, commit `7d969fbce14fdc838d2c1ea01389717fb96c3189`:

- [Wheelie stationary variant and initialization](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/wheelie.c#L34-L80).
- [Giant Rocky initialization](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/giant_rocky.c#L33-L57) and [stationary variant](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/giant_rocky.c#L270-L280).
- [`ObjectDestroy` lifetime handling](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/object.c#L325-L400) and [`InitObject` template identity](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/object.c#L2026-L2098).
- [Original spawn-bit clearing](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/code_080023A4.c#L685-L710), [camera following](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/code_080023A4.c#L1689-L1720), [viewport scan](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/code_080023A4.c#L5872-L5997), and [edge spawning](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/code_080023A4.c#L6056-L6097).
- [Kirby ordinary-body bounds](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/kirby.c#L21-L35).

#### Ability-room fallback provenance

These native source and carrier records accompany the current item-gated room
970 contract above. They do not establish access without the item; the combined
Wheel replay is recorded separately in the acceptance section. The prior
all-switch access hypothesis is retained below as history, not as an alternative
current gate.

| Evidence point | Native detail |
| --- | --- |
| Entry to970 | From801 tile `(3,4)`, record `0x088730E0`, spawn `(15,6)` |
| Return from970 | Record `0x088B4AB8`, tile `(14,5)`, to801 spawn `(5,4)` |
| Sources | All19 regular statue slots `3538FC..35390E`; each has an ordinary-flight roundtrip from entry to return door |
|801 carrier segment | 28-node two-high air route to exit `0x08873428`, tile `(24,12)`, then190 spawn `(9,3)` |
|190 carrier segment | 14-node two-high air/door route avoids statue envelopes, to exit `0x08879CE4`, tile `(1,8)`, then140 spawn `(43,9)` |
| Complete carry |970 ->801 ->190 ->140 ->108 ->110 ->108; requires Rainbow Route East - Hub Connection |

In the native game, all15 physical hub-switch activations populate WORLD
slots1..15 and `WorldMapUnlockMain` sets slot18. The AP intercept bypasses that
normal callback, which invalidated the earlier physical-switch reachability
guard. The merged AP gate now checks `Copy Ability Room Access` instead; all 15
switches and legacy word 18 remain insufficient. Actual statue assignments and
ability unlocks apply after entry. There is no forced pickup, obstacle, or ability
change along the reviewed 970-to-140 carrier geometry. Permanent statues
can be retouched after dropping unwanted results. Positive-support repeated
acquisition relies on fairness, not a finite guarantee; enemy no-ability weight
does not remove statue outputs.

#### Native Normal successes that must not become Wheel gates

- Room424 Music Scores: Normal puff and run collected the chest in an isolated replay.
- Room708: from743 return spawn `(30,29)`, Normal puff and run entered the distinct
  secret exit `(22,28)` to743 spawn `(6,3)`. Other arrivals are not inferred.


## Rope traversal evidence

Six AP rope targets have 17 sufficient source-aware witness graphs, including
permanent statue carriers for all six. Executable bindings live in the owning
room records; the following evidence records are not a second production catalog.
Only the named target edge or check is gated. The seven non-AP platforms remain
ungated, and unrelated exits and checks keep their independent routes.

Native evidence is pinned to commit `7d969fbce14fdc838d2c1ea01389717fb96c3189`:

- [Star-platform attack and collision removal](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/star_platform.c).
- [Ability attack objects](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/code_0806F780.c).
- [Kirby attack dispatch](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/kirby.c).
- [Permanent statue grants](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/ability_objects.c).
- [Standing-triggered crumble objects](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/asm/object_spawner.s).

### Reliable rope providers

Native star_platform.c:sub_0811FB54 requires attack flag 0x2000. It removes the supporting
collision tiles at platform(x,y) and(x-1,y), then clears the rope rectangle. The following
five reusable providers set that flag:

- Cutter: code_0806F780.c:sub_08078EFC assigns 0x20002003; kirby.c dispatch15371-15372.
- Sword: sub_0807529C assigns 0x30002003; kirby.c23707.
- Cupid: sub_08081864 assigns 0x2003; kirby.c20709,20713,20715.
- Smash: UpCutter sub_08080E9C assigns 0x30002003; Smash action sub_08069270 at
  kirby.c21200.
- Master: sub_08075DB0 assigns 0x30007103; kirby.c23710.

Magic's Meta Knight outcome also sets 0x2000 in sub_080838DC/sub_08083B04, but is not a
reusable rope provider. A separate visible-selection witness supports only the exact
[Mustard Room15 switch route](../dev-docs/mustard-room15-magic-source-witness.md), not rope credit. Ordinary Stone does not cut ropes. An ability permission item is
never equipment. Room transitions do not prove an instance reset: AI occupancy may preserve
the instance. The one-way carrier records claim no source replenishment or retained rope
opening across transitions.

### Complete platform census

All 983 native room slots were scanned. The 286 populated rooms contain 3476 decoded
objects. There are 13 OBJ_STAR_PLATFORM objects in 8 rooms. Six platforms gate AP targets.
The other seven affect only loose consumables or pits and must not receive AP target rules:

- Room143 left:0x088B7BC4(176,224), loose Maxim Tomato.
- Room147:0x088BBDAC(224,144), loose1Up.
- Room211:0x088BF90C(288,256), loose Maxim Tomato.
- Room553:0x088CC3C8(304,192), loose soda;0x088CC3EC(720,256) and0x088CC434(768,256),
  platforms beside a loose1Up;0x088CC650(1024,208), pit floor.

### rope_143_23_14

Owner: Rainbow Route Room42. Bind only main -> ROOM_1_42_CUT. Right
platform0x088B7B34(368,224) clears floor tiles22/23,row14. Sir Kibble0x088B7C0C(152,88) is
reachable from141 spawn(3,3) and190 spawn(3,19) before the rope. Heavy
Knight0x088B7B58(432,288) is below the rope and cannot bootstrap it.

After cutting, lower bomb(29,18) opens the ascent to145. The reverse arrival from145
at(27,5) approaches upper bomb(24,4) without cutting; preserve the separate reverse rule.
The left platform only hides a loose Tomato.

The 190 hub statues are renewable sources under their actual assignments; their native
Stone/Beam do not cut. Hub 194 has fixed Cutter statue0x088B8528, key STATUE:35390D, and
Laser0x088B854C, key3538FE. The carrier194->801->190->143 requires Rainbow Route South and
East hub connections. Ordinary hub travel retains all five providers. This supplies a
fixed-statue witness even when all included enemies return Normal, without relying on
Copy Ability Room access.

Source: https://wikirby.com/wiki/Rainbow_Route_-_Room_42

### rope_217_6_5

Owner: Peppermint Room20. Bind only exit ROOM_7_21/native223. Platform0x088C1534(96,80)
clears tiles5/6,row5. Exits to221/Room22 and216/Room19 remain independent. Arrivals from216
at(14,9) and221 at(3,4) approach the same rope. Local Flamer0x088C15C4(120,16) qualifies
only if its actual grant cuts; native Burning does not.

Independent216/Room19 has Sir Kibble0x088C13EC(320,128), reachable from212 spawn(44,18)
or217 spawn(3,19). Carry through216 door(1,18) to217 spawn(14,9). The291 hub statue carrier
is291->215 spawn(27,29)->212 spawn(74,9)->216 spawn(44,18)->217 spawn(14,9), using ordinary
F0 puffs and avoiding the metal chest branch. The same ordinary route was already reviewed
for the Stone carrier to221.

For excluded fixed statues,290/Hub1 has Cupid0x088C0EF4(160,48), key STATUE:35390E. Carry
through291 and follow the same route. This requires Peppermint West hub connection. East
connection is unnecessary when290 itself is the independently reachable start. All five
providers retain ordinary movement here.

Source: https://wikirby.com/wiki/Peppermint_Palace_-_Room_20

### rope_227_20_12

Owner: Peppermint Room6. Bind only MINOR_CHEST_PEPPERMINT_PALACE_7_06_OBJECT_03,
chest0x088C02B4(368,296), location3960591, native1Up. Platform0x088C02D8(320,192) clears
tiles19/20,row12. Happy Notes and the other Tomato chest are not rope-gated.

All arrivals can approach this rope. Pengy0x088C0224(368,184) is a pre-cut source under its
actual assignment. Do not assume Pengy0x088C0200(608,136), by the separate Happy Notes
arrival, is globally available.

The fixed Sword witness starts independently at290/Hub1. Take290 door(1,8)->210
spawn(27,49), climb to Sword Knight0x088BF658(112,464), then use210 LOWER door(1,23)->227
spawn(58,17). Native ordinary-body connectivity reaches the source and this lower exit
without bombs. This route never uses Box Boxer's upper door(1,14)->227 spawn(59,10). The290
Cupid statue can instead supply a retained ability through this same lower arrival. All five
providers can follow the ordinary carrier.

Source: https://wikirby.com/wiki/Peppermint_Palace_-_Room_6

### rope_228_11_21

Owner: Peppermint Room9. Bind only MINOR_CHEST_PEPPERMINT_PALACE_7_09_OBJECT_02,
chest0x088C04D8(240,456), location3960592, native Sparerib. Platform0x088C0520(176,336)
clears tiles10/11,row21. The upper-right metal1Up chest0x088C046C and all three Room10 doors
are separate routes.

From205 spawn(26,29), pixel(408,456), climb the central ladder at x18, reach the right
ladder at x23, and activate bomb(22,15) from the right. Return through the gap at
x17,rows19/20, inhale Sir Kibble0x088C0424(320,328), move left to the rope at(176,312), cut,
and descend to the chest. Do not activate bomb(17,23) first: it closes the gap at
x17,rows19/20 and can seal this route.

With only bomb(22,15) activated, the ordinary body reaches the Kibble and rope but not the
chest. After the rope cut, the chest becomes reachable. Path to source:
(408,456)->(313,456)->(313,392)->(374,392)->(374,328)->(320,328). The rope approach
continues through(176,328)->(176,312). After cutting, descend at x185 to y437, then move
to(240,456).

Permanent source carrier:290 Cupid statue ->210 lower arrival(27,49), climb to upper
exit(15,2)->205 spawn(10,19)->205 exit(44,2)->228 spawn(26,29). The210 route avoids Box
Boxer. The205 route needs no bomb, metal, or copying: ordinary-body connectivity
reaches(712,40) from(152,296). All five providers retain flight and swimming. At228 use the
same right-hand bomb approach above, without replacing the carried ability.

Source: https://wikirby.com/wiki/Peppermint_Palace_-_Room_9

### rope_316_35_5

Owner: Mustard Room10. Bind only MINOR_CHEST_MUSTARD_MOUNTAIN_4_10_OBJECT_01,
chest0x088C4798(608,136), location3960597, native Energy Drink. Platform0x088C4870(560,80)
clears tiles34/35,row5.

Enter from308 at(60,4), pass above the rope to Sir Kibble0x088C47BC(168,104), acquire, and
backtrack east to cut. Normal movement reaches the source and main exit before cutting, but
not the chest. Pre-cut Wheelie0x088C4774(808,120) qualifies only if its actual grant cuts;
native Wheel does not. Exit322 behind ordinary F0 blocks is not rope-gated.

Permanent carrier:194 Cutter statue ->801->590->390->304 bottom arrival(28,39)->321 LEFT
arrival(2,22)->321 upper-left exit(14,2)->308 LEFT bottom arrival(39,29)->316. Require
Rainbow Route South, Rainbow Route North, and Mustard hub connections, plus Mustard Area Key
when enabled. Native normal-body paths prove304 ascent and321 left-to-upper travel without
Mini, bombs, or ability replacement.

At308 the initial chamber reaches(604,456), immediately right of bomb(36,28). Puff left to
open that chain. This single bomb suffices to reach the upper316 exit; no other bomb or
crumble block is required. Path after activation:
(616,456)->(422,456)->(422,440)->(406,440)->(406,424)->(390,424)->(390,408)->(358,408)->(358,392)->(329,392)->(329,344)->(377,344)->(377,264)->(425,264)->(425,248)->(441,248)->(441,200)->(470,200)->(470,56)->(424,56).
All five providers retain ordinary flight and puffing.

Source: https://wikirby.com/wiki/Mustard_Mountain_-_Room_10 (oldid574589)

### rope_553_26_7

Owner: Olive Room16. Bind only MINOR_CHEST_OLIVE_OCEAN_6_16, chest0x088CC458(1088,136). Of
five platforms,0x088CC410(416,112) opens the lower corridor to this chest, removing floor
tiles25/26,row7. Main exit832 at(73,4) remains reachable after upper bomb(50,4) without any
rope cut. Native geometry with only that bomb has exit reachable/chest unreachable; cutting
the416 rope makes the chest reachable.

Local Sir Kibble0x088CC4A0(192,104) is enclosed. No successful inhalation witness is
established, so it is excluded. A narrow left-side emulator test failed; that is not proof
that every possible approach fails. Kibble0x088CC4E8(528,184) is behind the target rope and
cannot bootstrap it.

The conservative enemy carrier starts independently at890/Olive Hub ->811 spawn(4,4). Inhale
Sword Knight0x088CC904(200,40). Ordinary F0 clearing and an underwater puff at bomb(25,10),
from reachable(392,168), open the passage east and up. Clear Mirra at811 door(51,3)->551
spawn(3,4). Follow the ordinary551 path to door(73,18)->815 spawn(5,9).

In815, stand on crumble objects0x088CCDB0/0x088CCDD4 at(40/24,152). Native
object_spawner.s:sub_0811BF24 detects standing and triggers collapse without an ability
attack. Replacement records clear collision tiles1/2,row9. Swim through the lower bypass,
then upward through0x0F platforms37/38,row9. Exact body path:
(72,136)->(41,136)->(41,197)->(57,197)->(57,213)->(201,213)->(201,245)->(617,245)->(617,136)->(648,136).
No heavy block, timed gate, or upper bomb puzzle is used. Door(40,8)->553 spawn(3,4). Sword
is retained throughout.

Renewable fixed alternative:191/Cabbage East Hub Sword statue0x088CB1C4, key STATUE:35390C,
then191->890 through the Olive Hub Connection. Require Olive Area Key when enabled. The890
Bomb/Parasol statues qualify only under actual cutting assignments. All five providers can
use this ordinary swimming, puffing, and Mirra carrier. Ordinary enemy avoidance/combat is
assumed. This is native geometry/body evidence, not a complete emulator jump-physics replay.

Sources: https://wikirby.com/wiki/Olive_Ocean_-_Room_16 and
https://wikirby.com/wiki/Olive_Ocean_-_Chest_1 (oldid459081 explicitly describes the lower
underwater bypass).

### rope-hub-sources

Hubs 190/194/191/290/291/890 contain accessible permanent statues. Each physical object
address is a stable source identity. Its source_key is the native grant-table address from
enemy_ability_runtime_patch._STATUE_TABLES. Statues can be retouched without consumption,
per ability_objects.c:sub_080AA588. Random statue pools ignore enemy Normal weight.

SourcePolicy must resolve excluded categories' native grants, static shuffle writes, and
live output pools. Gateable abilities still need permission items. For live random statues,
drop an unwanted result and retouch before departure. Eventual positive-support acquisition
is an explicit fairness assumption, not a finite-attempt guarantee. No rope enemy is marked
renewable merely because it might respawn; the separately documented fuse retry loops do not
confer renewal on rope witnesses. No route relies on copying a replacement ability or
recovering a randomly changed dropped star. Master is not assumed to appear in ordinary
enemy pools.

### Rope regression contract and Cutter coverage limits

Test all six bindings and all seven non-AP exclusions; exact five providers; Stone and
Normal negatives; permission without a source; a source behind its own rope; actual shuffle
assignment; fixed excluded categories; 100%Normal enemies with permanent statue
alternatives; live statue retries only when an eligible cutting output is unlocked; negative
pools without a cutter; and missing hub/Area Key guards. Negative cases must leave unrelated
exits and chests available. Preserve227 lower arrival versus Box Boxer upper arrival,321
left versus right arrival, and228 bomb order. A room transition must not renew a consumed
source without explicit lifetime evidence.

Cutter now enters the progression pool when Ability Gating is on. The structural non-rope
inventory contains 35 small buttons across 24 rooms and 403 F1 bomb tiles across 125 rooms, including unused/test rooms. Explicit
far-switch placeholders are310 Mustard major chest,533 Mustard Room15->16, and209 Peppermint
major chest. Button rooms
are147,177,209,228,310,404,426,427,511,527,533,608,610,707,708,712,720,742,804,815,825,831,911,915.

No unique Cutter-only obstacle type check was found, but range and projectile steering can
matter even when attacks share eligibility. Absence of a type check does not establish a
geometric alternative. Normal Kirby's air puff can trigger ordinary blocks, F1 bomb chains
and small switches when its horizontal, terrain-colliding hitbox reaches them (see the
[pinned native air-puff implementation](https://github.com/jiangzhengwenjz/katam/blob/1197474f80e5de282fbedcd0025ebfa61f61a764/src/code_0806F780.c#L2093-L2180)). This change
retains the existing far-switch predicates: successful seed generation validates the AP
model, not every physical switch or projectile trajectory. No new Cutter-only geometric
requirement is asserted. Rope access continues to require a reviewed source and an unlocked
cutting ability; ownership alone is not equipment.


## Fuse cannon traversal evidence

The complete native object inventory contains four fuse cannons and four fuse ends, in
native rooms 126, 323, 502, and 827. The 57 rotating eight-direction cannons are a different
object type and do not belong to this capability. This historical mechanism audit did not
change starting abilities; the current source-backed release precollects only Beam.

### Native attack capability

The fuse accepts the heat attack bit and the Crash attack bit. Eight providers can ignite
it: Fire, Burning, Bomb, Laser, UFO, Master, Hammer Flip, and Crash. Ordinary Hammer swings are not the
relevant Hammer move. Missile explosions, ordinary Sword, Smash, Fighter, and a Foley
exploding on its own are not substitutes. A copied Bomb ability is a valid provider; the
Foley enemy's own explosion has a different attack mask.

The production cannon witnesses currently admit the seven non-Crash providers. Crash
ignition is proven, but its per-target traversal timing is not yet certified. Its long
animation freezes same-room objects, apart from a short hit-processing interval, so
animation length alone does not disqualify it. Nevertheless, attack-mask compatibility is
not sufficient evidence that Kirby can finish the animation and enter each cannon in time.
Crash must remain excluded from these traversal witnesses until that input/position check is
completed. Any future Crash witness must consume Crash and leave Kirby Normal.

A fuse is not a permanent opened switch. Its native state machine burns, signals the cannon,
pauses, and regrows. Each route abstracts an available cannon with a current fuse
signal followed by Kirby's transition. Clearing an occupied cannon may precede
that signal; neither ignition nor occupant clearance grants persistent opened
credit. The abstraction does not promise a single ignition.

### Occupied fuse cannons

Room 126's fuse cannon is unoccupied. The other three have Jack occupants:

| Native room | Jack object | Cannon object | Fire / occupancy state slots |
| --- | --- | --- | --- |
| 323 | `0x088C50B8` | `0x088C5124` | 1 / 2 |
| 827 | `0x088CD6EC` | `0x088CD65C` | 2 / 3 |
| 502 | `0x088D1944` | `0x088D1608` | 1 / 2 |

An exposed Jack clears protection flag `0x200`. Normal airshot damage 2 against
Jack's HP 2, with zero relevant adjustments, can kill it; no extra ability gate
or forced damage to Kirby is required by this clearing alternative. Alternatively,
firing an occupied cannon ejects Jack and consumes the current fuse signal, but
not Kirby's equipped ability or HP. Let the fuse regrow and relight it with the
same one of the seven credited reusable providers; source reacquisition is not
required.

Ejection leaves Jack's HP positive. It must not be conflated with killing Jack,
whose destruction can retain its original spawn bit. No permanent cleared-cannon
state is credited, and no exactly-two-ignitions guarantee is claimed across
viewport changes or room resets. Crash remains excluded from production cannon
witnesses. This is native-code evidence, not a new emulator replay or a claim
that Kirby must take damage.

Pinned evidence at native commit `7d969fbce14fdc838d2c1ea01389717fb96c3189`:

- [Jack initialization](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/jack.c#L36-L65), [exposure](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/jack.c#L247-L263), and [ejection behavior](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/jack.c#L307-L330).
- [Cannon occupancy handling](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/asm/kirby_cannon.s#L179-L242) and [firing state](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/asm/kirby_cannon.s#L545-L656).
- [Fuse regrowth and signaling](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/cannon_fuse.c#L506-L611).
- [Kirby cannon entry](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/kirby.c#L11153-L11268), [airshot dispatch](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/kirby.c#L8812-L8835), and [airshot attack object](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/code_0806F780.c#L2090-L2126).
- [Object damage](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/object.c#L634-L703) and [destruction/spawn-state handling](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/object.c#L325-L375).
- [WiKirby: Jack](https://wikirby.com/wiki/Jack).

### The four directed transitions

- Rainbow Route Room 32 (126) launches to the left part of Room 33 (570), arriving at the
  upper entrance. There is no ordinary exit from 126. Its local Hot Head is a reachable Fire
  source. An independent carrier can start at Rainbow Hub 2 (194), take its Laser statue or
  a reviewed randomized Burning grant, and travel through Room 14 (137), Room 31 (136), and
  Room 32. The left-side path through 137 does not require crossing its central bottomless
  pool. A second carrier starts at Cabbage Hub 3 (592) with its native Burning statue, then
  uses the Cabbage West and Rainbow South hub connections before following the same route.
  Inventory permission alone is not a source.
- Mustard Mountain Room 13 (323) launches to the left half of Room 14 (300). Room 13 has a
  full-height wall: the secret upper door in Room 12 (315) enters the cannon side, while the
  ordinary lower door enters the Batafire side. Batafire cannot provide an ability across
  that wall. The cannon-side Hot Head is a reachable Fire source. The ordinary right-hand
  ascent and door still reach the right half of Room 14 without lighting the fuse. Both
  halves of Room 14 have doors to the same boss room (324), and both count for the same
  room-visit check. The cannon half adds no exclusive check, but its statues must not be
  credited on the other side. Retaining an imported ability through the Room 12
  Heave-Ho/lava-wall setup remains unproved; no such carrier is claimed.
- Radish Ruins Room 16 (502) launches to Room 17 (525). Its ordinary door also reaches 525
  and remains ungated by fuse capability. The local Hot Head is a valid source. This cannon
  is an optional shortcut, not a mandatory progression requirement.
- Olive Ocean Room 7 (827) launches to the upper surface of Room 5 (133). That arrival
  reaches Room 6 (134), not the isolated Cookin pocket with the door back to Room 7. It must
  not inherit the old logical return-to-Room-7 edge. Native Room 5 has no outgoing door back
  to Room 4 or to Room 23. Room 7's ordinary exit to Room 8 (828) remains available without
  a fuse. Two upper Foleys are reachable Bomb sources after opening the main chamber. A
  carrier can independently start at the Olive hub (890), use its Bomb statue or a reviewed
  randomized Burning grant, swim the lower maze of Room 9 (823), cross Room 8, and enter
  Room 7 from below. Water-gun block clearing preserves the carried Bomb/Burning. A Burning
  carrier from Cabbage Hub 3 is also sufficient when its three hub-connection guards and the
  Cabbage/Olive area-key guards are satisfied.

### Repetition and live randomization

The reviewed ordinary-enemy retries use the actual source templates, not an assumed global
copy source:

- In 126, swallow the upper Hot Head, discard an unsuitable result, descend the cleared
  shaft to the bottom chamber, and fly back up.
- In the left compartment of 323, swallow its Hot Head, discard an unsuitable result, fly up
  the open left shaft, and return without crossing the wall.
- In 502, swallow its Hot Head, retreat left through the main room until its template is
  outside the spawn viewport, and return.
- In 827, after Boxy is defeated, swallow either upper Foley, descend to the cleared main
  chamber, and return.

Ordinary Hot Head and Foley destruction clears their template's spawn bit, and viewport-edge
spawning can create them again. These loops do not require the cannon being proved. They are
static native-code and geometry proofs, not emulator replays. Boxy and Batafire are finite
defeated-midboss sources and are not covered by that repeatability claim.

A documented retry is useful only when the eligible copy pool is nonempty and its
probability is positive. At enemy no-ability weight 100, a selected randomized ordinary
enemy grants no ability; repetition must not make it pass. Included live-random statues use
a separate allowed mask and do not inherit the enemy no-ability weight. Excluded categories
retain their native grants. Native hub 190 statues are Stone and Beam, not Burning; native
Burning is at hub 592. Source gating and the actual assignment policy still apply to every
witness.

Cross-room carriers claim ability retention only. They do not claim that every room change
creates a fresh room instance: AI occupancy can preserve a room. The planner should discard
unproved opened credit without renewing consumed source identities.

### Regression coverage

Test the exact provider set and rejection of the named nonproviders; ensure every cannon
witness rejects inventory-only access and permanent opened-fuse metadata. Test local-source
assignments with ability gating enabled and disabled; deterministic and live-random modes;
included and excluded enemy/statue categories; default no-ability weighting; and weight 100.
A renewable source with an empty pool must fail.

For the room graph, test both Mustard entrances, separation of its local sources and
destination statues, both ordinary progression bypasses, and the Olive cannon's upper
arrival leading only to Room 6. Require the correct independent hub access, hub-connection
items, and inter-area keys for remote carriers. Optional Mustard/Radish cannon failure must
not invalidate their ordinary routes or shared checks. The original fuse audit did not change
Burning starts; the current release separately validates its removal.

Coverage is exhaustive for the four native fuse placements and their direct destinations.
The carrier list is a reviewed sufficient set, not a claim to enumerate every possible
imported ability route. Remaining gaps are Crash's target-specific timing, the Mustard
Heave-Ho retained-ability passage, and remote carriers to the optional Radish cannon. No
emulator timing validation is claimed.

### Sources

Native source is pinned to commit 7d969fbce14fdc838d2c1ea01389717fb96c3189:

- [Fuse collision and
  lifecycle](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/cannon_fuse.c)
- [Cannon destination decoding and
  entry](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/asm/kirby_cannon.s)
- [Ability attack
  objects](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/code_0806F780.c)
- [Ordinary-object destruction and freeze
  handling](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/object.c#L180-L375)
- [Spawn-state
  clearing](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/code_080023A4.c#L685-L710)
  and [viewport
  spawning](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/code_080023A4.c#L5873-L6074)
- [Kirby cannon entry
  restrictions](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/kirby.c#L11153-L11189)
  and [Crash
  animation/release](https://github.com/jiangzhengwenjz/katam/blob/7d969fbce14fdc838d2c1ea01389717fb96c3189/src/kirby.c#L20753-L20949)
- WiKirby: [Fuse](https://wikirby.com/wiki/Fuse), [Cannon](https://wikirby.com/wiki/Cannon),
  [Rainbow Room 32](https://wikirby.com/wiki/Rainbow_Route_-_Room_32), [Rainbow Room
  14](https://wikirby.com/wiki/Rainbow_Route_-_Room_14), [Rainbow Room
  31](https://wikirby.com/wiki/Rainbow_Route_-_Room_31), [Mustard Room
  12](https://wikirby.com/wiki/Mustard_Mountain_-_Room_12), [Mustard Room
  13](https://wikirby.com/wiki/Mustard_Mountain_-_Room_13), [Mustard Room
  14](https://wikirby.com/wiki/Mustard_Mountain_-_Room_14), [Radish Room
  16](https://wikirby.com/wiki/Radish_Ruins_-_Room_16), [Olive Room
  7](https://wikirby.com/wiki/Olive_Ocean_-_Room_7), [Olive Room
  5](https://wikirby.com/wiki/Olive_Ocean_-_Room_5), [Olive Room
  8](https://wikirby.com/wiki/Olive_Ocean_-_Room_8), [Olive Room
  9](https://wikirby.com/wiki/Olive_Ocean_-_Room_9).

## Underwater and frozen-enemy hits

The native swimming B dispatcher (`kirby.c`, `gUnk_0834C318`, selected by
`Macro_0803FF64_2`) preserves the attacks of Parasol, Hammer, Sword and Master.
Other equipment uses Normal Water Gun without changing equipment. Mini is
excluded by the native swimming-input caller: the evaluator must drop Mini to
Normal before attacking, and cannot claim it kept Mini through that attack.
Stone must finish transforming on dry ground before entering water; possession
of Stone does not establish a swimming Stone attack. Swimming Hammer is not its
dry fire move; no underwater fuse-ignition witness is credited.

Water Gun (`code_0806F780.c`, `sub_08079C28`) has mask `0x30000043`; the kicked
frozen enemy (`sub_0807E098`) has `0x20000043`. Both expose damage type `0x40`
and strength 3. Direct Ice ownership is not a general through-wall or metal hit.
`object_collision.c` intersects the attack with `0x3FFFF8 & ~(defense & ~7)`
and compares the low three strength bits. Actual direction, reach and target
remain room-specific requirements.

The finite `frozen_enemy_hit` API requires Ice equipment, a separate one-use
physical placement at the launch compartment, and explicit freeze/kick evidence.
Swallowing or firing that identity consumes it. Conflicting identity aliases,
renewable projectile sources and permanent `opens` effects are rejected. No
viewport-refresh API is implemented. A timed switch requires a complete route
through its gate, not a permanently opened event.

### Accepted production scope

The Normal Room 21 bypass and Room 12 directional topology below are bound.
Goal 2 has the conditional Frosty-only binding described below. Room 9 remains
unchanged; no global incoming-ability carry route is inferred.

**Olive Room 21 / native 819:** from the actual effective entry pixel `(40,72)`,
Normal swims to the central bomb at tile `(27,12)`, fires Water Gun upward,
takes the upper-right loop and lower bypass, and reaches native 821/Room 22.
The accepted run ends at frame 3876, ability 0, HP 2. No F5 metal was destroyed;
the optional metal shortcuts are not prerequisites. `underwater_819_exit` starts
Normal and needs no copy-ability source.

**Olive Room 12 / native 814:** effective arrivals are `(56,456)` from Room 11,
`(696,456)` from Room 17, and `(40,40)` from Room 13. Room 14 has no return tile
transition. The upper-left Room 13 arrival sits above nondroppable tile 0x0F
floors (attribute 0x4), unlike droppable 0x0E (0xC).
`code_080023A4.c:sub_080035F4` requires support bit 0x8; the 0x0F handler does
not honor the drop flag. The `UPPER_LEFT` logical subregion therefore only
returns to Room 13 and reaches the singleton RoomSanity sink. It cannot grant
the lower corridors' exits.

Normal controller witnesses establish:

- Room 17 lower-right arrival to Room 13: inhale bomb `(40,28)`, cross the lower
  corridor, ascend central x25/26 and left x11/12 shafts. Final frame 2876:
  native 824, ability 0, HP 4.
- Room 11 lower-left arrival to Room 14: jump into the lower corridor, ascend the
  central shaft, inhale ordinary F0 blocks, use the middle-right cannon and
  upper corridor. Final frame 4661: native 831, ability 0, HP 1.
- Room 11 lower-left arrival to Room 17: same ordinary-block approach, then fire
  the rotating cannon downward through the untouched ordinary F4 shaft and
  swim through the lower-right chamber. Final frame 4167: native 832, ability 0,
  HP 3. No player underwater attack or metal-breaking ability is required.

These prove Normal routes, not preservation of every carried ability or a
one-hit-health playthrough. Room 9 bomb ordering remains unreviewed. Candidate
undirected collision-grid paths are not accepted traversal proofs.

### Native acceptance and coordinate convention

`dev-docs/block-hit-acceptance.json` preserves four controller traces and
checkpoints, fixture hashes, and no ROM bytes or raw collision grids. The lawful
USA ROM SHA1 is `274b102b6d940f46861a92b4e65f89a51815c12c`. Fixtures alter only
initial room/spawn tables and use blank saves, controller inputs and read-only
observations. They do not inject abilities, write gameplay RAM, reload states,
or change collision geometry. These isolated native tests are not combined-patch
multiworld acceptance.

`startup_fixture.pixel_spawn` records the effective in-game spawn. Initial ROM
position-table coordinates are **8 greater on each axis**. Reconstructing with
that offset reproduces the four recorded fixture hashes; do not treat effective
coordinates as direct table bytes.

### Frozen Goal 2 evidence and conditional production binding

The accepted local chest replay starts in native 825's upper arena at `(168,104)`,
not its real incoming `(280,296)` spawn. It defeats and swallows Mr Frosty
`0x088CD3F0`, freezes the distinct Waddle Dee `0x088CD318`, kicks it through the
wall and passes the timed gate to collect chest 66/music bit 0x400. This proves
that local sequence, not the full arrival or randomized-source route.

Pengy `0x088CD384` is at the lower arrival before the boss; nondroppable platforms
prevent assuming a postboss return. Ice damage source code is not a completed
Pengy-to-chest carry replay. A narrow postboss Ice-preserving Waddle viewport loop
was observed, but is not generalized into renewable-resource semantics here.
The subsequent WiKirby arrival evidence supports the narrow conditional binding
below, not a general incoming-equipment or randomized-source witness.

Fresh Pi replay verification on **2026-11-08** reproduced all four underwater
fixture hashes and expected destination rooms, plus the separately scoped
upper-arena frozen Goal 2 chest/music readbacks. This does not expand the
production scope or prove the missing real-arrival/randomized sequence.

### Supplementary WiKirby route evidence

[Goal 2](https://wikirby.com/wiki/Olive_Ocean_-_Goal_2) describes the lower
arrival chute, ascent to Mr Frosty, and subsequent gated Sound Effects chest.
[Room 14](https://wikirby.com/wiki/Olive_Ocean_-_Room_14) confirms the one-way
approach into Goal 2. The Sound Effects entry in
[Treasure](https://wikirby.com/wiki/Treasure) specifies freezing the nearby
Waddle Dee and kicking its body through the wall into the switch. These sources
corroborate the intended vanilla sequence and agree with native room extraction
and the upper-arena controller replay.

The supplementary sources do not establish arbitrary incoming ability retention,
randomized Frosty grants, live-random retry guarantees, or a postboss Pengy return.
The scoped Frosty witness checks that the finalized physical source assignment
guarantees Ice, not merely that inventory allows Ice. Uncertain randomized
assignments retain their previous access behavior and are not rejected by this
partial witness.

### Guaranteed-Frosty applicability

`requires_guaranteed_source` enables the Goal 2 graph only when the finalized
`SourcePolicy.grant("MR_FROSTY", lambda _: True).guaranteed` is exactly `{Ice}`.
The same predicate runs before assignment feasibility and access-rule installation.
It accepts vanilla/excluded-miniboss grants, fixed Ice assignments and an Ice-only
live pool with no failure chance. Fixed non-Ice, mixed live pools and any live
no-ability chance preserve the previous rule exactly. This is deliberately a
conditional repair, not complete randomized Goal 2 logic.

The graph starts Normal at the actual arrival, follows WiKirby's documented
ascent, uses the native-proven Normal Frosty defeat/acquisition, and freezes the
distinct finite Waddle. It credits neither prebattle Pengy equipment nor renewal.
The native replay still begins in the upper arena; the documentation source,
not a fabricated controller run, supports the arrival segment.

Ice is classified as progression only when this guaranteed-source rule applies,
the physical Sound Effects location exists, and ability gating is enabled.
The base item definition remains useful for other configurations. Full and
minimal accessibility use the same applicability predicate. The sanitized
`frozen_goal2_upper_arena` record is separate from the four actual-entry underwater
runs in `block-hit-acceptance.json` and contains no private paths or ROM bytes.

### metal_216_chest

Peppermint Palace Room19's exact1-Up chest `0x088C1380` now uses one unconditional
source-backed target. Central and independently reached291 access are OR alternatives,
reusing `ordinary_hub_statues` and the existing291->215->212 carrier from `rope_217_6_5`.
Native291 statue `0x088C263C` supplies Burning under the actual source policy; the
synthetic212 imported-equipment fixture is not a production source.

The accepted low rightward Burning dash clears F5x28..30/y5..6, then actual chest
interaction sets flag36 mask16. Fresh native100%/500% enemy-health traces have no
HP loss; the existing Normal/Burning source argument supplies the positive-HP
qualification, not a direct AP1HP replay. The terminal action exports neither
opened-block persistence nor a reusable equipment postcondition. Both ordinary
exits and RoomSanity remain unchanged; unsupported source assignments stay closed.
See [the bounded source/carrier contract](../dev-docs/ordinary-216-source-carrier-contract.md).
This bounded 216 proof is one part of the current starting-permission release review, not a whole-game proof.


### metal_205_to_209_top and directed Peppermint chest approaches

One fail-closed target ORs the finite Bonkers-Hammer route with three guarded
hub-statue Stone starts. Native190 Stone is resolved through its actual policy;
the imported290 fixture is not a replacement production source. Both floor moves
and retained-equipment water continuations are reviewed at default and500%
enemy health. Stone's carrier defeats the actual Box Boxer without damage or
copy loss, so mixed-live miniboss assignments need no lucky Bonkers grant.

Native209 TOP, UPPER_ENTRY, LOWER_MAP and BOTTOM_MINOR remain distinct. The Normal
Bonkers-side Bomb doorway leads through the separate210 Snow hallway to the map;
actual290→208→209 leads only to bottom minor24. TOP owns minor23 and returns
through205 WATER_RETURN, whose reviewed egress leads specifically to203. No
summary edge, RoomSanity sink or generic210/209 alias joins these compartments.

See [the directed check contract](../dev-docs/ordinary-205-209-directed-checks.md)
for exact source identities, independent access, finite versus renewable policy,
full controller/scaler qualifications and unreviewed alternatives. Check IDs and
physical RoomSanity IDs/bits are unchanged. The current release separately integrates
the completed mandatory-metal coverage and option audit before removing Stone/Burning starts.

### Native529 directed ordinary passages

Cabbage Cavern Room3 needs no new source or metal-provider predicate for its
reviewed routes. Fresh Normal default/500% controller runs join lower and
upper-right approaches in both directions and reach the upper-left doorway
from below through the Bomb chains, without destroying any of the eight F5
tiles. Fresh upper-left arrival is kept separate: it can return to512SUB but
does not borrow the opened lower approach. One terminal RoomSanity sink serves
both compartments, preserving check3961090 and bit185.

The [directed topology contract](../dev-docs/ordinary-529-directional-topology.md)
identifies the actual door records, fresh-layout proofs and fixture limits.
There is no symmetric upper-left-to-lower edge, metal ownership shortcut,
equipment-preserving carry claim, or new room-reset assumption.

### metal_228_chest

One fail-closed chest target ORs the finite joint Bonkers-Hammer witness with
real item-gated970 statues. Both paths collect native209 minor23 and then228
minor30 with the same Hammer, without reacquisition or an assumed source reset.
The renewable carrier uses actual290→210 lower→227→204→203→205 travel, avoiding
Box Boxer and the intact rope/peg branches. It requires independent970 access,
Copy Ability Room Access, Peppermint East connection, optional Area Key and
Hammer permission. The imported290 fixture never becomes a production source.

See [the joint source/carrier contract](../dev-docs/ordinary-228-source-carrier-contract.md)
for exact identities, live-retouch assumptions, no-loss default/500% evidence and
health qualification. Closing Bombs remain untouched; separate ropeflag31 and
229 traversal are outside this gate. Full source outcomes are preserved;
unsupported policies fail closed rather than falling back to ownership alone.

### metal_229_left1up

Only native229's left1Up check3960593/flag33 uses the joint retained-Hammer
continuation from205 minor23 and228 minor30. Finite Bonkers and real970 statue
alternatives reuse their existing source/access contracts. Both default/500%
source-family continuations directly pass the transient228 switch/closing-door
slide, actual left229 doorway and airborne exterior-F5 attack with the same
Hammer and all three flags collected. The229 result is terminal; no permanent
switch opening, reset or reacquisition is inferred.

See [the exact joint contract](../dev-docs/ordinary-229-source-carrier-contract.md)
for proof levels and source-policy conditions. Spray flag 32, interior food flag 34,
Warp and RoomSanity remain outside this gate. Separate default and 500% health
supplements now prove Normal routes from the actual native 205 doorway through
pristine native 228 to Food, Spray and Warp. They do not prove Normal access
through upstream native 205, certify arbitrary shared-top joins, or replace the
accepted Hammer carrier to the left 1-Up. No unrelated check or topology rule
changes with these evidence-only supplements.

### metal_537_beginning_notes

Beginning Notes3960514 alone requires the reviewed Stone floor passage. The
actual190 statue acquisition and six directed doors through143/141/543/542/536
are replayed at default and production500% enemy health without damage or copy
loss. Both141 metal banks remain intact;542's ordinary Bomb/F0 path restores its
actual exit. The537 dry Stone drop clears the four F5 cells and Up sets flag1.

Central and independently reached190 alternatives reuse guarded hub sources,
their actual policy and documented statue retouch. No inventory-only acquisition,
right-shaft Normal bypass, room-wide gate or new provider is inferred. All537
exits and RoomSanity remain unchanged. See the
[source and carrier contract](../dev-docs/ordinary-537-source-carrier-contract.md)
for exact door/source identities, native-versus-AP qualification and test scope.


### Carried Burning alternatives for native 141 and 742

The existing target rows now OR their finite local Flamer witnesses with real
hub-statue acquisition and retained-Burning carriers. Native 141 forward banks
use actual 190 → 143 lower arrival. Its reverse row also accepts an independently
sourced ordinary lower-destination itinerary before either metal bank; that
alternative is not a physical reverse crossing or room-reset claim. Native 742
extends the exact accepted 707 result through actual 712 and 741 travel into its
first clean lower arrival. Its chest and Warp compatibility is separately proved
in one visit after deliberate Burning discard.

See [the source and direction contract](../dev-docs/carried-burning-source-contract.md)
for exact guards, fixture qualifications, terminal outcomes and remaining gaps.
All five rows are fail-closed when neither the local nor remote witness works.
No AP compartment, generic return alias, enemy renewal, starting inventory or
source assignment changes. The new ordinary-block capability uses only the
reviewed dry Burning action and grants no equipment or persistent opening.


## Late Central Master to Carrot lower Room13

The exact original post-clear Central stand is a special single-acquisition
source, not an ordinary randomized ability or a permission item. Its addressless
return event requires all eight unique shards, actual Dimension Mirror access,
the existing DMK sequence and reachable Central. This uses the goal-independent
reached-boss completion model; it is not a literal native clear receipt.

The forward-only 801->192->193->170->719 carrier requires independently reachable
West Hub, Carrot Hub and the enabled Carrot Key. Retained human Master and the
exact charged wave open only 734 lower ENTRY_FROM_5_07. The 719 target always
installs five OR graphs; the four finite Doo branches retain their graph-local
source conditions. No return/retouch/recovery, generic Master provider, helper
ability, upper734, chest or other-exit credit follows.

The [accepted source witness](../dev-docs/carrot-room7-master-source-witness.md)
distinguishes five key-on HP1 profiles, each with a positive and repeat (ten traces total),
the key100 final-action omission, source-derived finite classes over50–500,
and source-only mode1. Historical clear/Hub doors are imported prerequisites.
Real local client initialization includes RNG mailbox initialization and actual
acknowledged receipt rows; it is not a full watcher, external-server, reconnect
or native BizHawk portability proof. Current coverage is 145 witnesses/five
conditional-policy fallback targets and PR1052 remains partial.
