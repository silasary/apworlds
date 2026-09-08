# Dwarf Fortress — Archipelago Setup Guide

## Required Software

- [Dwarf Fortress](https://store.steampowered.com/app/975370/Dwarf_Fortress/) (Steam 2022+ or Classic)
- [DFHack](https://store.steampowered.com/app/2346660/DFHack__Dwarf_Fortress_Modding_Engine/) — install via Steam alongside DF
- [Archipelago](https://archipelago.gg/) 0.6.7

---

> **Upgrading from 1.3.x?** 2.0 changed locations, items and logic, and added new
> raws. Both halves have to be redone: **generate a new multiworld seed** (old seeds
> are refused rather than allowed to fail mid-run) and **generate a new DF world**
> (raws only enter a save at world-gen). Existing forts cannot be carried over.

## Installation

### 1. Install the AP World

Download `dwarfipelago.apworld` from the Releases section and double-click it. Archipelago will automatically copy it into your custom worlds folder.

> The AP client is bundled inside the world package — there is no separate client file to copy anywhere.

### 2. Install the DFHack Mod

Copy the `mods` folder from this repository into your Dwarf Fortress installation:

```
<SteamLibrary>\steamapps\common\Dwarf Fortress\mods\
```

`%AppData%\Roaming\Bay 12 Games\Dwarf Fortress\mods\` works too — the client
writes to whichever copies it finds. Just don't keep one in both, or you will be
guessing which one DF's mod manager is showing you.

This creates `mods\dwarfipelago\`. The final layout should look like:

```
mods\dwarfipelago\
  info.txt
  objects\            <- raws: the Archipelago civilization and the shop materials
  graphics\           <- raws: the AP item sprite
  scripts_modinstalled\
    dwarfipelago.lua
    internal\
      dwarfipelago\
        apcaravan.lua
        checks.lua
        items.lua
        log.lua
        state.lua
```

The `objects\` and `graphics\` folders are not optional. They carry the
`ARCHIPELAGO` civilization and the Merchant's Shop materials, and **raws only enter
a save at world generation** — a world generated without them can never have the
shop, no matter what you install afterwards.

> **installed_mods snapshot:** when DF enables a mod it copies it to a snapshot
> directory, and that copy is what world-gen actually reads. **The client keeps this
> in sync for you** — on connect it wipes any stale `dwarfipelago*` snapshots and
> reinstalls a fresh one, so you no longer have to disable/re-enable the mod by hand
> after an update. The snapshot lives at:
> ```
> %AppData%\Roaming\Bay 12 Games\Dwarf Fortress\data\installed_mods\dwarfipelago (15)\
> ```

### 3. Install the World Gen Preset

Dwarfipelago works best with a specific world generation profile. **The client
installs this for you** whenever it connects, so in the normal flow you can skip
straight to step 4.

If you want to install it without connecting — or something went wrong — run this in
the **Dwarf Fortress Client** from the Archipelago launcher:

```
/dfinstall
```

It adds the preset to your world gen list and reinstalls the mod snapshot.
`/dfuninstall` reverses both, leaving your `mods\dwarfipelago\` copy and your saves
untouched.

> **Back up your world_gen.txt first** if you have custom presets you care about:
> ```
> %AppData%\Roaming\Bay 12 Games\Dwarf Fortress\prefs\world_gen.txt
> ```
> The command appends the Dwarfipelago preset without touching your existing entries, but a backup is good practice.

After running the command, restart DF and the **DwarfipelagoWorld** preset will appear in the world generation preset list. Select it when creating a new world.

> **If `/dfinstall` can't find your `world_gen.txt`** (e.g. a non-Steam install), set `game_path` in `host.yaml` to your `Dwarf Fortress.exe`, or copy `prefs/world_gen.txt` from this repo into your DF `prefs/` folder by hand.

#### Verifying your world

After generating a world (and before embarking), run this command in the DFHack console to confirm the world meets Archipelago requirements:

```
dwarfipelago test worldcheck
```

This checks world size, history length, the presence of Dwarf/Human/Elf/Goblin civilizations, and active volcano count. If any check fails, consider rerolling — a world missing a key civilization will make certain AP goals impossible.

---

### 4. Generate Your Archipelago Session

Create a `DwarfFortress.yaml` options file and generate your session through the Archipelago launcher or CLI:

```yaml
name: YourName
game: Dwarf Fortress

Dwarf Fortress:
  goal: population_boom             # population_boom | legendary_wealth | slay_megabeast | mountainhome
  wealth_goal_amount: 100000        # target treasury value in minted coins + cut gems (legendary_wealth goal only)
  population_goal_amount: 300       # target population (population_boom goal only, range 20–500)
  trap_item_weight: 20              # 0–100, percentage of filler slots that are traps
  deathlink: false                  # enable DeathLink
  deathlink_threshold: 5            # dwarf deaths per outgoing DeathLink (1–20)

  # Craftsanity — optional crafting milestone checks
  craftsanity: off                  # off | on | storage
  craftsanity_difficulty: medium    # easy | medium | hard | craftsanity | choose
  craftsanity_enable_materials: false  # split checks by material type (Stone Blocks vs Metal Blocks)
  craftsanity_max_amount: 15        # total items to produce per check group
  craftsanity_threshold: 5          # items crafted per individual check
  # craftsanity_items:              # only used when craftsanity_difficulty is 'choose'
  #   - Beds
  #   - Blocks
  #   - Cloth
```

### 5. Launch and Connect

**Connect the client before you open Dwarf Fortress.** On connect it installs the
world gen preset, reinstalls the mod snapshot so world-gen reads current files, and
then launches DF itself. If DF is already running it read its mod list at startup and
will not see any of that.

1. Click **Dwarf Fortress Client** in the Archipelago launcher and connect to your server.
2. Watch the client log for the install lines:
   ```
   World gen preset installed to: ...
   Installed dwarfipelago (raws + scripts) for world-gen to: ...
   Native caravan: baked 50 shop good(s), prices <lo>-<hi>, into: ...
   ```
   DF then opens on its own — you do not need the launcher's **Dwarf Fortress** button.
3. In DF choose **Create New World**, and in the world gen screen:
   - select the **DwarfipelagoWorld** preset, and
   - **tick `Dwarfipelago` in the mod list.** This is the step people miss. Enabling
     the mod here is what writes its raws into the save; a world generated without it
     has no Archipelago civilization and no Merchant's Shop, permanently.
4. Generate the world, then embark as normal.

The mod starts automatically once a fortress loads — no DFHack console commands needed.
Within a few ticks you should see the trade depot announcement below.

> **Merchant's Shop goods** are named and priced by the mod while your fortress runs, so
> any world generated with **Dwarfipelago enabled** shows them correctly no matter when
> you connected. The client additionally bakes them into the raws before world gen as a
> fallback. What the shop *does* require is that the world was generated with a mod build
> that includes the shop materials — an older one leaves the goods unnamed at a flat
> price, and the mod says so in `<Dwarf Fortress>/dwarfipelago.log`. The fix is to
> generate a new world with the current mod enabled.

---

## Trade Depot

On the first poll tick after your fortress loads, the mod automatically places a **Trade Depot** near your starting wagon. You will see the announcement:

> *[AP] A Trading Post has been established near your starting wagon!*

- The depot is placed **7 tiles west** of the wagon and instantly completed (no dwarves or materials required)
- If that spot is obstructed the mod tries the remaining three cardinal directions
- If you already have a Trade Depot built, it is adopted as the delivery point instead
- **All AP location checks and item deliveries are held until the depot is established** — nothing is sent or received before it exists

### If the depot does not appear

1. Build a Trade Depot manually — the mod will detect and adopt it on the next poll tick
2. To force a retry, run in the DFHack console:
   ```
   lua dfhack.persistent.saveWorldDataString("dwarfipelago/depot_built", "0")
   ```
   Then save and reload your fortress

---

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| **"Dwarf Fortress not found"** | Set `game_path` in `host.yaml` to point to your `Dwarf Fortress.exe` (Steam) or `dfhack.exe` |
| **"Dwarf Fortress Client" missing from launcher** | Confirm `dwarfipelago.apworld` is installed and restart the launcher |
| **Client can't connect to DFHack** | Ensure DFHack is running; its remote API listens on `127.0.0.1:5000` by default |
| **Mod doesn't start automatically** | Load a fortress and wait ~5 seconds; you can also run `dwarfipelago start` in the DFHack console |
| **Trade depot not appearing** | See the Trade Depot section above |
| **Items not arriving** | Check the client log window; items are delivered via DFHack RPC once the depot is established |
| **Checks fire immediately on world load** | Ensure you are running Archipelago 0.6.7 and the latest mod version |
| **Shop goods have no names / all cost the same** | That world was generated with a mod build older than the shop materials. Check `dwarfipelago.log`, then generate a new world with the current mod enabled (see step 5) |

### Where to find errors

- **AP client window** — client, RPC, and network errors, with full tracebacks.
- **`<Dwarf Fortress>/dwarfipelago.log`** — in-game mod errors (item spawn failures, trade depot placement, etc.). The path is printed to the DFHack console on start; print it any time with `lua print(reqscript("internal/dwarfipelago/log").path())`.
