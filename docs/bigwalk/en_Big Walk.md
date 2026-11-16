# Big Walk

## Where is the options page?

The [player options page](../player-options) lets you configure your personal
options and export a config file from them.

## What does randomization do to this game?

### Gourds and monuments

Solving a puzzle still opens it and sends a check, but you don't get its gourd.
Your gourds come from the multiworld instead. They show up at the hub as normal
props you can pick up, and any gourd fits any monument slot.

Every gourd you deposit in a monument is a check. A full monument no longer
releases its tower's key.

### Big keys

Each big key is an item. It drops at the spawn point, uncut and tinted so you
can tell the keys apart. You still cut it along its trail and place it in its
receptacle. Each cut segment is a check, and so is each placement, for 32 checks
over the seven keys.

Placing a key doesn't open anything anymore. The drawbridge, the map room, the
chairlift, the train, the tunnels, the Big Wall Door and the Spawn Secret Door
are their own items. You can end up riding the chairlift long before you find
its key, or finish a key and still wait for someone to send you the ride.

### Radio

Switching on a station at its tower sends a check. The music only plays once
the matching Radio Music item arrives. Set `shuffle_radio_music` to off to keep
the vanilla radio.

Only the host's game talks to Archipelago. If you're a guest, the host's mod
tells yours which stations have arrived, so you hear the same music. A guest
without the mod gets the vanilla radio.

The dial has no labels, just a row of lights, so stations are numbered by
their light from the left: `Radio Station 01: Bobby` is the first,
`Radio Station 07: Bristol` the last.

### Free from the start

The purple postgame gourds are on the map from the start, and the sphere that
blocks the true ending path until you've beaten the game once is gone.

### Arch doors

`start_with_arch_doors_open` lists the hub arch doors that start open. The
others are items. By default only the First Arch Door (the tutorial's way back
to the hub) is open. The left door, towards Sports Creek, and the right door are
items.

With `require_arch_doors` on (the default), the logic expects you to have a door
before it sends you past it:

- Left door: the Yellow, Blue and Black towers, and the Green Dome. Not the
  chapel, which only needs the Big Wall Door.
- Right door: the Green Tower and everything past the chairlift.

The seven purple puzzles past the chairlift also need the **Tunnels** item (the **Purple Tunnel** with
`tunnel_sanity`): it is what opens the purple hole that leads to them.

You can still walk around a closed door, it's only a shortcut. But until it
arrives, the checks behind it are out of logic, and Universal Tracker shows them
as out of reach. Turn `require_arch_doors` off if you don't want the doors in
the logic at all.

For a real early game, take the First Arch Door off the list. You'll then leave
the starting area through the Drawbridge or the First Arch Door, and one of the
two is always found early. With it open, most of the island is reachable right
away.


### Silent Gauntlet

`gauntlet_mode` is `vanilla` by default, so the Gauntlet works as in the game
and has no checks. With `locked_stages`, each of its seven stages is a check and
each way up is an item.

In the game, each stage has two doors. Its puzzle opens a wall inside the stage,
and the stairway to the next stage opens when every player holds its buttons at
the same time. With `locked_stages` those buttons are gone. The puzzle is still
the stage's check, but the wall and the stairway stay shut until the stage's
item arrives (**Gauntlet Stage 1 Door** to **Gauntlet Stage 7 Door**).

- With the **Big Goodbye** goal you need all seven items to win. With another
  goal the Gauntlet is optional: its checks are behind the chapel, so with the
  usual accessibility the Black Monolith Key and the seven items can always be
  found, but the goal doesn't need them.
- `gauntlet_stage_items`: `progressive` (seven Progressive Gauntlet Doors) or
  `individual` (one door item per stage, found in any order).
- `gauntlet_puzzles_required` (on by default): the wall only opens once the
  puzzle is solved and the item has arrived. Turn it off and the item opens the
  wall by itself, so you can skip the puzzles and walk to the top with the seven
  items. The puzzles are still checks.
- `lock_gauntlet_needs` (on by default, even in `vanilla`): when
  `lock_puzzle_needs` is on, the parts inside the Gauntlet (buttons, panels...)
  are items like everywhere else, and Big Goodbye needs them. With
  `locked_stages` the stage checks need them too. Turn it off to leave the
  Gauntlet's parts on the map.
