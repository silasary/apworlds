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

- **Modern Day Goal Type** — whether Modern Day unlocks on world trophies, world completions, or
  world keys. Note that world trophies caps out at 10, because Kongfu Temple has no trophy in the
  game data.
- **Worlds Required for Modern Day** — how many worlds must satisfy that condition.
- **Modern Day Victory** — which Modern Day level ends the run.
- **Skip Tutorial** — start on the world map and send the tutorial checks automatically.
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
