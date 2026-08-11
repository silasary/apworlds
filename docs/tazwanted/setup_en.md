# Taz Wanted — Setup Guide

## What you need

- Archipelago 0.5.0 or newer
- PCSX2 2.0 or newer, with **PINE** enabled
- A Taz Wanted (PS2) disc image, `SLUS-20236`

## Enabling PINE in PCSX2

Settings → Advanced → tick **Enable PINE**, and leave the slot at `28011`.
The client talks to the emulator through it; nothing works without it.

## Playing

1. Start Archipelago and launch **Taz Wanted Client** from the launcher.
2. Connect it to the room, then to your slot.
3. Start PCSX2 and load the game.
4. **Set the difficulty to match your yaml** before starting a file. The
   client warns you if they disagree, but by then some checks may already be
   unreachable.
5. Start a new file. Any of the three slots works.

The client writes nothing until a save file is loaded, so it is safe to leave
running at the title screen.

## Commands

Typed into the client:

| Command | What it does |
| --- | --- |
| `/taz` | Mode, locations sent, unlocks, and what the goal still needs |
| `/goal` | In Open, each goal condition and how far along it is. In Linear, every poster gate and which ones are open |
| `/difficulty` | What the game is set to versus what your yaml expects |
| `/deathlink` | Turn DeathLink on or off, overriding the yaml |
| `/resync` | Rebuild everything from the server's item list |

`/resync` is rarely needed — the client does it on connect — but it is the fix
if the game ever looks out of step with what you own.

## Saving and reloading

The client is the source of truth, not the save file. It records what it has
sent and rebuilds your unlocks from the server every time it connects, so save
states, reloading a file, and reconnecting mid-session are all safe. You cannot
lose an item by reloading, and you cannot send a check twice.

## Game modes

**Open** shuffles level access into the multiworld. Every level, boss, costume
and bonus game is an item, and you choose what the goal requires: Wanted
Posters, boss defeats, the Hindenbird's own unlock, or any combination.

**Linear** leaves the game's own progression alone. Levels unlock as they
normally would, but each boss is gated behind a number of Wanted Posters.
Costumes and bonus games are still shuffled.

## Things worth knowing

- Levels you have not unlocked read **LOCKED** on the hub signs.
- A boss gate tells you what you are still missing.
- In Linear, reaching a poster gate opens the boss the next time the hub
  loads — enter a level and come back, and the door will be open.
- The Hindenbird shows your remaining goal while you are standing in Tazland.
- Bonus games need their unlock, whatever your sandwich count says.
- Phone booths refuse you until the matching costume arrives.
