# Quake III Arena

Explore maps for checks, receive map access and equipment unlocks from the multiworld, and
work toward your seed's goal. It supports stock Quake III gameplay and the
CPMA 1.53 mod using a custom Quake3e client.

## What is randomized?

Each seed selects from a configurable pool of 60 stages: the 26 stock deathmatch and
tournament maps plus 34 CPMA FFA/duel maps. CPMA stages require CPMA 1.53 and its
`map_cpm*.pk3` map files. The five CTF-only maps are not supported as AP stages.

Checks are: 
- Pickups
- Kills
- Jump Pads
- Teleporters
- Powered-up frags on maps with a major powerup
- Winning a match

The Gauntlet weapon is always available. 
Every other weapon requires its weapon unlock and ammo shares that unlock. 
Health, Armor, Mega Health, powerups, the Personal Teleporter, and Medkit 
use their pickup-family unlocks. 

Pickup locks apply to the human player but bots retain access to spawned items/weapons.

Selected pickup locations send an Archipelago check when the player touches
the spawned, unlocked item, even if their health or armor is full. 
Multi-powerup spawns sharing one spawner are one shared location.

## Checks and goals

Filler includes `+1 Health`, `+1 Armor`, and small ammo refills. The client queues
these rewards until you are alive in an active match and have room for them:
health below its normal maximum (usually 100), armor below twice that maximum
(usually 200), and ammo below 200 for an unlocked weapon you hold. Only the
amount that fits is consumed. The rest carries into later stages during the
same connection; disconnecting or closing the client clears this queue.

Frag milestones count kills credited to the player, not bot-vs-bot kills or self-inflicted deaths.
Jump pads and teleporters count when touched. 
The powered-up-frag check requires a credited frag while a major powerup is active. 

**Stage Clears** requires winning the configured percentage of the selected stages. 
**Quad Token Hunt** instead requires receiving a percentage of the generated Quad Tokens. 
Tokens are progression items in the multiworld pool, not physical Quad Damage pickups.
Picking up Quad Damage is not itself token progress. 

## Filler rewards

Spare item slots choose equally between **Nothing**, **+1 Health**, **+1 Armor**,
and the **ammo rewards** below for weapons found.
Health/armor refills add one point to your current health or armor, not
your permanent maximum, and do not unlock pickups. 
They can exceed 100 up to twice your normal maximum (normally 200). 
A reward received at the cap has no effect.

| Ammo reward | Weapon |
| --- | --- |
| +5 Bullets | Machinegun |
| +2 Shells | Shotgun |
| +1 Grenade | Grenade Launcher |
| +1 Rocket | Rocket Launcher |
| +10 Lightning Ammo | Lightning Gun |
| +1 Slug | Railgun |
| +5 Cells | Plasma Gun |
| +1 BFG Ammo | BFG10K |

Ammo rewards do not unlock or equip weapons. 
Rewards for a locked weapon wait until its unlock arrives. 
Ammo is capped at 200 per type, excess is discarded. 

Refills received in a menu or while dead wait until you are alive in a stage.
They apply once, not on every respawn or replay of received-item history.
Pending refills are session-only.

## Options


- `kill_check_increment`: create a check at every Nth frag (default 5; use 1 for every frag).

- **CPMA** (default false): use the CPMA mod. Enable this before adding
  maps to **CPMA Maps**. Stock Q3 maps can also be played through CPMA.
- **Q3 Maps** and **CPMA Maps**: dictionaries of eligible maps. 
  Set a map  to `1` to include it and `0` or remove it to exclude it.
- **Map Pool Size** (0–60, default 10): number of eligible maps selected at
  random, clamped to the number of enabled maps. Zero uses every enabled map.
- **Goal**: either **Stage Clears** or **Quad Token Hunt**.
- **Goal Percentage** (1–100, default 50): percentage of selected stages to win
  when using the Stage Clears goal.
- **Quad Token Pool Percentage** (1–100, default 25): percentage of item slots
  that would otherwise contain filler replaced with progression Quad Tokens.
- **Quad Token Goal Percentage** (1–100, default 80): percentage of generated
  Quad Tokens required for victory.
- **Weapon Logic Percentage** (0–100, default 50): percentage of distinct weapons
  appearing in a stage required for logical access.
- **Maximum Starting Weapons** (1–8, default 2): maximum weapon unlocks
  precollected to make the chosen starting stage logically accessible.
- **Item Logic Percentage** (0–100, default 50): the same rule for distinct
  non-weapon pickup families.

The two logic percentages are placement logic, not extra lock-outs. 
Once Stage Access arrives, a stage may be played even when the stage menu labels it out of logic. 
The seed precollects the minimum access and unlock subset needed to put the
randomly selected starting stage in logic immediately.
If a small seed has too few locations to hold all required pickup unlocks,
excess unlocks are granted at the start instead of being omitted. 
This safety rule can exceed **Maximum Starting Weapons**. 
That option caps the weapons needed for starting-stage logic, not these overflow grants.

Example pool configuration:

```yaml
cpma: true
q3_maps:
  q3dm0: 1
  q3dm1: 1
cpma_maps:
  cpm3: 1
map_pool_size: 3
custom_included_locations:
  weapon_rocketlauncher: 100
  item_health: 50
  trigger_push: 50
  trigger_teleport: 50
goal: quad_token_hunt
quad_token_pool_percentage: 25
quad_token_goal_percentage: 80
```

Each `custom_included_locations` value is the percentage of that pickup or traversal
classname turned into AP checks. `trigger_push` controls jump pads and
`trigger_teleport` controls teleporters. 
Classnames that are not presentstay vanilla. 
The default lists every classname at 100.
For shared powerup spawners the highest configured percentage of their possible items is used.

## Finding checks and adjusting difficulty

The stage menu shows available maps and their completed/total check counts.
The HUD shows `AP: X/Y` for the current stage. Automap marks eligible unchecked
pickup and traversal locations. Small floating orbs indicate item classification. 
Optional respawn timers distinguish a waiting pickup from a spawned one. 
Checked locations lose their AP markers.

Bot difficulty can be adjusted locally without regenerating the seed. See
the setup guide for `g_spSkill`, per-bot skill spread, the maximum-skill cap,
automap, notification, and timer controls.
