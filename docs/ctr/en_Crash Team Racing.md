# Crash Team Racing

## How do I configure the options?

Install `ctr.apworld`, then open the Archipelago Launcher and choose **Generate
Template Options**. Select Crash Team Racing to create a YAML file with every
available setting and value documented inside it. The defaults provide the full
randomizer experience. For a gentler first seed, use vanilla warp-pad unlock
requirements or reduce the two-stage gate and trap settings.

A YAML that sets no content gets the original game's shape: the 18 original race
tracks, 5 Gem Cups, 4 Crystal Challenges and the five garages, shuffled onto the
27 warp pads, with the cup races drawn. The 4 Crystal Challenges are drawn from
all 7 arenas, the 4 original ones and the 3 new ones. Custom tracks and Cortex Vortex join the
same pool. YAML files from v0.2.x need a new look: option names that are gone are
ignored without a message. A v0.2.x room plays on the v0.2.4 client only.

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

## Why do some weapon crates stay ordinary?

On a custom track without hand-placed AP boxes, up to 15 eligible weapon crates become AP boxes. Crates at reviewed excluded positions stay normal weapon crates, including the origin crate in the reviewed Ancient Lake revisions.

Hand-placed AP layouts keep every weapon crate ordinary and use their own spots. A saved room keeps the layout recorded in its seed.

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

### Relic Race Perfect Checks

Each Relic Race gets one check, paid when the race ends with every time crate
broken (the crate counter reads full). It needs the same access as that
track's Sapphire Time Trial. With Progressive Boost on, every perfect check
also needs Ultimate Sacred Fire at every Logic Difficulty, because some time
crates sit on routes that need boost.

### Wumpa Check

With `per_track`, every track with a Trophy Race or CTR Challenge in the seed has
a Wumpa check. A boss track that races nowhere else keeps its Wumpa check, paid
from the boss race. The old `true` and `false` values still work and mean
`global` and `off`.

### Wumpa Shop and Wumpa Goal

With the shop or a Wumpa goal on, every fruit you collect while already holding
10 is banked, and so is the fruit you hold when you finish a race. Fruit you
receive that would take you past 10 is banked too, even outside a race.
Quitting or restarting a race banks nothing you hold, and neither does a race
lost to a DeathLink. Race fruit banks only in Adventure races; Arcade, Time
Trial and Battle bank nothing. While racing, the HUD shows only this race's
fruit. In a hub, a line below the relic, key and trophy counters reads
`WUMPA <spendable fruit>  COLLECTED <total banked over the whole seed>`, and the tracker's
hub map shows how many shop slots that hub has left, how many are on sale and
how many you can afford.

Each hub's save screen has a WUMPA SHOP row, the first in its menu. The shop
lists that hub's slots with their item, its owner and the price; its header
shows the same two numbers as `BALANCE` and `COLLECTED`. Every slot's price is
drawn from its hub's range the same way, so the price says nothing about the
item. Buying spends banked fruit and sends
the check. Later slots go on sale once enough fruit has been banked over the
whole seed; spending never takes that back. A slot that the server checks for
you, for example after a Collect, shows SOLD and costs nothing. Buying needs a
connection to the server. Any slot may hold any item, unless
`wumpa_shop_progression` is `excluded`: then the shop holds no progression
items. In logic a shop slot needs its hub and a repeatable Trophy or CTR race
that banks fruit. Higher prices and shelf unlocks also need later Keys: at the
default `wumpa_shop_logic_scale: 100`, up to 100 fruit needs 0 Keys, 300 needs
1, 600 needs 2, and 900 needs 3. Larger amounts, including 1200 and above,
need all 4 Keys. This uses the higher of the price and lifetime shelf unlock,
and the hub's own Key requirement still applies. Lower logic scale values
expect less farming early; higher values allow more. This option changes
placement and tracker logic independently of prices. You may still farm and
buy before the logic expects it. Previously generated rooms keep their original
shop logic.

Wumpa Goal counts the fruit you banked over the whole seed. With N. Oxide in
your goal, his garage also waits for that count, so beating him completes the
goal.

Prices and shelf unlocks are first values and may change after play testing.

### Boss Track Shuffle

Each of the four boss garages races on a track drawn for your seed: any of
the 16 trophy tracks, Slide Coliseum or Turbo Track. The boss, its attacks,
its Key and the garage door requirement do not change. The garage shows the
drawn track, and so does the in-game tracker. A boss race on another track
pays that track's Wumpa check, and its finish needs whatever that track
needs, such as Ultimate Sacred Fire on Hot Air Skyway with Progressive Boost
on. N. Oxide is not affected. Boss Track Pool narrows the tracks, and it also
takes Cortex Vortex and custom tracks that are in the seed. If it leaves too few
tracks for different boss tracks, generation stops with an error. A boss cup
needs four different tracks of its own.

### Cortex Vortex Track

With `in_pool` the seed may use Cortex Vortex on a warp pad or as a cup race, or
not at all. With `own_pad` it is sure to get a pad. It takes no other content's
checks with it. With Progressive Boost on, its finish checks need two Progressive
Boosts.

### Racer-Locked Warp Pads

A pad can only take a lock if the seed randomized its requirement, so the
always-open N. Sanity Beach starter pads are never locked. When you return to
the hub, the game gives you back the racer you chose.

### Remove Playable Oxide

Oxide stays in the racer select screen as a locked racer you can never
unlock. He still races against you in his boss races, and in ordinary races
once Hit Character adds him to the field.

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
requirement_weights:
  Trophy: 30
  Key: 40
  Sapphire Relic: 40
```

### Warp Pad Rules

Set the first requirement of chosen warp pads yourself. Each entry names a pad
(the pad's name without "Warp Pad") and gives an `item` and a `count`:

```yaml
warppad_unlock_requirements: randomized
warp_pad_rules:
  Crash Cove: {item: free, count: 0}
  "Roo's Tubes": {item: Key, count: 1}
  Red Cup: {item: Red CTR Token, count: 3}
  Skull Rock: {item: AnyRelic, count: 2}
```

`free` needs `count: 0`. The other items are Trophy, Key, a CTR Token colour,
a Relic tier, a Gem colour, and the sums `AnyCtrToken`, `AnyRelic` and
`AnyGem`. Counts are whole numbers from 1 up to what the seed has of that item.
Pads you leave out keep the randomized rule, and a track or cup shuffled onto a
pad takes that pad's rule. Your rules ignore Requirement Weights, only set the
first requirement of a pad (Pads With Two Requirements still adds the second), and
are never changed to make a seed work: a rule that cannot work stops
generation with an error that names the pad, the item and the count. The
option needs randomized or random_without_4_keys unlock requirements, and
random_without_4_keys refuses a rule of 4 Keys.

### Custom Tracks

`custom_tracks` is a list of track packages. Copy each entry from the track's
download rather than writing it. The game checks the track's files against the
entry when you connect. A custom track joins the pool with the original tracks,
so a seed with more tracks than pads may leave it out; list its track key in
`required_entries` to keep it. Cups take custom tracks up to Custom Races Per Cup.
A pad needs the track installed, and the Custom Content page shows what a seed
asks for.

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
