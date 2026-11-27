# Kirby: Planet Robobot Archipelago

An Archipelago randomizer for **Kirby: Planet Robobot** (Nintendo 3DS).

Code Cubes, stickers, copy abilities and Robobot Armor modes become Archipelago
items and locations. Progress is tracked live in the running game over a small
memory bridge, so almost nothing is baked into the ROM: the only patched files
are a handful of the game's own script archives.

Works on **Azahar** (emulator). Real 3DS hardware is not supported yet, see
[step 2](#2-install-the-memory-bridge-plugin).

> No game data is distributed. Everything is built from a ROM you supply.

---

## Contents

- [What you need](#what-you-need)
- [1. Install the apworld](#1-install-the-apworld)
- [2. Install the memory bridge plugin](#2-install-the-memory-bridge-plugin)
- [3. Point the world at your ROM](#3-point-the-world-at-your-rom)
- [4. Generate a game](#4-generate-a-game)
- [5. Build and install the patched game](#5-build-and-install-the-patched-game)
- [6. Play](#6-play)
- [Options reference](#options-reference)
- [Client commands](#client-commands)
- [Troubleshooting](#troubleshooting)
- [Known issues](#known-issues)
- [Credits](#credits)

---

## What you need

| Thing | Notes |
|---|---|
| [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.5.0+ | The launcher and client |
| `kirby_robobot.apworld` | This integration |
| A **decrypted North American** Planet Robobot ROM | `.cci` or `.3ds` (same format, different extension). Dump it yourself. |
| [ctrtool](https://github.com/3DSGuy/Project_CTR/releases) | **Optional.** Only a fallback if the built-in extractor can't read your dump. |
| `default.3gx` | The memory bridge plugin. See [step 2](#2-install-the-memory-bridge-plugin). |
| [Azahar](https://github.com/azahar-emu/azahar) **or** a modded 3DS | Luma3DS 10.2+ on hardware |

---

## 1. Install the apworld

Open the Archipelago Launcher, choose **Browse Files**, and drop
`kirby_robobot.apworld` into the `custom_worlds/` folder. Double-clicking the
file also works.

Restart the Launcher afterwards so it picks the world up.

---

## 2. Install the memory bridge plugin

> **Hardware support does not work yet.** The plugin this step describes fails
> on Kirby: Planet Robobot specifically: the game crashes on launch with it
> loaded. The cause is CTRPluginFramework, which the plugin is built on and
> which does not function under this game. The plugin, Luma, the 3GX format and
> this randomizer's romfs patch have all been ruled out, and the same plugin
> runs correctly under other games on the same console.
>
> **Use Azahar.** The emulator path is fully supported and is what everything
> here is developed and tested against. The rest of this section applies to the
> emulator; the 3DS parts are kept for whoever picks up the hardware work.

This is the part people miss, and nothing works without it.

`default.3gx` is a CTRPluginFramework plugin that opens a **UDP server on port
45987** inside the running game and answers read/write requests for the game's
memory. The Archipelago client talks to it to see what you have collected and to
hand you items. The plugin is deliberately game-agnostic: it knows nothing about
Kirby, it just moves bytes.

### Finding your title ID

The plugin lives in a folder named after the game's title ID. To find yours:

- **Azahar**: right-click the game in the game list, **Properties**, and read
  the Program ID. It is also printed near the top of `azahar_log.txt`.
- **3DS**: most dumping tools show it, or use FBI's title browser.

The North American release is `00040000001BB800`. Use whatever *your* setup
reports rather than assuming.

### Placing the plugin

**On a 3DS (Luma3DS):**

```
SD:/luma/plugins/<TITLE_ID>/default.3gx
```

Then enable plugins in the Luma configuration menu (hold **Select** at boot →
*Enable game patching* / plugin loader, depending on your Luma version).

**On Azahar:**

Azahar reads plugins from its **virtual SD card**, the `sdmc` folder, using the
same layout as a real console:

```
<Azahar folder>/sdmc/luma/plugins/<TITLE_ID>/default.3gx
```

Open the Azahar folder with **File → Open Azahar Folder**, then go into `sdmc`
and create `luma/plugins/<TITLE_ID>/` if it isn't there. This is **not** the
`load` folder: `load/mods` is where the romfs mod goes, and Azahar never looks
for plugins in `load`. A plugin placed there is silently ignored, while the
mod itself still works, which makes it look as though everything is installed.

Then enable the plugin loader under **Emulation → Configure → System**.

**How to tell it loaded:** once you're in a save file, a notification pops up
on the top screen telling you what to type, `Run '/3ds <address>' from the
client...`. It can take a few seconds to appear after the game starts, and it
disappears as soon as the client connects. No notification means the plugin
isn't loading, so check the folder above first.

On Azahar that address is just your PC's own local IP, so you can also find it
yourself: run `ipconfig` in Command Prompt and use the **IPv4 Address**. Don't
use `127.0.0.1`; that reaches Azahar's built-in RPC server instead of the
plugin, which connects but reads the wrong memory.

### Networking

The client connects to the plugin over UDP on port **45987**.

- **Azahar**: your PC's own LAN IP (the **IPv4 Address** from `ipconfig`), the
  same address the plugin's notification shows. Not `127.0.0.1`.
- **3DS**: the console's IP on your LAN, e.g. `111.222.3.44`. Check it under
  **System Settings → Internet Settings → Connection Settings**. A static DHCP
  reservation saves you re-typing it.

Your PC and 3DS must be on the same network, and a firewall must not be blocking
UDP 45987.

---

## 3. Point the world at your ROM

In the Launcher, choose **Open host.yaml** and find the `kirby_robobot_options`
section:

```yaml
kirby_robobot_options:
  rom_file: "C:/path/to/Kirby - Planet Robobot (USA).cci"
  ctrtool_path: ""          # optional fallback, see below
  mod_path: ""              # where to install the finished mod, see below
  make_zip: false           # zip the mod folder, useful for real hardware
```

A `.cci` is a container: the game's files sit inside it in a filesystem called
romfs, which has to be unpacked before anything can be patched. This world ships
its **own extractor**, so there is normally nothing to install and
`ctrtool_path` can stay empty.

`ctrtool` is only tried if the built-in extractor fails on your particular dump.
If you hit that, install it and either put it on your `PATH` or point
`ctrtool_path` at it.

`rom_file` is the only required entry, and if you leave it blank, the client
asks for the ROM the first time you open a patch and saves your answer here.

Setting `mod_path` lets the build step install the mod for you automatically:

- **Azahar**: `<Azahar folder>/load/mods`
- **3DS**: `<SD card>/luma/titles`

---

## 4. Generate a game

Launcher → **Generate Template Options** creates
`Players/Templates/Kirby Planet Robobot.yaml`. Edit it, put your copy in
`Players/`, and generate as usual.

A minimal example:

```yaml
name: YourName
game: Kirby: Planet Robobot
Kirby: Planet Robobot:
  goal: story_star_dream
  story_boss_count: 6
  rare_sticker_checks: true
  sticker_checks: false
  open_all_stages: true
  ability_gating: true
  armor_gating: true
  death_link: false
  kirby_color: random
```

See the [options reference](#options-reference) below.

---

## 5. Build and install the patched game

Generation produces a patch file for your slot. **Open it** (double-click, or
Launcher → *Open Patch*). The world will:

1. Unpack the romfs from your ROM (built in, no external tools).
2. Patch a small number of script archives.
3. Write a LayeredFS folder containing **only** the changed files.
4. Copy it to `mod_path` if you set one, otherwise leave it for you to move.

The result is tiny, because only these files change:

```
romfs/mint/LvMap.bin.cmp              boss gate and the road to it
romfs/mint/StepHero.bin.cmp           item delivery and the ability/armor gates
romfs/msg/US_English/TitleMenu.msbt   a visible "the mod loaded" marker
```

Everything else the randomizer does happens live over the memory bridge.

If the title screen looks unchanged after installing, the mod is **not** loading
: fix that before going further, because nothing else will work.

---

## 6. Play

1. Start the Archipelago client for this world from the Launcher.
2. Connect it to your room as usual (`/connect <address>` if needed).
3. Launch the game with the plugin active.
4. In the client, run:

   ```
   /3ds 111.222.3.44     # use the address the plugin's notification shows
   ```

The client confirms when the bridge answers. Load your save file and play: cube
collection, sticker finds and stage clears are sent automatically, and items
arrive as real in-game pickups.

---

## Options reference

| Option | Values | Meaning |
|---|---|---|
| `goal` | `story_star_dream`, `story_boss_count` | Victory condition |
| `story_boss_count` | 1–6 | Bosses needed when using the boss-count goal |
| `rare_sticker_checks` | on/off (default **on**) | The 35 in-stage Rare Stickers become locations |
| `sticker_checks` | on/off (default off) | **Stickersanity.** All 138 normal stickers become locations |
| `open_all_stages` | on/off (default **on**) | Normal stages are open from the start |
| `ability_gating` | on/off | Copy abilities must be received before Kirby can use them |
| `armor_gating` | on/off | Robobot Armor modes must be received before the armor can use them |
| `death_link` | on/off | Share deaths with other players |
| `kirby_color` | `pink` … `white`, `random` | Cosmetic recolor, baked into the patched ROM |

### A note on Stickersanity

Normal stickers are picked up passively as you play, so turning this on adds a
large number of locations that are open almost everywhere at once. That can make
for strange or difficult logic. It is off by default for a reason.

### A note on gating

Ability gating and armor mode gating are **separate**. A copy ability only
affects Kirby on foot; an armor mode only affects the Robobot Armor. Receiving
one never grants the other.

With gating on, some Code Cubes genuinely require a specific ability or mode, and
the logic accounts for that. The requirements come from the per-stage guides on
[WiKirby](https://wikirby.com/wiki/Kirby:_Planet_Robobot).

With a gate **off**, there are no items for it at all: no `Ability:` items with
`ability_gating` off, no `Armor Mode:` items with `armor_gating` off. Kirby and
the armor copy everything exactly as in the unmodified game.

### EX stages

An EX stage opens in game once you have **picked up** every Code Cube in that
Area's normal stages yourself (cubes sent by Archipelago do not count). Logic
only expects EX stage checks once you can reach all of those cubes, and the
tracker keeps them under "not yet reachable" until you have actually collected
them. Access Ark's 6-8 EX additionally needs 6-7 EX cleared.

### Boss gates

Each area's boss sits behind a Code Cube gate, exactly as in the original game,
but it counts **only the cubes Archipelago has sent you**, never the ones you
physically pick up. You can walk up to the gate at any time; it opens when you
have earned it.

---

## Client commands

| Command | What it does |
|---|---|
| `/3ds <address>` | Connect to the memory bridge |
| `/watchsave` | Log every byte of the save area that changes. Noisy; for debugging. |
| `/armorlog` | Log each Robobot Armor copy check and its result. For debugging. |

---

## Troubleshooting

**The client says it can't reach the game.**
The plugin is not running, or the address is wrong. Confirm the plugin loaded
(the on-screen notification), check the IP, and make sure UDP 45987 is not
firewalled. On Azahar, use your PC's LAN IP from `ipconfig`, not `127.0.0.1`.

**The title screen looks stock.**
The LayeredFS mod is not loading. Check that the mod folder is under the right
title ID and that your emulator or Luma has mods enabled.

**"Could not extract romfs from your ROM."**
Almost always one of two things. The dump is still **encrypted**: it must be
decrypted, and no tool here can work around that. Or it's an installed **CIA**
rather than the ROM itself; you need the `.cci`/`.3ds`.

If your dump is decrypted and still fails, install
[ctrtool](https://github.com/3DSGuy/Project_CTR/releases) and set
`ctrtool_path`; it's used as a fallback extractor.

**Items arrive but nothing happens in game.**
Items are handed to Kirby as real pickups, so they only apply while you are in a
stage. Anything received on the world map is delivered when you next enter one.

**A rare sticker will not send its check.**
Stickers only register as *new* on the results screen at the end of a stage. If
you already own it, the game will not hand it over. The client works around this
automatically, but you must actually finish the stage.

---

## Known issues

- **Parasol Mode does not work while `armor_gating` is on.** Because of that,
  Gigabyte Grounds Stage 2's third Code Cube only ever holds filler, and with
  armor gating on, Gigabyte Grounds' EX stage (4-7) is left out of the seed: it
  can only open once that cube has been picked up.
- **Robobot Armor cannot re-absorb a dropped ability star.** If the armor's mode
  is knocked out, the star it leaves behind cannot be scanned back up. Under
  investigation.

---

## Credits

- **firubii**: [KirbyLib](https://github.com/firubii/KirbyLib), and the Mint VM
  documentation that made patching the game's scripts possible at all.
- **randomsalience** and **LittleCube**: the memory bridge plugin, originally
  written for the A Link Between Worlds integration and reused here unchanged.
- The Kirby modding community for the retexture pack used by `kirby_color`.

---

## Legal

This project ships no Nintendo assets. It requires a ROM you dump yourself from
hardware you own. Kirby: Planet Robobot is © HAL Laboratory and Nintendo.