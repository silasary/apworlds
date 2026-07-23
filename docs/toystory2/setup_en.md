# Toy Story 2 - Setup Guide

This guide walks you through installing and playing the Toy Story 2: Buzz Lightyear
to the Rescue randomizer for Archipelago.

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases). Please use
  version 0.6.7 or later for integrated BizHawk support.
- A legally obtained copy of **Toy Story 2: Buzz Lightyear to the Rescue** (PS1,
  NTSC-U, serial `SLUS-00893`) as an ISO or BIN/CUE image. Other regions are **not**
  supported, and **revision (REV) releases will not work**. The client cannot detect
  a wrong disc — it will connect and then behave incorrectly — so check this first if
  things look wrong from the very start.
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) 2.10 or later (the latest
  release is recommended). Other emulators are **not** supported.
- The latest `toystory2.apworld`. Put this in your `Archipelago/custom_worlds`
  folder.
- The `ts2.lua` all-in-one game script (distributed alongside the apworld). **Place
  it in your `Archipelago/data/lua/` folder** — the same folder Archipelago keeps its
  BizHawk connector and networking library in. This single script does everything, so
  you do **not** need to load any separate Archipelago BizHawk connector, but it does
  need to live in `data/lua/` so it can find Archipelago's `socket` library (a native
  component that can't be embedded in the script).

## Configuring BizHawk

Once you have installed BizHawk, open `EmuHawk.exe` and change the following
settings:

- Under `Config > Customize`, check the "Run in background" option to prevent
  disconnecting from the client while you're tabbed out of EmuHawk.
- Under `Config > Preferred Cores > PSX`, select **Nymashock**.
- Open any PlayStation game in EmuHawk and go to `Config > Controllers…` to
  configure your inputs. If you can't click `Controllers…`, it's because you need to
  load a game first.
- Consider clearing keybinds in `Config > Hotkeys…` if you don't intend to use them.
  Select the keybind and press Esc to clear it.

## Installing the APWorld

1. Double-click `toystory2.apworld`, or place it in your Archipelago install at
   `Archipelago/custom_worlds/`.
2. Launch `ArchipelagoLauncher.exe` once so it registers the world. You should now
   find **"Toy Story 2 Client"** in the list on the right side.

> **When updating to a new version, close the Archipelago client completely and
> reopen it.** Archipelago loads apworlds at startup, so reconnecting on its own will
> keep using the previously loaded copy. This matters most for the map page, whose
> data ships inside the apworld.

## Generating a Game

1. Create your options file (YAML). After installing the `toystory2.apworld` file,
   you can generate a template within the Archipelago Launcher by clicking
   `Generate Template Settings`.
2. Follow the general Archipelago instructions for
   [generating a game](https://archipelago.gg/tutorial/Archipelago/setup/en#generating-a-game).
3. Open `ArchipelagoLauncher.exe`.
4. Select **"Toy Story 2 Client"** in the right-side column.

## Connecting to a Server

1. Open EmuHawk.
2. Open your Toy Story 2 (NTSC-U) ISO or CUE file in EmuHawk and let it boot. Press
   Start at the first title screen to reach the **title screen after pressing Start**
   (the main menu). It is safe to sit here — pressing Start does not enter your save
   (see the important note below about *when* to load the scripts).
3. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing.
   Be careful to avoid clicking "TAStudio" below it in the menu, as this is known to
   delete your savefile.
4. In the Lua Console window, go to `Script > Open Script…`.
5. Open **`ts2.lua`** from your `Archipelago/data/lua/` folder. That's the only
   script you need — it includes the BizHawk connector, so there's nothing else to
   load. **It must be opened from `data/lua/`**; loading it from another location
   (e.g. your Downloads folder) will fail with a
   `socket.lua: The specified module could not be found` error, because the script
   won't be able to locate Archipelago's networking library.
6. The emulator and client will eventually connect to each other. The Toy Story 2
   Client window should indicate that it connected and recognized Toy Story 2.
7. To connect the client to the server, enter your room's address and port (e.g.
   `archipelago.gg:38281`) into the top text field of the client and click Connect.

You should now be able to receive and send items. You'll need to do these steps
every time you want to reconnect.

### Checking your connector version

When `ts2.lua` loads, it prints its version to the Lua console:

```
[TS2] Archipelago combined script loaded!  (connector v2.1.0)
```

It prints the version again when the client sends its settings. If that number
doesn't match the release you installed, EmuHawk is still running an old copy of the
script — replace it before reporting a bug.

## IMPORTANT: Load the Script on the Title Screen (After Pressing Start)

> **Load the `ts2.lua` script while the game is on the TITLE SCREEN AFTER PRESSING
> START.**

There are technically two title screens. The first is the initial splash; pressing
Start there takes you to the **second title screen** (the main menu). Pressing Start
to reach this menu is safe and does **not** enter your save, so it's the ideal place
to load the scripts.

Your starting items (starting moves, starting levels, laser, etc.) are applied when
the scripts first attach. If the Lua is loaded while the game is on anything other
than this title screen — for example mid-level, on the level-select map, or during a
cutscene — your starting inventory may not be applied correctly, and the game can
behave as if you have nothing.

To avoid this:

1. Boot the game and press Start to reach the **title screen after pressing Start**
   (the main menu). Do not start a save yet.
2. **Only then** load `ts2.lua` in the Lua Console.
3. Connect the Toy Story 2 Client to the server.
4. Start your save / enter the game normally.

