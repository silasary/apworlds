# Secret Level Worksheet — Pyramid of the Forbidden (Keen 4)

Rendered map (gems/cones/flasks stamped): `images/Ck4lv14.png` in the tracker.

Fill the **Requires** column from in-game testing, then I translate to
`Rules.py`. Tokens (combine with `;`): `default` (level item only),
`pogo`, `stunner`, `pogo|stunner`, `gems:Red,Yellow`, `exclude`.

**Gem doors in this level:** Red @ [(42, 27), (25, 70)], Yellow @ [(23, 40)], Blue @ [(32, 72)], Green @ [(7, 73)]
(POTF is the only level with two Red doors — both reds open both.)

## Gems (current rule: level + pogo)

Red gem pickups (one shared "Red Gem" check): [(45, 24), (3, 70)]

- Red Gem — stunner
- Yellow Gem ([(27, 36)]) — red gem + stunner
- Blue Gem ([(46, 83)]) — pogo + red gem + yellow gem + stunner
- Green Gem ([(4, 77)]) — pogo + red gem + yellow gem + stunner

## Complete (current rule: all gems + pogo)

Exit: see map (CK4 exits aren't encoded as a scannable marker).
Should be: red gem + yellow gem + blue gem + pogo + stunner

## Ice Cream Cones (14) (current rule: default / level only)

| #   | Tile (X, Y) | Source | Requires                                     |
| --- | ----------- | ------ | -------------------------------------------- |
| 1   | ( 71, 28)   | dump   | red gem, yellow gem, blue gem, pogo, stunner |
| 2   | ( 70, 29)   | dump   | red gem, yellow gem, blue gem, pogo, stunner |
| 3   | ( 72, 29)   | dump   | red gem, yellow gem, blue gem, pogo, stunner |
| 4   | ( 69, 30)   | dump   | red gem, yellow gem, blue gem, pogo, stunner |
| 5   | ( 71, 30)   | dump   | red gem, yellow gem, blue gem, pogo, stunner |
| 6   | ( 73, 30)   | dump   | red gem, yellow gem, blue gem, pogo, stunner |
| 7   | ( 68, 31)   | dump   | red gem, yellow gem, blue gem, pogo, stunner |
| 8   | ( 70, 31)   | dump   | red gem, yellow gem, blue gem, pogo, stunner |
| 9   | ( 72, 31)   | dump   | red gem, yellow gem, blue gem, pogo, stunner |
| 10  | ( 74, 31)   | dump   | red gem, yellow gem, blue gem, pogo, stunner |
| 11  | ( 5, 47)    | dump   | red gem, yellow gem, pogo, stunner           |
| 12  | ( 6, 47)    | dump   | red gem, yellow gem, pogo, stunner           |
| 13  | ( 7, 47)    | dump   | red gem, yellow gem, pogo, stunner           |
| 14  | ( 8, 47)    | dump   | red gem, yellow gem, pogo, stunner           |

## Lifewater Flasks (2)

| #   | Tile (X, Y) | Source | Requires                                     |
| --- | ----------- | ------ | -------------------------------------------- |
| 1   | ( 58, 21)   | dump   | red gem, yellow gem, blue gem, pogo, stunner |
| 2   | ( 43, 15)   | dump   | stunner                                      |