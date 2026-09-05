# Final Fantasy VIII Setup Guide

This is the short version. The complete player guide — every option, how checks
and items behave in-game, saves and reloading, trackers, client commands,
troubleshooting — lives on GitHub:
https://github.com/wilsonao/ff8_arch/blob/main/docs/player-guide.md

## Requirements

- **Final Fantasy VIII** — the Steam **2013 release**, English (`FF8_EN.exe`).
  Remastered, the PSX version, and the non-English executables are not supported.
- **Windows** (the client attaches to the running game process).
- **Archipelago 0.6.7 or newer**: https://github.com/ArchipelagoMW/Archipelago/releases
- **`ff8.apworld`** from this world's Releases page:
  https://github.com/wilsonao/ff8_arch/releases

No game files are modified. Graphics, music, and texture mods (FFNx, Junction VIII
asset mods) are fine; avoid gameplay mods that change encounters, drops, draw
points, or the save layout.

## Installation

1. Open the Archipelago **Launcher** → **Install APWorld** → select `ff8.apworld`
   (or copy the file into your Archipelago `custom_worlds/` folder).
2. Restart the Launcher. **FF8 Client** now appears in its list.

That is the whole install — nothing else to download, install, or configure.

## Your options file

Launcher → **Generate Template Options** → edit `Final Fantasy VIII.yaml` (or use
this game's options page on the WebHost) and give it to whoever is generating.
Presets: *All Checks*, *Core Only*, *Junction Master*.

## Connecting

1. Start Final Fantasy VIII and begin a **New Game** (a fresh game is strongly
   recommended — see the player guide's *Saves* section for what happens with an
   existing save).
2. Open the client, pre-connected if you can:
   - **From a WebHost room page** (archipelago.gg or a self-hosted WebHost): click
     **your slot name** in the room's player list. The Launcher opens and asks which
     client to use — choose **FF8 Client**. It starts already pointed at the right
     server, port, and slot.
   - **Otherwise**: Launcher → **FF8 Client**, enter `host:port` in the address bar
     (or `/connect host:port`), then your slot name.

   Give the client window up to a minute to appear after clicking — Archipelago
   reloads every installed world in the new process first (antivirus scans can
   stretch this on the first launch). The Launcher shows "FF8 Client is
   starting" so you know the click registered.
3. The client finds `FF8_EN.exe` on its own and attaches; it keeps retrying until the
   game is running. `/ff8` shows the connection status.
4. Play. Items arrive while you are on a field screen (never in menus or battles), and
   reloading an older save re-delivers whatever that save is missing.

Keep the client running while you play.

## Trackers (optional)

- **PopTracker**: download `ff8_ap_tracker.zip` from the same Releases page, drop it
  into PopTracker's `packs/` folder, pick **Final Fantasy VIII (Archipelago)**, and
  connect the built-in **AP** autotracker with your server and slot. It follows your
  checks, received items, story progress, and your slot's options automatically.
- **Universal Tracker**: needs no extra files — the maps ship inside `ff8.apworld`.

## If something goes wrong

- **"Not attached to FF8_EN.exe"** — the game isn't running, or it isn't the Steam
  2013 English version. The client says what it actually found (Remastered, a
  non-English executable, only the launcher open, or blocked memory access) —
  follow that message.
- **A check didn't send** — `/ff8missed` lists any location that reads as satisfied
  but unsent; `/ff8check <name>` sends one the client provably missed (for example a
  boss killed while the client was closed).
- **Logs** are in `logs/FF8Client_*.txt` inside your Archipelago folder — attach the
  current one to any bug report: https://github.com/wilsonao/ff8_arch/issues
