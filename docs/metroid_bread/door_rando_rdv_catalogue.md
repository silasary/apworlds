# Door Rando: Randovania catalogue + Archipelago redesign

Research note for Metroid Bread door-lock randomization. Goal: stop invalid ODR/game placements (especially **sensor / phantom-cloak doors**) by imitating Randovania’s (RDV) constraint model instead of unconstrained rolling.

Sources inspected (local Downloads trees):

| System | Path |
|--------|------|
| RDV logic + dock DB | `Downloads/Archipelago-main/randovania/randovania/games/dread/logic_database/` (`header.json` + region JSONs) |
| RDV assigner | `…/randovania/generator/dock_weakness_distributor.py` |
| RDV dock config types | `…/randovania/layout/base/dock_rando_configuration.py`, `…/game_description/db/dock.py` |
| RDV → ODR export | `…/games/dread/exporter/patch_data_factory.py` (`_door_patches`) |
| ODR door API | `…/Archipelago-main/output/_odr_tmp_2.10.0/Lib/site-packages/open_dread_rando/door_locks/door_patcher.py` |
| AP world | `Archipelago-main/worlds/metroid_bread/DoorRando.py`, `Options.py`, `__init__.py` |
| AP logic DB | `worlds/metroid_bread/logic_database/` (ported RDV DB; same door metadata) |

---

## 1. RDV catalogue — how door types are assigned

### 1.1 Data sources

Door weaknesses and rando pools live in the **dock weakness database** inside:

`randovania/games/dread/logic_database/header.json` → `dock_weakness_database`

Per-dock flags live on each dock node in region files (`Artaria.json`, …):

- `default_dock_weakness` — vanilla lock name  
- `exclude_from_dock_rando` — hard skip  
- `incompatible_dock_weaknesses` — per-dock ban list (weakness names)  
- `extra.actor_name` / `extra.actor_def` — Mercury actor used for ODR patches  
- `extra.type` on the **weakness** (in header) — ODR `door_type` string (`power_beam`, `phantom_cloak`, …)

Typed structures:

- `DockRandoParams` / `DockRandoConfig` — `randovania/game_description/db/dock.py`  
- Preset UI / bitpacking — `DockTypeState.can_change_from` / `can_change_to` — `layout/base/dock_rando_configuration.py`

### 1.2 Door-type `dock_rando` pool (Dread)

From `header.json` → `dock_weakness_database.types.door.dock_rando`:

| Role | Weaknesses |
|------|------------|
| **unlocked** | `Power Beam Door` |
| **locked** | `Access Permanently Closed` |
| **change_from** | Access Open, Charge, Grapple, Missile, Plasma, Power Beam, **Sensor Lock**, Super Missile, Wave, Wide |
| **change_to** | Access Permanently Closed, Bomb, Charge, Cross Bomb, Diffusion, Grapple, Ice Missile, Missile, Plasma, Power Beam, Power Bomb, Storm Missile, Super Missile, Wave, Wide |

**Not in `change_to` (critical):** `Sensor Lock Door`, `Phase Shift Door`, thermal doors, powered-switch doors, Access Locked/Closed, Access Open.

**Not randomized as door types:** tunnels, teleporters (`dock_rando: null` on those dock types).

Global `dock_rando` config (`header.json`):

```json
"force_change_two_way": true,
"resolver_attempts": 250,
"to_shuffle_proportion": 0.6
```

So RDV only shuffles ~60% of eligible docks in Individual Doors mode, always mirrors both sides when configured, and uses a resolver budget.

### 1.3 Modes (`DockRandoMode`)

| Mode | Behavior | Key function |
|------|----------|--------------|
| `VANILLA` | no shuffle | — |
| `WEAKNESSES` (“Door Types”) | map each selected source weakness → a target weakness globally | `distribute_pre_fill_weaknesses` |
| `DOCKS` (“Individual Doors”) | unlock eligible docks pre-fill, then **post-fill** assign locks with a dock-local resolver | `distribute_pre_fill_weaknesses` + `distribute_post_fill_weaknesses` |

### 1.4 Eligibility (pre-fill)

`distribute_pre_fill_weaknesses` (`dock_weakness_distributor.py`):

A dock is shuffled only if **all** hold:

1. Still has default weakness (not already patched)  
2. `dock_rando.can_shuffle(dock_type)`  
3. `default_dock_weakness ∈ types_state[dock_type].can_change_from`  
4. `not node.exclude_from_dock_rando`