- `gauntlet_stages_local` (on by default): the seven items stay in your own
  world, so another game never holds up a stage.

Everyone needs the same build of the mod.

### Puzzle parts

With `lock_puzzle_needs` (on by default), the things puzzles are built from
become items: buttons, panels, speakers, timers and so on. A puzzle never has an
item of its own and you can always walk in. It's just missing the parts you
haven't received yet. A part isn't on the map until its item arrives, then it
appears everywhere, for everyone.

There are 17: **Buttons**, **Synchronized Buttons**, **Icon Panels**,
**Drawing Panels**, **Pose Panels**, **Sound Panels**, **Point Panels**,
**Speakers**, **Lights**, **Teapots**, **Timed Tomato**, **Golf Ball**,
**Big Head Mask**, **Ink Viewer**, **Counter**, **Coordinates Computer** and
**Terrain Pegs**. Each one covers the whole island: Buttons turns on every
puzzle button, for every player. The logic only expects a puzzle once you have
all its parts. Sometimes you can solve one earlier, never later.

The tutorial's puzzles need parts too, so you start with one, picked at random
among the parts that solve a tutorial puzzle (`start_with_random_puzzle_need`,
on by default). Add more with `start_with_puzzle_needs`.

Never locked: door handles, the train's controls, the hub gates, the lookouts,
the radio stations, the Silent Gauntlet and everything at the end of the game.
When you're at a puzzle with missing parts, the corner of the screen tells you:
`Puzzle parts missing (12): buttons, icon panels, ...`.

**Everyone in a co-op group needs the same build of the mod** for this. The
host tells each guest what's missing, and a guest on another build sees every
part and can use it.

## What is the goal of Big Walk when randomized?

Pick one goal in your YAML:

- **Big Wall**: break the bell inside the Big Wall.
- **Big Goodbye** (default): go behind the Big Wall and complete the Silent
  Gauntlet. Saying farewell afterwards is up to you.
- **Big Game**: reach the secret ending behind the Spawn Secret Door. In the
  vanilla game that path is sealed until you've finished once. The mod removes
  the seal.
- **Big Collection**: place a set number of gourds in the towers' slots.

The corner of the screen shows your goal all session, with a running count for
Big Collection.

### Objectives

`objectives` adds things to do on top of the goal, in any order. You win once
the goal and every listed objective are done. The goal then acts as the run's
ending: `big_wall` (the chapel bell, a short seed without the Gauntlet),
`big_goodbye` (the Gauntlet) or `big_game` (the secret ending). `big_collection`
works too. Empty by default.

`random_objectives` picks that many at random, from your list, or from every
objective your other options allow if the list is empty. 0 (the default) means
the whole list.

```yaml
Big Walk:
  goal: big_wall
  objectives: [big_keys, big_radio, big_climb, big_party]
  random_objectives: 2   # two of these four, picked per seed
```

- **big_collection**: place `gourds_required` gourds.
- **big_keys**: place `keys_required` big keys, the drawbridge's included.
- **big_radio**: switch on `radio_stations_required` radio stations. Needs
  `radio_sanity`.
- **big_climb**: stand on the highest point of the island.
- **big_party** (or big_fiesta): throw the party on the beach by plugging a
  radio into the big speakers with music playing. A **Radio** is always in the
  pool, and with `shuffle_radio_music` you'll need one of the Radio Music items.
- **big_doof** (or big_club): light up the Doof Chamber, the music room in the tunnels: its
  five light switches on and its smoke machine's button held, for ten seconds.
- **big_makeover**: get painted at the Secret Salon, in the tunnels. With
  `everyone_gathers`, every player must be painted there, each in turn.
- With `everyone_gathers` (on by default), big_climb, big_party, big_doof and
  big_makeover want every player there. Their ten seconds tick: once at the
  start, then on each of the last three.
- **big_lights**: switch on `lights_required` percent of the lights at least
  once. Without `light_sanity` the lamps still count, they just aren't checks.
- **big_objects**: send `objects_required` percent of the object checks. Needs
  `object_sanity`.
- **big_body**: receive `body_required` percent of the ability items, Running
  aside. Needs `lock_abilities`.
- **big_towers**: complete `towers_required` towers in the seed's order. A
  tower is complete when its monument is full. Needs `tower_mode` set to
  `in_order` or `by_item`.

