# CK5 Pointsanity Worksheet — Bag O' Sugar

CK5's 5000-pt pickup is the **Bag O' Sugar**. Locations are named
`"<Level Name> - Bag O' Sugar <N>"` in the apworld.

Fill in the `Requires` column for each pickup, then I'll translate to `ck5_points5k_rules` entries in `Rules.py`.

**Allowed tokens** (combine with `,`):

- `default` — level item only (no extras beyond the level's own rule).
- `pogo`, `stunner` — that ability is required.
- `pogo|stunner` — either of those abilities (OR).
- `gems:Red,Yellow` — one or more gems required (matches `Gemset` too via the existing helper).
- `keycard` — the level's keycard is required.
- `exclude` — pickup is unreachable in normal play (will be added to `ck5_points5k_excluded`).

**End Game region note**: Gravitational Damping Hub and Quantum Explosion Dynamo are already region-gated by completing EFS, RCC, NBI, and BMI (all gems). You do not need to repeat those upstream requirements per pickup.

**Source**: `info` = object spawned from the info layer (animated sprite); `tile` = static foreground tile. Behaviour-identical for AP.

---

## Security Center (28 pickups)

- **Level rule** (for the _Complete_ check): `gems: Blue; keycard`.
- **Existing keg rules in this level**: Keg 1: gems:Blue.

| #   | Tile (X, Y) | Source | Requires  |
| --- | ----------- | ------ | --------- |
| 1   | ( 44, 4)    | info   | gems:Blue |
| 2   | ( 45, 4)    | info   | gems:Blue |
| 3   | ( 68, 4)    | info   | gems:Blue |
| 4   | ( 69, 4)    | info   | gems:Blue |
| 5   | ( 44, 5)    | info   | gems:Blue |
| 6   | ( 45, 5)    | info   | gems:Blue |
| 7   | ( 68, 5)    | info   | gems:Blue |
| 8   | ( 69, 5)    | info   | gems:Blue |
| 9   | ( 63, 14)   | info   | gems:Blue |
| 10  | ( 64, 14)   | info   | gems:Blue |
| 11  | ( 62, 15)   | info   | gems:Blue |
| 12  | ( 63, 15)   | info   | gems:Blue |
| 13  | ( 64, 15)   | info   | gems:Blue |
| 14  | ( 65, 15)   | info   | gems:Blue |
| 15  | ( 6, 33)    | info   | pogo      |
| 16  | ( 7, 33)    | info   | pogo      |
| 17  | ( 8, 33)    | info   | pogo      |
| 18  | ( 6, 34)    | info   | pogo      |
| 19  | ( 7, 34)    | info   | pogo      |
| 20  | ( 8, 34)    | info   | pogo      |
| 21  | ( 27, 57)   | info   | default   |
| 22  | ( 28, 57)   | info   | default   |
| 23  | ( 27, 58)   | info   | default   |
| 24  | ( 28, 58)   | info   | default   |
| 25  | ( 55, 65)   | info   | default   |
| 26  | ( 56, 65)   | info   | default   |
| 27  | ( 55, 66)   | info   | default   |
| 28  | ( 56, 66)   | info   | default   |

## Defense Tunnel Vlook (7 pickups)

- **Level rule** (for the _Complete_ check): `gems: Yellow; keycard`.
- **Existing keg rules in this level**: Keg 1: pogo + gems:Yellow.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | (181, 3)    | info   | default  |
| 2   | (182, 3)    | info   | default  |
| 3   | (186, 3)    | info   | default  |
| 4   | (181, 4)    | info   | default  |
| 5   | (182, 4)    | info   | default  |
| 6   | (186, 4)    | info   | default  |
| 7   | (187, 4)    | info   | default  |

## Energy Flow Systems (10 pickups)

- **Level rule** (for the _Complete_ check): `pogo; gems: Green`.
- **Existing keg rules in this level**: Keg 1: gems:Yellow.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 36, 55)   | info   | default  |
| 2   | ( 37, 55)   | info   | default  |
| 3   | ( 36, 56)   | info   | default  |
| 4   | ( 37, 56)   | info   | default  |
| 5   | ( 30, 16)   | tile   | default  |
| 6   | ( 30, 17)   | tile   | default  |
| 7   | ( 17, 51)   | tile   | default  |
| 8   | ( 18, 51)   | tile   | default  |
| 9   | ( 19, 51)   | tile   | default  |
| 10  | ( 20, 51)   | tile   | default  |

## Defense Tunnel Burrh (4 pickups)

- **Level rule** (for the _Complete_ check): `gems: Red; keycard`.
- **Existing keg rules in this level**: Kegs 1-2: pogo.

| #   | Tile (X, Y) | Source | Requires      |
| --- | ----------- | ------ | ------------- |
| 1   | (106, 3)    | tile   | gems:Red;pogo |
| 2   | (107, 3)    | tile   | gems:Red;pogo |
| 3   | (106, 4)    | tile   | gems:Red;pogo |
| 4   | (107, 4)    | tile   | gems:Red;pogo |

## Defense Tunnel Sorra (13 pickups)

