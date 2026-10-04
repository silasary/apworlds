# AP Stars candidate logic (schema 19)

APWorld 0.28.0 generates exactly 66 individual Star items. The existing 71
non-Star instances remain: 69 progression inputs and two useful character rewards.
Plunger is now progression because it gates the Lobby feeding action. The Music
Lab economy remains ten 1-point items, three 10-point bundles and seven 20-point
bundles, worth 180 points.

| Difficulty | Addressed checks | Modeled non-filler slots | Non-filler items | Stardust |
| --- | ---: | ---: | ---: | ---: |
| Normal | 164 | 152 | 137 | 27 |
| Hard | 222 | 209 | 137 | 85 |
| Expert | 280 | 266 | 137 | 143 |
| Perfection | 316 | 302 | 137 | 179 |

Normal gains 32 campaign slots and 31 source/action slots over schema 18's 89
eligible slots. The guard counts all 137 non-filler items, including the two useful
characters; checking only 135 progression instances would miss a capacity deficit.
No new caches, automatic milestones or economy compression supply these slots.

## Native route model and acceptance boundary

`native_logic.py` holds the schema 19 candidate graph. Its basis is the historical
playthrough ledger (`docs/HISTORICAL_GAMEPLAY_EVIDENCE.md`), the September 17 native
scene/flag audit and the grouped source-check acceptance. Native source detection
and solver reachability are separate claims: the conservative graph remains a
candidate until a fresh complete native playthrough verifies hidden story conditions.
These rules mean that a player can perform an action; they do not set native flags.

Every level requires its area item and its generated Star gate. Additional
conservative paths are:

| Levels | Native path included in logic |
| --- | --- |
| 1–5 | Roots order; Weed Killer and Plant Pipes for 3/4; Hip Glasses and Chicken Bucket for 5 |
| 6–10 | Lift Quest before Lobby6; Boring Room and mail route before 7; training before 8/9;8 and 9 before 10 |
| 11–14 | Native music/pickup route for 11; each later act follows its predecessor and requires Hypno Pan, including native pet/mouse actions |
| 15–16 | Cell introduction for 15; mainframe plus Roots2 and Meat11 routes for the two Bee nectar drops before 16 |
| 17 | Lobby training and Cell16 return, plus Hypno Pan |
| 18–20 | Violance; Plant Pipes for Darkness 18; Hypno Pan for Loneliness 20 |
| 21 | All three Tower branches and their totem route; Violance, Weed Killer and Plant Pipes |
| 22 | Independent Royal phone-side route; optional Royal feeding is not required |

Hub sources inherit their parent area's access item. In-level sources inherit
entry gates: Frog/Hippo remains reachable without Plant Pipes, while Combo Bucket
Conversion includes the Lift Quest gate. Normal cassette award aliases inherit
the matching campaign route and Star gate. Supported Bee cassette aliases require
the Cell introduction and their base route; unsupported Devil aliases do not open
an independent solver path.

Six supplemental special completions, two Bunker actions, the untested Certificate
award and three cartridge pickups remain filler/trap-only. Higher boss 2/3-star checks
also remain filler/trap-only. Their raw presence never contributes non-filler capacity.

## Gate generation and Victory

Levels 1 and 2 always require zero Stars. The seeded nondecreasing curve uses
`min(required_stars - 1, required_stars // 2)` as its maximum. This leaves at least
half the configured goal outside the highest entrance gate, preserving room to
route the existing quest, cassette and point items. The full configured goal still
applies to Victory. The previous near-goal curve failed real Archipelago restrictive
fill on Normal / goal 50 / seed 285001; retain that counterexample as regression evidence.

The five transmitted Star Eater requirements are Roots=min(3,Level 3),
Lobby=Level 7, Cell Tower=Level 16, Royal Corridor=Level 21 and Secret Bunker=66.
Royal feeding additionally requires the Tower/Locker Room route on its side of the
broken bridge. Bunker feeding has no progression items behind it.

The addressless Victory event lives in Royal Corridor. Its rule requires the
repeatable Level 22 route, including Plant Pipes, and the full configured AP Star total.
All Level 22 completion, enabled star and downstream reward checks require Plant Pipes;
the generator never assumes a luck-dependent no-pipes clear. This is solver
modeling of a subsequent clear; the client must snapshot synchronized Stars during
a new successful persisted Level 22 result. A prior clear followed by a Star receipt
never qualifies by itself. Ordinary Level 22 checks remain available below the goal.

## Contract and validation

Schema19 uses the existing campaign mapping schema 1 plus star_victory_schema 1.
It publishes item Star/187256118/count66/maximum66, the exact 22-entry gate map,
the exact five-entry Star Eater map, enabled Star/gate/post-threshold Victory flags,
and Level 22/internalLevel_28 identity. The implementation suffix is
`-check-expansion-0.27-ap-stars-0.28`.

Expanded checks schema 1 has 39 entries: the legacy 37 plus Cell Tower Star Eater
Fed (187256334) and Royal Corridor King Ferdinand Unlocked (187256335). The latter is
its actual native boss reward source, not a new interaction or randomized King item.
Permanent old item/location identities and cassette contract maps are retained.

Focused tests cover pool/eligible capacity, every generated gate boundary, the
partial Plant Pipes source, in-level Combo gate, missing route inputs, Royal split,
Victory threshold and unchanged point economy. Actual restrictive-fill/playthrough
matrices must run against the final packaged revision; lightweight full-inventory
reachability tests are not a substitute for real Archipelago generation.

Tower statue correction: each deposit needs both its own shield branch and the branch supplying its part. Restore Eye requires Levels18+19 and Plant Pipes; Restore Mind requires Levels19+20 and Violance; Restore Heart requires Levels18+20 and Hypno Pan. Native Hub03Totem asset fields independently confirm these unions.