An ending only plays once per save, so each objective is saved as soon as you
do it, and the goal is sent with the last one. The objectives are on a board in
the hub, above the resync station's sign, ticked off as you go. Turn on
**Settings > Archipelago > Objectives on screen** to also see them on the
overlay. With `lock_endings_until_objectives` (on by default), the way into the
ending stays shut until the other objectives are done: the Gauntlet's last
stairway, and the printer in the secret room.

`everyone_gathers` (on by default): Big Climb and Big Party only count their
ten seconds while every player is there. Turn it off and one player is enough.

### Towers in order

`tower_mode` sets how the monuments accept gourds:

- **all_open** (default): every monument takes gourds from the start.
- **in_order**: one monument at a time, in an order the seed draws from all
  seven towers (drawbridge and Green Dome included). The next one opens when the
  previous one is full. Until then it refuses gourds, and the button that opens
  its tower doesn't move.
- **by_item**: same order, but each next monument also waits for a
  **Progressive Monument** item. The first monument is open from the start.
  Turn `first_tower_open` off and the first one needs an item too (seven items
  instead of six).

The logic follows the order exactly. The board in the hub shows the order and
whether each tower is full, open or waiting.

### Playing with friends

Both bells need two players pressing two buttons at once, and putting a gourd in
a tower's slot takes two players too. Big Walk can't be played solo, and a whole
co-op group shares one slot. See the setup guide.

## What items and locations can get shuffled?

### Locations

On the default options:

- Each of the 45 puzzles, when you solve it. For the seven purple gourds'
  puzzles, `include_big_game_puzzles` can be `from_start` (default, shown on the
  map), `when_unlocked` (in logic once an ending is reached, not on the map) or
  `disabled` (no checks).
- Each of the 25 key segments, when you cut it (`cut_key_sanity`, which can
  also be `junk` or `off`). Five on the drawbridge's key and each of the four
  colored towers' keys. The Black Monolith and Green Dome keys come already
  finished.
- Each of the 7 big keys, when you place it.
- Each of the 7 radio stations, when you switch it on (`radio_sanity`).
- Gourd deposits in the towers' slots: every gourd, every fifth one, or none
  (`gourd_sanity`). Gourds are counted across all towers, so it doesn't matter
  which tower you fill.
- Each of the 7 towers, when you reach it (`tower_sanity`), and each monument,
  when it's full (`monument_sanity`). With `linear_towers: one_deposit_box`,
  each tower's **Monument Key** as well.
- Each of the 12 packs (6 backpacks, 5 belts and the gourd carton) the first
  time it's picked up (`pack_sanity`). The pack then leaves the map for
  everyone. `junk` keeps the checks but fills them with junk. `vanilla` makes
  each check give the pack itself.
- Each of the 8 firework launchers, the first time you fire it with the button
  at its foot (`firework_sanity`).
- Each of the 4 flare guns, when picked up (`flare_gun_sanity`, or `junk`).

`tower_sanity` counts a tower as reached when its opening button is pressed (the
two buttons at the top of the Black Tower, held together). The drawbridge and
the Green Dome have no button, so it's when a player gets there.
`hint_discovered_key_locations` then hints what's on that tower's key cuts and
key deposit, and `hint_discovered_deposit_boxes` (with `tower_mode`) hints the
gourd deposits in its monument.

Off by default:

- **`object_sanity`**: picking up the island's gadgets. `first_pickup` is the
  first of each kind (16 by default), `every` is each one (144 by default),
  which then leaves the map. `object_sanity_kinds` lists the kinds:
  walkie_talkie, radio, megaphone, binoculars, laser, torch, scanner, clock,
  compass, map, cowbell, lamp and paintbrush (left out by default; the brushes
  never leave the island). Kinds left out are removed from the island, except
  lamps.
- **`light_sanity`**: switching on each light for the first time. `lamps` is the
  83 lamps (pedestals, towers, tutorial...), `lamps_and_switches` adds 19 wall
  switches (Doof Chamber, the music room in the tunnels; salons, tutorial, train and its stops). Puzzle lights
  don't count. With it on, lamps are lights rather than objects.
- The Silent Gauntlet's seven stages (`gauntlet_mode: locked_stages`).

