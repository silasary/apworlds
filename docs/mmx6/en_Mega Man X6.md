# Mega Man X6

## What does randomization do to this game?

Weapons, armor parts, tanks, Heart Tanks and the upgrades carried by rescued
Reploids are shuffled into the multiworld item pool. You start with the buster
and the Falcon Armor, exactly as vanilla does, and everything else arrives as a
multiworld item — possibly from someone else's game.

All eight investigation sites are open from the start, as in vanilla, so
routing is yours to decide. (`stage_unlocks` changes that if you want it to.)

## What is the goal?

- **all_mavericks_sigma** (default) — defeat all 8 Mavericks, then reach and defeat
  Sigma. The randomizer also holds Gate's Lab shut until all eight are down,
  so you cannot reach the ending early; see the notes below.
- **all_mavericks_high_max_sigma** — as above, and High Max as well. Gate's Lab
  stays shut until all eight Mavericks are down **and** High Max has been
  beaten in an Another Route, so the longest route through the game is the one
  you have to take. High Max is the *second* Another Route boss, so getting to
  him means clearing one route first — that is the Zero Nightmare, and beating
  it hands you Zero whether or not `zero_unlock` put him in the pool.

  This goal cannot be spoiled by the base game's missable-boss problem. Once
  Gate's Lab opens, High Max is gone from that file for good, so a goal that
  merely *asked* for him could be made impossible by opening the lab first.
  Here the lab cannot open until he is dead.
- **sigma** — defeat Sigma, however you got there. Mega Man X6 does not open
  its endgame on Maverick kills at all: it opens on a Nightmare Soul count of
  3000, and souls drop from Nightmare enemies throughout every stage. So under
  this goal a run can legitimately finish having skipped Mavericks.

## What items and locations get shuffled?

**Items (28 before options):** the 8 special weapons, all 8 armor parts (Blade
and Shadow sets), 8 Heart Tanks, 2 Sub Tanks, the W Tank and the EX Tank.

**Locations (29 before options):** the intro stage, plus per investigation site
— the boss, its Heart Tank, its armor capsule — plus the four tank pickups.

| Option | Effect |
|---|---|
| `reploid_checks` (**on by default**) | **+128 locations** and **+16 items** — every rescuable Reploid becomes a check, and the Life Ups and Energy Ups they carry join the pool |
| `parts_in_pool` (**on by default**) | **+24 items** — the equippable Power-up Parts |
| `zero_unlock` (**on by default**) | **+1 item** — Zero joins the pool instead of being available from the start. Note the game can still unlock him on its own: the first Another Route boss is the Zero Nightmare, and beating it makes him playable with no item involved. Logic never assumes that, because that fight is missable |
| `endgame_checks` (**on by default**) | **+3 locations** — the Gate opening, and clearing Secret Lab 1 and Secret Lab 2. Adds no items, so it can only make room. Clearing Secret Lab 3 is not a check: that is beating Sigma, which is the goal |
| `secret_armors_in_pool` | **+2 items** — Ultimate Armor and Black Zero |
| `stage_unlocks` | **+7 items** — only one investigation site is open at the start, and each of the others needs its own Access Codes |

Every item needs a location, so option sets that ask for more items than the
seed has room for are refused at generation with a message naming what to
change, rather than silently dropping items.

Turning `reploid_checks` off leaves a 29-location seed, which is not really
enough for one player, let alone a multiworld. It is there for completeness.

## Which options change the disc?

**`text_skip`**, **`skip_intro_videos`**, **`exit_stage_anytime`**,
**`protect_reploids`**, **`boss_hp_randomization`**, **`weapon_damage`**,
**`stage_music`**, **`starting_hp`**, **`starting_rank`**,
**`disabled_nightmare_effects`**, **`nightmare_wall_always_open`** and your
**goal** are all applied to the disc
image itself rather than by the client. Patch from the file the seed produced rather than reusing an older
image, and re-patch whenever you change one of them.

With every disc option off, the patched image differs from your clean dump by
exactly **three bytes** — the weapon/kill separation described below.

The first four are **on by default**. The quality-of-life edits are adapted
from acediez's **Mega Man X6 Tweaks**, with every site re-verified against both
supported disc images.

**Player colours** are five more options in your YAML: X, Zero, Shadow, Blade
and Ultimate can each be recoloured from eighteen presets, or `random`. Purely
cosmetic — no items, locations or logic change, and two players in the same
multiworld can pick differently. Falcon Armor and Black Zero are not covered
and keep their usual colours; since X6 starts you in Falcon, `x_palette` shows
once you are playing as plain X or have switched armours. If you want to change
a colour without generating a new seed, your own `host.yaml` can override it
when the patch is opened — the setup guide explains how.

