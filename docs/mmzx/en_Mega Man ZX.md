# Mega Man ZX

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a
config file.

## What does randomization do to this game?

Mega Man ZX becomes an open world. The intro mission is skipped: a new game starts on the Transerver floor you chose in your
options with the model you chose, on Normal difficulty. The biometals, the
Card Keys and the Transerver destinations are items placed somewhere in the multiworld, and the game's collectables and missions are checks. 
Missions are accepted automatically when you enter their area, and they can be done and reported in any order. 

## What is the goal?

The `goal` option picks the goal boss:

- `defeat_serpent` (default): defeat Serpent at the top of Slither Inc. (D-5). The gate from D-2 into the tower opens
  once you meet all your chosen `goal_requirements`.
- `defeat_omega_zero`: defeat Omega Zero in N-1. The door of his arena opens once you meet your `goal_requirements`;
  the rest of Area N is open as always. Slither Inc. stays closed and the checks of D-4 and D-5 are not in
  the multiworld. Area N lies past Area M, so whatever `area_m_access` asks for will be required too.

You can pick any number of goal requirements from this list:

- `Biometals`: own `required_models_count` models from the models listed in `required_models`. With `require_full_models` a progressive model
  counts only once you hold both halves.
- `Secret Disks`: collect `required_secret_disks` Secret Disks out of the `total_secret_disks` shuffled into the multiworld. 
- `Missions`: complete a number `required_missions` out of the 14 story missions available, in any
  order. The skipped intro mission and the final mission do not count.
- `Mutos Reploid Hunting`: beat `required_mutos_reploids` of the eight Mega Man Zero 3/4 bosses of N-1 (see below).
  Up to 4 needs one of `zero3_bosses` and `zero4_bosses` on; 5 or more needs both. It needs your Mega Man Zero 3 and/or
  Zero 4 ROM when you open the patch, like those options.

The STATUS tab of the pause menu shows your progress, and a popup announces the moment the door opens (you can also check your goal progress using the command `/mmzx_goal` in the
client). `goal_requirements` must list at least one requirement.

## The Mega Man Zero 3 and Zero 4 bosses

In the original game, N-1 holds eight capsules that lead to the bosses of Mega Man Zero 3 and Mega Man Zero 4, 
open only with that Game Pak in the second slot. With `zero3_bosses` and/or `zero4_bosses` on,
those capsules are open from the start, and beating each boss is a check (`N-1: Hellbat Schilt`
and so on). They can be named in `boss_logic`.

**These options need your own Mega Man Zero 3 or Zero 4 (GBA) ROM**, USA, Europe or Japan: the game keeps the sprites
of those bosses in the cartridge, so the launcher asks for the ROM the first time you open an `.apmmzx` with the
option on and converts them from it. Only the ROM of a game whose option is on is ever asked for.

## What items and locations get randomized?

Items:
- Biometals: Model X, Model ZX, Model OX, and the progressive Model HX, FX, LX and PX. The first copy of a progressive
  model gives you the form; the second is the biometal's other half, which unlocks the level 2 charged attack and the
  full Weapon Energy bar. With `progressive_models` off each of the four is a single item that gives both at once.
- The Yellow, Green, Red, Blue and Purple Card Keys.
- Transerver Access for each of the 13 areas with a Transerver (A, B, C, D, E, F, G, I, K, L, M, O and X).
  The one of Area M is left out when `area_m_access` closes the seal.
- Four Life Ups, four Sub Tanks and the eight ITEM B chips.
- The eight usable items of the pause menu (ITEM A): Cake, Orange, Candy, Bread, Apple, E Tank, W Tank and
  Smelling Salts.
- With `mission_objectives: locations_and_items`, the story objects (four Computer Chips, the Stuffed Animal and the Data Disks 1, 2
  and 3) as well as door locks/area events (Area F Lock Hack, Sprinkler Key, Lava Flow Control, Area K Door Switch,
  Area D Bridge and Area E Power Shutdown).
- Passwords, only with `area_m_access: passwords`, that enable access to area M.
- Filler: 
  - E-Crystals (25, 50 or 100)
  - Energy Refills
  - Weapon Energy Refills 
  - 1-Ups. With `infinite_lives` they are not included in the pool.

Locations:

- The 95 Secret Disks.
- The four Life Ups and the three Sub Tanks found in the world.
- The eight places that hand out a usable item: the child you rescued in area I (Cake), Lucia (Bread) and Max (Orange) in Area C, the
  crane of H-3 (Candy), the tree of A-3 (Apple), the hanging doll of Prairie's room in X-2 (W Tank), and the
  Guardians Cédre in X-3 (E Tank, 200 E-Crystals) and Scombrésoce in X-1 (Smelling Salts, 20 E-Crystals).
