# Final Fantasy VII

Final Fantasy VII (1997, Steam / PC) integrated with Archipelago. Field pickups, materia, and reserved shop slots
become multiworld **checks**, and the items you receive (vehicles, key items, equipment, materia, consumables) are
delivered straight into your save by the **Final Fantasy VII Client**, which reads and writes the live game memory.

This world pairs with the **Gold Saucer** randomizer, which patches the actual game files (field scripts, shops,
starting gear) from the seed Archipelago generates. The client handles everything that has to happen at runtime
(detecting checks, granting received items, applying multipliers, and driving the in-shop AP display).

## How It Works

1. Generate a seed with your YAML. Archipelago writes an `AP_<seed>_P<slot>_<name>.apff7` file (a JSON payload) next
   to the rest of the output.
2. Import that `.apff7` into **Gold Saucer** to build the randomized game files, then play through **7th Heaven**.
3. Run the **Final Fantasy VII Client** from the Archipelago Launcher and connect to the room. The client pulls the
   location/shop data from the server (or from the `.apff7` via `/setjson`) and syncs with the running game.

## Supported Features

- **Field item randomization** — treasure, pickups, and materia across the reachable maps become checks
  (`shuffle` keeps the original pool, `replace` rolls a fresh selection).
- **Shop randomization (Tier-3 native-grid)** — reserved shop slots sell Archipelago items shown with the owner's
  name; buying one fires the check (via the injected `shophook.dll`).
- **Free Roam** (default) — start on the world map near end-game with foot access to all continents; vehicles
  (Tiny Bronco/Highwind/Submarine), Midgar re-entry, and other traversal are gated behind received items.
- **Starting equipment randomization** with a configurable tier.
- **Battle reward multipliers** — scale EXP / Gil / AP (1–50×), applied live by patching the battle reward math.
- **DeathLink** and optional **Weapon (Ultimate/Ruby/Emerald) fight checks**.

## Victory Condition

Defeat **Sephiroth** in the Northern Crater. In Free Roam the goal is gated behind real end-game progression: the
**Highwind**, all party members recruited, and all four **Huge Materia**. Reaching the victory location grants the
hidden `FF7 Victory` item and completes the slot.

## Client Notes

- The client connects to a running `FF7_EN.exe` (Steam US v1.02), reads the Savemap at `0xDBFD38`, and fires a check
  when a field-pickup flag flips 0→1.
- Received items are written directly into inventory/materia; vehicles and key items update the relevant save state.
- Shop slots require `shophook.dll` (shipped with Gold Saucer) sitting next to `FF7_EN.exe`; the client auto-injects it.