## Anything unusual I should know?

- **Special weapons are separated from boss kills.** In the base game, beating
  a Maverick and gaining its weapon are the same fact in the same byte, which
  is why a randomizer cannot hand you a weapon without also claiming you beat
  its boss. The patch separates them, so weapons become real multiworld items
  and can arrive in any order. One consequence you will notice: the game
  latches your weapon list when a stage starts, so a weapon received mid-stage
  is not selectable immediately. **Dying re-latches it**, so you never have to
  leave the stage to pick it up.
- **Shadow Armor still cannot use special weapons.** That is a real Mega Man X6
  rule and it is left alone, so while you are wearing Shadow you have no
  special weapons no matter what Archipelago has sent you. Nothing is lost —
  pick a different armor at the stage select and they come back. Worth knowing
  before you walk into High Max, who only takes damage from a charged special
  weapon.
- **`protect_reploids` stops Reploids being destroyed, and is on by default.**
  In the base game a Reploid you do not reach in time is gone for the rest of
  the playthrough — a Nightmare carries it off, or it is killed in the
  crossfire, and its slot records "death" or "missing" forever. With this on,
  the three routines that record a Reploid as lost record it as untouched
  instead, so it simply reappears next time you enter the stage. Rescuing is
  unchanged.
- **Losing a Reploid never costs you a check, even with that option off.** The
  client counts a Reploid as checked the moment its slot leaves the untouched
  state, and "destroyed" counts exactly as much as "rescued". So a Nightmare
  that beats you to one costs you the rescue, never the item. This is belt and
  braces on purpose: the option is what lets you go back for it, and this is
  what makes sure a multiworld can never lose an item to it.
- **`disabled_nightmare_effects` switches Nightmare Effects off**, named one
  at a time in any combination, or `all` for every one of them. Each stage can
  be afflicted by exactly two of the eight
  (North Pole gets Fire or Mirror, Magma Area gets Bug or Iron, and so on), so
  turning one off does not clear a stage by itself. Turning **Fire** off puts
  nothing important behind North Pole's ice wall — that wall only opens while
  Fire is on the stage, and nine locations sit behind it (Blizzard Wolfang's
  Heart Tank, his EX Tank and seven Reploids), so they are excluded and hold
  junk. The patch also tries to hold the wall open so you can still collect
  them, but no seed depends on it — unless you set
  `nightmare_wall_always_open`, which is exactly the statement that you want
  it to.

  Two side effects, neither of which costs you a check. **Nightmare Souls get
  much harder to farm**, because the Nightmare Virus only drops a fresh Orb
  after a stage has been afflicted — no check here needs Souls, since the
  endgame opens on your eighth Maverick, but the vanilla 3000-Soul route to
  Gate's Lab effectively closes. **Souls are also what lets you equip Parts**,
  so this is not free: Hunter Rank comes from Souls, separately for X and for
  Zero, and below Rank A — 500 of that character's own Souls — you can equip
  nothing at all. The endgame gate does not care either way:
  under `all_mavericks_sigma` the Souls opening is already switched off on the disc
  (see below).
- **`nightmare_wall_always_open` takes the stage order out of North Pole.**
  Nine of Blizzard Wolfang's locations sit behind an ice wall, and the only
  thing that opens it in the base game is Nightmare Fire being active on his
  stage — which means beating Blaze Heatnix first. Those nine are the only
  checks in the game with a stage-order requirement, and under `stage_unlocks`
  it is a real constraint. Turn this on and the wall is never in your way,
  whatever you have beaten.

  **Expect fire in that room.** The single test this forces does not only gate
  the wall — it selects how the room is set up, so the room runs its
  Fire-afflicted version, hazards and all. That is the room exactly as the base
  game presents it, since Fire being on is the only way anyone gets in there.

  It does **not** switch the effect on. Your Nightmare Effect state is
  untouched: North Pole still shows no Nightmare on the stage select, the
  Nightmare Virus and soul drops behave normally, and no other stage changes.

  Forcing the test rather than the effect is also steadier than the real thing:
  North Pole holds one effect at a time, so beating Shield Sheldon replaces
  Fire with Mirror and shuts the wall again. Vanilla access can be taken away;
  this cannot.
- **`scaravich_no_progression` answers Central Museum's random rooms.** Ground
  Scaravich's stage is assembled from totem-pole rooms the game picks four of
  at random each time you enter, and its Heart Tank, its Blade Armor Helmet and
  fifteen of its sixteen Reploids are behind that roll — so hunting one
  particular check there can mean walking the stage again and again. With the
  option on, every location in that stage holds junk. The checks are still
  real and still send if you go and get them; they are simply never worth
  re-rolling for. It also stops the client holding your Blade Armor Helmet
  back until you find that capsule, which is the one case where the usual
  hold could wait on a room you never see.
