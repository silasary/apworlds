# OpenTTD Archipelago Setup Guide

## Requirements

- Archipelago 0.5.0 or later, for generating a seed.
- The **Multiworld Launcher** (version 3.21.2 or newer) and its OpenTTD plugin,
  for playing one. The launcher installs the patched game for you.

There is no separate download of the game to install by hand.

## Installation

1. Put `openttd.apworld` in your Archipelago `custom_worlds` folder. This is all
   you need to generate a seed.
2. To play, install the Multiworld Launcher, add the OpenTTD plugin to it, and
   click **Install** on the OpenTTD entry in the library. The launcher fetches
   the patched game and keeps it up to date.

## Connecting

**The launcher owns the connection. The game never asks you to log in.**

1. Join the room from the launcher, with your slot name and the server address.
2. Press **Play**.

That is the whole flow. The launcher starts the game, hands it the seed, and the
world is generated or your previous session is loaded — no dialog, no address to
type. Earlier versions had an Archipelago login window inside the game; it no
longer connects to anything.

If the seed needs NewGRF sets you do not have, the launcher offers to fetch them
through OpenTTD's own content service before the game starts.

## Gameplay

- Every vehicle starts locked except the ones the seed grants you at the start.
  New vehicles arrive as items from the multiworld.
- Missions, shop purchases, ruins, stars and demigods are the location checks.
  The status window lists them.
- Infrastructure — track directions, signals, bridges, tunnels, airports, road
  directions, terraforming — is unlocked by items too, so early networks are
  deliberately limited.
- Traps cause temporary setbacks. They run on real time, and pausing does not
  hold them off.

## Win Conditions

`win_difficulty` sets **six** targets at once, and you must meet **all of them
at the same time** to win:

- Company value
- Town population
- Vehicle count
- Cargo delivered
- Monthly profit
- Missions completed

Pick `custom` to set each target yourself. The targets are clamped to what the
seed can actually produce, so a goal is never larger than the world can supply.