For both sanities, `object_sanity_items` and `light_sanity_items` can be `any`,
`local` (items from your world that nothing needs) or `junk`. With `any`,
`object_sanity_junk_percentage` and `light_sanity_junk_percentage` (75 by
default) still fill that share of the checks with junk.

`zone_locks`, with Object or Light Sanity, locks lamps and gadgets by zone (the
nearest colored tower): 8 items, `Red Zone Lamps`, `Red Zone Gadgets` and the
same for green, blue and yellow. A zone's gadgets aren't on the map until its
item arrives. Its lamps and switches still work but are out of logic until then.
The tutorial, Map Room, chairlift, tunnels and train keep their usual locks.
`start_with_zone_locks` lists the zones you start with (`red_lamps`,
`blue_gadgets`...), and `zone_locks_local` keeps the 8 items in your world.

`tunnel_sanity` opens the tunnels door by door: the **Tunnels** item gives way to
**Red Tunnel Door**, **Green Tunnel Door**, **Blue Tunnel Door**, **Yellow Tunnel
Door** and **Purple Tunnel**. Each colored door opens the outlet by its tower, and
any one of them lets you in. The Purple Tunnel opens the purple hole past the
chairlift, the way to the seven purple puzzles. It is off with `linear_keys`,
where the Yellow key opens every door at once, as in the game.

### Items

- **Gourd**: fits any slot of any tower. There are 45, one per slot.
- The 7 things big keys used to open: **Drawbridge**, **Map Room**,
  **Chairlift**, **Train**, **Tunnels**, **Big Wall Door** and **Spawn Secret
  Door**.
- The 7 big keys: **Drawbridge Key**, **Red Funnel Tower Key**, **Green Cup
  Tower Key**, **Blue Castle Tower Key**, **Yellow Twist Tower Key**, **Black
  Monolith Tower Key** and **Green Dome Tower Key**. Their checks use the same
  names (**Red Funnel Tower Key Cut 1**, **Red Funnel Tower Key Deposit**). A key
  opens nothing, but it's the only way to get its checks. A key can be cut along
  any trail, each station cutting its own segment (Key Cut 1 at a trail's first
  station, and so on). The map's flags show the stations of the key's own trail.
- The 7 Radio Music items, each one making a station play. They're named after
  the song, which the game never shows, and numbered by the station's light.
- **First Arch Door**, **Left Arch Door** and **Right Arch Door**, for the doors
  that don't start open.
- With `gauntlet_mode: locked_stages`, the Gauntlet's stage doors.
- With `lock_puzzle_needs`, the 17 puzzle parts, named with "Unlock":
  **Buttons Unlock**, **Icon Panels Unlock** and so on.
- With `lock_abilities`, the body parts (see below). With `tower_mode: by_item`,
  the Progressive Monuments.
- Gear, separate from the filler: **Backpack**, **Belt** and **Gourd Carton**
  (`backpacks_in_pool`, `belts_in_pool`, `gourd_cartons_in_pool`; with
  `pack_sanity: vanilla`, only the island's own). With `flare_gun_sanity`, the
  four flare guns (**Flare Gun**, **Blue Flare Gun**, **Green Flare Gun**,
  **Yellow Flare Gun**). And in every seed, the **Rainbow Flare Gun**, a white
  flare gun whose shots cycle through every color.
- Filler: the island's hand props (megaphone, walkie-talkie, laser, binoculars,
  compass, folding map, portable radio, torch, scanner, lamp...). They do nothing
  for the logic. Each lands next to you, and its copies on the island are
  removed so you can't pick them up for free. Lamps (marine buoy lights) are the
  exception: they're common scenery, so they stay.
- Traps and bonuses, which replace part of the filler (see below).

`island_object_limits` sets how many of each object the filler takes first, and
how many of each flare gun are in the pool (1 each by default, 0 leaves the
Rainbow out). The walkie-talkie's default is 8, as many as the island has. If
the pool has more room once every object reaches its limit (with Object or Light
Sanity, say), it keeps adding whichever object it has fewest of. An object set
to 0 stays out.

## Your bodies

With `lock_abilities` set to `handed` or `ambidextrous`, what the players' bodies
can do becomes items. Each one applies to every player of the slot at once.

- **Legs**: jumping and crouching. You need both to get past the tutorial, so
  the logic asks for Legs to leave the starting zone. If the zone has no room
  for it, you start with it.