- Obtaining each of the five biometals: Z from Giro, and H, F, L and P from either Pseudoroid of its pair.
- Completing 14 story missions (Destroy Model W is the goal itself, and the initial mission "Catch the Maverick" is skipped).
- Optionally (`mission_objectives`), the objects and events of the story missions: the four Computer Chips of
  Area B, the four guardians of Pass The Test (Oeillet, Carrelet, Congre and Thon) and the Stuffed Animal, the Data
  Disk in the terminal of F-3 and the ones Leganchor and Protectos leave behind, the thirteen people trapped in Area G,
  the generator of E-3, the Lava Flow Control of K-1, the door switch of K-4 and the bridge switch of D-1 (29
  locations).
- Optionally, the 133 overworld pickups (energy capsules, weapon energy, E-Crystals and 1-Ups). Only the "big" pickups are considered. Small pickups from drops do not count.
  - 7 1-Ups
  - 45 Life Energy
  - 25 Weapon Energy
  - 56 E-Crystal

## What has been changed from the base game?

### Starting point

- New Game skips the whole introduction. You start on the Transerver floor chosen in your options
  with the model and the character from your options, on Normal difficulty.

### Items

- Pickups in the world show the item they hold: the game's own icon for a Life Up, Sub Tank, chip, biometal or Card
  Key, and the Archipelago logo for anything else (an arrow for progression, a cross for useful, grey for filler).
  The icons are part of the patched ROM, so they show even while the client is disconnected.
- A pickup that holds a multiworld item cannot be sliced into small pieces with a weapon; once its check is sent
  and it is back to a normal refill, it breaks as usual.
- Items you receive and items you send are announced in the game's own popup without stopping play. The `notify_*`
  options and the `/mmzx_notify` command choose which items are announced and how much text is shown.
- Usable items: the objects handed out in the world are checks; but the usables you hold need to be 
  received from the multiworld. A usable you have used comes back the next time you open any Transerver console.
  The child who gives the cake on your birthday has been tricked to think its always your birthday and gives you the cake when spoken.

### The "Open World" state

- The mission of an area is accepted automatically when you enter it (no need to select it from a transerver), so you can play the
  areas in any order without going back to the hub. You DO have to report missions on a transerver. 
  If you've played Mega Man ZX Advent, the feeling should be similar to how missions felt in that game.
- The "Select Mission" menu has been replaced by a new "Replay Missions" menu. 
  It lists the missions you have already reported, so you can play any of them again. 
  While a mission you picked there is under way, entering an area does not accept that area's mission. Report or abort it to go back to normal.
  - "Abort Mission" now only appears for a mission you picked from that list in the "Replay Mission" menu. 
- All bosses are spawned from the beginning, and you can start the fight with them from both sides.
  - The exception for this rule are Rayfly (B-2) and Giro (D-2).
    - Rayfly requires you to get the nearest "Computer Chip" to the boss area to spawn the boss.
      With `mission_objectives: locations_and_items` it is the Computer Chip item that spawns it, not the ones lying in Area B, so you need to receive it from the multiworld.
    - Giro requires beating both mini-bosses in the area to spawn.
- The MISSION tab of the pause menu gains a fast travel function by pressing "Y". It lets you travel to Transerver locations you've unlocked.
- With `sub_tank_refill_operator` (on by default) a Guardian stands to the right of your starting Transerver. Talk to him 
  and he refills every Sub Tank you hold for 200 E-Crystals.
- About Area X:
  - By default the only ways in logic to reach Area X are to have it as your starting point or to receive its Transerver Access from the multiworld.
  - Some story points where the teleport to Area X is granted have been patched.
  - The missions "Troop Reinforcement" and "Repel the Army" teleport you to Area X on completion. With `include_warps_in_logic` those
    teleports count as a way into Area X: a check there may expect you to clear one of those missions (both can be played again from
    "Replay Missions" if needed). 
- Some story gates are open from the start (this does not apply if you have `mission_objectives: locations_and_items`):
  - The F-3 door
    - This means you don't need to beat the mini-boss in this area 
  - The G-2 door to G-4
    - These changes mean you don't have to rescue anyone in area G 
  - The M-1 seal (which normally requires all models), unless `area_m_access` closes it (see below)
  - The D-1 bridge
  - The sand fall that hides the pit from K-1 to K-2
  - The D-3 ladder up to the walkway that leads to Area O.
