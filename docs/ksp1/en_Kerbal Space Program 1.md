# Kerbal Space Program

**This world is experimental.** Only the default (Normal) difficulty has been thoroughly tested.
Only vanilla (unmodded) KSP is supported - no part mods, planet packs, or other gameplay mods have been tested.
The **Making History DLC** is supported and its parts are **included by default**; if you don't own it,
opt out via the **Enabled Part Packs** option (see Key options) so the seed only uses stock parts.
[Kerbal Engineer Redux](https://github.com/jrbudda/KerbalEngineer) is known to work and is recommended for delta-v readouts.
Please report issues at the [GitHub issue tracker](https://github.com/nickdavies/Archipelago/issues).
Include your player YAML, the AP `.zip` output, your `.apsave` file, and a screenshot if possible.

## How do I configure my options?

This world isn't part of the main Archipelago distribution yet, so it has no online player-options page.
After installing the `.apworld`, create your config from the Archipelago Launcher instead:

- **Options Creator** — a GUI that lists every option for each installed game (Kerbal Space Program 1
  included), lets you set them visually, and exports a ready-to-use YAML.
- **Generate Template Options** — writes a fully-commented template YAML for every installed game to your
  `Players/Templates/` folder; open `Kerbal Space Program 1.yaml`, edit it, and use it as your config.

See the setup guide for step-by-step instructions.

## What does randomization do to this game?

Rocket parts (engines, fuel tanks, capsules, decouplers, etc.) are removed from the normal tech tree and shuffled
into the multiworld item pool. You start with almost nothing and must receive parts from the pool to build
increasingly capable rockets. The game must be played in **Career Mode**.

Instead of the stock science-experiment progression, your location checks are **mission milestones**: first
launch, altitude records, orbits, landings, crew landings, flag plants, sample returns, and more across all 17
bodies in the Kerbol system. Completing a harder mission awards multiple checks at once (e.g., a Mun Sample
Return also counts as a Mun Landing, Crewed Landing, etc.).

You also play **contracts**: native KSP contracts (orbit a body, rescue a stranded Kerbal, transmit science,
plant a flag, and more) injected into your game as items. Accepting and completing a contract checks its
reward location, and under the default goal mode, completing contracts is what unlocks your victory condition.
The orbital and rescue contracts are randomized — each seed hands you different target orbits to fly.

By default, most of the solar system also starts **hidden**. Bodies beyond your home neighbourhood are
invisible (or unlabelled and un-clickable) and award no checks until they're **discovered** — normally by
receiving their **Discover** item, though by default you can also reveal one by flying there (out of logic).
Exploring the Kerbol system is itself part of your progression. See *Hidden bodies* below.

The tech tree is still present but restructured. Tech tree nodes are additional locations that cost science
points to purchase. Science packs (filler items) provide science needed to buy them but you are still expected
to gain science from your regular missions as normal.

## What items and locations get shuffled?

### Items

**Parts** are the core progression items. Every rocket part — engines, fuel tanks, capsules, probe cores,
decouplers, solar panels, relays, heat shields, and so on — is its **own individual item** shuffled into the
multiworld pool. You start with almost nothing and grow your parts catalogue as items arrive. A part is usable
in the VAB/SPH the moment you receive it; generation simply never places a part in a location you couldn't
reach yet, so you are never handed something you can't use.

**Progressive items** are the handful of non-part gates that still advance in tiers:

| Progressive Item | What It Does |
|---|---|
| Progressive R&D (×5) | Unlocks successively higher bands of the tech tree, and (with Buildings In Logic) raises the R&D facility's science-cost cap so you can afford pricier nodes. |
| Progressive Science Instrument (×3) | Advances your science-instrument tier (it feeds the science-point budget). |
| Progressive Astronaut Complex (×2, buildings) | Unlocks EVA — flag planting, EVA in orbit, rescues, and surface samples away from home. Present when Buildings In Logic is on (default). |
| Progressive Tracking Station (×2, buildings) | Extends Deep Space Network range and unlocks patched conics. Present when Buildings In Logic is on (default). |
| Progressive Mission Control (×1, buildings) | Unlocks maneuver nodes for planning transfers and rendezvous. Present when Buildings In Logic is on (default). |
| Progressive Launch Pad (×3, optional) | Raises the launch-pad mass limit so you can fly heavier rockets. Present only if you enable the Progressive Launch Pad option. |

**Science Packs** are filler items that grant science points, used to purchase tech tree nodes.

**Contract items** — one per contract in your seed. Receiving a contract item makes that native KSP contract
available to accept; completing it checks its reward location(s).

**Discover items** — one *Discover &lt;Body&gt;* item per hidden body in your seed (present only when Body
Visibility Mode hides bodies). Receiving one reveals that body and unlocks its missions, contracts, and
science. They are always progression and can be placed anywhere in the multiworld, including another player's
world. See *Hidden bodies* below.

**Other equipment** includes RTGs, batteries, docking ports, landing legs, ladders, reaction wheels, RCS,
science instruments, and more.

**Traps** are **NOT** implemented today but are planned for later.

### Locations

Locations are **mission-based** (plus contracts), not science-experiment-based. You don't run individual
experiments; instead you complete missions and contracts:

- **Starting Inventory** (5–20 slots depending on difficulty) — Zero-requirement locations that bootstrap your
  run. The AP fill algorithm places the items you need to get started here.
- **KSC Biome Checks** (12) — Earned by performing science experiments at KSC buildings (Launch Pad, VAB, R&D,
  Tracking Station, etc.). Each is named *Science from KSC <building>* to make the requirement obvious.
  Only one per building, not each sub-building biome.
- **Home-body Milestones** (11) — First Launch, First Landing, First Crash, altitude records, First Staging.
  Plus a single body-agnostic **Splashdown** check that fires on any ocean body (Kerbin / Eve / Laythe).
- **Body Mission Events** (~231) — Per-body checks across all 17 bodies: Flyby, Orbit, Landing, Crewed Landing,
  Flag Plant, Return, and Sample Return. Each event type has multiple slots.
- **Tech Tree Nodes** (124–248) — Each of the 62 tech nodes has 2–4 location slots (scaled by difficulty).
  Purchasing a node with science points awards these checks.
- **Contracts** (10 by default) — Native KSP contracts injected by the client; completing one checks its reward
  location(s). Under the default Count goal mode, completing contracts is also how you unlock your goal.

## KSC building upgrades (Buildings In Logic)

With **Buildings In Logic** (on by default) your KSC facilities start un-upgraded and you unlock them
by collecting progressive items — they are no longer free from the start. Each facility gates a
different capability:

- **Astronaut Complex** — EVA actions. Planting a flag and doing an EVA in orbit require the upgrade
  (even on your own home body), as do rescues and reaching a Kerbal outside the craft on any body
  other than home.
- **Tracking Station** — Deep Space Network range (a weaker station needs a stronger antenna, so
  distant uncrewed missions and far science transmission require upgrading it) and patched conics.
- **Mission Control** — maneuver nodes, which (together with conics) let you plan transfers and
  rendezvous.
- **Research & Development** — surface samples (a Kerbal collecting surface material needs the R&D
  facility, even at home) and the science-cost cap described below.

Turn Buildings In Logic **off** to play with every facility maxed from the start (closer to a
science-sandbox feel), where no building gates anything.

### Progressive R&D: tech bands *and* the R&D building (this is not a bug)

Progressive R&D does **double duty**, which surprises people — it is working as intended:

1. **Every** Progressive R&D copy unlocks the next **band** of the tech tree — i.e. which nodes you
   are allowed to buy. You get 5 total, and the early bands are deliberately generous (your first
   copy opens several early tiers).
2. **Two of those copies — the 2nd and the 4th — also upgrade the R&D *building* itself.** The
   building level sets KSP's science-cost cap: the price of the most expensive node you may purchase
   (100 → 500 → unlimited science). The 2nd copy raises the building to the middle level (and unlocks
   surface samples); the 4th raises it to max.

So most Progressive R&D items only open new tech, but two of them *also* bump the R&D building. That
is deliberate: the building upgrades are placed so the science-cost cap is **never** the thing
blocking you — the tech band you've unlocked is always the real limit. If you receive an R&D item and
the building does **not** visibly upgrade, that is expected — only the 2nd and 4th copies do.

## Hidden bodies (Body Visibility Mode)

By default some celestial bodies start **hidden** — invisible or unlabelled on the map, off the Tab-cycle,
and unable to award any location checks — until you receive their **Discover &lt;Body&gt;** item. This turns
the Kerbol system itself into progression: you unlock *where* you can go, not just *what* you can fly.

**Body Visibility Mode** decides which bodies start hidden:

- **auto** (default) — chosen from your goal. A goal confined to your home system hides *even the home system*
  (like `home_only`), so you discover your own neighbourhood one body at a time; any wider goal hides
  everything *outside* your home system (like `home_system`).
- **all_visible** — feature off. Every body is visible from the start, exactly as before, and no Discover
  items are added.
- **home_system** — your home body and the rest of its local system are visible; every other body is hidden
  until discovered.
- **home_only** — only your home body is visible; everything else, including the rest of your home system,
  is hidden until discovered.

Your **home body and the Sun are never hidden.** Planets are always discovered before their moons — a moon's
Discover item only becomes reachable once you hold its planet's.

**While a body is hidden it awards no location checks** — its flybys, orbits, landings, samples, and contracts
are dormant until it's revealed. There are two ways to reveal one: receiving its **Discover** item (the
in-logic route, which also restores its map label, targeting, and science), or — when Allow Undiscovered
Bodies is on — simply flying there and entering its SOI. Once revealed by *either* route, its checks fire
normally; a fly-there reveal just isn't something the seed's logic ever relies on.

**Allow Undiscovered Bodies** controls whether you can physically reach a body you haven't discovered:

- **On** (default) — a hidden body's sphere still exists but is uninteractable: no map label, not clickable,
  not Tab-selectable. You *can* fly a probe there anyway — this is **out of logic**, AP never requires it —
  and entering its SOI reveals the body locally, at which point its flyby (and every later) check fires
  normally. That fly-there reveal is remembered across restarts.
- **Off** — a hidden body is fully invisible; its sphere is removed from the game. Flying into its SOI
  **destroys your craft** ("collided with undiscovered body") *before any check can fire* — so with this
  setting the Discover item is the only way to unlock a body's checks. This is intended, not a bug: you flew
  into a body you couldn't see.

Either way, the seed's **logic only ever requires a body's Discover item** to unlock it. The `auto` default
means most players never touch these options — the mode is picked from your goal, and every body you actually
need is gated behind a Discover item the fill algorithm guarantees you can reach.

**Tech-tree interaction (not a bug):** an undiscovered body's science does **not** count toward your science
budget until you discover it. A science-hungry tech tier can therefore stay unaffordable until you have
discovered enough of the system — discovering bodies is part of how you afford the deeper tree. This is why
the Complete Tech Tree goal remains solvable with hidden bodies enabled.

## Which items can be in another player's world?

Any KSP item can appear in another player's world — individual parts, the progressive items (R&D, Science
Instrument, Launch Pad), science packs, contract items, and Discover items can all be placed in other games'
locations.