- **`no_progression_behind` keeps what you need out of places you would
  rather not go.** Name the kinds of place fill may not hide progression in:
  `spikes` for the Shadow Armor rooms (Rainy Turtloid's Heart Tank, Shield
  Sheldon's Heart Tank and W Tank, Blizzard Wolfang's EX Tank, and the
  Reploids in those rooms), `movement` for what needs Zero or the full Blade
  Armor, `nightmare_wall` for North Pole's ice wall, or `all` for every one of
  them. Nothing is removed and no rule changes — those checks still exist,
  still need exactly what they always did, and still send their item to
  whoever owns it. They just hold junk, so no seed can require you to do that
  kind of thing. An empty list, the default, is the base game's deal where
  anything can be anywhere. Note that an excluded location can only hold junk,
  and a seed with `reploid_checks` off has very little to spare; if you ask
  for more than the seed can fill, generation says so and names the fix.
- **`starting_rank` gives you Part slots you would otherwise have to earn.**
  Hunter Rank is what decides how many Power-up Parts you may equip, and Rank
  is bought with Nightmare Souls — **separately for X and for Zero**. The
  disc's thresholds are 200 (C), 300 (B), 500 (A), 800 (SA), 1200 (GA), 5000
  (PA), 9999 (UH), and below Rank A you can equip **nothing at all**. So in
  the base game the first slot costs 500 of that character's own Souls, which
  is a long way into a run to be handed 24 Parts as items and be unable to
  wear one — and if you play mostly as one character, the other never gets a
  slot. This makes the rank you name free; the ranks above it still cost what
  they always did. Note that rank also drives boss fight level (Lv.2 at SA,
  Lv.3 at GA, Lv.4 at PA and UH), so `rank_a` is the only value that is purely
  a convenience.
- **The endgame is gated on all 8 Mavericks under `all_mavericks_sigma`.** Vanilla
  does not enforce that goal — beating High Max in an Another Route opens
  Gate's Lab early, and there is **no play after the credits**, so reaching the
  ending short would leave you with no way back except a save from before the
  endgame. The disc patch switches off the game's two early openings — 3000
  Nightmare Souls and the High Max route — so the only thing that opens the
  Gate is your eighth Maverick, and the client opens it itself on the eighth
  as a backstop. Under the `sigma` goal nothing is gated.
- **`text_skip` makes dialogue get out of the way.** It removes the in-stage
  Navigator calls, the other in-stage dialogue, the stage-select briefings and
  the Nightmare Souls explanation, and mutes the alert chime. Everything that
  is left — cutscenes, story beats — then types out instantly and advances on
  its own instead of waiting on a button at every box. Mega Man X6 has no
  choice prompts, so nothing is ever answered on your behalf. You will not be
  able to follow the story at this speed; leave it off for a first playthrough.
- **`skip_intro_videos` boots you to the title screen.** It skips the Capcom
  logo and the title-screen opening and stops the attract demos from starting.
  **It does not skip the cutscene that plays when you begin a game** — that
  runs from a different call site, which has not been located. Said plainly
  because an earlier version of this option claimed otherwise and a player
  found out the hard way.
- **`exit_stage_anytime` lets you leave before beating the boss.** A randomized
  run is full of trips into a stage for one check, and of entering stages you
  cannot finish yet. Without this, leaving means dying on purpose. It works
  everywhere, including Another Routes — which the base game gives you no way
  out of at all — and the Intro Stage, which is the one place it has not been
  tested.
- **`stage_unlocks` turns the stage select into a progression gate.** Exactly
  one investigation site is open at the start — the seed picks which — and each
  of the other seven needs its own "&lt;Boss&gt; Access Codes" item. A locked
  site greys out and confirming it does nothing until its codes arrive.
- **`difficulty` picks the game's own difficulty setting.** `easy` gives fewer
  and weaker enemies and a slightly larger starting life gauge, `normal` is the
  standard game, `xtreme` is the hardest. Mega Man X6 is famously punishing, so
  `easy` is a real option rather than a joke setting. It only changes how hard
  the game hits — it can never change what is reachable, so it never affects
  logic or your checks.
