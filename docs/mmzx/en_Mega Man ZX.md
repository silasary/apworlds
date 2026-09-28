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

Defeat Serpent at the top of Slither Inc. (D-5). The gate from D-2 into the tower opens once you meet all your chosen
`goal_requirements`. You can pick any number of goal requirements from this list:

- `Biometals`: own `required_models_count` models from the models listed in `required_models`. With `require_full_models` a progressive model
  counts only once you hold both halves.
- `Secret Disks`: collect `required_secret_disks` Secret Disks out of the `total_secret_disks`
  (30) shuffled into the multiworld. 
- `Missions`: complete a number `required_missions` out of the 14 story missions available, in any
  order. The skipped intro mission and the final mission do not count.

The STATUS tab of the pause menu shows your progress, and a popup announces the moment the gate opens (you can also check your goal progress using the command `/mmzx_goal` in the
client). `goal_requirements` must list at least one requirement.

## What items and locations get randomized?

Items:

- Biometals: Model X, Model ZX, Model OX, and the progressive Model HX, FX, LX and PX. The first copy of a progressive
  model gives you the form; the second is the biometal's other half, which unlocks the level 2 charged attack and the
  full Weapon Energy bar. With `progressive_models` off each of the four is a single item that gives both at once.
- The Yellow, Green, Red, Blue and Purple Card Keys.
- Transerver Access for each of the 13 areas with a Transerver (A, B, C, D, E, F, G, I, K, L, M, O and X).
- Four Life Ups, four Sub Tanks and the eight ITEM B chips.
- E-Crystals and 1-Ups as filler.

Locations:

- The 95 Secret Disks.
- The four Life Ups and the three Sub Tanks found in the world.
- Obtaining each of the four biometals, from either Pseudoroid of its pair.
- Completing 14 story missions (Destroy Model W is the goal itself, and the initial mission "Catch the Maverick" is skipped).
- Optionally, the 133 pickups (energy capsules, weapon energy, E-Crystals and 1-Ups). Only the "big" pickups are considered. Small pickups from drops do not count.
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

### The "Open World" state

- The mission of an area is accepted automatically when you enter it (no need to select it from a transerver), so you can play the
  areas in any order without going back to the hub. You DO have to report missions on a transerver.
  - Because of this, do not use the in-game mission select or the "Abort Mission" option.
- All bosses are spawned from the beginning, and you can start the fight with them from both sides.
  - The exception for this rule are Rayfly (B-2) and Giro (D-2).
    - Rayfly requires you to get the nearest "Computer Chip" to the boss area to spawn the boss.
    - Giro requires beating both mini-bosses in the area to spawn
- The MISSION tab of the pause menu gains a fast travel function by pressing "Y". It lets you travel to Transerver locations you've unlocked.
- About Area X:
  - The only way in logic considered to reach Area X is to have it as your starting point or receive the Transerver Access from the multiworld
  - Some story points where the teleport to Area X is granted have been patched
  - The missions "Troop Reinforcement" and "Repel the Army" teleport you to Area X on completion. This teleports are NOT considered in logic.
- Some story gates are open from the start:
  - The F-3 door
    - This means you don't need to beat the mini-boss in this area 
  - The G-2 door to G-4
    - These changes mean you don't have to rescue anyone in area G 
  - The M-1 seal (which normally requires all models)
  - The D-1 bridge
  - The sand fall that hides the pit from K-1 to K-2
  - The D-3 ladder up to the walkway that leads to Area O.
- Troop Reinforcement can be started from D-1, D-2 or D-3 without the base cutscene.
- "Protect HQ" becomes available, when you have completed and reported 4 of the "main" missions (the ones with Pseudoroids in them)
  - To start the mission, teleport to Area X and speak with Prairie (you should have seen the previous cutscene on any transerver when reporting a mission
  - If you take another area's mission in between, Protect HQ resumes as soon as you enter Area X again. Until you report it, the Transerver consoles do not offer "Abort the mission?" (the game treats it as a story mission).
- The gate from D-2 into the Slither Inc. tower opens once you meet your `goal_requirements`.
- With `skip_boss_rush` the Pseudoroid refights of the D-4 tower are skipped and the elevator climbs straight to D-5.
- The mini-bosses that guard a stretch of an area (the King Flyers of D-2, the Lava Demon of K-2 and the others) come back every time you re-enter their area. With `skip_minibosses: after_first_defeat` each one stays beaten once you have beaten it; with `always` they all count as beaten from the start.
  - With `always` the Giro cutscene and boss fight at D-2 triggers right as you walk into it, since that fight required beating both mini bosses and this options marks them as defeated from the start.

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
like any other death: one life is lost and you return to the last checkpoint. It is recommended to give yourself some 1-Ups
through the start inventory option in the YAML to avoid hating all your friends.

## Is there a tracker?

This randomizer is designed to be used with Universal Tracker. UT shows a map tab with the game's own world map, one map per area and one per room, switches to the
room you are in and marks your position. The world ships the map layout; the images come from the separate
[Mega Man ZX tracker pack](https://github.com/Nekusen/MegaManZX-Tracker/releases) (`mmzx_tracker.zip`, kept zipped).
UT asks for the file the first time it needs it; the [setup guide](setup_en.md) says where to set its path.