- **Level rule** (for the _Complete_ check): `gems: Yellow; keycard (gem needs pogo, keycard needs stunner)`.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 77, 5)    | info   | default  |
| 2   | ( 77, 6)    | info   | default  |
| 3   | ( 77, 7)    | info   | default  |
| 4   | ( 67, 15)   | info   | default  |
| 5   | ( 68, 15)   | info   | default  |
| 6   | ( 69, 15)   | info   | default  |
| 7   | ( 70, 15)   | info   | default  |
| 8   | ( 71, 15)   | info   | default  |
| 9   | ( 67, 16)   | info   | default  |
| 10  | ( 68, 16)   | info   | default  |
| 11  | ( 69, 16)   | info   | default  |
| 12  | ( 70, 16)   | info   | default  |
| 13  | ( 71, 16)   | info   | default  |

## Neutrino Burst Injector (4 pickups)

- **Level rule** (for the _Complete_ check): `pogo; gems: Red, Blue`.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 63, 3)    | info   | pogo     |
| 2   | ( 64, 3)    | info   | pogo     |
| 3   | ( 37, 43)   | tile   | default  |
| 4   | ( 38, 43)   | tile   | default  |

## Defense Tunnel Teln (10 pickups)

- **Level rule** (for the _Complete_ check): `gems: Yellow, Blue; keycard`.
- **Existing keg rules in this level**: Keg 1: gems:Red.

| #   | Tile (X, Y) | Source | Requires         |
| --- | ----------- | ------ | ---------------- |
| 1   | ( 17, 2)    | info   | gems:Yellow,Blue |
| 2   | ( 17, 3)    | info   | gems:Yellow,Blue |
| 3   | ( 48, 13)   | info   | gems:Yellow,Blue |
| 4   | ( 48, 14)   | info   | gems:Yellow,Blue |
| 5   | ( 48, 15)   | info   | gems:Yellow,Blue |
| 6   | ( 48, 16)   | info   | gems:Yellow,Blue |
| 7   | (103, 16)   | info   | gems:Yellow      |
| 8   | (104, 16)   | info   | gems:Yellow      |
| 9   | (103, 17)   | info   | gems:Yellow      |
| 10  | (104, 17)   | info   | gems:Yellow      |

## Brownian Motion Inducer (8 pickups)

- **Level rule** (for the _Complete_ check): `pogo; gems: Yellow, Blue`.
- **Existing keg rules in this level**: Keg 1: pogo.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 63, 29)   | info   | default  |
| 2   | ( 64, 29)   | info   | default  |
| 3   | ( 63, 30)   | info   | default  |
| 4   | ( 64, 30)   | info   | default  |
| 5   | ( 64, 17)   | tile   | pogo     |
| 6   | ( 65, 17)   | tile   | pogo     |
| 7   | ( 64, 18)   | tile   | pogo     |
| 8   | ( 65, 18)   | tile   | pogo     |

## Gravitational Damping Hub (15 pickups)

- **Level rule** (for the _Complete_ check): `pogo; gems: Green; keycard (region: End Game — many gates upstream)`.
- **Existing keg rules in this level**: Keg 1: pogo + gems:Green.

| #   | Tile (X, Y) | Source | Requires        |
| --- | ----------- | ------ | --------------- |
| 1   | ( 31, 3)    | info   | gems:Green;pogo |
| 2   | ( 32, 3)    | info   | gems:Green;pogo |
| 3   | ( 33, 3)    | info   | gems:Green;pogo |
| 4   | ( 31, 4)    | info   | gems:Green;pogo |
| 5   | ( 32, 4)    | info   | gems:Green;pogo |
| 6   | ( 33, 4)    | info   | gems:Green;pogo |
| 7   | ( 25, 23)   | info   | gems:Green;pogo |
| 8   | ( 26, 23)   | info   | gems:Green;pogo |
| 9   | ( 25, 24)   | info   | gems:Green;pogo |
| 10  | ( 26, 24)   | info   | gems:Green;pogo |
| 11  | ( 33, 55)   | info   | pogo            |
| 12  | ( 35, 55)   | info   | pogo            |
| 13  | ( 34, 55)   | tile   | pogo            |
| 14  | ( 63, 63)   | tile   | default         |
| 15  | ( 63, 64)   | tile   | default         |

## Quantum Explosion Dynamo (9 pickups)

- **Level rule** (for the _Complete_ check): `pogo; gems: Red, Yellow, Blue, Green (region: End Game)`.
- **Existing keg rules in this level**: Kegs 1-2: pogo + stunner.

| #   | Tile (X, Y) | Source | Requires                             |
| --- | ----------- | ------ | ------------------------------------ |
| 1   | ( 74, 14)   | tile   | pogo; gems: Red, Yellow, Blue, Green |
| 2   | ( 75, 14)   | tile   | pogo; gems: Red, Yellow, Blue, Green |
| 3   | ( 74, 15)   | tile   | pogo; gems: Red, Yellow, Blue, Green |
| 4   | ( 75, 15)   | tile   | pogo; gems: Red, Yellow, Blue, Green |
| 5   | ( 74, 16)   | tile   | pogo; gems: Red, Yellow, Blue, Green |
| 6   | ( 75, 16)   | tile   | pogo; gems: Red, Yellow, Blue, Green |
| 7   | ( 26, 63)   | tile   | pogo                                 |
| 8   | ( 27, 63)   | tile   | pogo                                 |
| 9   | ( 28, 63)   | tile   | pogo                                 |