# Kerbal Space Program

**This world is experimental.** Only the default (Normal) difficulty has been thoroughly tested.
Only vanilla (unmodded) KSP is supported - no part mods, planet packs, or other gameplay mods have been tested.
[Kerbal Engineer Redux](https://github.com/jrbudda/KerbalEngineer) is known to work and is recommended for delta-v readouts.
Please report issues at the [GitHub issue tracker](https://github.com/nickdavies/Archipelago/issues).
Include your player YAML, the AP `.zip` output, your `.apsave` file, and a screenshot if possible.

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and
export a config file.

## What does randomization do to this game?

Rocket parts (engines, fuel tanks, capsules, decouplers, etc.) are removed from the normal tech tree and shuffled
into the multiworld item pool. You start with almost nothing and must receive parts from the pool to build
increasingly capable rockets. The game must be played in **Science Mode**.

Instead of the stock science-experiment progression, your location checks are **mission milestones**: first
launch, altitude records, orbits, landings, crew landings, flag plants, sample returns, and more across all 17
bodies in the Kerbol system. Completing a harder mission awards multiple checks at once (e.g., a Mun Sample
Return also counts as a Mun Landing, Crewed Landing, etc.).

The tech tree is still present but restructured. Tech tree nodes are additional locations that cost science
points to purchase. Science packs (filler items) provide science needed to buy them but you are still expected
to gain science from your regular missions as normal.

## What items and locations get shuffled?

### Items

**Parts** are the core progression items. They are organized into progressive tiers:

| Progressive Chain | What It Unlocks |
|---|---|
| Progressive Launch Engine | Atmospheric engines: LV-T30/T45, Skipper, Mainsail/Vector |
| Progressive Vacuum Engine | Vacuum engines: Terrier/Spark, Poodle, Nerv/Dawn |
| Progressive SRB | Solid rockets: Flea/Mite, Hammer/Thumper, Kickback/Clydesdale |
| Progressive LFO Tank | Fuel tanks, from Oscar-B up to Jumbo-64 |
| Progressive Heat Shield | Heat shields: small (0.625–1.875m), large (2.5m+) |
| Progressive Stack Decoupler | Stack decouplers/separators: small then large |
| Progressive Radial Decoupler | Radial decouplers |
| Progressive Capsule | Command pods: Mk1, Mk1 Lander/Mk2, Mk1-3 |
| Progressive Probe Core | Probe cores: Stayputnik/OKTO, HECS, HECS2 |
| Progressive Solar Panel | Solar panels: OX-STAT, OX-4W, Gigantor |
| Progressive Relay | Relay antennas: Communotron 16, RA-2, HG-55, 88-88 |

Each progressive tier unlocks a representative part and also **gates other parts in that tier**. For example,
receiving "Progressive Launch Engine 2" unlocks the Skipper as a representative, and also makes other tier-2
engines like the Thud available — but only if you've independently received those parts from the pool. Parts
received before their progressive tier is unlocked will not be available in the VAB.

**Progressive R&D** (3 copies) gates access to higher tiers of the tech tree.

**Science Packs** are filler items that grant science points, used to purchase tech tree nodes.

**Other equipment** includes RTGs, batteries, docking ports, landing legs, ladders, reaction wheels, RCS,
science instruments, and more.

**Traps** Today are **NOT** implemented but are planned for later

### Locations

Locations are **mission-based**, not science-experiment-based. You don't need to run individual experiments;
instead you complete missions:

- **Starting Inventory** (5–20 slots depending on difficulty) — Zero-requirement locations that bootstrap your
  run. The AP fill algorithm places the items you need to get started here.
- **KSC Biome Checks** (12) — Earned by performing science experiments at KSC buildings (Launch Pad, VAB, R&D,
  Tracking Station, etc.). Each is named *Science from KSC <building>* to make the requirement obvious.
  Only one per building, not each sub-building biome.
- **Kerbin Milestones** (13) — First Launch, First Landing, First Crash, altitude records (5km through 70km),
  Splashdown, First Staging, EVA in Orbit.
- **Body Mission Events** (~231) — Per-body checks across all 17 bodies: Flyby, Orbit, Landing, Crewed Landing,
  Flag Plant, Return, and Sample Return. Each event type has multiple slots.
- **Tech Tree Nodes** (124–248) — Each of the 62 tech nodes has 2–4 location slots (scaled by difficulty).
  Purchasing a node with science points awards these checks.

## Which items can be in another player's world?

Any KSP item can appear in another player's world. Progressive parts, Progressive R&D, all other parts and science packs
can all be placed in other games' locations.

## What does another world's item look like in KSP?

Items for other players appear as mission checks and tech tree purchases. When you complete a mission or buy a
tech node, any items at those locations are sent to their respective players.

## When the player receives an item, what happens?

When you receive a part, it becomes available in the VAB/SPH for building rockets. If the part's progressive
tier hasn't been unlocked yet, the part will be held until you receive the corresponding progressive item.
Science packs are added to your science balance immediately.

## What is the victory condition?

The victory condition is configurable. Preset goals include:

- **Duna Return** (default) — Return a vessel or crew from Duna.
- **Eeloo Return** — Return from Eeloo.
- **Eve Return** — Return from Eve (challenge goal).
- **Flag Every Body** — Plant a flag on all 15 landable bodies.
- **Standard Returns** — Return from 11 bodies (excluding Eve, Tylo, Laythe).
- **Standard Sample Returns** — Crewed sample return from the same 11 bodies.
- **Complete Tech Tree** — Purchase all 62 tech tree nodes.
- **Mun Flag** — Plant a flag on the Mun (short run).
- **Mun Sample Return** — Crewed sample return from the Mun (short run).
- **Custom** — Build your own goal from five body-list options: `flag_bodies`, `return_bodies`,
  `sample_return_bodies`, `orbit_bodies`, and `flyby_bodies`. Set goal to `custom` and populate one or
  more of these lists with body names. `orbit_bodies` and `flyby_bodies` accept all 17 bodies including
  Jool and Kerbol; the others only accept landable bodies.

**Short run goals:** When all goal bodies are in the Kerbin system (Kerbin, Mun, Minmus), progression items are
automatically restricted from appearing at interplanetary locations. You will never be forced to fly to Duna or
beyond to complete a Mun-only goal. Interplanetary missions are still available as optional content — they just
won't contain items required for progression.

## Key options

- **Difficulty** — Controls delta-V margins, starting location count, and tech tree density. Casual is forgiving;
  Insane requires exact delta-V piloting. **Only Normal has been thoroughly tested so far.**
- **Item Pacing** — Prevents powerful items from appearing too early. Gentle (default) keeps tier-2 items out of
  starting slots; Strict extends this restriction further.
- **Exclude Late Tech Tree** — Prevents progression items from being placed in tier-8 tech nodes, avoiding a
  late-game science grind if you'd rather focus on flying missions than gaining science.
- **Start With Launch Clamps** — Enabled by default. Disabling makes launch clamps a progression gate for
  interplanetary missions. It is important to note that you might not get any landing legs so disabling this may be seed breaking.

## Tracking In-Logic Locations

KSP1 integrates with the [Universal Tracker (UT)](https://github.com/FarisTheAncient/Archipelago/releases),
a general-purpose tracker that works across all AP games. No YAML file is needed — UT reconstructs the
full logic state from slot data when you connect.

UT connects to the AP server and shows you which unchecked locations are currently in logic, grouped by
body (Kerbin system first, then interplanetary bodies, then tech tree and KSC). It updates automatically
as you receive items and complete checks.

**KSP-specific features via UT:**

- `/explain <location>` — Shows a detailed rocket design for any location: which engines, tanks,
  and equipment logic thinks you need, and why a mission might not be in logic yet.
- `/explain parts [filter]` — Lists all parts you've received, grouped by type. Optionally filter by name.

## I am stuck!

Use UT's `/explain` command to see exactly what the logic engine thinks you need for a mission and why
it might not be reachable yet. This is the fastest way to understand what's blocking you.

If you believe a location shown as in-logic is not actually achievable with your current parts, please
file an [issue](https://github.com/nickdavies/Archipelago/issues) with the location name and either your
parts list (from `/explain parts`) or your `.zip` and `.apsave` files.