## What does another world's item look like in KSP?

Items for other players appear as mission checks and tech tree purchases. When you complete a mission or buy a
tech node, any items at those locations are sent to their respective players.

## When the player receives an item, what happens?

When you receive a part, it becomes available in the VAB/SPH for building rockets immediately — there is no
tier to unlock first. Science packs are added to your science balance right away, and receiving a contract
item makes that contract available to accept.

## What is the victory condition?

The victory condition is configurable. Preset goals include:

- **Duna Return** (default) — Return a vessel or crew from Duna.
- **Eeloo Return** — Return from Eeloo.
- **Flag Every Body** — Plant a flag on all 15 landable bodies.
- **Standard Returns** — Return from 11 bodies (excluding Eve, Tylo, Laythe).
- **Standard Sample Returns** — Crewed sample return from the same 11 bodies.
- **Complete Tech Tree** — Purchase all 62 tech tree nodes.
- **Mun Flag** — Plant a flag on the Mun (short run).
- **Mun Sample Return** — Crewed sample return from the Mun (short run).
- **Jool Moons Return** — Return from each Jool moon (Laythe, Vall, Tylo, Bop, Pol). Your home body is
  filtered out, so a Laythe start gives a tight 4-target Jool-system goal.
- **Random Contracts** — No destination goal: complete a number of your available contracts, then plant a
  flag at home to win. Only valid with Goal Contract Mode = count or progressive_unlock.
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
  Expert assumes near-optimal delta-V piloting. **Only Normal has been thoroughly tested so far.**
