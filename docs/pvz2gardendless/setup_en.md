# PvZ2 Gardendless Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) with the PvZ2 Gardendless
  `.apworld` installed.
- [Git](https://git-scm.com/downloads) and [Node.js 18 or newer](https://nodejs.org/) — both must be
  on your `PATH`. The installer builds the game client from source and will stop with an error if
  either is missing.
- An internet connection for the first build. It clones roughly 300 MB of game source.

## Installing the game client

The game is not distributed as a ready-made download. You build it once with the bundled installer,
which clones the upstream game, injects the Archipelago client, and packages an executable.

1. Install the `.apworld` by dragging it onto the Archipelago Launcher, or by dropping it into your
   Archipelago `custom_worlds` folder.
2. Open the Archipelago Launcher and click **PvZ2 Gardendless Installer**.
3. Pick a build directory. It is remembered in `host.yaml` for next time.
4. Click through the build. It will:
   - check that `git`, `node` and `npm` are available,
   - clone the Electron wrapper and the game source,
   - inject the Archipelago client,
   - run `npm install` and package the app.

The first build takes several minutes, mostly clone and `npm install` time. When it finishes you will
have `PvZ Gardendless AP.exe` in the build directory.

## Configuring your YAML

Open the [player options page](../player-options) to generate a config file, or use the template from
the Archipelago Launcher's **Generate Template Options** button.

The options worth knowing about:

- **Enabled Worlds** — a whitelist. A world is in the seed if and only if it is named here, and
  Ancient Egypt is always in whether you name it or not. Leave the list empty to waive the
  whitelist and let **World Count** pick at random instead.
- **World Count** — a cap on top of that, never a target. It can only make the seed smaller: name
  more worlds than it allows and the extras are dropped at random, but name fewer and you get
  exactly the ones you named. Nothing outside **Enabled Worlds** is added to fill the gap.
- **Goal Type** — what completing a world means: its **World Key** level, its **Zomboss**, or its
  final level (**Completion**). Note that the zomboss goal cannot be satisfied by Kongfu Temple,
  which has no Zomboss level in the game data.
- **Worlds Required** — how many worlds must be completed to win. Every world in the seed counts,
  Modern Day included. Asking for more than the seed contains clamps down to what it has, so a
  two-world whitelist caps this at three however high you set it. Requiring fewer worlds than the
  seed holds is fine and is left alone.

Worlds open in three stages, and the currency is one item: **Progressive &lt;World&gt;**, three per
world. The first opens the world as far as its World Key level, the second carries you to its
Zomboss, the third to its final level. The game refuses to start a level you have not unlocked, so
these are not just a logic gate. Ancient Egypt needs none to enter and so has two: 1-8 need nothing,
9-25 want the first, 26-35 want the second. Egypt also expects a sun producer from level 6, the same
place the game unlocks the store — that one is a logic requirement, not an unlock, so it never stops
you starting a level.
- **Skip Tutorial** — start on the world map and send the tutorial checks automatically. Also stops the game making you open the almanac, zen garden and store when each one unlocks.
- **Shopsanity** — turn the store's one-time purchases into 39 extra checks.
- **Trap Percentage** — how much of the filler pool becomes Lawn Mower Traps.

## Joining a multiworld game

1. Launch `PvZ Gardendless AP.exe`.
2. Click the **AP** button in the top-left corner.
3. Enter the server address, your slot name, and the password if the room has one.
4. Click connect.

On first connect the client creates a dedicated save slot for the multiworld and reloads, so your
existing non-Archipelago save is left alone. From then on it reconnects to that same slot
automatically.

If you reconnect later — or move to a different machine — the client restores your level progress
from the checks the server already has for your slot, so you do not replay anything.

## Troubleshooting

**The installer button is missing from the Launcher.** The `.apworld` is installed but its Launcher
component failed to register. Check the Archipelago log for a warning from `PvZ2 Gardendless`.
Generation still works without it; you can run the installer directly with
`python build_pvzge_ap.py` from inside the apworld.

**The build fails immediately.** Confirm `git --version` and `node --version` both work from a fresh
terminal. The installer only checks `PATH`, so a tool installed but not exported will fail here.

**Plants I own will not place.** Plants are only usable once Archipelago has sent them. If the client
shows them as received and the game still hides them, reconnect — the client re-applies the full
inventory on connect.

**My checks are not registering.** The client polls for finished levels every couple of seconds. If
nothing is arriving, confirm the AP panel shows a connected state; checks are queued and flushed on
reconnect if the connection dropped mid-level.
