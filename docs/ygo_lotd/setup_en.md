# YGO Legacy of the Duelist: Link Evolution Multiworld Setup Guide

## Disclaimer

> **Archipelago 0.6.7+ is required.** The apworld uses APIs introduced
> in 0.6.7. Generating or running the client on an older version will
> fail.
>
> **Steam Cloud sync must be disabled** for Legacy of the Duelist:
> Link Evolution before connecting. The AP client swaps `savegame.dat`
> on disk between seeds, and Steam Cloud will silently restore the
> cloud copy on the next launch if it stays on, undoing every swap.
> Right-click the game in Steam → Properties → General → uncheck
> "Keep game saves in the Steam Cloud". The client checks for this
> on connect and shows a warning modal if it can't confirm cloud is
> off — the modal has a "proceed anyway" button if you've already
> disabled cloud but the auto-detect doesn't pick it up.
>
> **Your pre-AP save is automatically backed up** to
> `Documents/ygo_lotd_ap/backups/pre_ap/savegame.dat` the first time
> the client runs. You can restore it from the client's Saves tab at
> any time. The backup system has been tested but is new — **make
> your own manual copy of your save anyway** before your first
> session in case something goes wrong. Your save lives at
> `Steam/userdata/<your steam id>/480650/remote/savegame.dat`.

This randomizer ships as a single download: **`ygo_lotd.apworld`**.

- The **seed host** drops it into their Archipelago install to
  generate the multiworld.
- **Every player** drops it into their Archipelago install to run the
  in-game client from the Archipelago Launcher. The client is bundled
  inside the apworld; no separate download.