- **Buildings In Logic** — **On by default.** Gates the Astronaut Complex, Tracking Station, Mission Control, and
  R&D facility as progression, so you unlock EVA, comms/conics, maneuver nodes, and the tech science-cost cap by
  collecting the matching Progressive items (see *KSC building upgrades* above). Turn it off to start with every
  facility maxed.
- **Enabled Part Packs** — Which optional DLC part packs to include. **The Making History pack is enabled by
  default, so the seed uses its parts** — if you do **not** own the Making History DLC you must **opt out** by
  removing `MakingHistory` from this set, or you'll be handed parts you can't build. Stock parts are always
  available regardless.
- **Goal Contract Mode** — How your goal is unlocked. **Count (default):** complete a number of your available
  contracts and the goal is awarded. Other modes: *Findable* (the goal item is in the multiworld pool and found
  like any other item), *Starting* (the goal is granted up front, limited only by physics/parts), and
  *Progressive Unlock* (goal missions unlock one at a time as you complete contracts).
- **Contracts Available** — How many ordinary (non-goal) contracts are placed in the seed (default 10). These
  are side objectives the client tracks; completing them is how Count and Progressive Unlock release your goal.
  Contract mission types and their relative frequency are configurable too.
- **Exclude Late Tech Tree** — Prevents progression items from being placed in tier-8 tech nodes, avoiding a
  late-game science grind if you'd rather focus on flying missions than gaining science.
