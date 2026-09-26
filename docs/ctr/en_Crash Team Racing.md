# Crash Team Racing

## How do I configure the options?

Install `ctr.apworld`, then open the Archipelago Launcher and choose **Generate
Template Options**. Select Crash Team Racing to create a YAML file with every
available setting and value documented inside it. The defaults provide the full
randomizer experience. For a gentler first seed, use vanilla warp-pad unlock
requirements or reduce the two-stage gate and trap settings.

## What does randomization do to this game?

CTR Archipelago turns Adventure mode into a multiworld. A seed can randomize
warp-pad requirements and destinations, boss garages, hub doors, Gem Cups, and
the items awarded by your events. Your available locations can include Trophy
Races, CTR Token Challenges, relic Time Trials, boss races, Gem Cups, Crystal
Bonus Rounds, Oxide races, and additional finishing-position checks.

Progression comes from items received through Archipelago rather than the local
reward for the event you just completed. The server can send Trophies, Keys,
CTR Tokens, relics, Gems, and other seed-specific items. Warp pads show the
unclaimed rewards at their destination, including an Archipelago marker for
items belonging to another player.

## What do the AP item box colours mean?

With Item Box Locations on, AP item boxes stand on the tracks. By default each
box shows the Archipelago colour of the item inside: purple for progression,
blue for useful, cyan for filler and salmon for a trap. A box is pink until the
game has looked up what is inside, a moment after connecting.

The YAML option Item Box Colours (`color_boxes_by_item`) turns this off for the
whole slot, which is useful for races. Players can also turn the colours off
for themselves in the game under **OPTIONS → Archipelago → Item Box Colours**.
When the YAML turned them off, that row shows **OFF (SEED)** and cannot be
turned on.

## Options in detail

The help text for each option in the YAML is kept short. This section holds
the extra detail for the options that need it.

### Progressive Boost and Progressive Stats

With `per_character`, Progressive Boost adds 2 items per racer (3 with Blue
Fire), so 32 to 48 items, and Progressive Stats adds 3 stats x 4 steps per
racer, so 192 items. Both together can add up to 240 items. In a solo game
every item comes back to you, so most of your checks will give you a
progressive item. If the seed does not have enough locations for them,
generation stops with an error that suggests which options to change.

### Logic Difficulty

Boss races always need your first boost, and more if their track needs it.
Oxide Station needs Ultimate Sacred Fire to finish unless Shortcut Knowledge
is `hard`. Cortex Vortex always needs Ultimate Sacred Fire.

Platinum Time Trials need two boosts on `easy` and `medium`, and three on
`easy` with Progressive Boost: Blue Fire on. `hard` keeps each track's own
Platinum requirement.

### Hit Character Checks

Ripper Roo, Papu Papu, Komodo Joe, Pinstripe and N. Oxide join your opponents
when you win their boss race. Fake Crash joins after Crash Cove or Sewer
Speedway, Penta Penguin after Blizzard Bluff or Polar Pass, and N. Tropy after
Slide Coliseum or Turbo Track. When that race is not in your seed, Keys
unlock the racer instead: Fake Crash at 1 Key, Penta Penguin at 2, N. Tropy at
3 and N. Oxide at 4. Up to three unlocked racers join a race, and racers you
have not hit yet get a seat first.

### Wumpa Check

With `per_track`, Slide Coliseum and Turbo Track only have a Wumpa check when
their Trophy Race is in the seed. If Cortex Vortex Track takes the pad of a
boss track, that track keeps its Wumpa check, paid from the boss race. The old
`true` and `false` values still work and mean `global` and `off`.

### Cortex Vortex Track

Destination shuffle can move Cortex Vortex like any other destination, and it
can be a Gem Cup leg when Randomize Gem Cup Tracks is on. With Progressive
Boost on, its finish checks need two Progressive Boosts.

### Racer-Locked Warp Pads

A pad can only take a lock if the seed randomized its requirement, so the
always-open N. Sanity Beach starter pads are never locked. When you return to
the hub, the game gives you back the racer you chose.

### Trap Weights

The keys are `icy_road`, `low_gravity`, `forced_usf`, `forced_boost`,
`first_person`, `wumpa_wipeout`, `flatten`, `item_reroll`, `forced_use`,
`empty_crates`, `weakened_kart`, `boost_blocker`, `wireframe`, `nitro`,
`reverse_steering`, `red_potion`, `upside_down`, `mirror_mode`,
`warpball_ambush` and `demo_camera`. Each weight is a whole number from 0 to
100. For example, this never picks First Person and picks Icy Road twice as
often as its default:

```yaml
trap_weights:
  first_person: 0
  icy_road: 10
```

### Requirement Weights

For example, to ask for Keys and Sapphire Relics more often than Trophies:

```yaml
requirement_variety: custom
requirement_weights:
  Trophy: 30
  Key: 40
  Sapphire Relic: 40
```

### Custom Tracks

The entry must match a track package this version of the apworld knows,
field for field, so copy it rather than writing it. The game checks the
track's files against the entry when you connect. If they do not match, it
does not load the custom track and the Purple Gem Cup runs its four normal
tracks instead.

## Which items can be in another player's world?

Progression, useful items, filler, and traps may all be placed in another
player's world. Likewise, some of your locations will contain items for other
players. The exact mix depends on the generated multiworld.

## When the player receives an item, what happens?

Received progression updates the gates in Adventure mode. New items appear in
the feed when you return to the hub. Traps arm silently and trigger during a
later race rather than firing the moment they arrive.

Download the paired client and apworld from the
[CTR Archipelago releases page](https://github.com/dowlle/ctr-native-ap/releases),
then follow the [setup guide](https://github.com/dowlle/ctr-native-ap/blob/main/SETUP.md)
to play. Report bugs and stuck seeds on
the [project issue tracker](https://github.com/dowlle/ctr-native-ap/issues).
