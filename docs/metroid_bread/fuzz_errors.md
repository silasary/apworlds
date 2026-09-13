# Metroid Bread fuzzer failures (2026-08)

Catalog of `fuzz_output/error/metroid_bread/<id>/` generation failures, root
causes, and fixes shipped through world version **1.7.9**.

## How to re-verify

From the Archipelago repo root:

```text
py -3.12 -m unittest discover -s worlds/metroid_bread/local_tests -p "test_victory_clearance.py" -v
```

Or regenerate a single fuzzer YAML:

```text
py -3.12 Generate.py --skip_output --seed <seed> --player_files_path fuzz_output/error/metroid_bread/<id>/
```

(Normalize `transport_rando: false` → `off` / `randomized` if Generate rejects the fuzzer spelling.)

## Root causes

### A. Combat tricks off + low `energy_per_tank`

**Symptom:** `assert_graph_preflight` (“Raven Beak unreachable … door_lock_rando=off, transport_rando=off”) or `post_fill` (“Raven Beak is unreachable after fill”).

**Why:** With `combat_tricks: disabled`, RDV fight templates fall back to raw `Damage`/energy gates. **Gold Chozo-X** and **Raven Beak** both need **799** energy on that path. `_damage_ok` only bypasses Damage when Combat ≥ beginner.

Fuzzer YAMLs often pair combat-off with tiny `energy_per_tank` (12–153). Even “full inventory” then has too little HP, or Energy Tanks sit as **useful/filler** behind Gold Chozo → classic softlock (need tanks to reach tanks).

**Examples:** 19, 53 (older energy-class runs), 80, 98, 100, 106, 122, 137, 138, 150, 174, 207, 246 (and later same-class folders).

**Fix (`__init__.py`):**

- `_ensure_combat_energy_viable()` raises `energy_per_tank` so **base** HP (`ept - 1`) ≥ 799 when combat is off (cap 1000; else force combat beginner).
- Energy Tank / Energy Part become **progression** while combat is off.
- `_full_inventory_counts()` uses YAML tank/part counts so preflight matches obtainable energy.

### B. Sphere-0 dead-end starts (fill: “No more spots…”)

**Symptom:** `FillError: No more spots to place N items. Remaining locations are invalid.` Logs dump long event lists; the real failure is fill stalling after 2–3 placements.

**Why:** Some starts (Artaria Save East, Burenia Save South, etc.) expose only ~2 local checks. Assumed fill places Morph/etc. there and **still cannot open sphere 1** (one-ways, individual doors, transport cuts). `_MIN_START_CHECKS == 2` was necessary for Artaria Intro but insufficient as an expandability test.

**Examples:** 1, 97, 167, 199, 207 (after energy fix), plus later “no more spots” folders.

**Fix (`__init__.py`):**

- `_start_sphere_expands()`: simulate filling sphere-0 slots with openers; require ≥2 new checks.
- Wired into `_kit_is_ok`, `_graph_state_acceptable`, and last-resort fallback to Artaria Intro.
- DNA pre-placement prefers **non–sphere-0** checks so high DNA does not consume every early slot.

### C. Not a separate Raven Beak logic bug

Preflight failures that printed `door_lock_rando=off, transport_rando=off` after a revert were usually **A** (energy), not a broken vanilla graph. Transport/door re-rolls failing first was a red herring once vanilla also failed for the same energy reason.

### D. DNA pre-placement ignores start frontier / preferred sinks (1.7.6)

**Symptom:** `FillError` in `fill_restrictive` (early, progression unplaced) or `remaining_fill` (far along, filler left + unreachable empties). Spoiler / placement dump shows Metroid DNA on bad sinks.

**Why:**

1. **Wrong-region intros (e.g. fuzz 168):** With `prefer_emmi` / `prefer_bosses`, `include_boss_pickups: false`, and DNA **&lt; 6**, `_compute_forced_boss_locations` used to skip keeping boss/EMMI checks. Preferred sinks vanished from the active pool, so DNA fell through to `location_table` order. Sphere-0 filtering only excluded the *start-kit* sphere — Artaria Charge/Melee tutorials look “late” from a Ferenia + Morph/Bomb start, so all DNA locked there and fill died immediately.

