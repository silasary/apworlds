# Taz Wanted — Setup Guide

## What you need

- Archipelago 0.6.4 or newer
- PCSX2 2.0 or newer, with **PINE** enabled
- **Your own dump of Taz: Wanted (USA) (En,Fr,De,Es,It)**, `SLUS-20236`, in
  either of the two forms a PS2 disc is normally kept in:

  | | |
  |---|---|
  | `.bin` | 746,983,440 bytes, MODE2/2352 — a raw dump, usually with a `.cue` |
  | `.iso` | 650,434,560 bytes — the same disc with the per-sector error correction stripped, which is what "convert to ISO" tools produce |

  Both work and both are checked by hash. Whichever you give it, you get the
  same patched disc back in the same form. Nothing here is distributed with
  the game; you patch a copy of your own disc.
- The **`.apTAZ` file** from your room's page on the Archipelago server. It
  arrives named `P1_YourName_<room>.apTAZ`. It is about a kilobyte — it holds
  your seed's settings, not the game.

## Enabling PINE in PCSX2

Settings → Advanced → tick **Enable PINE**, and leave the slot at `28011`.
The client talks to the emulator through it; nothing works without it.

## The first time: double-click your `.apTAZ`

That is the whole setup. The Taz Wanted Client opens and asks you two
questions, once ever:

1. **Where is PCSX2?** Point it at `pcsx2-qt.exe`.
2. **Where is your Taz Wanted dump?** Point it at your own `.bin` or `.iso`.

If you pick the wrong file it says so on the spot — it names both hashes and,
since it can see the size, **what kind of wrong it is**: a different revision
or region, an image of some other disc, or not a disc image at all. Every
address this patcher writes was measured out of one revision, so a different
disc would produce an image that boots and is quietly wrong. It is refused
rather than patched.

> **A note for anyone who was refused before.** 1.1.0 accepted only the raw
> `.bin`, so a perfectly good `.iso` of the right game was turned away with
> nothing but two hashes to go on. That was the most common thing to hit, and
> **1.1.1 reads both.** Update the apworld and pick the same file again —
> your existing `.apTAZ` still works, so there is nothing to re-roll and no
> need to bother whoever is hosting your room.

Then it patches — about thirty seconds, with a progress bar — and writes two
files **beside your `.apTAZ`**:

```
    P1_YourName_<room>.apTAZ     what you downloaded
    P1_YourName_<room>.bin       your playable disc
    P1_YourName_<room>.cue       so PCSX2 knows what it is looking at
```

If you gave it an `.iso`, you get `P1_YourName_<room>.iso` instead and no
`.cue` — PCSX2 mounts one directly, and a `.cue` describing it as MODE2/2352
would be describing it wrongly.

Your original dump is never modified. PCSX2 then starts on the patched image
by itself.

## ⚠ Connect BEFORE you choose English

**This is the one rule.** The moment the game starts, connect the client to
your room and slot — before you touch the **Choose Language** screen.

Connecting after that screen means the client has already missed its chance to
set your slot up, and the run has to be restarted from a cold boot. The client
says this in red every time it starts a game, and shouts if it catches you at
the main menu still unconnected.

## Playing again later

Two ways, and they are the same game either way:

- **Double-click the same `.apTAZ`.** The patched `.bin` is already sitting
  next to it, so nothing is patched again and you are asked nothing — it just
  launches PCSX2 on it.
- **Or do it by hand.** Launch **Taz Wanted Client** from the Archipelago
  launcher and load your patched `.bin` in PCSX2 yourself. Handy if you keep
  PCSX2 open, or want the game running before the client is.

Either way, connect before the language screen.

If you delete the patched `.bin`, double-clicking the `.apTAZ` simply builds
it again — and you will not be asked for PCSX2 or your dump a second time,
because those answers are kept in `host.yaml`.

## Before you start a file

**Set the difficulty to match your yaml.** The client warns you if they
disagree, but by then some checks may already be unreachable.

Then start a new file — any of the three slots works. The client writes
nothing until a save file is loaded, so it is safe to leave running at the
title screen.

## Boot from cold, not from a save state

A save state made on a different build of the disc restores the old archive
directory, the old executable and the old sound contents over your patched
image. Start the game normally; save files are fine, save states carried
across a re-patch are not.

## What the patch actually changes

- The main menu wears an **Archipelago** logo, so you can tell at a glance
  that you launched the right image.
- If your yaml randomises costumes, each level's booth hands out the costume
  your seed assigned it — model, animations, voice and all — with no loading
  stutter, because the work was done on the disc rather than in RAM.
- **Every costume's special attack works on whatever level it lands on.** The
  DJ's sound waves and the Adventurer's flying hat are built into the game
  per-level, so early builds had six pairings where the attack silently did
  nothing and the seed simply avoided them. It does not have to any more —
  all eleven costumes work on all eleven levels, and the same goes for
  `Completely Random` seeds that hand the same costume to several levels at
  once.

Everything else is the game you already own.

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
sent and rebuilds your unlocks from the server every time it connects, so
reloading a file and reconnecting mid-session are both safe. You cannot lose
an item by reloading, and you cannot send a check twice.

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
  loads — enter a level and come back, and the door will be open. The same is
  true of any boss whose unlock arrives while you are already standing in its
  hub; the door tells you to reload when that happens.
- The Hindenbird shows your remaining goal while you are standing in Tazland.
- **When you qualify for the Hindenbird, the game says `YOU'RE IN GO MODE!`**
  — once, on screen, the moment the last requirement lands.
- If you qualify *while you are already standing in Tazland*, the arena door
  was built before you did and is still shut. The Hindenbird's line changes
  to **`Reload Hub to face Tweety`** to say so — step into any level and come
  back, and it opens. Qualifying anywhere else means the Tazland you walk into
  next is already built with the door open, and you will not see the message.
- Bonus games need their unlock, whatever your sandwich count says.
- Phone booths refuse you until the matching costume arrives.

## If something goes wrong

- **"Unable to reach PCSX2"** — PINE is not on, or another tool is holding the
  same slot. Close any other PCSX2 scripts and retry.
- **You picked the wrong file for PCSX2 or your dump** — open `host.yaml`,
  delete the offending line under `tazwanted_options`, and the client will ask
  again next time.
- **Diagnostics** — `logs/Taz Diagnostics.txt`, rewritten each session. It is
  always on, and it is the first thing to read if a run goes strange.