The apworld is published on this project's
[releases page](https://github.com/HillbillyDroid/YGO-LotD-LE-APWorld/releases).

## Required software

- **Yu-Gi-Oh! Legacy of the Duelist: Link Evolution** (Steam). The AP
  client only supports the LE version (the original *Legacy of the
  Duelist* is a different game with different memory offsets).
- **[Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)**
  **0.6.7 or higher** — required for both seed generation and running
  the in-game client.

## Install the apworld

1. Download `ygo_lotd.apworld` from the
   [releases page](https://github.com/HillbillyDroid/YGO-LotD-LE-APWorld/releases).
2. Double-click it (Archipelago 0.6.7+ registers `.apworld` as
   installable), or drop it manually into
   `<Archipelago install>/custom_worlds/`.

That's it — the same file is used for both generation and playing.

## For the seed host: generating a seed

1. Open Archipelago's YAML generator and pick **YGO LotD-LE**.
2. Configure the options (see "Options" below).
3. Drop the YAML into `<Archipelago install>/Players/`, run
   `ArchipelagoGenerate`, then host the resulting room (or upload the
   output zip to [archipelago.gg](https://archipelago.gg/) for
   hosting).

### Options

- `campaign_mode` — `sequential` or `shuffled` (default).
  - `sequential`: each duel's Unlock is locked behind the previous
    duel's Win location. Inside each series the chain runs slot 1 →
    2 → ... so you advance naturally.
  - `shuffled`: every duel unlock goes into the AP item pool and the
    fill algorithm scatters them. Slot 1 of each series is
    pre-collected either way so all six series tabs are clickable at
    start.
- `goal` — `any_series_finale` or `duel_count` (default).
  - `any_series_finale`: complete the highest-numbered duel in any
    one of the six series.
  - `duel_count`: complete `goal_duel_count` duels in any
    combination.
- `goal_duel_count` (range 2–175, default 20) — required duel total
  when `goal=duel_count`.
- `hide_default_cards` (default **on**) — at session start the
  client writes 0 to the default-structure-deck-cards static address
  so your deck-edit trunk only contains AP-granted cards. Runtime
  only; the game's starter decks come back on next launch.
- `staple_filler_count` (range 0–200, default 100) — number of
  staple-tagged cards added to the AP item pool as filler. Drawn
  randomly without replacement from ~200 staples.
- `dp_filler_count` (range 0–200, default 50) — number of Duel
  Points filler items added to the pool, each picking randomly from
  {1000, 5000, 10000} DP.

## Playing the seed

> **Do not launch the game yourself.** The AP client launches Yu-Gi-Oh!
> for you, from its **Launch game** button on the Status tab, *after*
> it has reconciled your save with the seed. Starting the game from
> Steam (or any other shortcut) before the client is ready will skip
> save reconciliation — the client will then detect the game running
> and ask you to close it before continuing.

1. Disable Steam Cloud for the game (Properties → General →
   uncheck "Keep game saves in the Steam Cloud"). **Close the game
   completely** if it's already running — do not launch it manually;
   the client will do that for you in step 5.
2. Launch the Archipelago Launcher. Click **YGO LotD-LE Client**.
3. The client opens. Enter the server address (e.g.
   `archipelago.gg:38281`), your slot name, and the room password if
   the server requires one. Click **Connect**.
4. The client will walk you through any required steps:
   - **Steam Cloud check** — if not detected as off, a warning modal
     opens. Disable cloud sync in Steam and click **Verify** to
     re-run the check, or click **I've disabled cloud — proceed
     anyway** if you've already disabled it (your choice is
     remembered, so the modal won't reappear on this PC).
   - **Close the game** — if the game is open when you connect, the
     client waits for you to close it. The client needs the game
     closed so it can reconcile your save before it launches the
     game itself.
   - **Save swap** — if you're rejoining a different seed than the
     one currently on disk, the client offers to swap your tracked
     save in. Your current save is captured first, never deleted.
5. Once setup is reconciled, click **Launch game** on the Status
   tab. **The client launches Yu-Gi-Oh! itself** — do not start it
   from Steam. After it spawns the game, the client attaches via
   pymem.
6. **The game will warn that your save data is corrupted on the
   first launch into a new AP seed.** This is **normal and expected**
   — every new seed starts with a clean (empty) save, which the game
   reads as "no save here yet" and surfaces as a corruption warning.
   Dismiss the warning and continue; the game generates a fresh save
   and the AP client then writes your starter content into it. This
   warning will *not* appear on subsequent launches into the same
   seed.
7. After attach, the client's Status tab shows all six series and
   their current unlock state. Play any unlocked duel; on win, the
   AP location fires and you can spend earned Duel Points on
   individual cards via the **Crafting** tab.

The first time you connect to a new seed, your character also gets a
**starter archetype bundle**: 8 random cards (×3 copies each, so 24
total) from a curated archetype tied to your precollected character
pack. If the pack has multiple eligible archetypes you'll get a popup
asking which one — pick once, the choice persists for the rest of the
seed.

## Save management

Each AP world (each unique `seed_name × slot_name` combination) gets
its own isolated `savegame.dat` stored in
`Documents/ygo_lotd_ap/backups/<world_key>/`. The client swaps the
right save into your Steam userdata directory on connect and captures
your progress back to the world dir on disconnect.

The client's **Saves** tab lets you:
- See every tracked world.
- Restore your pre-AP save snapshot (taken automatically the first
  time the client runs).
- Manually restore any tracked world's save.
- Open the backup folder in Explorer.

The save manager has been tested but is new and the LE save format
is sensitive — **also keep your own manual backup** of
`Steam/userdata/<your steam id>/480650/remote/savegame.dat` from
before your first AP session. If the in-client snapshot fails to
restore for any reason, the manual copy is your guaranteed escape
hatch.

## Troubleshooting

- **"Save data is corrupted" warning when the game launches.**
  Expected on the first launch into any new AP seed — the seed
  starts with a clean (empty) save, which the game reports as
  corrupted. Dismiss the warning; the game generates a fresh save
  and the client writes your starter content in. The warning won't
  appear on later launches into the same seed.
- **"Steam Cloud check" modal keeps appearing.** The client parses
  Steam's `remotecache.vdf` to detect cloud state; on some setups
  the file is missing or uses a syncstate value we don't recognize.
  The modal shows what we actually saw (e.g. `syncstate=8`) — if
  you've already disabled cloud in Steam, click **I've disabled
  cloud — proceed anyway** and the client persists your
  acknowledgement to `Documents/ygo_lotd_ap/config.json` so the
  modal won't reappear. To reset, delete the
  `user_confirmed_cloud_off` key from that file. The legacy
  `--ygo-cloud-disabled-confirmed` CLI flag still works as a
  session-only bypass.
- **"Game running — close it first"** but no game window is open.
  The client looks for `Lotd.exe`, `LotdLE.exe`, `YuGiOh.exe`, or
  `Yu-Gi-Oh!.exe`. A leftover process can hang around after a crash;
  check Task Manager.
- **Launch button says "Connect to AP server first"** even though
  you connected. The client needs the AP server's slot_data before
  it can launch. Watch the status line — connection takes a second
  or two to fully resolve.
- **Cards aren't appearing after I get an item.** Re-enter the deck
  edit screen to refresh the trunk view. Granted cards persist; the
  game UI just caches the trunk while you're on the menu. You may
  need to do this more than once.
- **Duel completion didn't send a check.** The watcher polls every
  1s for the `Duel.State` transition into "Complete". Wait a second
  after the win screen. If still no check, check the client log for
  errors.