- **`boss_hp_randomization` rerolls how tough bosses are.** Every boss gets a
  new health bar between 32 and 127, the range the bar can actually draw. A
  randomized boss has exactly the health it rolled, at every Hunter Rank —
  four of them (Blizzard Wolfang, Metal Shark Player, Shield Sheldon and
  Infinity Mijinion) normally gain health as your Rank climbs, and they no
  longer do once they are randomized. Blaze Heatnix, whose ranks differ in the
  game's own data, keeps his vanilla step between them. A few bosses —
  Nightmare Mother, Dynamo, and High Max's higher ranks — store health in a
  form this does not yet handle and keep their vanilla values. The intro boss
  is never rolled. Rolls are fixed for a seed, so dying and retrying gives you
  the identical fight.
- **`weapon_damage` rerolls how hard your weapons hit.** `weak` is 50–90% of
  normal, `regular` 80–130%, `strong` 120–200%, `chaotic` 25–250%. Each weapon
  rolls **once** and keeps its shape, so a charged shot can never come out
  weaker than the plain shot. **Boss weaknesses are preserved** — a weapon that
  was good against a boss still is, it is just stronger or weaker overall.
  Nothing rolls to zero and instant kills stay instant kills. It stacks with
  `boss_hp_randomization`, and `weak` weapons against randomized boss health is
  a very different game.
- **`stage_music` shuffles the music between stages.** The eleven themes the
  stages already use are dealt back out among them, so every stage still gets a
  real stage theme, every theme is still used somewhere, and **no stage keeps
  the theme it started with**. There are fourteen places and eleven themes, so
  three themes turn up in two places. Places that share music in the base game
  are **split**: Secret Lab 1, 2A and 2B each get their own, and the Secret Lab
  3 boss rush is separated from Sigma. Only stages change — the Stage Select,
  Title Menus, the Mission Report, cutscenes, jingles and the ending all keep
  their vanilla music. A stage sounds the same every time you enter it,
  including the revisits later in the game. Purely cosmetic: it moves no checks
  and changes no logic.
- **`randomize_options` lets the seed choose your settings.** It rolls the
  goal, difficulty, `parts_in_pool`, `zero_unlock`, `secret_armors_in_pool`,
  `text_skip`, `stage_unlocks`, `boss_hp_randomization` and `weapon_damage`,
  and ignores what you wrote for them. `reploid_checks` is left alone because
  turning it off would shrink the seed to 29 locations, and
  `protect_reploids` is left alone because rolling it off would hand you a run
  where checks you can see are quietly destroyed as you play. If the roll asks
  for more items than the seed can hold, `reploid_checks` is turned on to make
  room rather than refusing to generate. Since the roll can enable
  disc-changing options, patch your disc from the file the seed produced.
- **Some items wait until you visit the place they belong.** An armor part or a
  tank you receive is not applied to your save until you have checked that
  part's own location, because setting the bit early stops the capsule or tank
  spawning and would make the location impossible to collect. The client tells
  you when it is doing this and which check releases it. The consequence worth
  knowing: **if you skip a stage entirely, an item held against something in it
  stays held** — you can earn a W Tank in the Secret Lab and never see it
  because you decided not to play Shield Sheldon's stage. Everything held is
  released once you complete the goal.
- **Gauge upgrades apply to both X and Zero.** Each character has his own life
  and weapon gauge and the game normally keeps them in step through its own
  pickup routine, which an Archipelago grant does not go through. The client
  writes both, so playing as Zero gets you everything the seed has sent.
- **The life bar's artwork covers 32 to 64.** Your life can go from 1 to 127
  and all of it plays. Below 32 the bar used to draw the wrong sprites
  entirely; it now stops shrinking at its smallest real size instead, so a
  low-life run looks right. Above 64 the bar runs on past the end of its own
  frame, the way most games in this genre do. Heart Tanks and Life Ups raise
  your maximum and grow the bar as normal in every case.
- **Checks appear a few seconds after a boss dies**, not instantly — the game
  commits the kill at the Mission Report, a little after gameplay ends.
- **Use a fresh save file, and patch your disc.** The client works out what you
  have done by reading the game's memory, so it has to be sure it is reading
  *your* run. Two things it will refuse: a disc that was never patched, and a
  save that already has progress this seed has never seen — a copied memory
  card, the wrong slot, or a savestate from before you connected. In both cases
  it holds everything back and tells you what to do rather than reporting
  progress you did not make. Starting a new game and clearing the intro before
  you open the client is fine.
- **Filler items** — Small and Large Life Energy, Weapon Energy, and Extra
  Lives — pad the pool when there are more locations than real items. A heal
  arriving between stages waits until you are in one, rather than being thrown
  away.

## What does another world's item look like in Mega Man X6?

Nothing is changed visually. Picking up an item that belongs to someone else
grants nothing locally and sends it to its owner.
