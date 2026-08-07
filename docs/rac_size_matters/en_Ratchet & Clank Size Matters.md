# Ratchet & Clank: Size Matters

An Archipelago implementation for Ratchet & Clank: Size Matters

## FAQ
- [Where is the settings page?](#where-is-the-settings-page)
- [What does randomization do to this game?](#what-does-randomization-do-to-this-game)
- [What options are available?](#what-options-are-available)
- [What is the goal?](#what-is-the-goal)
- [What items can be in another player's world?](#what-items-can-be-in-another-players-world)
- [When the player receives an item, what happens?](#when-the-player-receives-an-item-what-happens)
- [Setup guide](#setup-guide)

## Where is the settings page?

The [player settings page for this game](../player-settings) contains all the options for configuring your randomizer experience.

## What does randomization do to this game?

All weapons, gadgets, armour pieces, and infobots are shuffled into the item pool and placed on the following location
types. Some of these are always in the pool; others are only included when their corresponding option is turned on
(noted below) — the exact total for your seed depends on your settings.

| Location type | Count | Notes |
|---|---|---|
| Titanium Bolts | 20 | Always included. |
| Armour Pickups | 13 (11 without Giant Clank) | Two pieces (Metalis Gloves, Challax Chestplate) require the Giant Clank option. |
| Boss | 1 | Defeating Otto Destruct on Quodrona. |
| Gadget Pickups | 2 | Always included. |
| Weapon Vendors | 11 | Always included — one per weapon's kiosk. |
| Gadget Vendors | 5 | Always included. |
| Weapon Mod Vendors | 13 | Always included. |
| Story Missions | 18 (fewer without Giant Clank/Clank Challenges) | Requires All Missions. Two entries need Giant Clank; one needs Clank Challenges. |
| Cutscenes | 18 | Requires All Cutscenes. |
| Skill Points | up to 19 | Requires Skill Points: 8 on Easy, 19 on Hard (Easy's 8 plus 11 more). Clank Challenge (3) and Skyboard Challenge (2) skill points are controlled by their own separate toggles below, on top of this — 24 in total with everything enabled. |
| Clank Challenge rewards | 6 | Requires Clank Challenges: Item Challenges (or higher). |
| All Clank Challenge completions | 24 | Requires Clank Challenges: All. |
| Skyboard race completions | 4 | Requires Skyboard Challenges: All. |
| Extra Skyboard checks | 4 | Requires Skyboard Challenges: All. |
| Weapon Level (max level) | 13 | Requires Weapon Level Checks: Max Level (or higher). |
| Weapon Level (every level) | 26 | Requires Weapon Level Checks: All. |
| Armour Set Checks | 13 | Requires Armour Set Checks (on by default). |

With every optional location type enabled, the pool tops out at 215 locations.

## What options are available?

The full option list with all details lives on the [player settings page](../player-settings), but here's a summary
of everything specific to this game:

| Option | Default | What it does |
|---|---|---|
| Starting Weapons | 2 | Number of random weapons precollected at the start. |
| Starting Gadgets | 1 | Number of random gadgets precollected at the start (1 grants the Hypershot). |
| Random Starting Planet | Off | Off: always start on Pokitaru and Ryllus, as in vanilla. Logic: two of the seven eligible planets are chosen at random, weighted by how many locations they offer under your other settings. No Logic: the same two-planet pick, but uniformly random instead of weighted. Dreamtime, Inside Clank, and Quodrona are never candidates. |
| Starting Bolts | 45,000 | Bolts precollected at the start. |
| Progressive Weapons | Off | Off: weapons are individual items, leveling works as in vanilla. Manual: a single Progressive Weapon item per weapon caps how far you can level by playing. Automatic: level is set directly from Progressive Weapon items received, no need to play to level up. |
| Progressive Mods | Off | On: one Progressive Mod item per weapon grants mod slots in sequence, instead of each slot being its own item. |
| Progressive Armour | Off | On: armour pieces unlock in a fixed order via Progressive Armour items, instead of as individual pieces. |
| Trap Chance | 0% | Percent chance for each filler item to be replaced with a trap. |
| Trap Weight | equal | Relative weights of each trap type when a filler item rolls as a trap. |
| Trap Duration | per-trap default | How many seconds each trap type stays active once triggered. |
| Weapon Experience Multiplier | Off | Multiplies weapon experience gained, speeding up leveling. Stops applying past level 4. |
| Bolt Multiplier | Off | Multiplies bolts gained from crates/enemies. Doesn't affect one-off AP grants like Starting Bolts. |
| All Missions | On | Adds story mission completions as location checks. |
| All Cutscenes | Off | Adds cutscene/flag-event triggers as location checks. |
| Giant Clank | Off | On: the Giant Clank Metalis and Giant Clank Challax sequences become playable and their completion/armour/skill point checks are added. Off: entering either sequence immediately forces a load back out, as in vanilla before this option existed. |
| Clank Challenges | Item Challenges | Off: none. Item Challenges: only the armour/gadget reward per arena. All: every individual challenge completion is its own check. |
| Skyboard Challenges | Off | All: every individual Skyboard race completion is a separate check. |
| Skill Points | Off | Off: none. Easy: a curated set of easier skill points. Hard: also includes a curated set of harder skill points. Clank Challenge and Skyboard Challenge skill points are controlled separately (see below), regardless of this setting. |
| Enable Clank Challenge Skill Points | Off | Adds skill points earned from Clank Challenge arenas as checks, regardless of the Clank Challenges option. |
| Enable Skyboard Challenge Skill Points | Off | Adds skill points earned from Skyboard Challenges as checks, regardless of the Skyboard Challenges option. |
| Armour Set Checks | On | Treats equipping a complete armour set as a check. Adds 13 locations. |
| Weapon Level Checks | Off | Off: none. Max Level: one check per weapon for reaching level 4. All: one check per weapon per level (1–4). |
| NG+ Items | On | Off: removes RYNO and the Chameleon/Hyperborean armour sets from generation (along with their Weapon Level and Armour Set checks, and Stalker/Ice II, which need a Chameleon or Hyperborean piece), since these are New Game Plus exclusives that would be unobtainable on a fresh playthrough. |
| Death Amnesty | 0 | Number of deaths allowed before items are removed from your inventory on death. Higher is more forgiving. |
| Starting Skin | Default | Cosmetic skin for Ratchet, applied automatically on each planet load. All skins are unlocked in-game regardless of this choice. |

Plus the standard Archipelago options (Death Link, Progression Balancing, Accessibility, Start Inventory From Pool,
etc.) shared across every game.

## What is the goal?

Defeat **Otto Destruct** on Quodrona. The client detects the end-boss cutscene completing and automatically sends goal completion to the Archipelago server.

## What items can be in another player's world?

Any weapon, gadget, armour piece, or infobot. When progressive modes are enabled, you receive `Progressive Weapon`, `Progressive Mod`, or `Progressive Armour` items that unlock each in a fixed order instead.

## When the player receives an item, what happens?

You will be able to visit the planets with whatever infobot you receive, receiving Infobot: Kalidon will unlock Kalidon
for travel within Ratchet's Ship. Upon receiving a weapon it unlocks in ratchet's inventory, which will let you equip it
and use to fire on enemy troops. Progressive upgrades will upgrade your weapons increasing their
firepower.

## Setup guide

See [the Setup Guide](setup_en.md) for full instructions on connecting PCSX2 to Archipelago.
