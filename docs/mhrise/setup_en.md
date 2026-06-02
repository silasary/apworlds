# Monster Hunter Rise Multiworld Setup Guide

## Disclaimer

> **This mod may be considered cheating.** Monster Hunter Rise has no
> known anti-cheat and I don't know anyone banned for using mods,
> but Capcom's stance could change at any time. Playing online while
> this mod is installed is **discouraged** — stick to singleplayer 
> or offline sessions. **You use this mod entirely at
> your own risk** — the author accepts no responsibility for bans,
> account actions, save corruption, or any other consequences arising
> from its use.
>
> **Back up your save before playing.** This mod hooks into the game
> at runtime and, while it doesn't intentionally modify save data,
> bugs and crashes can still corrupt saves. MH Rise's save lives at
> `Steam\userdata\<Your Steam ID>\1446780\remote\win64_save` — use
> Steam Cloud backups or copy that folder before each session.

This randomizer ships as **two separate downloads**, each used by a
different group of people:

- **`mhrise.apworld`** — the world definition. Only the person
  **generating** the seed needs this. It plugs into Archipelago and
  produces the multiworld. Players who are just connecting to a
  pre-generated room do **not** need it.
- **`mhrise-client.zip`** — the in-game client (Lua plugin + native
  DLL). **Every player** who wants to play MH Rise in the multiworld
  needs this installed in their game directory.

Both are published on this project's releases page.

## Required software

- **Monster Hunter Rise** (Steam). Sunbreak is optional — the
  randomizer runs on either, with `IncludeSunbreak` controlling which
  roster the seed draws from.
- **[REFramework](https://github.com/praydog/REFramework)** — the
  modding framework the client runs inside. Required for every player.
- **[Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)**
  **0.6.7 or higher** — required only for the person generating the
  seed. Players connecting to an existing room don't need it.

> **Archipelago 0.6.7+ is required for seed generation.** The apworld
> uses the rule builder API introduced in 0.6.7. Generating with an
> older version will fail.

## For everyone: installing the client

### 1. Install REFramework

Follow the instructions on the
[REFramework releases page](https://github.com/praydog/REFramework/releases)
for Monster Hunter Rise. Drop the provided `dinput8.dll` (or
equivalent) into the game's install directory next to
`MonsterHunterRise.exe`. Launch the game once to confirm the
REFramework overlay appears (default toggle key: `Insert`).

### 2. Install the MH Rise AP client

Download `mhrise-client.zip` from the releases page and
extract its contents directly into your game install folder
(the folder containing `MonsterHunterRise.exe`). The client zip 
mirrors the game install layout, so the install is one drag-and-drop.

After extraction your game folder should contain:

```
<game install>/
├── MonsterHunterRise.exe
├── lua-apclientpp.dll    ← from the client zip
├── dinput8.dll           ← from REFramework
└── reframework/
    └── autorun/
        ├── MHRiseAP.lua  ← from the client zip
        ├── AP_REF/       ← from the client zip
        └── AP_CLIENT/    ← from the client zip
```

**The `lua-apclientpp.dll` must end up in the game root**, next to
`MonsterHunterRise.exe`. The zip is laid out so this happens
automatically — but if you extracted it somewhere else and copied
files manually, double-check the DLL location. Wrong placement causes
a silent hang at startup with no error message.

## For the seed host: generating a seed

### 1. Install Archipelago

Grab the latest release from
[Archipelago's releases page](https://github.com/ArchipelagoMW/Archipelago/releases)
and install it.

### 2. Install the apworld

Download `mhrise.apworld` from the releases page and drop it into
`<Archipelago install>/custom_worlds/` or just click to install.

### 3. Generate

Use Archipelago's standard YAML generator to produce a "Monster Hunter
Rise" YAML. The available options are:

- `Mode` (default `hunt_a_thon`) — the game mode. `hunt_a_thon` is the
  per-monster license hunt loop; `quest_rando` swaps quest boss
  monsters and gates quest-clear checks (see below).
- `IncludeSunbreak` (default on) — include Sunbreak monsters.
- `IncludeRisen` (default off) — include the five Risen elder dragons.
- `IncludeWeapons` (default on) — add weapon-type licenses to the pool
  and require the current weapon's license to land checks. Applies to
  both modes.
- `WeaponPool` — subset of weapons allowed when `IncludeWeapons` is on.
- `MonsterCount` (range 3–72, default 15) — number of monsters drawn
  into the world. **Ignored in `quest_rando`.**
- `RandomizeQuestMonsters` (default on) — **`quest_rando` only.** When
  on, every pool quest's boss monster is randomly swapped. Turn it off
  to keep vanilla bosses and only gate the clear-checks.

Drop the YAML into `<Archipelago install>/Players/`, run
`ArchipelagoGenerate`, then host the resulting room (or upload the
output zip to [archipelago.gg](https://archipelago.gg/) for hosting).

### Quest Randomizer mode

Setting `Mode: quest_rando` switches the seed to the Quest Randomizer.
Instead of per-monster licenses, every village quest in the pool gets
its boss monster swapped to a random other monster, and each quest is
gated by an `Unlock: <quest>` item. Clearing a gated quest sends two AP
checks. The goal is clearing the village urgent quest,
**Comeuppance**.

> **Use a fresh save for `quest_rando`.** Clears are recorded
> at the moment a quest is cleared, so a save that has already 
> cleared quests will need to redo them.

## Connecting in-game

1. Launch Monster Hunter Rise. REFramework loads, then the AP client.
2. Press `Insert` (or whatever your REFramework toggle is) to open the
   overlay.
3. Find the **AP_REF Connect** window. Enter the server address (e.g.
   `archipelago.gg:38281`), your slot name, and the password if the
   server requires one. Click **Connect**.
4. On a successful connect, the in-game **Tracker** window
   automatically becomes visible.
   - In **Hunt-A-Thon** it lists your available, hunted, and locked
     monsters (and weapons, if `IncludeWeapons` is on). Hunt your
     precollected starter monster to send your first checks.
   - In **Quest Randomizer** it lists available, inaccessible, cleared,
     and locked quests. Clear a quest whose `Unlock:` item you hold to
     send your first checks. (In this mode the monster you actually
     fight may differ from the quest's name — that's the swap.)

## Troubleshooting

- **Game hangs at startup with no error!** `lua-apclientpp.dll` may be 
  in the wrong directory. It must sit in the **game root** next to
  `MonsterHunterRise.exe`, not anywhere inside `reframework/`.
- **Checks aren't sending.** Confirm you're playing solo —
  multiplayer quests do not send checks (the client detects MP and
  skips, only singleplayer is currently supported). Then confirm you
  hold the gating items: in **Hunt-A-Thon**, the monster's license; in
  **Quest Randomizer**, that quest's `Unlock:` item. In either mode, if
  `IncludeWeapons` is on you also need the license for your
  currently-equipped weapon. Check the in-game tracker to see what you
  actually hold.
- **Help the tracker window isn't showing in REFramework!** Some testers
  have reported this happening when the client and APWorld versions are
  not the same. Make sure both versions are exactly the same and check
  the AP Client window for a warning.
- **I just got some DLC and now the client is not showing/working!** There is 
  a known issue where getting new DLC can sometimes wipe files from REFramework
  in your game install. You may need to reinstall the client if this happens.
- **Whenever I look at my hunter's notes for large monsters the game crashes!**
  This is a known issue with bringing Sunbreak monsters earlier in the game 
  with the quest randomizer. If a Sunbreak monster is in your hunter's notes
  too early on it will crash the game when looking at them. I'm trying to find
  a fix for this but no luck yet, so just don't look at them for now.