## IMPORTANT: Reconnect on the Map or Title Screen, Not Mid-Level

> **When you need to reconnect or reload the scripts, do it from the level-select
> map or the title screen — never in the middle of a level.**

When the client reconnects, it re-syncs your full state (received items, checked
locations, and so on) back into the game. If this happens **while you are inside a
level**, the re-sync can collide with the level's own in-progress state and cause
incorrect behavior (for example, mis-set coin counts or checks that look wrong until
you leave and re-enter).

To re-sync safely:

1. Return to the **level-select map** (or the **title screen**) before reconnecting,
   reloading the Lua, or restarting BizHawk.
2. Reconnect the client (or reload `ts2.lua`).
3. Wait for the client to report that it has connected and re-synced.
4. Then enter a level as normal.

It is perfectly safe to make progress offline; everything will re-sync the next time
you connect — just do that connection from the map or title screen.

## Tracking Your Progress (optional)

You have two ways to track which checks you've found and which are currently in
logic. You can use either, or both.

### PopTracker pack (separate window, with auto-tracking)

Install [PopTracker](https://github.com/black-sliver/PopTracker/releases) and load
the Toy Story 2 pack. It can connect directly to your Archipelago slot to
auto-track items and checks as you play, and shows per-level maps. See the pack's
own readme for connection details.

### Universal Tracker (tabs inside the Toy Story 2 Client)

With Universal Tracker installed, the Toy Story 2 Client gains two extra tabs, both
inside the same window you already use to connect BizHawk:

- **Tracker Page** — a live list of exactly which locations are currently reachable,
  computed from this game's own logic and updating as you collect items.
- **Map** — a visual map view built from the same maps and pin positions as the
  PopTracker pack, covering every level plus Level Select and the boss map. It
  follows along as you play, switching to whichever level you're currently in.

Both show what is *reachable*, not what you are holding.

To install:

1. Download the latest `tracker.apworld` from the
   [Universal Tracker releases](https://github.com/FarisTheAncient/Archipelago/releases).
   Use the release that matches your Archipelago version, or it won't load.
2. Install it the same way you installed the Toy Story 2 apworld (double-click it,
   or drop it in your Archipelago `custom_worlds` folder).
3. Launch the **Toy Story 2 Client** as usual. When Universal Tracker is present, the
   tabs appear automatically; connect and play, and they update as you go. If
   Universal Tracker isn't installed, the client behaves exactly as before, with no
   extra tabs.

You do **not** need to keep your `.yaml` file around. This world supports Universal
Tracker's yaml-less tracking, so the seed's actual options — including your skips
difficulty, game mode, coinsanity settings, and randomly chosen starting levels — are
restored from the seed itself and the tracker matches your real game.

How coins appear on the map depends on your **Coinsanity Checks Bundle Size**:

- **Size 1** (the default): every coin is its own check, so coins are shown
  individually at their exact positions.
- **Size 5 and above**: coins are grouped into `Coin Bundle N` checks. A bundle covers
  several coins at once and has no single position of its own, so each level instead
  gets one **Coin Bundles** pin, placed where the PopTracker pack draws its coin
  counter — on both the level map and Level Select.

Whichever mode your seed uses, the other set of pins is hidden automatically.

If you'd rather have the tracker in a separate window, you can still launch
**Universal Tracker** directly from the Archipelago Launcher and connect to your
slot; both approaches use the same logic.

## Death Link (optional)

If you enable Death Link in your YAML, dying in your game sends a death to everyone
else with Death Link enabled, and their deaths will kill you. Deaths received while
you are not in a playable level are queued and applied once you are back in a level.

## Ending a Session

- Toy Story 2 does not automatically save your progress for you. When you're done
  playing, either save your game to a virtual memory card (recommended) or make a
  savestate to resume later. When reconnecting later, Archipelago will send you any
  items you received while you were disconnected — just reconnect from the map or
  title screen as described above.

## Troubleshooting

- **No starting items / nothing unlocked:** You most likely loaded the Lua off the
  title screen. Return to the title screen after pressing Start (the main menu),
  reload `ts2.lua`, and reconnect.
- **Coin counts, checks, or unlocks look wrong after reconnecting:** You may have
  reconnected or reloaded the scripts while inside a level. Return to the map or
  title screen and reconnect from there; the state will re-sync correctly.
- **Client says connected but nothing happens:** Make sure `ts2.lua` is loaded and
  that the Toy Story 2 Client is pointed at the correct game.
- **`socket.lua: The specified module could not be found` (or similar socket error):**
  `ts2.lua` was loaded from the wrong place. Move it into your `Archipelago/data/lua/`
  folder and open it from there. That folder holds Archipelago's `socket` networking
  library (a native file the script can't carry inside itself), and the script must be
  loaded from beside it.
- **Map or tracker tab looks out of date after updating:** Close the Archipelago
  client completely and reopen it. Apworlds are loaded at startup, so reconnecting on
  its own keeps using the previously loaded copy.
- **Old connector behaviour after replacing `ts2.lua`:** Check the version line the
  script prints in the Lua console when it loads. If it doesn't match the release you
  installed, EmuHawk is still running the old script — reload it from
  `Archipelago/data/lua/`.
- **Wrong game/version:** This randomizer targets the NTSC-U release
  (`SLUS-00893`). Other regions are not supported. MAKE SURE YOU DON'T HAVE A
  REV VERSION! IT WILL NOT WORK!