# Dwarf Fortress — Archipelago Setup Guide

## Required Software

- [Dwarf Fortress](https://store.steampowered.com/app/975370/Dwarf_Fortress/) (Steam 2022+ or Classic)
- [DFHack](https://store.steampowered.com/app/2346660/DFHack__Dwarf_Fortress_Modding_Engine/) — install via Steam alongside DF
- [Archipelago](https://archipelago.gg/) 0.6.7

---

## Installation

### 1. Install the AP World

Download `dwarfipelago.apworld` from the Releases section and double-click it. Archipelago will automatically copy it into your custom worlds folder.

> The AP client is bundled inside the world package — there is no separate client file to copy anywhere.

### 2. Install the DFHack Mod

Copy the `mods` folder from this repository into your Dwarf Fortress installation:

```
<SteamLibrary>\steamapps\common\Dwarf Fortress\mods\
```

This creates `mods\dwarfipelago\` inside your DF installation. The final layout should look like:

```
mods\dwarfipelago\
  info.txt
  scripts_modinstalled\
    dwarfipelago.lua
    internal\
      dwarfipelago\
        checks.lua
        items.lua
        log.lua
        state.lua
```

Then **enable the mod** in DF's in-game mod manager before generating or loading a world.

> **Important — installed_mods snapshot:**  
> When DF enables a mod it copies it to a separate snapshot directory. If you update the mod files later you must also update the snapshot, or disable and re-enable the mod in DF's mod manager to regenerate it automatically.  
> The snapshot lives at:
> ```
> %AppData%\Roaming\Bay 12 Games\Dwarf Fortress\data\installed_mods\dwarfipelago (1)\
> ```
> Paste that path into Explorer's address bar to open it directly.

### 3. Generate Your Archipelago Session

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
  craftsanity_item_group: medium    # easy | medium | hard | craftsanity | choose
  craftsanity_enable_materials: false  # split checks by material type (Stone Blocks vs Metal Blocks)
  craftsanity_max_amount: 15        # total items to produce per check group
  craftsanity_threshold: 5          # items crafted per individual check
  # craftsanity_items:              # only used when craftsanity_item_group is 'choose'
  #   - Beds
  #   - Blocks
  #   - Cloth
```

### 4. Launch and Connect

1. In the Archipelago launcher, click **Dwarf Fortress** to launch the game
2. Load or embark on a fortress
3. Click **Dwarf Fortress Client** in the launcher and connect to your server

The mod starts automatically once a world is loaded — no DFHack console commands needed.

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

### Where to find errors

- **AP client window** — client, RPC, and network errors, with full tracebacks.
- **`<Dwarf Fortress>/dwarfipelago.log`** — in-game mod errors (item spawn failures, trade depot placement, etc.). The path is printed to the DFHack console on start; print it any time with `lua print(reqscript("internal/dwarfipelago/log").path())`.
