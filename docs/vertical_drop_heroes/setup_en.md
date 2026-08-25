# Vertical Drop Heroes HD — Setup Guide

> **Windows only.** The game has no Linux build (Proton should work but is
> untested), and while it does ship a macOS build, gm-apclientpp publishes no
> macOS binary, so there is nothing to load there yet.

## Do I need a client?

**No.** The Archipelago client is compiled into the game itself, so there is no
separate client process to run — set up a Slot once, then choosing Single
Player connects you.

A text client is still useful for chat, `!hint`, and release commands, but
nothing about items or checks depends on it.

## Installing

You need **Python** — <https://www.python.org/downloads/>, and during setup
**tick "Add python.exe to PATH"**. Nothing else: UndertaleModTool and
`gm-apclientpp.dll` are inside the patcher zip.

1. **Copy your whole game folder** somewhere outside Steam and work on the
   copy. Steam can "verify" your real install and quietly undo everything.
2. **Extract `vdh-ap-patcher.zip` into that game folder.**
3. **Double-click `patch.bat`.**

You should end up with this, and nothing to type:

```
Vertical Drop Heroes HD\
    data.win
    Vertical Drop Heroes HD.exe
    gm-apclientpp.dll        <-- from the zip
    patch.bat
    build\
        build.py
        utmt\UndertaleModCli.exe
    gml\
    third-party\             <-- licenses, and UTMT's GPL source
```

The patcher needs no configuration because it is sitting in the folder it
patches. If you would rather keep it elsewhere, set `VDH_GAME_DIR` to the
folder holding `data.win` and run `python build\build.py`.

## Installing the apworld

Drop `vertical_drop_heroes.apworld` into your Archipelago install's
`custom_worlds/` folder. Only the person generating the multiworld needs it.


Launch the game, go to **Game Options → Archipelago**, fill in Server and Slot,
and choose Connect. `Ctrl+V` pastes. After that, picking **Single Player**
connects for you automatically.

Leave Slot empty and the mod stays completely dormant: it never even loads the
DLL, and the game plays as vanilla.

## Connecting

Launch the game and go to **Game Options > Archipelago**.

```
Server:    archipelago.gg:38281
Slot:      YourSlotName
Password:  (leave empty if the room has none)
Connect
Back
```

Up/Down moves, Enter edits a field or activates a row, **Ctrl+V pastes**, Esc
goes back. Fields are saved as you leave them, so the details persist across
restarts, and `Connect` can be used again at any time to retarget a different
server without restarting the game.

You do not have to press `Connect`: if a Slot is filled in, choosing **Single
Player** connects automatically as the run starts. The mod deliberately does
*not* connect at launch, so the server's checked-location set never lands on
top of a session already in progress.

Status is shown live on that page, and as a small readout in the top-left
during play: `connecting` -> `handshaking` -> `connected`.

Everything is still written to `archipelago.ini`, so you can edit that by hand
instead if you prefer -- but note that it is **not** the copy in your game
folder. GameMaker redirects the game's file writes into its own save area,
which for this mod is `%LOCALAPPDATA%\Vertical_Drop_Heroes_HD\`. The Options
page prints the exact path on its bottom line, and `ap_debug.log` is in there
too. Editing the copy sitting next to the exe has no effect.

Leaving `Slot` empty keeps the mod completely dormant -- it does not even load
the DLL, and the game plays as vanilla.

## What changed in the game

- **The Merchant** sells unlock purchases rather than specific skills. A
  Merchant standing on level L fills one of *that level's* five slots -- level
  1's five are on level 1, and only there. Once a level's five are taken, its
  Merchants have nothing left to sell. The traits and powers themselves arrive
  as Archipelago items.
- **Every shop shows what you are buying.** The Blacksmith, Apothecary, Monk
  and Merchant each display the actual item sitting on their next location,
  including whose world it belongs to.
- **Blacksmith / Apothecary / Monk** likewise check a location per purchase;
  your damage, max HP and orb XP levels are driven entirely by the
  `Progressive Damage` / `Progressive Max HP` / `Progressive Orb XP` items you
  receive. Each stops selling once all its tiers are checked.
- **Shortcut crystals** check a location and still cost coins to enable, so
  lighting one is a real trade-off against shopping. `Progressive Shortcut`
  items are what actually raise how deep you can start, and *using* a shortcut
  you already own is free.
- **Clearing a level** (taking its exit portal, by boss or by keys) checks a
  location, for levels 1–10.
- **Defeating the Chosen One** is the goal.

Because the server replays your whole item list on every connect, reconnecting
mid-session restores your unlocks and upgrades exactly.