- **Seat**: sitting on chairs, couches, benches, stumps, the Carousel's swings
  and the floor, and on a chair you carry. Turnstiles, telescopes and the
  ending are never locked; the chairlift and the train only with
  `rides_require_seat`, and then the logic asks for Seat to use them.
- **Progressive Arm**: raising the arm, then pointing, then extending it
  sideways. `handed` has three for each arm, `ambidextrous` has three that work
  on both.
- **Throwing** and **Carrying** another player. Big Throw still works without
  Throwing.
- **Running**, with `lock_running`. The logic never needs it.

`rides_require_seat` (off by default) locks the chairlift and the train with the Seat.

`start_with_abilities` lists the ones you start with: `legs`, `seat`, `arms`,
`throwing`, `carrying`. None by default.

Puzzles that need gestures ask for them in logic. The Seat and both arms
extended: Concert, Indoor Semaphore, Optical Telegraph, Charades Rooms,
Pointer's Paradise, Dancer and Selector, and the Gauntlet's last stage. Both
arms raised: Invisible Ink. The Seat: the Carousel and Cannonball Commute, and
the Carousel's binoculars with `object_sanity`, only reached on its swings.
Throwing: Fielding, Window Labyrinth, Basketball and Kick Up Pits. Carrying:
High Button, the two obbies and Pointer's Paradise, and the three Megaphones
with `object_sanity`, hung above one player's reach.

## Closer to the vanilla game

All off by default.

- `linear_towers`: each tower's key comes from its monument, as in the game.
  `all_deposit_boxes` when the monument is full, `one_deposit_box` after a
  random number of gourds per tower, at its **Monument Key** check.
- `linear_keys`: a placed key opens its door, as in the game.
- `linear_puzzles`: every puzzle gives a gourd (next to you, as an item), except
  the seven purple ones past the chairlift.
- `linear_arch_doors`: the hub's arch doors work as in the game, opened by the
  push buttons on their far side. You then leave the starting zone through the
  Drawbridge.

## Making things easier

- `start_with_map_room_open`, `start_with_drawbridge_open`: open from the start.
  The drawbridge's key deposit is still a check.
- `open_black_tower` (on): the Black Tower's door is open from the start. Off,
  it waits for the monuments of the drawbridge and the four coloured towers;
  with `tower_mode` in_order or by_item, it opens at the Black Tower's turn
  (with by_item, its Progressive Monument). The logic waits for it too.
- `hint_keys: from_start`: the seven big keys are hinted from the start.
- `fast_golf`: the golf ball (the cannonball) is no longer too heavy.
- `tower_resync_stations`: a resync station in each of the five towers, at the
  Drawbridge and at the Green Dome Tower. It's a
  button that brings your gourds, keys and gadgets lying around back in front
  of it. The hub always has one. `guests_can_resync` lets guests use them.
- `teleport_buttons`: buttons in the hub that take you to the five towers, the
  Silent Gauntlet, the Drawbridge and the Green Dome Tower. `free`, `with_towers` (once you've opened the place on
  foot) or `items` (each also needs its Teleporter item).
  `teleport_back_to_hub` adds a button back at each destination.
- `cabin_fever_seconds` (300) and `cabin_fever_long_seconds` (1800): how long
  the two Cabin Fever waits last. `cabin_fever_help` and `cabin_fever_long_help`
  hide a button in each room that takes ten seconds off. `cabin_fever_hide_timer`
  and `cabin_fever_long_hide_timer` do the opposite: the dial shows "??:??",
  flashing a digit now and then. The game's sound still plays for the last ten
  seconds.
- `tile_thief`: a button next to the Tile Thief puzzle that makes peg tiles.
  `easy` gives the tiles it expects, `chaos` one of each kind it uses.

## Trackers in the game

- `hint_board` (on): the middle sign of the hub's notice board shows your hint
  points, what a hint costs, and the hints you asked for that aren't found yet.
  Write an item's name on it to ask for a hint (it costs points, like `!hint`).
- `tracker_board`: the right sign counts the checks you can do now against those
  left, and names a few, hinted ones first, then those with progression items.
- `map_tracker`: the big map in the Map Room shows the seed. Each check is a
  little copy of its object on a pin, gone once done. `in_logic` shows only what
  you can do now, `all` shows every check left, out of logic ones in grey.

