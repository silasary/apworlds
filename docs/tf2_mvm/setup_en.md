# Setup Guide for Team Fortress 2 Mann vs Machine

## Required software

A player needs Team Fortress 2 and nothing more. The randomizer stays on the
server.

The host needs:

- Docker with the compose plugin.
- About 20 GB of disk space. The game server downloads about 14 GB at the first
  start.
- A machine that holds a Team Fortress 2 dedicated server and an Archipelago
  server at the same time. Two cores and 4 GB of memory are enough for six
  players.

The compose file of this project holds the other parts. These are the
Archipelago server, the dedicated server, the SourceMod plugin and the bridge.

## Configure your YAML

The options are under `Team Fortress 2 Mann vs Machine`:

- `mission_count`: how many missions the run uses. Eight missions take about
  one evening.
- `difficulty_pool`: the easiest tier that the run can draw. The run also draws
  every tier above it. `normal` allows all of them. `expert` allows Expert and
  Haunted only.
- `goal`: `final_boss` or `missionsanity`.
- `missionsanity_percentage`: how much of the run Missionsanity asks for.
- `death_link`: off by default. A death here is a lost wave: losing one kills
  every linked player, and one of their deaths wipes your team, which loses
  the wave.

## Join a game

1. Copy `deploy/.env.example` to `.env`.
2. Set `SRCDS_RCONPW` and `SRCDS_HOSTNAME` in `.env`.
3. Start the stack with `make up`.
4. Wait. The first start generates a seed and then hosts it. Each later start
   uses the seed in `output/`.
5. Open the Team Fortress 2 console and connect to the address of the server.
6. Type `password <SRCDS_PW>` first if the host set a password.

The server selects the mission. There is no map vote and no mission browser:
the run decides which mission you play.

## Where the state lives

The bridge holds the Archipelago session and the unlock set. It writes both to
disk in the compose volume.

The state survives a restart of the server, a map change and a crash inside a
wave. The bridge writes each check to disk before it answers the game server.
It sends the check again after a reconnection.

The game continues when the Archipelago server is unreachable. The checks
arrive when that server comes back.
