# Finding Robobot's RAM addresses on Azahar

Good news: a set of Action Replay cheat codes (European version) revealed most of
the save-data layout already, so this is now mostly a quick VERIFICATION, not a
long memory hunt. You only need to nail down the Code Cube layout (which the
cheats didn't cover) plus a couple of story flags. ~15-20 minutes.

## What you need

- Azahar (the 3DS emulator)
- Your decrypted NA Kirby: Planet Robobot ROM as a `.cci`
- `kpr_find_addresses.py` (one self-contained file)
- Python 3
- A save file with at least one file slot started (get past the title screen)

You do NOT need the AP patch for this — plain vanilla Robobot is best.

## Step 1 — Install the memory-pipe plugin (no compiling)

The plugin is game-agnostic, so we reuse LittleCube's prebuilt one.

1. Download `plugin.3gx` from:
   https://github.com/LittleCube-hax/albw-ap-plugin/releases/latest
2. Azahar -> **File -> Open Azahar Folder**. Go to (create folders as needed):
   `<Azahar folder>/sdmc/luma/plugins/`
3. Rename `plugin.3gx` to **`default.3gx`** and drop it directly in that folder.
4. Azahar -> **Emulation -> Configure -> System** -> enable **3GX Plugin Loader**.
5. Azahar -> **Emulation -> Configure -> Debug** -> enable **RPC Server**.
   (Newer Azahar ships with RPC OFF by default, so this step matters.)

## Step 2 — Boot and confirm

1. Launch Robobot (`.cci`). Load a save file (past the title screen).
2. You should see a brief flash / plugin message at boot = the memory pipe is
   live on UDP 45987.

WARNING: some Azahar builds crash on boot when the 3GX loader is enabled
(azahar issue #1381). If Robobot won't start with it on, tell me — there's a
fallback.

## Step 3 — Run the scanner

With the game running and a save loaded:

    python kpr_find_addresses.py

(For a real 3DS on your LAN: `python kpr_find_addresses.py 192.168.x.x`)

It will:

1. **Find the save automatically** — it checks the known European addresses, and
   if your NA copy differs, it scans for the sticker-array signature and locates
   it. You do nothing here; just watch it print the confirmed address.
2. **Code Cubes** — it asks you to stand next to an uncollected Code Cube, press
   Enter (before), collect EXACTLY ONE cube, press Enter (after). It prints the
   cube bit + counter.
3. **Clear a stage** — before/after around beating one stage.
4. **Unlock next level** — before/after around clearing a boss.

## Step 4 — Send the output

Copy the ENTIRE terminal output (especially the "SUMMARY TO SEND BACK" section)
and send it here. From that I finalize MemoryMap.py and the client goes live.

Because the sticker layout is already known, this first pass should be enough to
get checks, items, and gating working.