Each check you send also shows a short line on the overlay: what it was, what
it gave, and to whom.

## Traps and bonuses

Traps and bonuses hit every player of the session, and replace part of the
filler. By default there are no traps (`trap_fill_percentage: 0`) and a quarter
of the filler is bonuses (`bonus_fill_percentage: 25`).

| Trap | What it does |
|---|---|
| **Big Drop** | everyone drops what they're holding |
| **Big Throw** (hard) | everyone winds up, then throws what they're holding. It can't be cancelled |
| **Big Trip** (hard) | everyone is sent to a different place the logic has opened: the hub, a tower, a radio station, a solved puzzle, a launcher fired, a pack picked up. A timed tomato ticks, then pops as you go |
| **Big Meeting** (hard) | everyone is sent around a random player, in a ring, facing them |
| **Big Night** | the clock jumps to midnight for everyone and runs on from there |
| **Big Sleep** (hard) | everyone falls asleep where they stand, two seconds out of seven |
| **Big Load** (hard) | every pack comes off and its contents fall out |
| **Big Mask** (hard) | everyone wears the blindfold puzzles' helmet and can't take it off. Anyone already wearing a puzzle's mask is spared |
| **Big Flare** | a flare shot in the Archipelago colors lands on every player. Each player can hide it on their screen with Gentle effects (see In-game settings) |
| **Big Silence** | everyone is muted, and the mute key can't undo it |
| **Big Slide** | the ground is slippery: starting, stopping and turning slide |
| **Big Time** | every player gets a clock to keep, showing their own computer's time |
| **Big Ghost** | every player turns white, like in the Silent Gauntlet (the color, not the silence) |
| **Big Paint** | players swap colors (two swap, more rotate) |
| **Big Air** (hard) | a timed tomato ticks in everyone's hands, then everyone shoots up into the air (stopping under a ceiling) |
| **Big Goggles** | the field of view narrows |
| **Big Pixels** | the island turns into big square pixels |
| **Big Head** | the other players' heads grow |
| **Big Brain** | the other players' heads become lit lamps |
| **Big Arms** | the players' hands grow (you see it on the others) |
| **Big Smell** | everyone gives off a green gas, and players are pushed apart |
| **Big Brother** | everyone shrinks: body, view and collisions |
| **Big Reset** (hard) | the nearest puzzle that still has its gourd restarts for each group of players (its door shuts and opens) |
| **Big Break** | a folding chair appears under every player, who sits on it |

| Bonus | What it does |
|---|---|
| **Big Speed** | everyone walks and runs faster |
| **Big Jump** | everyone jumps higher |
| **Big Day** | the clock jumps to noon and runs on from there |
| **Big Confetti** | confetti bursts around every player, with the sound of a puzzle solved (filler, just for show) |

Effects that last (Big Sleep, Big Mask, Big Silence, Big Slide, Big Ghost, Big
Paint, Big Goggles, Big Pixels, Big Head, Big Brain, Big Arms, Big Smell, Big
Brother and the bonuses Big Speed and Big Jump) last `trap_duration` seconds, 20
by default.

- `trap_weights` and `bonus_weights`: how often each one comes. 0 removes it.
- `hard_traps` off: only the standard traps.
- `traps_spare_the_gauntlet` (on): Big Trip and Big Meeting leave players inside
  the Silent Gauntlet alone.

Traps arrive through the host, one at a time, about four seconds apart. One that
hasn't played when the game closes is kept in the save. A player who joins
during a lasting effect gets it for the time left. For 20 seconds after a world
loads or a player joins, Big Trip and Big Meeting are skipped, so nobody gets
moved while others are still arriving.

## DeathLink

`death_link` is `off` by default. `send`, `receive` and `both` turn it on.

- **What sends one** (`death_link_triggers`): by default `puzzle_failed`, which
  covers 29 puzzles: a wrong tile validated, buttons pressed in the wrong order,
  a wrong count, a synchronized button let go, a dispenser's timed tomato
  running out. Add `big_fall` to also send one when a fall leaves a player
  dazed. The other games see what happened: "*slot* failed the Blindfold
  Catwalk Puzzle (buttons pressed out of order)". `death_link_amnesty` forgives
  that many before sending one.