**DOCKS mode:** eligible docks (and often their partners under `force_change_two_way`) are forced to **unlocked** (`Power Beam Door`) before item fill; real locks assigned later.

**WEAKNESSES mode:** builds a weakness→weakness mapping; skips/falls back to unlocked when `incompatible_dock_weaknesses` rejects the mapped target; two-way sync if configured.

### 1.5 Individual-door assignment (post-fill) — the important algorithm

`distribute_post_fill_weaknesses` → `_run_dock_resolver` → `_determine_valid_weaknesses`:

1. Pretend the door (both sides) is a special impassable “Locked” weakness.  
2. Run the resolver aiming to **reach that door** from the start state.  
3. From the resulting reach, only allow targets in `can_change_to` that are:
   - not in `dock.incompatible_dock_weaknesses` or the partner’s list  
   - whose open (and blast-lock) requirements are **satisfied by the reach inventory**  
4. Always allow **unlocked**; allow **locked** (`Access Permanently Closed`) only if both sides of the door are mutually reachable (no one-way softlock).  
5. Weighted random pick; assign same weakness to partner when two-way rules say so.

This is why RDV can use “hard” blast shields without unreproducible softlocks: locks are gated by **what the player can already open when they first reach the door**.

### 1.6 Per-dock exclusions

~**82** door docks have `exclude_from_dock_rando: true` (boss arenas, EMMI intro frames, Drogyga eyedoor, many story/one-ways, Itorash capsule area, etc.). Vanilla weakness is usually still Power Beam / Access Open — exclusion is structural, not “because it’s a sensor.”

### 1.7 `incompatible_dock_weaknesses`

**14** dock nodes (7 physical doors, both sides) ban **`Grapple Beam Door` only**. Examples:

- Artaria Waterfall / Behind Waterfall (`Door022 (PW-PW) _000`)  
- Artaria White EMMI intro ballspark frames  
- Burenia `doorpowerpower_013`, `doorpowerpower_021`  
- Ghavoran Flipper / Elun Transport (`doorpowerpower_005`), Golzuna / Chozo warrior closed doors  

Reason (game/layout): grapple door actor / navmesh / one-sided geometry cannot safely become a grapple lock there.

### 1.8 Sensor (phantom cloak) doors

**10** dock nodes / **7** Mercury actors are vanilla `Sensor Lock Door`:

| Scenario | Actor | Notes |
|----------|-------|-------|
| `s010_cave` | `doorpresenceframe_000`, `_001` | one-sided presence frames |
| `s010_cave` | `Door049 (PR-PR)`, `Door052` | symbolic / presence-presence style names |
| `s020_magma` | `doorpresenceframe_000`, `doorframepresence`, `_001` | |
| `s040_aqua` | `doorframepresence`, `_000` | |

Weakness definition (`header.json`): `extra.type = "phantom_cloak"`, requirement = Cloak item; **no blast lock**.

RDV policy:

- Sensors are in **`change_from`** → they may be **converted away**.  
- Sensors are **not** in **`change_to`** → they are **never placed** on arbitrary doors.  
- Test patch exports (`test/.../patcher_data/dread/.../world_1.json`) show `doorpresenceframe_*` / `doorframepresence*` patched to `power_beam` / `bomb`, and **zero** `phantom_cloak` targets.

### 1.9 Blast shields / heat / other specials

| Kind | In RDV `change_to`? | ODR representation |
|------|---------------------|--------------------|
| Beam/missile shields (wide/plasma/wave/missile/super) | yes | power door + shield actor |
| Ice / storm / diffusion / bomb / cross / power bomb | yes | custom shield assets (`custom_door_types.py`) |
| Grapple | yes | `doorgrapplegrapple` actordef |
| Access Permanently Closed | yes | closed shield |
| Sensor | **no** | `doorpresence*` — see ODR `can_be_added=False` |
| Phase Shift | **no** | shutter logic; not a DoorType in ODR enum |
| Artaria/Cataris Thermal | **no** | event-gated; weakness `extra` has **no** `type` |
| Dairon power-switch doors | **no** | event-gated |

Export guard (`patch_data_factory._door_patches`): refuses weaknesses lacking `extra.type` (thermal/powered would hard-fail if ever assigned).

### 1.10 Two-way symmetry

`force_change_two_way: true` for Dread:

- Pre-fill unlock mirrors partners.  
- Post-fill assigns the same weakness to the connected dock when the partner is changeable or force-two-way applies.  
- Physical Mercury actor is usually shared; logic still has two nodes.

