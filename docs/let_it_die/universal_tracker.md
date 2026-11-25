# Universal Tracker — first playable version

This APWorld supports Universal Tracker without a local YAML. Install this
APWorld alongside Universal Tracker, generate a NEW run using this version,
then connect UT to your LET IT DIE slot. Your original gameplay options are
restored from slot data before UT reconstructs the world.

Runs generated before tracker schema 1 (R43) need to be regenerated: their item
placement was not generated with these access rules. Updating the APWorld does
not rewrite an existing seed, and no native DLL update is needed for this feature.
Keep your currently validated native DLL. Restart Archipelago Launcher/client after
installing the APWorld so the new Python code is loaded.

## Access rules

Each boss requires a total number of received character progressives across HP,
STM, STR, DEX, VIT, Luck, Death Bag, Skill Slots and Rage Gauge. Base fighter
values do not add to this count. An eligible weapon and, where specified, armor
must also meet the minimum equipment tier and be wearable with your configured
base stats plus received character stat progressives. Higher tiers qualify.
Native requirement arithmetic is shared with MasterySanity and includes the
actual enhancement of each weapon and armor blueprint. Temporary buffs, decals
and equipment stat bonuses are not assumed.

Bosses requiring armor also require at least FOUR total Death Bag slots: one
weapon, one head, one body and one pair of legs. Coen on 3F requires one slot
for its weapon, since its route has no armor requirement. Skill Slots and Rage
Gauge requirements are actual capacities (starting value plus configured gains),
not a count of those particular progressive items.

Equipment tiers use the existing faction/tier catalogue, not native star rarity
or the number of progressive copies. For example a family with tiers [1,2,4,5]
reaches tier 4 on receipt three. Repeated tiers remain distinct receipts.

With Group Armor Sets disabled, a head, body and legs of the required tier may
belong to DIFFERENT families. With it enabled, one qualifying progressive armor
set supplies all three pieces. Weapons remain separate in both modes.

The minimum route to each boss is accessible after the preceding boss's
requirements. Its boss check requires the current threshold; other maps of
that phase also require that threshold. Initially IKEGARA, IMOKAWA-CHO and
TAMATA are accessible, but Coen needs a tier 1+ weapon and five character
progressives. Other 1F–3F maps stay out of logic until then.

| Boss | Character progressives | Weapon tier | Armor tier | Skill slots | Rage Gauge |
|---|---:|---:|---:|---:|---:|
| 3F Coen | 5 | 1 | None | 0 | 0 |
| 6F Jin-Die | 10 | 1 | 1 | 0 | 0 |
| 10F Max Sharp | 20 | 2 | 2 | 1 | 0 |
| 11F Goto-9, via 11F–13F route | 25 | 2 | 2 | 1 | 0 |
| 16F Jin-Die | 30 | 2 | 2 | 1 | 0 |
| 20F Jackson | 40 | 3 | 3 | 2 | 0 |
| 23F Goto-9 | 50 | 3 | 3 | 2 | 0 |
| 26F Coen / Jin-Die | 70 | 3 | 3 | 2 | 0 |
| 30F Crowley | 80 | 4 | 4 | 3 | 0 |
| 32F U-10 | 95 | 4 | 4 | 3 | 0 |
| 34F Coen | 100 | 4 | 4 | 3 | 0 |
| 36F Goto-9 | 130 | 4 | 4 | 3 | 0 |
| 38F Jin-Die | 135 | 4 | 4 | 3 | 0 |
| 40F Taro Gunkanyama | 150 | 5 | 5 | 4 | 2 |

The selected goal still excludes all maps/checks above 10F, 20F, 30F or 40F.
Impossible option combinations are rejected during generation with an explicit
message: for example a 40F goal with maximum tier 2 or fewer than 150 character
progressives. Requirements are never silently reduced to fit the YAML. Pools that cannot
supply the required capacities or wearable equipment are rejected as well.

New runs carry boss_logic_schema=1 in tracker slot data. Marker-less existing
runs retain their original boss thresholds and equipment rules in UT, matching
their original placements. Generate a new run to use the revised requirements.
For placement, a blueprint must remain wearable through its possible upgrades,
as in MasterySanity; UT uses the actual highest received enhancement of each
unlocked blueprint. Distinct earlier blueprint ranks remain available. Reaper
sets need one wearable head option, not both alternative glasses.

Visits and Haters use their exact map. Minibosses additionally require their
boss threshold. Screamer and Tuber checks remain repeatable aggregate counters
in their existing ten-floor bands; entering the first logical route of the band
enables that band's counters. Detailed per-map Tuber spawn restrictions are not
part of this version. The tracker models logical feasibility, not enforced
barriers in the running game; completing a check out of logic still sends it.

New runs using catalogue version 2 omit Hater checks in the twelve Forcemen
rooms (three per ten-floor band); their Visit checks remain. Legacy runs with
catalogue version 1 keep their original location list when reconstructed by UT.
Removing checks from a seed already hosted on a server requires a new generation;
installing an APWorld does not edit that server's existing seed.
