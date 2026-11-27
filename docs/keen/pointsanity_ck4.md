# CK4 Pointsanity Worksheet — Ice Cream Cone

CK4's 5000-pt pickup is the **Ice Cream Cone**. Locations are named
`"<Level Name> - Ice Cream Cone <N>"` in the apworld.

Fill in the `Requires` column for each pickup, then I'll translate to `ck4_points5k_rules` entries in `Rules.py`.

**Allowed tokens** (combine with `,`):

- `default` — level item only (no extras beyond the level's own rule).
- `pogo`, `stunner`, `wetsuit` — that ability is required.
- `pogo|stunner` — either of those abilities (OR).
- `gems:Red,Yellow` — one or more gems required (matches `Gemset` too via the existing helper).
- `exclude` — pickup is unreachable in normal play (will be added to `ck4_points5k_excluded`).

**Tile-Y hint**: high Y values (>30, especially >50) usually mean the pickup is at the bottom of the level or on a high platform — pogo is frequently needed to get up to or past it. Low Y in CK5 tunnels often means a ceiling stash. Use as a hint, not a rule.

**Source**: `info` = object spawned from the info layer (animated sprite); `tile` = static foreground tile. Behaviour-identical for AP.

---

## Slug Village (3 pickups)

- **Level rule** (for the _Complete_ check): `default`.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 45, 6)    | tile   | pogo     |
| 2   | (141, 32)   | tile   | default  |
| 3   | ( 43, 36)   | tile   | default  |

## The Perilous Pit (1 pickup)

- **Level rule** (for the _Complete_ check): `gems: Red, Blue`.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 4, 37)    | info   | pogo     |

## Cave of the Descendents (11 pickups)

- **Level rule** (for the _Complete_ check): `pogo; gems: Yellow`.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | (157, 49)   | info   | default  |
| 2   | (158, 49)   | info   | default  |
| 3   | (120, 51)   | info   | default  |
| 4   | (121, 51)   | info   | default  |
| 5   | ( 74, 60)   | info   | default  |
| 6   | ( 75, 60)   | info   | default  |
| 7   | ( 74, 61)   | info   | default  |
| 8   | ( 75, 61)   | info   | default  |
| 9   | ( 31, 74)   | info   | default  |
| 10  | ( 38, 74)   | info   | default  |
| 11  | ( 31, 5)    | tile   | pogo     |

## Chasm of Chills (7 pickups)

- **Level rule** (for the _Complete_ check): `default`.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 15, 59)   | info   | default  |
| 2   | ( 68, 64)   | info   | default  |
| 3   | ( 7, 7)     | tile   | pogo     |
| 4   | ( 57, 75)   | tile   | default  |
| 5   | ( 60, 75)   | tile   | default  |
| 6   | ( 57, 76)   | tile   | default  |
| 7   | ( 60, 76)   | tile   | default  |

## Crystalus (3 pickups)

- **Level rule** (for the _Complete_ check): `pogo; gems: Blue`.

| #   | Tile (X, Y) | Source | Requires       |
| --- | ----------- | ------ | -------------- |
| 1   | ( 19, 9)    | tile   | pogo           |
| 2   | ( 20, 9)    | tile   | pogo           |
| 3   | ( 74, 114)  | tile   | pogo,gems:Blue |

## Hilville (1 pickup)

- **Level rule** (for the _Complete_ check): `default`.
- **Existing flask rules in this level**: Flask 1: pogo.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | (135, 14)   | info   | pogo     |

## Sand Yego (4 pickups)

- **Level rule** (for the _Complete_ check): `pogo; gems: Green`.
- **Existing flask rules in this level**: Flask 1: pogo.

| #   | Tile (X, Y) | Source | Requires                               |
| --- | ----------- | ------ | -------------------------------------- |
| 1   | ( 31, 45)   | info   | I cannot find this one. Maybe exclude? |
| 2   | ( 4, 59)    | info   | default                                |
| 3   | ( 9, 65)    | info   | pogo                                   |
| 4   | ( 78, 79)   | info   | default                                |

## Miragia (5 pickups)

- **Level rule** (for the _Complete_ check): `pogo`.
- **Existing flask rules in this level**: Flask 1: pogo.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 21, 9)    | tile   | pogo     |
| 2   | ( 22, 9)    | tile   | pogo     |
| 3   | ( 5, 55)    | tile   | default  |
| 4   | ( 5, 56)    | tile   | default  |
| 5   | ( 5, 57)    | tile   | default  |

## Pyramid of the Moons (6 pickups)

- **Level rule** (for the _Complete_ check): `gems: Yellow`.
- **Existing flask rules in this level**: Flask 1: pogo.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 3, 67)    | info   | pogo     |
| 2   | ( 4, 67)    | info   | pogo     |
| 3   | ( 5, 67)    | info   | pogo     |
| 4   | ( 6, 67)    | info   | pogo     |
| 5   | ( 3, 68)    | info   | pogo     |
| 6   | ( 6, 68)    | info   | pogo     |

## Pyramid of Shadows (1 pickup)

- **Level rule** (for the _Complete_ check): `stunner; gems: Blue`.
- **Existing flask rules in this level**: Flasks 1: pogo+stunner; 2-8: stunner.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 90, 50)   | tile   | default  |

## Pyramid of the Gnosticine Ancients (1 pickup)

- **Level rule** (for the _Complete_ check): `pogo; gems: Red, Green`.
- **Existing flask rules in this level**: Flasks 2/3: stunner; 4: pogo.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 94, 88)   | tile   | pogo     |

## Isle of Tar (3 pickups)

- **Level rule** (for the _Complete_ check): `pogo; gems: Blue (region also: wetsuit)`.
- **Existing flask rules in this level**: Flask 1: pogo; 2: pogo + Blue Gem.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 95, 19)   | tile   | pogo     |
| 2   | ( 19, 84)   | tile   | default  |
| 3   | ( 29, 84)   | tile   | default  |

## Isle of Fire (5 pickups)

- **Level rule** (for the _Complete_ check): `gems: Yellow, Blue (region: wetsuit)`.

| #   | Tile (X, Y) | Source | Requires |
| --- | ----------- | ------ | -------- |
| 1   | ( 6, 15)    | tile   | pogo     |
| 2   | ( 6, 16)    | tile   | pogo     |
| 3   | ( 6, 17)    | tile   | pogo     |
| 4   | ( 6, 18)    | tile   | pogo     |
| 5   | ( 6, 19)    | tile   | pogo     |