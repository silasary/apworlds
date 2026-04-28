# Names and groups in Rain World Randomizer

## Location groups
A number of location groups are defined.
Location groups can be used in `!hint_location` commands
and in the `priority_locations` and `exclude_locations` setting values.
For instance, `priority_locations: [ Echo, Safari Token ]` sets all echoes and Safari tokens as priority locations.

| Group name                                                | Description                      |
|-----------------------------------------------------------|----------------------------------|
| `Arena Token`<br>`Blue Token`                             | Non-slugcat arena tokens         |
| `Broadcast`<br>`White Token`                              | Broadcasts (Spearmaster)         |
| `Dev Token`                                               | Developer commentary token (MSC) |
| `Echo`                                                    | Echoes                           |
| `Gold Token`<br>`Level Token`                             | Arena level tokens               |
| `Green Token`<br>`Slugcat Token`                          | Slugcat tokens (MSC)             |
| `Flower`                                                  | Flowersanity                     |
| `Passage`                                                 | Passages                         |
| `Pearl`                                                   | Pearls                           |
| `Red Token`<br>`Safari Token`                             | Safari tokens (MSC)              |
| `Shelter`                                                 | Sheltersanity                    |
| `Token`                                                   | All tokens                       |
| Full physical region name<br>(e.g., `Industrial Complex`) | All checks in that region        |

## Item names
### Gate key names
Each gate key has several aliases based on the regions it connects.
A key may be called `Gate: A to B` or `Gate: B to A`,
where `A` and `B` are the names of the two regions which are connected.
For instance, `Gate: Outskirts to Drainage System` and `Gate: Drainage System to Outskirts` both work.
Gate keys can also be called by the name of the gate room - for instance, `GATE_SU_DS`.
The regions in this alias *cannot* be swapped, so `GATE_DS_SU` is invalid
(be sure to read about doubly-connected regions below).

#### Conditional regions
Some regions have a *conditional region* which replaces that region for certain slugcats.
Replacing a region name with a conditional region name also results in a valid key name.
Note that most of Saint's and Sofanthiel's regions are renamed, but these are not conditional regions.

| Region            | Conditional region    |
|-------------------|-----------------------|
| `Drainage System` | `Undergrowth`         |
| `Five Pebbles`    | `The Rot`             |
| `Shaded Citadel`  | `Silent Construct`    |
| `Shoreline`       | `Waterfront Facility` |

This means, for instance, that `Gate: Outskirts to Undergrowth` and `Gate: Undergrowth to Outskirts`
are valid aliases for `GATE_SU_DS`.

#### Doubly-connected regions

There are three pairs of regions which have two gates connecting them.
In these cases, a subregion name is used to differentiate the two.

| Gate         | Region `A`                 | Region `B`            |
|--------------|----------------------------|-----------------------|
| `GATE_SS_UW` | `Five Pebbles`             | `The Wall`            |
| `GATE_UW_SS` | `Underhang`                | `Five Pebbles`        |
| `GATE_SL_MS` | `Shoreline`                | `Bitter Aerie`        |
| `GATE_MS_SL` | `Submerged Superstructure` | `Shoreline`           |
| `GATE_SL_DM` | `The Precipice`            | `Looks to the Moon`   |
| `GATE_DM_SL` | `The Struts`               | `Waterfront Facility` |

This means that `Gate: Waterfront Facility to Looks to the Moon` is not a valid key alias,
since it could refer to `GATE_SL_DM` or `GATE_DM_SL`.
For similar reasons, `Gate: The Exterior to Five Pebbles` is invalid.
`Gate: Shoreline to Submerged Superstructure` *is* valid,
since the other relevant gate key is not currently used (Bitter Aerie is a one-way trip).

## Check names
### Primary checks
For most checks, the name looks like `Region - Type - Name` or `Type - Name`.
If the check exists in a specific place in the game world, `Region` is the full name of that physical region
(e.g., `Industrial Complex`), although internal region codes are also accepted (e.g., `HI`).
Subregions are not accepted and, to avoid collisions with internal region codes,
direct abbreviations (e.g., `IC` for Industrial Complex) are not accepted.
Checks which don't exist in a specific region (or are considered unique) don't have a `Region` in their name.
`Type` and `Name` depend on the check:

| Kind of check       | `Region` | `Type`         | `Name`                                                                                                      |
|---------------------|----------|----------------|-------------------------------------------------------------------------------------------------------------|
| Blue or green token | Physical | `Arena Token`  | ID (e.g., `BigSpider` or `Spearmaster`)                                                                     |
| Yellow token        | Physical | `Level Token`  | ID (e.g., `gutter` or `DS`)                                                                                 |
| Red token           | Physical | `Safari Token` | None (only one per region)                                                                                  |
| Broadcast           | Physical | `Broadcast`    | ID (e.g., `Chatlog_SI3`)                                                                                    |
| Pearl               | Physical | `Pearl`        | ID (e.g., `SI_west`) or wiki color name (`dark green`)                                                      |
| Karma flower        | Physical | `Karma Flower` | Room name, all caps (e.g., `CC_B06`)                                                                        |
| Echo                | Physical | `Echo`         | None (only one per region)                                                                                  |
| Shelter             | Physical | `Shelter`      | Room name, all caps (e.g., `SU_S05` or `LC_SHELTERTRAIN1`)                                                  |
| Food Quest          |          | `Food Quest`   | Wiki names or internal names of food(s) (e.g., `Blue fruit` or `DangleFruit` or `Salamander or Eel Lizard`) |
| Passage             |          | `Passage`      | Passage name (e.g., `The Survivor`)                                                                         |
| Wanderer pip        |          | `The Wanderer` | Pip count (e.g., `5 pips` or `1 pip`)                                                                       |

Here are some examples of complete check names:
- `Shaded Citadel - Arena Token - BigSpider`
- `Subterranean - Level Token - filter`
- `Garbage Wastes - Safari Token`
- `Sky Islands - Broadcast - Chatlog_SI3`
- `Waterfront Facility - Pearl - SL_chimney`
- `Chimney Canopy - Karma Flower - CC_B06`
- `The Exterior - Echo`
- `Undergrowth - Shelter - UG_S03`
- `Food Quest - Red Centipede or Aquapede`
- `Passage - The Chieftain`
- `The Wanderer - 7 pips`

### Unique checks
The remaining unique check names look like `Region - Name` (except for one):
- `Eat a Neuron Fly`
- `Five Pebbles - Ascend Five Pebbles`
- `Five Pebbles - Meet Five Pebbles`
- `Looks to the Moon - Meet Looks to the Moon`
- `The Rot - Remove Rarefaction Cell`
- `Shoreline - Ascend Looks to the Moon`
- `Shoreline - Gift a Neuron Fly to Looks to the Moon`
- `Shoreline - Meet Looks to the Moon`
- `Shoreline - Revive Looks to the Moon`