- **What happens when one arrives** (`death_link_effect`): `knockout` by
  default. Everyone drops what they hold, takes off their backpacks and belts
  (their contents fall out) and is dazed like after a big fall. `drop` only
  drops. `roulette` plays a trap picked from `death_link_trap_weights`.
  `death_link_roulette_hard_traps` (on) lets the roulette pick hard traps.
- **Who it hits** (`death_link_target`): `everyone` by default, or `one_player`,
  the player hit least so far this session (ties at random). With `one_player`
  and the roulette, Big Meeting and Big Night are left out since they need the
  whole session. Big Drop, Big Throw, Big Trip, Big Sleep, Big Load, Big Mask and
  Big Flare play on that one player.
- **`death_link_trap_on_send`**: when Big Walk sends a DeathLink, its own players
  also get the death effect. Normally only the other games pay for your death.

A knockout from the mod never counts as a fall, so it can't send a DeathLink
back.

### TrapLink

`trap_link` (off by default) joins the multiworld's TrapLink. Traps from your
pool are also sent to every game that has it on, and theirs play here. A trap
from another game plays as the Big Walk trap with the same name, or the closest
one by name (a freeze is **Big Sleep**, a banana is **Big Throw**, a bomb is
**Big Flare**, a teleport is **Big Trip**...), or as a random pick from the
DeathLink roulette if nothing comes close. Bonuses are never sent. Traps that
came from a DeathLink or another game's TrapLink aren't sent back out, so
nothing loops, and a trap you send doesn't play on your own screen.

## Cosmetics

### Colors

With `random_colors` (on by default), the seed picks five to ten of the mod's
ten colors (red, orange, yellow, lime, green, cyan, blue, purple, pink, white)
and paints the island's **buoys** and **flare guns** with them:

- Buoys: body, halo and the light they cast, one color per buoy, the same on
  every screen.
- Flare guns: body, barrel and shot (flare, light and smoke). The four island
  guns take the first four colors, and a gun you receive matches its kind. The
  item feed names a flare gun by its color: "Received: Pink Flare Gun".
- Lasers: one color per laser, its beam included.
- Gadgets (binoculars, clocks, compasses, cowbells, radios, megaphones,
  torches, scanners, walkie-talkies): one color per object, and a torch's light
  takes its color.
- A laser or a gadget you receive gets a color of its own, the same on every
  screen.

Only map objects are painted, never the players, gourds or keys. Turn
`random_colors` off to keep the game's colors.

### Custom tiles

The nine basic peg tiles (triangle, asterisk, diagonal line, G, dot and line,
three dots, S, spiral and e) can show other drawings. Only the picture changes:
every peg tile, split-flap and display of that kind follows, on every screen,
and the puzzles ask for the same tiles.

- **`custom_tiles: matching_games`** (default): the drawings of the games in
  your multiworld, plus pelly (in every multiworld), are added to the nine basic
  tiles, and nine are picked at random.
- **`matching_first`**: the same drawings, but all of them are shown (nine
  picked at random if there are more). The basic tiles fill the remaining
  slots.
- **`all`**: nine picked from every tile. **`custom_only`**: nine picked from
  the drawings only, no basic tile left. **`off`**: the game's tiles.
- **`custom_tile_choices`**: tiles you want for sure (nine at most), whatever
  the mode and weights: `custom_tile_choices: [pokeball, heart, cat]`.
- **`custom_tile_weights`**: how often each tile is picked. 0 leaves it out.
- **`custom_drawings`** (off): community scribbles for the drawing panels (the
  Poet's and the Pontiff's puzzles), each replacing one of the game's 45. None
  yet.
- **`mirrored_poses`** (0): the pose panels (Indoor Semaphore, Optical
  Telegraph, Charades Rooms) picked among the game's nine poses and the mirrors
  of the four that aren't symmetric. A pose and its mirror can both be there:
  tell left from right. The value is how often a mirror is picked against a
  game pose (100 = as often).