2. **High DNA on every CU/boss sink (e.g. fuzz 30):** DNA=12 + `prefer_bosses` + bosses excluded forced ~13 sinks and pre-placed DNA on all of them, including **Central Unit Access** (Morph / Speed / Magnet homes) in the start region. Fill progressed far, then `remaining_fill` failed with filler left and unreachable empties.

**Examples:** 30, 168.

**Fix (`__init__.py`):**

- Always keep preferred boss/EMMI sinks when DNA > 0 and placement is prefer_emmi/prefer_bosses (any count).
- DNA candidates must be **eventually reachable** (full inventory).
- Prefer **arena / EMMI-defeat** sinks before Central Unit Access; protect start-kit + opener **frontier**; deprioritize stale Artaria (and other wrong-region) tutorial intros.
- Item group `"DNA"` (alias `"Metroid DNA"`) for `!hint DNA`.

### E. Cramped sphere-0 + non-opening early fill (1.7.7)

**Symptom:** `FillError: No more spots…` after only Progressive Beam (etc.) land in the two early checks. Graph preflight and `_start_sphere_expands` both pass.

**Why:** `_start_sphere_expands` grants Morph/Bomb/Charge as free inventory. Assumed fill does **not** — it can put Progressive Beam (or other non-openers) in every sphere-0 slot. With exactly two early checks:

- **Fuzz 434:** Artaria Save East + Morph kit + individual doors (10) + transport rando (29). Early = David Jaffe + Thermal Device. Beams open nothing; Bomb + Progressive Charge would. Seed `264219053`.
- **Fuzz 53 (rerun):** Burenia Nav South + Screw Attack kit + individual doors (98) + DNA prefer_bosses. Early = Artaria↔Burenia transport missiles. Morph stays unplaced after Beams take both slots. Seed `376963394`.

Not the same as **B** (start fails to expand under openers) or **D** (DNA on bad sinks) — expand simulation is fine; fill order is not.

**Fix (`__init__.py`):**

- When sphere-0 has exactly `_MIN_START_CHECKS` locations and expand openers exist, `_compute_early_expand_pins()` records those pool names.
- `create_items` writes them into `multiworld.local_early_items` so fill must place Morph/Bomb/Charge early.

### F. Starting missiles = 0 still opens missile logic (1.7.9)

**Symptom:** Seeds with `starting_missiles: 0` treat missile doors / Shoot Missile as in-logic from sphere 0; ROM capacity is correctly 0.

**Why:** `MissileAmmo` (and the legacy `Missile` alias) mapped to `None` in `ITEM_SHORT_TO_AP`, so `_resource_ok` always returned True. `inventory_from_counts` also always added `__missiles__`.

**Fix (`dread_logic.py`):** `MissileAmmo` → `__missile_ammo__` with capacity from `starting_missiles` + Missile / Missile+ tank yields (option ammo sizes). Zero start → no shoot until a tank (or Missile Launcher pickup) adds capacity.

## Error ID → cause (initial set)

| IDs | Class | Cause |
|-----|--------|--------|
| 80, 207 | generate_early preflight | A (low EPT + combat off); 207 also B after energy fix |
| 19, 53*, 98, 100, 106, 122, 137, 138, 150, 174, 246 | post_fill RB unreachable | A |
| 1, 97, 167, 199 | fill no spots | B (+ DNA early locking for high DNA) |
| 30, 168 | fill / remaining_fill | D (DNA pre-placement) |
| 434, 53 (1.7.6 rerun) | fill no spots after 2 beams | E (cramped sphere-0, non-opening early fill) |

\*Older folder **53** was class A; the 2026-08-20 re-fuzz of the same id is class **E**.

Later folders under the same error dir from an ongoing fuzzer run may still match **A**–**E**. Individual-doors **timeouts** (not FillError) remain out of scope.

## Files changed

- `worlds/metroid_bread/__init__.py` — energy viability, sphere expand, DNA placement, early-opener pins, full-inventory energy counts
- `worlds/metroid_bread/Items.py` — `DNA` / `Metroid DNA` item name groups
- `worlds/metroid_bread/local_tests/test_victory_clearance.py` — regression tests
- `worlds/metroid_bread/docs/fuzz_errors.md` — this doc
- `worlds/metroid_bread/archipelago.json` — `world_version` bump
