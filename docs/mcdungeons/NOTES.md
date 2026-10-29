# Minecraft Dungeons apworld: notes

## What this is
An Archipelago apworld for Minecraft Dungeons: missions, chests, bosses, emeralds and other checks become multiworld locations, and mission access, pickups and gear become items. A DLL injected into the game and a Python client let the game send checks and receive items.

## How the files fit together
- ZoneData.py: defines every mission in the game: how to unlock it (requires), whether it comes from a DLC, and whether it is a secret mission. The other files (items, locations, regions, rules) are built from this list. Its order decides the item and location IDs. Adding or moving a zone shifts later IDs, so it is a breaking change for existing seeds until new zones get their own ID range (see Planned).

- Items.py: defines everything the player can receive from the multiworld: Access items that unlock each mission, progressive items (pickup tiers, enchant slots), Eyes of Ender, villagers, and filler (emeralds, random gear). Each item has a classification (progression, useful or filler) and a fixed ID that must never change once published.

- Locations.py: lists every check in the game and gives each one a fixed ID: mission completes, emerald milestones, boss and mini-boss kills, chests, villagers, Eyes of Ender. IDs are grouped in separate blocks so one family never overlaps another. It only says what the checks are. Where they sit and what they require is handled in Regions.py and Rules.py.

- Regions.py: builds the map. It creates a region for each enabled zone (starting from Menu), places the checks inside it, and connects zones to their prerequisites with access rules from Rules.py. It skips zones of disabled DLC packs, marks some checks as EXCLUDED so no required item can end up there, and places the victory events that define the win condition.

- Rules.py: defines what the player must have received to enter each zone. A rule is a function that returns True or False: a zone needs its own Access item (Secret Access for secret zones when that option is on) plus the Access items of its predecessors. The Stronghold also needs all six Eyes of Ender when that option is on, and the Ancient Hunts need a single Ancient Hunt Access item.

- Options.py: declares everything the player can choose in their YAML: which DLC packs are enabled or required, which extra checks exist (bosses, mini-bosses, chests, villagers, Eyes of Ender), and the goal (emeralds and/or a goal mission). Each option has a type (Toggle, Choice, Range, OptionSet) and its docstring is the description shown to the player. All options are collected in the MCDungeonsOptions dataclass.

- __init__.py: the conductor. It declares the world (game name, options, item and location IDs) and runs the generation steps in order: validate the options and give the starting item (generate_early), create the regions (create_regions), build the item pool so it matches the number of locations (create_items), and send the client the data it needs (fill_slot_data). It also adds the client button to the Archipelago Launcher. Archipelago itself places the items in the checks.

## Game side (dungeons_bridge.dll)
The DLL is injected into the game and runs a named-pipe server; the Python client sends it text commands (about 36, handled in `HandleRequest`). One client at a time, pipe name contains the game's PID, remote (network) clients rejected, default Windows security, no authentication: any local process that can open the pipe can send any command.

- **Read only:** `get_build_info`, `get_health`, `get_crumbs`, `get_*_events` (chest, death, secret, merchant, mission outcome, currency, health), `get_pickup_tier`, `get_level_gate`, `get_void_mode`, `get_block_*`, `get_crash_guard` and `dump_recorder` report state or write logs and change nothing in the game; the `get_*_events` commands empty the DLL's event queue after reading.
- **Game behavior settings:** `set_level_gate`, `set_secret_block`, `set_pickup_tier`, `set_block_merchants`, `set_block_eyes`, `set_void_mode` and `set_crash_guard` change what the hook does (refuse a mission, swallow a secret or merchant unlock, block pickups, void mode, crash guard on/off).
- **Calls and lookups:** `CALL` and `CALLDATA` run a game function through ProcessEvent on the game thread (`CALLDATA` with caller-supplied parameter bytes), and `find_by_name`, `find_outer` and `resolve_name` search objects and names in memory.
- **Hook control:** `hook_state`, `hook_silence` and `hook_wake` read or change whether the hook is active or silent; the DLL silences itself on level transitions, so these are available for manual control and the client does not need them.
- **Self-tests:** `health_selftest` and `crash_selftest` prove the freeze report and crash report work without freezing or crashing the game (the access violation is caught).

## How to add a new zone
1. Append a `ZoneInfo` at the end of `ZONES` in `ZoneData.py` (`internal_name` must match the game's memory, `dlc_pack` must match an option name).
2. All IDs come from one shared counter in `Items.py`, so this shifts later item IDs: bump `world_version` in `archipelago.json` and treat it as a breaking change for existing seeds.
3. Run the tests.

## Rules I follow
- Item and location IDs never change once published.
- New Items go at the end of the table
- No exec/eval (only `ast.literal_eval` in tests).

## Release
- dungeons_bridge.dll SHA-256: `e35a603290fb3ca501de3cc39a441c5a4bed302b827190bf002b5a20fac45a28`
  (a rebuild changes it: recompute with `certutil -hashfile dungeons_bridge.dll SHA256`)
- Source tag on GitHub: `v0.0.3`
- Build: `cl /LD /EHsc dungeons_bridge.cpp /I <minhook>\include /link d3d11.lib dxgi.lib user32.lib <minhook>\lib\libMinHook.x64.lib /MAP:dungeons_bridge.map /OUT:dungeons_bridge.dll`

## Planned
Potential future features:
1. Multiple mission goal
2. Deathlink option to choose from two mode death and mission defeat
3. Logo for Deathlink death, Chest icon, and the game itself
4. Adding traps
5. Level check and enchant point in the multiworld
6. Villager shop randomized in the multiworld
7. The Tower support (wave-based mode, cannot be completed, so not a zone or goal)
8. Restrict the bridge pipe to the current user with explicit security attributes (today it uses the default Windows ACL)
9. Give new zones their own ID range so adding one does not shift existing IDs