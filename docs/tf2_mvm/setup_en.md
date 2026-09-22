# Setup Guide for Team Fortress 2 Mann vs Machine

## Required software

A player needs Team Fortress 2 and nothing more. The randomizer stays on the
server.

The host needs:

- `tf2ap.exe` on Windows, or `tf2ap-linux-amd64` on Linux, from the
  [latest release](https://github.com/m-this/tf2-archipelago/releases/latest).
  Docker works too.
- About 20 GB of disk space. The server downloads about 14 GB at the first
  start.
- The Archipelago app, to generate the seed.

The full guide is the book at
[m-this.github.io/tf2-archipelago](https://m-this.github.io/tf2-archipelago/).

## Configure your YAML

The launcher writes the YAML for you: **Settings**, then **Player options**,
then **Generate seed**. To write it by hand, the options are under
`Team Fortress 2 Mann vs Machine`:

- `mission_count`: how many missions the run uses. Eight is about one evening.
- `difficulty_pool`: the easiest tier the run draws from. The run also draws
  every tier above it.
- `goal`: `final_boss` or `missionsanity`.
- `missionsanity_percentage`: the share of missions Missionsanity asks for.
- `excluded_missions`: missions the run never draws.
- `start_mission` and `start_class`: where the run starts. `random` by
  default.
- `class_weapon_slots`: `off`, `progressive` or `any_order`. Each class earns
  its own slots.
- `mission_ticket_importance`, `class_unlock_importance`,
  `weapon_slot_importance`, `weapon_buff_importance`: `progression`,
  `useful`, or `disabled`. Disabled tickets, classes and slots are all unlocked
  from the start and absent from the reward pool. Disabled buffs never appear;
  spare checks pay cash instead. Tickets, classes and slots default to
  progression, buffs to useful.
- `cash_rewards`: whether spare checks pay cash. Off by default, so every
  spare check pays a weapon buff unless buffs are disabled.
- `weapon_buff_percentage`: with cash on, the share of spare checks that pay a
  buff. The default is 75.
- `weapon_buff_stack_chance`: how often a buff adds a level to one already in
  the seed. The default is 25.
- `trap_percentage`: the share of spare checks that hold a trap. The default
  is 1.
- `victory_caches`, `milestone_checks`, `giantsanity`, `tanksanity`: more
  checks. Off by default.
- `death_link`: off by default. A lost wave kills every linked player, and one
  of their deaths wipes your team.

## Join a game

1. Install the server with the launcher. Press **Start** and wait for the
   download.
2. Generate the seed, upload it at `archipelago.gg/uploads`, and create a
   room.
3. Paste the room address into the launcher and press **Restart**.
4. Give your friends the connect line from the **Join** line. They type it in
   the Team Fortress 2 console, after `password <the server password>` if you
   set one.

The server picks the mission. There is no map vote: the run decides which
mission you play.

## Where the state lives

The bridge holds the Archipelago session and the unlocks, and writes both to
disk. The state survives a restart, a map change and a crash inside a wave.
The game continues when the room is unreachable. The checks arrive when the
room comes back.
