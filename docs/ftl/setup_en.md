# FTL: Faster Than Light Setup Guide

## Current status

The mod connects to a real Archipelago server and plays a full multiworld on **Linux** and **Windows**.

Hyperspace's Lua sandbox has no sockets and no file access, so the mod cannot talk to a server on its own. You
need this project's **Hyperspace build with the Archipelago module**, not the regular Hyperspace release. It is
the same Hyperspace with one extra module; everything else behaves the same.

## Required software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest) 0.6.7 or newer, on the machine
  that generates the seed and hosts the room.
- **FTL: Faster Than Light, Advanced Edition**: 1.6.13 on Linux (what Steam ships), 1.6.9 on Windows, the
  only Windows version Hyperspace runs on. ftlman downgrades the Steam version by itself when it installs
  Hyperspace.
- [ftlman](https://github.com/afishhh/ftlman) to install Hyperspace and apply the mods.
- `Hyperspace.ftl`, from the official [Hyperspace release](https://github.com/FTL-Hyperspace/FTL-Hyperspace/releases)
  1.23.1.
- This project's own build of the Hyperspace library with the Archipelago module: `Hyperspace.1.6.13.amd64.so`
  on Linux, `Hyperspace.dll` on Windows. Then `ArchipelagoFTL.ftl` (the mod) and `ftl.apworld`. They are
  attached to the project's GitHub release, or can be built from source with `hyperspace-patch/build.sh`,
  `mod/install.sh` and `apworld/tools/build_apworld.py` (see the project's README for the build dependencies).

## Before you touch anything

**Turn off Steam Cloud for FTL** (right-click the game in Steam, Properties, General). Steam Cloud can overwrite
the save folder while the mod runs.

**Back up your save folder**: `~/.local/share/FasterThanLight/` on Linux,
`Documents\My Games\FasterThanLight` on Windows.

```sh
cp -r ~/.local/share/FasterThanLight ~/.local/share/FasterThanLight.backup
```

The mod plays on a profile of its own (`hs_ap_prof.sav`) and never touches your vanilla `ae_prof.sav`.

**Advanced Edition content must be on.** Ship selection has a toggle for it. The seed hands out the Lanius
cruiser, hacking, mind control, the clone bay and the backup battery, none of which exist with it off. The main
menu reminds you in orange if it is off.

## Installing on Linux

The game lives in `~/.steam/steam/steamapps/common/FTL Faster Than Light/`, and everything happens in its
`data` subfolder. From the root of this project:

```sh
D=~/.steam/steam/steamapps/common/"FTL Faster Than Light"/data

# 1. Install the official Hyperspace 1.23.1. This edits data/FTL to preload the Hyperspace library.
ftlman hyperspace-install 1.23.1 -d "$D"

# 2. Build the Hyperspace library with the Archipelago module and drop it in place of the official one
#    (the official .so is kept next to it, as *.before-archipelago).
hyperspace-patch/build-linux.sh --install

# 3. Put Hyperspace.ftl in ~/.local/share/ftl-mods/, then build and apply both mods, Hyperspace first.
mod/install.sh
```

With the release files instead of a source build, steps 2 and 3 become:

```sh
cp "$D/Hyperspace.1.6.13.amd64.so" "$D/Hyperspace.1.6.13.amd64.so.before-archipelago"
cp Hyperspace.1.6.13.amd64.so "$D/"
ftlman patch -d "$D" ~/.local/share/ftl-mods/Hyperspace.ftl ArchipelagoFTL.ftl
```

`mod/install.sh` runs that same `ftlman patch` for you. That command always
rebuilds `ftl.dat` from `ftl.dat.vanilla`, so applying only `ArchipelagoFTL.ftl` on its own would remove
Hyperspace from the game.

**Launch the game through Steam or through its `FTL` script**, not `data/FTL.amd64` directly: only the script
preloads Hyperspace. The main menu then shows `HS-1.23.1 x64` in the top right corner, the Archipelago title
and logo at the top left, and a connection panel at the bottom left.

## Installing on Windows

The game lives in `steamapps\common\FTL Faster Than Light` of your Steam library, next to `FTLGame.exe`.
Everything goes in that folder; there is no `data` subfolder on Windows.

1. With ftlman, install Hyperspace 1.23.1 (Hyperspace tab, or `ftlman hyperspace-install 1.23.1 -d <game folder>`).
   On a Steam copy it downgrades FTL to 1.6.9 first and keeps the original as `FTLGame_orig.exe`.
2. Keep a copy of the official `Hyperspace.dll` from the game folder, then put this project's
   `Hyperspace.dll` in its place.
3. Put `Hyperspace.ftl` and `ArchipelagoFTL.ftl` in ftlman's `mods` folder, Hyperspace first in the order,
   and apply.

From a source build, in Git Bash, steps 2 and 3 are:

```sh
hyperspace-patch/build-windows.sh --install
FTLMAN=/path/to/ftlman.exe mod/install.sh
```

Both find the game through Steam's library list, `FTL_DATA` / `FTL_DIR` point them elsewhere. The build runs
in Hyperspace's Docker container, so Docker Desktop is needed. FTL has to be closed while installing: Windows
locks `ftl.dat` and `Hyperspace.dll` while the game runs.

The main menu then shows `HS-1.23.1` in the top right corner and the same Archipelago title, logo and panel.

## Installing the apworld

Drop `ftl.apworld` into the `custom_worlds` folder of your Archipelago installation. Only the machine that
generates the seed needs it.

## Generating a seed

Create your YAML with **ArchipelagoOptionsCreator** (in the Archipelago Launcher) or start from a file in
`presets.zip`, put it in `Players/`, and generate as for any
other game. The options worth a second look:

- **Sectorsanity**, **Sectorsanity First Sector** and **Sectorsanity Last Sector** decide how big the seed is.
- **Archipelago Shop Checks** puts goods for other players on sale at one AP STORE beacon per sector. Each
  slot is one check, and the cheapest kind: scrap, no fight. The number is a minimum: when your options create
  more items than checks, the seed adds shop slots until every item has a place. With **Archipelago Shop by
  Sector** (off by default) each slot belongs to one sector and is sold there only.
- **Minimum Filler** is the other side of that balance: filler added when there are more checks than items.
- **Shop Weapons / Shop Drones / Shop Augments** decide how much of FTL's catalogue Archipelago controls, all of
  it by default. **Shop Unlock Mode** decides what that means: `rarity_boost` (default) makes a received item
  more common in stores, `locked` keeps an item off every shelf until you receive it.
- **Systemsanity** turns installing systems into checks (`first_install`), or every level too (`every_level`).
- **Crew Checks** makes the first recruit of each race a check (the starting crew does not count).
- **Crew Members** puts crew members in the item pool; weapons and drones come twice, the second copy adding
  them to the menu that opens at the start of every run.
- **System Blueprints** and **Progressive System Upgrades** decide whether you need a blueprint to buy a system,
  and whether its levels come from Archipelago. With both off, systems behave as in the base game.
- **Goal**, **Victories Required** and **Victory Difficulty** say when you are done. The difficulty is enforced:
  an easy win still sends its victory check, it just does not count towards the goal.
- **Archives** and **Archives Required** add a second currency: Archives scattered through the other players'
  worlds, of which the Flagship waits for a number. Leave a few spare.
- **Death Link**, **Energy Link** and **Trap Link** connect your runs to the other players.

## Connecting to a room

On the main menu, the panel at the bottom left takes the server address, the port, your slot name and the room
password. Press ENTER or click the button. `TAB` moves between fields.

- A successful connection is remembered: next time the fields are filled in. The password never is.
- Tick **auto-connect** to reconnect on every launch.
- If the connection drops, the mod retries on its own (after 5, 10, 20, 40, then 60 seconds).
- Once connected the panel folds into a **Disconnect** button, which brings the panel back.

**Changing seed.** Hyperspace can unlock a ship but never lock one again, so a profile that played another seed
keeps its ships. When you connect to a different seed with such a profile, the mod refuses the seed and asks.
"Yes" makes a dated copy of your profile next to it, erases the Archipelago progress and restarts FTL on its
own (through Steam if you launched it from Steam, on Linux and Windows alike); the new seed begins from nothing. "No" keeps everything and plays the new seed with the old ships.
The same question comes up the first time you connect with a profile that already unlocked ships without
Archipelago.

## Playing

Pick a ship in the hangar (locked ships are simply not there) and play. The mod does the rest:

- Reaching a sector, earning an achievement, installing a system and destroying the Flagship send their checks.
- Ships and layouts you receive appear in the hangar when you return to the main menu, never mid-run.
- Head starts apply at the beginning of each run.
- A system you have no blueprint for cannot be bought: if a store sells you one anyway, the mod removes it and
  refunds exactly the scrap you paid.
- The beacon marked **AP STORE** on the map holds the Archipelago shop; beacons marked **ARCHIPELAGO** hold one of
  five encounters. The Slug in one of them sells a real Archipelago hint.
- Hints about your world, whoever asked for them, show up in game and in the dashboard.

`TAB` opens the dashboard during a run and pauses the game. Its pages: an overview (goal, checks, links,
latest items), the ship layouts, the systems, the checks still to do by category, and a journal of the items
received and the hints. Left/Right or 1-5 change page, the wheel scrolls the lists, Esc closes it.

Losing a run costs you only the run. Your items are kept.

## Playing offline: solo mode

Without a server, click **Solo mode** in the connection panel. Solo mode applies the slot data of a real generated seed and hands
out its items one per check, in the order a real fill produced. It is a way to try the loop and the pacing
alone. It is always the same demo seed shipped with the mod, not your YAML: your options do not apply. A check
that held another player's item in that seed gives filler instead, so every check gives something.

A solo run is saved in the FTL profile: the items received and the checks sent survive a restart, and a solo
run that was going when FTL closed picks up again at the next launch. **Stop solo** puts it aside; clicking
**Solo mode** later asks whether to continue it or start over.

## Troubleshooting

**The game hangs on the loading screen at 100% CPU.** A Hyperspace bug with an `ae_prof.sav` that was created but
never played. Delete `ae_prof.sav` and any `hs_*_prof.sav` from the save folder and launch again.

**The connection panel is missing, or nothing connects.** The Hyperspace library is the official one, not the
build with the Archipelago module, or Hyperspace is not loaded at all. Check `data/FTL_HS.log`: it should contain
`[AP-net] network module present`.

**My unlocks disappear between sessions.** Steam Cloud is still enabled, or the mods were re-applied without
Hyperspace.

**"Failed to make copy of original code executable" at launch on Linux.** SELinux (Fedora and others) refuses
Hyperspace the right to patch the game in memory. Run `sudo setsebool -P selinuxuser_execheap 1` (and, if the error
stays, `sudo setsebool -P selinuxuser_execmem 1`), then start again. No need to turn SELinux off.

**Where is the log?** `FTL_HS.log` in the game folder (in `data/` on Linux), rewritten at every launch. Lines
from the mod start with `[AP`.