---

## 2. AP current behavior

### 2.1 Pipeline

1. `__init__._roll_door_and_transport_rando` when `door_lock_rando == individual_doors`
2. `DoorRandoAssigner.pre_fill_roll` → unlock ~`to_shuffle_proportion` eligible docks
   (Power Beam); mutates logic via `apply_assignments`
3. Item fill proceeds on the opened graph
4. `post_fill` → `DoorRandoAssigner.post_fill_assign` (reach-gated locks) →
   `assignments_to_door_patches` → `patch_extras.door_patches` →
   `ap_to_patcher.apply_dread_patch_extras`
5. Softening loop (`score_doors_by_new_checks` / `soften_assignments`) is
   **emergency-only** for fill / preflight repair — does not introduce sensors

### 2.2 What AP actually rolls

`DoorRandoAssigner` + `door_rando_db.py`:

- Eligible physical keys: dock nodes with `dock_type=="door"`, not
  `exclude_from_dock_rando`, and Mercury actor in ODR `ActorData` door
  allowlist (`doorpowerpower`, `doorcharge*`, `doorgrapple*`,
  `doorpresence*` / `doorframepresence`, `doorframe`, …). **Hard-excluded:**
  `doorshutter*` (Phase Shift), `doorheat*` (thermal), and any other actordef
  ODR `door_actor_to_type` cannot identify. Also excluded by vanilla weakness
  in `NON_PATCHABLE_SOURCE_WEAKNESSES` (Phase Shift / thermal / powered).
- Vanilla weakness must be in option `doors_to_change` (default ≈ RDV
  `change_from`, **includes Sensor Lock Door**; **excludes** Phase Shift).
- Shuffle count ≈ `reroute_shuffle_proportion` (~0.85 of non-assist eligible).
- Pre-fill target for shuffled docks: header `unlocked` (Power Beam Door).
- Post-fill target pool = option `change_doors_to` ∩ Phase-2 ODR-addable types
  from header `change_to` (beams / missiles / grapple / blast / Ice / Storm /
  Diffusion). Never Sensor / Phase; **Closed deferred**.
- Per-dock `incompatible_dock_weaknesses` (Grapple bans) applied at post-fill.
- Start-frontier doors stay vanilla (not selected).
- Per-scenario shield ID budget (~100 ids, cost 2 per shielded door, margin 10).
- One weakness per `(scenario, actor)`; both logic sides sharing that actor get
  the same mutation.
- **Emit guards:** `assignments_to_door_patches` and `ap_to_patcher` drop
  non-patchable actors (e.g. `s020_magma` / `doorshutter_001`) even if somehow
  assigned — seals ODR `ValueError: ... is not a patchable door!`.

### 2.3 Gaps vs RDV (especially crash-prone)

| Constraint | RDV | AP today |
|------------|-----|----------|
| Sensor in `change_to` | **Forbidden** (DB) | Forbidden (Options + basic pool + patcher allowlist) |
| Sensor in `change_from` | Allowed (convert away) | Allowed |
| Post-fill resolver / reach-gated locks | Full dock resolver | **Light** reach-gated assigner (DreadLogic + sphere inventory) |
| `incompatible_dock_weaknesses` (no Grapple on 7 doors) | Enforced | **Enforced** (post-fill filter) |
| `to_shuffle_proportion` 0.6 | Yes | **Yes** (header-driven) |
| `force_change_two_way` | Explicit | Implicit via shared actor key |
| Actor coverage | All `actor_name`s with type | Skips capitalized `Door###` / `Door049 (PR-PR)` (case filter) |
| Extended blast pool (bomb/ice/storm/…) | In `change_to` | **Phase 2 shipped** (ODR-addable ∩ header) |
| Closed-door locked type | In pool + resolver rules | Deferred (no AP dead-door resolver) |
| Thermal / phase / powered | Excluded | Mapped in `WEAKNESS_DOOR_TYPE` but not in targets |

### 2.4 Footguns closed

**Was Footgun A — UI unsafe `Change Doors To` keys.** Closed: Options + client
valid keys match the Phase-2 ODR-addable pool (no Sensor / Phase / Closed).

**Was Footgun B — Grapple incompat ignored.** Closed in post-fill filter.

**Remaining — Presence actors** may still convert under the Phase-2 pool without
RDV’s full resolver; lower priority than Sensor emit / Grapple incompat.

**Not a current emit path:** unrestricted Sensor **targets**.

---

## 3. Crash / reject hypotheses (with code evidence)

