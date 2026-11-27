# Rules model for Splasher

We explain how rules are built for this game. This document will focus on explaining the rule system for the main game (*standard* mode) but will also mention how other rules are computed.

## World model

The world is divided in multiple layers of Archipelago `Regions` which each address a specific ruleset (keys, powers...), starting off with the Hub being the start region (rule-free access).

### Level entrance

Each level gets its own region, gated by an **entrance key** [1]. 
```py
# rules.py

def connect_regions(self):
    (...)

    for lvl in range(SplasherUtils.level_count):
        level = SplasherUtils.level(lvl, True)
        hub.connect(world.get_region(level), f"{level} : Entrance (Time Attack)", __define_key_rule(world, lvl, True))

        level = SplasherUtils.level(lvl, False)
        level_region = world.get_region(level)

        hub.connect(level_region, f"{level} : Entrance", __define_key_rule(world, lvl, False))
        level_areas: list[Region] = []
```

### Level areas

Then, we need to address **power rules** [2]. We split levels in *areas* (defined from one checkpoint to another), where checkpoints inside an area share the same power rules.

Power rules are defined in `rules.py` : entry $j$ in `__checkpoint_rules[i]` is area $j$ for level $i$.
```py
# rules.py

class SplasherArea: 
    __checkpoint_rules: list[list[Tuple[int|None, SplasherPowerRules]]] = [
        # Welcome to Inkorp
        [
            (None, SplasherPowerRules.clean_water) # Area 0 : whole level
        ],
        # Potatoes Ink
        [
            (0, SplasherPowerRules.polluted_water), # Area 0 : from entrance to ckp 0
            (1, SplasherPowerRules.clean_water) # Area 1 : from ckp 1 to level exit
        ],
        (...)
    ]
```

It is important to note that the rule for area $N$ is necessarily stronger than rule for area $N-1$, as the player needs to traverse areas in order.

Then, areas are chained, while the very first is connected to the level's entrance :
```py
# regions.py

for area_id in range(len(areas[lvl])):
    area_name = splasher_area_name(level, area_id)
    area = world.get_region(area_name)
    previous_area = level_region if len(level_areas) == 0 else level_areas[area_id - 1]
    previous_area.connect(area, f"{area_name} : Entrance", areas[lvl][area_id])
    level_areas.append(area)
```

### Checkpoints

Finally, we define checkpoint regions. What's important here is that those regions have **2** entrances : one, from the **parent area**, gated by a **checkpoint item** [3], and another one from the next checkpoint region, which is **rule-free**. Indeed, items (for instance, splashers) inside checkpoint region $N$ can be validated if the player can access any of the next checkpoint regions (not previous regions, since one cannot avoid to validate a checkpoint and then backtrack). With this model, rule-free access is recursive : accessing region $N$ automatically unlocks all previous checkpoint regions (inside a level).

It should be noted that **these regions are only defined if `Checkpoint Sanity` is set to `progression`**, in which case splashers are placed inside checkpoint regions (for instance, the region of the very first reachable checkpoint after grabbing that splasher). Otherwise, splashers are placed in the corresponding **area** (thus only gated by an *entrance key* and *power rules*).

*Note : the following [picture](./model.png) shows what the model looks like.*

[1] : Entrance key items depend on the `IncludeKeys` option.

[2] : Power rules depend on `RandomizePowers` and `Progressive Water` options. Power rules model is defined bellow.

[3] : Checkpoint items depend on `Checkpoint Sanity` and `Checkpoint Packs` option.

## Power rules

Powers can be unlocked independently or progressively :

| Power | Specific item | Progressive level | Progressive level (with progressive water) |
| --- | --- | --- | --- |
| Polluted water | Progressive Water | *excluded* | 1 |
| Clean water | Progressive Water x2 | 1 | 2 |
| Speedink | Progressive Water x3 | *excluded* | 3 |
| Stickink | Stickink Gun | 2 | 4 |
| Bouncink | Bouncink Gun | 3 | 5 | 

Instead of writing repetitive code defining rules on each location for each option, we use an helper to define in one line each rule for a location, then we'll use the correct one with `world.options` :

```py
# rules.py

class SplasherPowerRules:
    def __init__(self, standard: Rule, progressive: int, progressive_with_water: int):
        self.__standard = standard # specific item rules
        self.__progressive = progressive # progressive amount needed
        self.__progressive_with_water = progressive_with_water # progressive with water amount

    # get the correct rule 
    def get(self, powers_opt: RandomizePowers, progressive_water: bool) -> Rule:
        (...)
    
    # Allow to combine class instances with & (progressive : take the highest of the two)
    def __and__(self, other: SplasherPowerRules):
        (...)

    # Allow to combine class instances with | (progressive : take the lowest of the two)
    def __or__(self, other: SplasherPowerRules):
        (...)
```

## Additional notes

- Checkpoint locations are placed inside their respective *area* region
- Splasher rules can optional define a *power rule* if more powers than those required to access the area are required to get it (this is mostly the case for splashers stuck on ceiling). If defined, this **overrides** the area rule.
- Time attack define power rules as powers you should normally have in vanilla. There is sub-regions in the level, as medals are the only locations.
- Vortex splashers are always bound to their area because they collect instantly.
- The level's exit is checkpoint `None` and never has an item gating it (only gated by power rules).