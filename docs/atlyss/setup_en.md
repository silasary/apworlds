# Atlyss Setup Guide

## Requirements

* **Archipelago 0.6.7 or later** — [releases](https://github.com/ArchipelagoMW/Archipelago/releases) (Rule Builder / `set_rule`; this world targets AP 0.6.7+)
* **ATLYSS** (Steam) with **BepInEx 5.4+**
* **Atlyss Archipelago** mod (BepInEx plugin) and this world's **`atlyss.apworld`**

## Install Archipelago and the world

1. Install Archipelago from the official release page.
2. Copy **`atlyss.apworld`** into your Archipelago install folder under **`custom_worlds/`**.
3. When hosting or playing on WebHost, select game **Atlyss** and configure your slot.

## Install the game mod

### Manual

1. Install [BepInEx](https://docs.bepinex.dev/) for ATLYSS and run the game once so folders are
   created.
2. Place **AtlyssArchipelago.dll** (release build) in
   `ATLYSS/BepInEx/plugins/` (or the Thunderstore mod folder if you use that layout).
3. Launch the game modded at least once before connecting.

### r2modman (recommended)

1. Install [r2modman](https://thunderstore.io/package/ebkr/r2modman/) and create an **ATLYSS**
   profile pointed at your game folder.
2. Install **AtlyssArchipelago** (and **BepInExPack** if prompted) from Thunderstore.
3. If Thunderstore lags behind GitHub, replace the profile's plugin DLL with the latest release
   from the project's GitHub page.
4. Use **Start modded** to launch.

Archipelago itself is **not** installed through r2modman — add the `.apworld` separately as above.

## Configuring your YAML file

### What is a YAML and why do I need one?

See the [basic multiworld setup guide](/tutorial/Archipelago/setup/en) on the Archipelago site for
how YAML files work.

### Where do I get a YAML?

Use the [Atlyss player options page](/games/Atlyss/player-options) to build a YAML in the browser,
or edit a template by hand. Set `game: Atlyss` and your slot name under the `Atlyss:` section.

Important options to review:

* **goal** — what counts as a win.
* **random_portals** — progressive portal lines vs per-area portal items.
* **shop_sanity** — shops send checks when enabled.
* **achievements** — include achievement locations (on by default).
* **equipment_progression** — gated tier logic vs unrestricted gear.
* **class_filter** — limit class gear in the pool.
* **profession_tools** — static tools on checks vs tools in the multiworld pool.
* **experience_multiplier** / **crown_multiplier** — in-game scaling from the mod.

Upload the generated YAML when joining a multiworld on WebHost or place it in your player config
folder for local play.

## Joining an Archipelago session

### Before you connect

1. Launch ATLYSS **modded**.
2. Open **Settings → Archipelago** and enter:
   * **Server** — hostname or `host:port` (e.g. `archipelago.gg:38281`).
   * **Slot** — must match your YAML slot name.
   * **Password** — room password if required (not saved to disk by the mod; re-enter each session).
3. Load a character: **Singleplayer → Create / Select Character**. Connection is blocked on the
   main menu without a loaded save.

### Connect

Press **F5** (default) to connect after your character is in the world. Chat will confirm the link
and show your goal. If the socket drops unexpectedly, the mod **auto-reconnects** with backoff
(enabled by default in BepInEx config `Connection.AutoReconnect`). Press **F5** anytime to connect
manually or reset the retry timer. Save/quit and returning to the main menu still fully disconnect.
Quest and level progress from your save are polled again after reconnect for missed checks.

### Gameplay tips

* Pick up items from **Spike's storage** after receiving AP gear.
* Portal items unlock regions on the world map; watch chat for unlock messages.
* With **Shop Sanity**, buying certain shop lines sends location checks — plan crown income
  accordingly.
* Use in-game AP chat for hints and `/help` for client commands supported by your server.

### Optional: text client

You can also run the Archipelago **text client** from your Archipelago install for chat and
commands alongside the game. See the
[commands guide](/tutorial/Archipelago/commands/en).

## PopTracker (autotracking)

The [ATLYSS-AP-PopTracker](https://github.com/blitz0070/ATLYSS-AP-PopTracker) pack marks checks
on a region map when you connect PopTracker to your Archipelago slot (variant **Archipelago**).

1. Install [PopTracker](https://github.com/black-sliver/PopTracker/releases) **0.31+**.
2. Copy the pack folder into PopTracker’s `packs/` directory (folder name:
   `ATLYSS-AP-PopTracker`).
3. Load **ATLYSS Archipelago Tracker** → **Archipelago** → connect with your slot credentials.

v0.2.x packs track **checked vs unchecked** only. Reachability (“in logic”) uses Universal Tracker
(see below).

## Universal Tracker (map + logic)

Universal Tracker (UT) simulates apworld logic for in-logic display. Atlyss exposes an external
PopTracker pack for the **map tab** (images + layout JSON paths).

### Host settings (`host.yaml`)

Add under the **`atlyss:`** section in your Archipelago **`host.yaml`** (or `options.yaml`):

```yaml
atlyss:
  atlyss_poptracker_path: /path/to/ATLYSS-AP-PopTracker
```

Use the **unpacked** pack folder (the directory that contains `manifest.json`). Leave empty to
be prompted on first UT use. UT reads `maps/maps.json` and `locations/locations.json` from that
path.

### Player YAML (optional logic export)

For a one-off logic JSON dump without UT:

```yaml
Atlyss:
  export_logic: true
```

Writes **`atlyss_logic_pN.json`** next to the spoiler output after generation. UT regen enables
this automatically.

Install the **Universal Tracker** `.apworld` from its project releases and point it at the same
player YAMLs used for your seed. See the Archipelago Discord **#universal-tracker** channel for
UT-specific setup.

## Troubleshooting

* **"Load a character first"** — create or select a character, then press F5.
* **Login failed** — verify slot name, password, server address, and that the room generated with
  game **Atlyss**.
* **No items or checks** — confirm BepInEx loaded the plugin (check `BepInEx/LogOutput.log` for
  `[AtlyssAP]` lines).
* **Wrong Archipelago version** — this world requires **0.6.7+**; update Archipelago and the
  `.apworld` from the latest release.

## Developer notes (logic export)

The apworld can write a post-generation JSON snapshot of resolved access rules:

* **`atlyss_logic_pN.json`** in the spoiler/output folder (`N` = player slot).
* Enabled when **Universal Tracker** triggers a regen (`re_gen_passthrough` for Atlyss), or manually via player settings **`export_logic: true`** in your YAML (default **off** for normal play).
* Used for debugging and Universal Tracker tooling; the in-game mod does **not** read this file.

Schema (`schema_version`, `meta`, `locations[]`, `entrances[]`, `completion`) is documented in
`AtlyssRules/export_logic.py`. `meta.item_mapping` lists progressive portal name aliases for
display only.