### H1 — Placing Sensor (`phantom_cloak`) on a non-presence door (highest severity)

ODR `DoorType.PRESENCE`:

```text
PRESENCE = (..., can_be_removed=True, can_be_added=False, ...)
```

`DoorPatcher.patch_door`:

```python
if door_type.can_be_added is False:
    raise ValueError(f"Door type {door_type} cannot be patched in!")
```

**Any** `door_patches` entry with `"door_type": "phantom_cloak"` on a normal power/charge/… actor is rejected by the patcher. If a fork/old path bypassed the raise, the game would still be loading an actordef that was never designed for that room.

RDV never puts Sensor in `change_to`. AP defaults don’t emit it; UI/`ALL_DOOR_WEAKNESS_NAMES` is the footgun.

### H2 — Patching an unpatchable base door / unknown type

```python
if door_in_scenario_type.can_be_removed is False: raise ValueError(...)
DoorType.get_type(type)  # ValueError: not a patchable door
```

`phase_shift` is in AP `WEAKNESS_DOOR_TYPE` but **not** in ODR `DoorType` enum → immediate patcher failure if ever emitted.

Thermal / powered weaknesses lack `extra.type` in RDV export (explicit `ValueError` in `_door_patches`).

### H3 — Grapple on incompatible docks

RDV DB bans Grapple on specific actors; AP does not. Likely softlock or collision/nav issues; possible crash depending on room. Evidence: non-empty `incompatible_dock_weaknesses` only for Grapple (14 nodes).

### H4 — Shield ID exhaustion

ODR allocates `RandoShield_0..99` per scenario. AP budgets with margin; RDV relies on similar rename/create path. Exhaustion → patcher/runtime failure. Lower priority if budget code stays.

### H5 — One-sided presence → full two-sided door without collision fix

ODR specially widens `doorpresence` collision (`patch_doorpresence_collision`). Converting frames to power+shield is done in RDV tests (even to `bomb`). Still a suspect if AP emits exotic combos RDV’s resolver rarely picks for those rooms.

### H6 — Misattributed non-door crashes

`open-dread-rando-exlaunch/docs/CRASH_PC_196ae0.md` documents a null-deref in main that is **not** proven door-related. Treat door hypotheses separately unless repro ties to `door_patches`.

---

## 4. Redesign proposal — imitate RDV where it matters

### 4.1 Principles

1. **ODR addability is law** — never emit `door_type` with `can_be_added=False` (`phantom_cloak`). Prefer reading ODR `DoorType` flags or a vendored mirror table.  
2. **Reuse the dock DB already in tree** — AP `logic_database/header.json` already contains RDV `change_from` / `change_to` / `dock_rando` config; **stop hardcoding divergent pools**.  
3. **Honor per-node flags** already present on AP region JSON: `exclude_from_dock_rando`, `incompatible_dock_weaknesses`.  
4. **Prefer reach-gated assignment** (RDV DOCKS post-fill) over “roll then soften”; keep soften only as emergency fill repair.  
5. **Two-way + proportion** — implement `force_change_two_way` and `to_shuffle_proportion` from header.  
6. **Expand blast pool only after (4)** — ice/bomb/storm/closed are RDV-legal but need resolver + custom shield assets path AP already forwards via ODR.

### 4.2 Phased plan

**Phase 0 — Safety (tiny, can ship alone)**  

- Constrain option `valid_keys` to RDV-legal sets.  
- Defense-in-depth: refuse to serialize `phantom_cloak` / non-`DoorType` names in `assignments_to_door_patches`.  
- Enforce `incompatible_dock_weaknesses` when picking targets.  
- Optionally: exclude Sensor from `change_from` until presence conversions are validated under AP’s basic pool (stricter than RDV; opt-in later).

**Phase 1 — Data-driven pools**  

- Load `change_from` / `change_to` / unlocked / locked / `dock_rando` config from `logic_database/header.json`.  
- Map weakness → ODR type only from weakness `extra.type` (same as RDV export).  
- Files: `DoorRando.py`, `Options.py`, small `door_rando_db.py` helper.

**Phase 2 — RDV-like assigner**  

- Port or reimplement the post-fill subset of `dock_weakness_distributor.py` against `DreadLogic` reachability (already used for soften/start frontier).  
- Pre-fill: unlock shuffled docks; fill items; then assign locks with reach filters.  
- Files: new `DoorRandoAssigner.py`, hooks in `__init__.py` generate path; tests under `test_door_*.py`.

