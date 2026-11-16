# Universal Tracker — first playable version

This APWorld supports Universal Tracker without a local YAML. Install this
APWorld alongside Universal Tracker, generate a NEW run using this version,
then connect UT to your LET IT DIE slot. Your original gameplay options are
restored from slot data before UT reconstructs the world.

Runs generated before tracker schema 1 (R43) need to be regenerated: their item
placement was not generated with these access rules. Updating the APWorld does
not rewrite an existing seed, and no native DLL update is needed for this feature.
Keep the validated R42 native DLL. Restart Archipelago Launcher/client after
installing the APWorld so the new Python code is loaded.

## Access rules

Each boss requires a total number of received character progressives across HP,
STM, STR, DEX, VIT, Luck, Death Bag, Skill Slots and Rage Gauge. Base fighter
values do not add to this count. An eligible weapon and, where specified, armor
must also meet the minimum equipment tier. Higher tiers qualify.

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

| Boss | Character progressives | Weapon tier | Armor tier |
|---|---:|---:|---:|
| 3F Coen | 5 | 1 | None |
| 6F Jin-Die | 10 | 1 | 1 |
| 10F Max Sharp | 15 | 2 | 2 |
| 11F Goto-9, via 11F–13F route | 20 | 2 | 2 |
| 16F Jin-Die | 25 | 2 | 2 |
| 20F Jackson | 35 | 3 | 3 |
| 23F Goto-9 | 45 | 3 | 3 |
| 26F Coen / Jin-Die | 60 | 3 | 3 |
| 30F Crowley | 80 | 4 | 4 |
| 32F U-10 | 100 | 4 | 4 |
| 34F Coen | 110 | 4 | 4 |
| 36F Goto-9 | 120 | 4 | 4 |
| 38F Jin-Die | 130 | 4 | 4 |
| 40F Taro Gunkanyama | 150 | 5 | 5 |

The selected goal still excludes all maps/checks above 10F, 20F, 30F or 40F.
Impossible option combinations are rejected during generation with an explicit
message: for example a 40F goal with maximum tier 2 or fewer than 150 character
progressives. Requirements are never silently reduced to fit the YAML.

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