- **Start With Launch Clamps** — Enabled by default. Disabling makes launch clamps a progression gate for
  interplanetary missions. It is important to note that you might not get any landing legs so disabling this may be seed breaking.
- **Body Visibility Mode** — Which celestial bodies start hidden, revealed by Discover items. **Default `auto`**,
  which picks a sensible mode from your goal (see *Hidden bodies* above). Set to `all_visible` to turn the
  feature off entirely; `home_system` / `home_only` force a specific scope.
- **Allow Undiscovered Bodies** — **On by default.** On: undiscovered bodies are visible-but-uninteractable and
  can be flown to out of logic (arriving reveals them). Off: they are invisible and flying into their SOI
  destroys your craft. Only meaningful when Body Visibility Mode is hiding bodies.

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
- `/explain parts [filter]` — Lists all parts you've received, grouped by type. Optionally filter by
  name (e.g. `/explain parts engine`).

## I am stuck!

Use UT's `/explain` command to see exactly what the logic engine thinks you need for a mission and why
it might not be reachable yet. This is the fastest way to understand what's blocking you.

If you believe a location shown as in-logic is not actually achievable with your current parts, please
file an [issue](https://github.com/nickdavies/Archipelago/issues) with the location name and either your
parts list (from `/explain parts`) or your `.zip` and `.apsave` files.

## Credits

The in-game flags shipped with the client mod are based on the wonderful work of
[1Kerbonaut](https://github.com/1Kerbonaut) from the
[KSP-Style-Flags](https://github.com/1Kerbonaut/KSP-Style-Flags/tree/v1.0) project (v1.0).
Many thanks for making them available!