**Phase 3 — Actor parity**  

- Replace `startswith("door")` with “has Mercury actor + weakness has `type`” (accept `Door036 (PW-PW)` etc., matching RDV export).  
- Keep skipping docks without patchable actors.

**Phase 4 — Closed / intentional dead doors (optional)**  

- Access Permanently Closed once AP has intentional dead-door / resolver rules.  
- Never add Sensor / Phase Shift / thermal / powered.

### 4.3 AP files to change

| File | Change |
|------|--------|
| `DoorRando.py` | DB-driven pools; incompat filter; forbid non-addable types; actor eligibility; optional proportion/two-way |
| `Options.py` | `valid_keys` / defaults from RDV `change_from`/`change_to` ∩ supported ODR types |
| `__init__.py` | Call assigner phases (pre-unlock / post-fill) instead of single roll |
| `logic_database/header.json` | Source of truth (already present); avoid drift |
| `ap_to_patcher.py` | Validate `door_patches` against allowlist before write |
| `test_door_soften.py` / new tests | Sensor never in patches; Grapple never on incompat actors; header pool parity |
| Docs (this file) | Keep updated as phases land |

**Do not** edit Hub Setup Wizard plan files for this workstream.

### 4.4 What to vendor vs reimplement

- **Vendor/read:** weakness tables + per-node flags (already vendored as JSON).  
- **Reimplement lightly:** post-fill weakness picker using AP’s existing reach API (full RDV resolver port is heavy).  
- **Do not vendor:** entire RDV generator; ODR already owns patch mechanics.

---

## 5. Status — Individual Doors assigner (AP)

Shipped:

- **Options / client UI:** `ChangeDoorsTo.valid_keys` and client
  `CHANGE_DOORS_TO_KEYS` are Phase-2 ODR-addable types (beams / missiles /
  grapple / Bomb / Cross Bomb / Power Bomb / Ice / Storm / Diffusion). Never
  Sensor / Phase / Closed. `DoorsToChange` keeps RDV `change_from` (Sensor may
  convert away).
- **`assignments_to_door_patches` + `ap_to_patcher`:** refuse / drop
  `phantom_cloak` and `phase_shift`; patcher allowlists Phase-2 addable types;
  **drop non-patchable Mercury actors** (`doorshutter*`, `doorheat*`, …) so
  ODR never sees Phase Shift shutters.
- **Collect / eligibility:** `physical_key_for_node` uses ODR `ActorData`
  allowlist + `NON_PATCHABLE_SOURCE_WEAKNESSES` (not bare `startswith("door")`).
- **Grapple incompat:** `incompatible_dock_weaknesses` honored in post-fill
  target filter (and exposed via `DoorRando.incompatible_weaknesses_for_key`).
- **Data-driven pools:** `door_rando_db.py` loads `change_from` / `change_to` /
  unlocked / locked / `to_shuffle_proportion` / two-way from
  `logic_database/header.json`; AP uses `reroute_shuffle_proportion` (~0.85).
- **Assigner (`DoorRandoAssigner`):** dual mandate — fill-assist unlocks +
  reroute set → item fill → post-fill weighted reach-gated locks (Power Beam
  not a normal random outcome). Soften remains emergency-only. Shield budget
  covers blast / Ice / Storm / Diffusion.

This is **not** a full RDV resolver port; Closed remains deferred.

---

## 6. Top constraints to treat as must-fix

1. **Never emit `phantom_cloak` / Sensor as a patch target** (`DoorType.PRESENCE.can_be_added is False`).  
2. **Never patch Phase Shift shutters / thermal actors** (`doorshutter*`, `doorheat*` — not in ODR `DoorType` actordefs; seals `door_actor_to_type` ValueError).  
3. **Honor `incompatible_dock_weaknesses` (no Grapple on listed docks)** and `exclude_from_dock_rando`.  
4. **Reach-gate hard locks (RDV post-fill)** — blast / Ice / Storm / Diffusion
   are in the Phase-2 pool and must stay reach-gated. Closed remains deferred
   until intentional dead-door rules exist.

---

## Appendix — ODR `DoorType` add/remove flags (2.10.0)

| `door_type` | `can_be_removed` | `can_be_added` |
|-------------|------------------|----------------|
| frame, power_beam, charge_beam, shields, grapple, closed, … | true (typical) | true (typical) |
| **phantom_cloak** | **true** | **false** |

Source: `open_dread_rando/door_locks/door_patcher.py` class `DoorType`.