- Troop Reinforcement can be started from D-1, D-2 or D-3 without the base cutscene.
- "Protect HQ" becomes available, when you have completed and reported 4 of the "main" missions (the ones with Pseudoroids in them)
  - To start the mission, teleport to Area X and speak with Prairie (you should have seen the previous cutscene on any transerver when reporting a mission
  - If you take another area's mission in between, Protect HQ resumes as soon as you enter Area X again. The Transerver consoles show their normal menu during it, as for any other mission of an area.
- If your goal is "Defeat Serpent", the gate from D-2 into the Slither Inc. tower opens once you meet your `goal_requirements`.
- If your goal is "Defeat Omega Zero", the gate to Omega Zero in area N opens once you meet your `goal_requirements`.
- With `skip_boss_rush` the Pseudoroid refights of the D-4 tower are skipped and the elevator climbs straight to D-5.
- The mini-bosses that guard a stretch of an area (the King Flyers of D-2, the Lava Demon of K-2 and the others) come back every time you re-enter their area. With `skip_minibosses: after_first_defeat` each one stays beaten once you have beaten it; with `always` they all count as beaten from the start.
  - With `always` the Giro cutscene and boss fight at D-2 triggers right as you walk into it, since that fight required beating both mini bosses and this options marks them as defeated from the start.

### Mission objectives

With `mission_objectives` the objects and events of the story missions become checks.

- `locations_only`: picking up a Computer Chip, talking to each guardian of Pass The Test, getting the Stuffed Animal, using the
  terminal of F-3, rescuing each person of Area G, destroying the generator of E-3, setting the lava control of K-1,
  stepping on the door switch of K-4, shooting the bridge switch of D-1 and picking up the Data Disks of J-5 and L-4
  each send a check. Nothing else changes, each path and gate is open from the start, as with the `off` option.
- `locations_and_items`: the same, and what those things gave is now an item of the pool.
  - The Report of a mission needs its object: a Computer Chip for Locate Giro, the Stuffed Animal for Pass The Test and
    the Data Disk 1, 2 or 3 for Find The Survivors, Recover The Disk and Protect The Lab. The objective of the mission is
    still needed. The object stays with you after the Report, so a mission played again can be reported again.
  - Rayfly appears in B-2 once you have a Computer Chip.
  - The terminal of F-3 and the sprinkler key of G-2 are checks, and their doors open with the Area F Lock Hack and the
    Sprinkler Key. These doors are locked only in one direction. You can still go through them the other way (this is something that may change in the future)
  - The lava of Area K is slow only while you hold the Lava Flow Control; the device in K-1 is a check.
  - The door of K-1 on the way to its Sub Tank opens with the Area K Door Switch; the switch in K-4 is a check.
  - The bridge of D-1 is down only while you hold the Area D Bridge; shooting its switch is a check.
  - The machines of Area E stop only while you hold the Area E Power Shutdow. Destroying the generator
    of E-3 is a check.

### The seal of Area M

- The seal in M-1 follows `area_m_access`:
  - `open` (default): it is open from the start.
  - `biometals`: it opens once the five "Obtain Biometal" checks of your own game are done: Z from Giro, and H, F, L
    and P from either Pseudoroid of each pair. Owning the biometals as items does not count.
  - `passwords`: it opens once you have received `required_passwords` Passwords out of the `total_passwords`
    shuffled into the multiworld.
- With `biometals` or `passwords` the Transerver Access of Area M is not in the pool, so nothing gets around the seal.
  Area M and N-1 (which is reached through it) stay closed until it opens. 
- A popup announces the moment the seal opens, and its scene plays the next time you walk up to it. Each Password
  you receive is announced with its count. 

### Door constraints

- With `door_constraints_min` and `door_constraints_max` above 0, each seed locks a number of doors between rooms
  behind a Card Key, a different set every time. 
- The main goal with door constraints is to make spheres more balanced and avoid the feeling 
  of "the game opening up way too fast" that can happen in default settings.
- The doors that already needed a key, the doors inside a room, the Guardian Base and the Slither Inc. tower are never
  changed.

### Cutscenes and menus

- Every story cutscene can be skipped with START, even if it is the first time you see it.


## Which difficulties and logic levels exist?

The game always runs on Normal difficulty. The logic only uses safe routes: no hard-tricks or damage boost is ever expected.
What you can tune:

- `boss_logic` (see [boss_logic.md](boss_logic.md)): for each story boss, what you must be carrying before the logic considers you able to beat it, for
  example `Hivolt: "HX & Life Up x2"`. It never restricts what you may fight in the game; it only keeps the seed from
  forcing you through a boss you are not equipped for by your own standard. A Life Up, Sub Tank or chip named in a
  requirement becomes a progression item.

## Can I play offline?

No. The client grants every item, including your own (nothing is handled locally), accepts missions and
performs the teleports. Keep it connected to the server while you play, also in a single-player game.

## Is DeathLink supported?

Yes, with the `death_link` option. Your deaths are sent, and a received death kills you as soon as you have control,
like any other death: one life is lost (none with `infinite_lives`) and you return to the last checkpoint. It is
recommended to give yourself some 1-Ups through the start inventory option in the YAML, or to turn on
`infinite_lives`, to avoid hating all your friends.

## Is there a tracker?

This randomizer is designed to be used with Universal Tracker. UT shows a map tab with the game's own world map, one map per area and one per room, switches to the
room you are in and marks your position. The world ships the map layout; the images come from the separate
[Mega Man ZX tracker pack](https://github.com/Nekusen/MegaManZX-Tracker/releases) (`mmzx_tracker.zip`, kept zipped).
UT asks for the file the first time it needs it; the [setup guide](setup_en.md) says where to set its path.
UT does not need your YAML for this game: it reads the options of your seed from the server.