The drawings and the games that bring them: pelly (every multiworld), jack (The
Witness), strawberry (Celeste), triforce (Zelda, Link to the Past, Links
Awakening, Ocarina of Time, Majora's Mask, Wind Waker, Minish Cap, Twilight
Princess, Skyward Sword, SMZ3), semibot (R.E.P.O.), star (Mario, Luigi, Yoshi),
smile (Lingo), five (Dice), arrow (Grapple Dog), sword_in_stone (Dark Souls),
lodo (StarCraft), stones_above_banner (RuneScape), pokeball (Pokémon), tree
(Terraria), creeper (Minecraft), sigil (Blasphemous), chicken (Stardew Valley),
planets (Risk of Rain), monster (Slay the Spire), joker (Balatro), rune (DOOM),
knight (Hollow Knight), blob_with_legs (Animal Well), gear (Factorio), hat (A Hat
in Time), heart (Undertale, Deltarune), tunic (Tunic), portal (Portal), cat (Rain
World). A game matches if its name contains one of these, whatever the
capitals (`Super Mario 64`, `Manual_SuperMarioBros3_Someone`). The spoiler log
lists the seed's tiles.

The drawings are by **Jack5**, **Don Chalant**, **GameFraek** and **Kensufox**,
under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Who drew which
is in the mod's repository, in `mod/assets/tiles/LICENSE.md`. They're fan art,
and the games belong to their owners. Want to add your own? See
`mod/assets/tiles/README.md`.

### Gourd name

`gourd_name` renames the gourds for the run, up to 24 characters:
`gourd_name: Plumbus du Destin`. Every game in the multiworld, the Text Client,
Universal Tracker, the spoiler log and the overlay use that name, and
`!hint Plumbus du Destin` finds them (`!hint Gourd` still works). The Gourd
Carton becomes the **Plumbus du Destin Carton**, and `!hint Gourd Carton`,
`!hint Gourd Carrier` and `!hint Plumbus du Destin Carrier` find it. Only the
names change. Locations keep theirs (Gourd Deposit 10, Gourd Carton Pickup).

The name applies to the whole game, not one slot. Every Big Walk slot in the
multiworld has to ask for the same name, or they all keep "Gourd". A name
already used by another Big Walk item or item group (Backpack, Traps...) also
falls back to "Gourd".

## In-game settings

The mod adds **Settings > Archipelago** to the game's settings, at the bottom of
the list, from the main menu or the pause menu. These are saved in the mod's
`.cfg` on each machine, not in the YAML.

| Setting | Who | What it does |
|---|---|---|
| **Archipelago text** | each player | size of the overlay text, top left: Small (16), Medium (22), Large (28), Huge (36) |
| **DeathLink** | host | On follows the YAML. Off turns DeathLink off for this session. Shows "On (not in this seed)" if the seed has no DeathLink |
| **DeathLink amnesty** | host | "Seed's" keeps the YAML's value, 0 to 10 replaces it |
| **Gentle effects** | each player | Off by default. On softens the traps that are hard to look at, on that screen only: no Big Flare, Big Goggles or Big Pixels, Big Smell without its gas, Big Brain's lamps without their light. Nothing else changes |
| **Gourd name** | host | free text, up to 24 characters, applied with Enter or when you leave the field. The overlay says it instead of "Gourd" for every player, and "<name> Carton" for the Gourd Carton |

Guests see the host's settings greyed out ("Set by the host") with the host's
values. This gourd name only exists in the mod. The server, the Text Client and
other games still say "Gourd", because item names are fixed in the apworld. Use
the `gourd_name` option to rename them everywhere.

## Which items can be in another player's world?

Any of them.

## What does another world's item look like in Big Walk?

There's nothing to see in the world. The host's screen names each check as it's
sent ("Check: Cabin Fever"), and the overlay line says what it gave and to whom.
Keep a text client open next to the game for the full log.

## When the player receives an item, what happens?

A gourd drops at the hub as a prop you can pick up, or straight into your hands
if you're playing and they're free. A big key does the same, uncut and tinted.
It goes to a player with free hands first, or else to someone who then puts down
what they're holding.

A door, ride or other unlock works right away, wherever you are. The chairlift
just starts running. A Radio Music item starts its station for the rest of the
run. A filler prop lands next to you. A trap or bonus plays on every player at
once. A puzzle part puts its objects back on the map everywhere.

`Ctrl+R` brings back anything of yours that got stuck somewhere you can't reach:
gourds, keys and filler props, even ones in someone's hands. Placed keys and
deposited gourds stay put, since their checks are already sent.

Unlocks and radio music are applied again each time you load the world, because
the game can't save them itself. If a door you own is shut for a moment after
loading, give it a second.
