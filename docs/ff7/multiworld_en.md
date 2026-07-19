# Final Fantasy VII Multiworld Setup

## Required Software

- **Final Fantasy VII** — Steam / PC release (`FF7_EN.exe`, US v1.02).
- **7th Heaven** mod manager (used to launch the game with FFNx).
- **Gold Saucer** — the FF7 randomizer that patches the game files from the seed and ships `shophook.dll`.
- **Archipelago** (0.6.7+) with the **Final Fantasy VII** apworld installed.

> ⚠️ Always keep a clean backup of your FF7 install. Gold Saucer writes to a separate output folder, but the client
> injects a DLL into the running game.

## Installing the APWorld

1. Put `ff7.apworld` in your Archipelago `custom_worlds/` (or `worlds/`) folder, **or** run from a source checkout
   that already contains `worlds/ff7`.
2. Launch the Archipelago Launcher once so it picks up **Final Fantasy VII** and the **Final Fantasy VII Client**.

## Creating Your YAML

1. Use the **Generate Template Options** button in the Launcher (or the supplied `Final Fantasy VII.yaml` template),
   then edit the options to taste. See the in-game info page for what each option does.
2. Place your YAML in the host's `Players/` folder and generate as usual.

## Generating and Playing

1. **Generate** the multiworld. For each FF7 slot Archipelago writes an `AP_<seed>_P<slot>_<name>.apff7` file in the
   output, next to the multidata.
2. **Import** that `.apff7` into **Gold Saucer** (enables Archipelago mode) and run the randomization to produce the
   patched game files. Load them through **7th Heaven**, making sure `shophook.dll` ends up next to `FF7_EN.exe`.
3. **Host** the room (or join one) as normal.
4. **Launch** the game via 7th Heaven, then start the **Final Fantasy VII Client** from the Archipelago Launcher and
   connect with your slot name.
   - The client gets locations/shops from the server's `slot_data` automatically. If you ever need to load them from
     the file instead (offline/debug), point the client at the seed file with `/setjson <path-to-.apff7>`.
5. Play. Field/shop checks send automatically, received items appear in your save, and the goal completes when you
   beat Sephiroth (the hidden `FF7 Victory` item is granted at the victory location).

## Gold Saucer Integration (.apff7)

The `.apff7` is a JSON payload (`"format": "apff7"`). Import it via Gold Saucer's Archipelago import to drive
placement of every field item and shop slot. Top-level keys:

| Key | Description |
|-----|-------------|
| `format` / `version` | Always `"apff7"` / schema version |
| `game` | Always `"Final Fantasy VII"` |
| `seed` / `seed_name` | Numeric seed and human-readable identifier |
| `free_roam` | Whether the slot starts in Free Roam (world-map) mode |
| `player` | This slot's `slot` (int) and `name` |
| `players` | All players in the multiworld (slot, name, game) |
| `features` | Boolean array Gold Saucer reads (shop/field/starting-equipment/AP integration/text) |
| `rules` | Option-derived rule config (randomizers, starting-equipment tier, free_roam, goal, death_link) |
| `placements` | Per-location placement records (see below) |
| `shops` | Reserved shop-slot records (see below) |

#### Placement Record Fields

Each entry in `placements` describes one filled field location:

| Field | Description |
|-------|-------------|
| `location` / `location_id` | Location name and FF7 location code |
| `map` / `maps` | Primary field map and all maps where this pickup appears |
| `item_text` | Original in-game item text for this pickup slot |
| `category` | `standard`, `materia`, `key_item`, `reward`, etc. |
| `item` / `item_id` | Placed item name and Archipelago item id |
| `item_ff7_id` | FF7 internal item id (ff7tk `ItemId`) for native items, else `null` |
| `item_owner` / `item_owner_slot` | Receiving player name and slot |
| `item_is_local` | Whether the item belongs to this FF7 player |
| `item_classification` | `progression`, `useful`, or `filler` |
| `bank` / `address` / `bit` | Savemap BITON flag the client polls to detect the check |

#### Shop Record Fields

Each entry in `shops` reserves one native-grid shop slot for Archipelago:

| Field | Description |
|-------|-------------|
| `location` / `location_id` | Shop-slot location name and code |
| `shop_id` | Which FF7 shop sells the reserved token |
| `token_id` / `token_type` | The reserved item/materia id used as the AP "token" and its space |
| `item` / `item_id` / `item_ff7_id` | The AP item placed on this slot |
| `item_owner` / `item_is_local` | Receiving player and whether it's local |

### Data Sources

Item IDs and names come from the ff7tk `FF7Item::ItemId` enum; location names and maps from ff7tk
`FF7FieldItemList`. This keeps the `.apff7` ids aligned with what Gold Saucer writes into `flevel.lgp` and the
shop tables. BITON flag coordinates are precomputed at generation so the client needs no LGP scan at connect.

### Troubleshooting

- **Client can't find the game** — launch FF7 via 7th Heaven first; the client waits for `FF7_EN.exe`.
- **Shop names/descriptions don't change, or shop buys don't send** — confirm `shophook.dll` sits next to
  `FF7_EN.exe`; check `shophook_log.txt` in that folder. See `ShopHook/README.md`.
- **Checks not detected** — make sure the `.apff7` used by Gold Saucer matches the room you're connected to.
