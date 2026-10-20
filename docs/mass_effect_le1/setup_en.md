# Mass Effect Legendary Edition 1 Setup Guide

Version 0.2 (beta test). Tested on the Steam release of Mass Effect Legendary Edition, English.

## Requirements

- Mass Effect Legendary Edition (Steam or EA app), Mass Effect 1 installed.
- [ME3Tweaks Mod Manager](https://me3tweaks.com/modmanager/) (installs the game mod and the ASI loader).
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.8 or newer.
- From the [latest release](https://github.com/Unowa001/ArchipelagoME1/releases/latest):
  - `mass_effect_le1.apworld`: the Archipelago world and client.
  - `ArchipelagoME1-mod-<version>.zip`: the game mod (Mod Manager imports it as is; do not unzip it).
  - `ArchipelagoME1-bridge-<version>.zip`: the game bridge and its installer (unzip it).
  - `Mass Effect Legendary Edition 1.yaml` (optional): the options template.

## 1. Install the world

Double-click `mass_effect_le1.apworld` (or copy it into `Archipelago/custom_worlds`). The Archipelago Launcher then
lists **Mass Effect LE1 Client**.

## 2. Install the game mod

1. Open ME3Tweaks Mod Manager and select Mass Effect 1 (Legendary Edition).
2. Drag `ArchipelagoME1-mod-<version>.zip` onto Mod Manager (or *Mod Management > Import mod from archive*), then apply
   **Archipelago for Mass Effect 1**. The installer asks whether to skip the mass relay and FTL travel videos.
3. In *Tools > ASI Manager* (Mass Effect 1 LE), install **LE1 Autoload Enabler** and **LE1 AutoTOC** if they are not
   installed yet. This also installs the ASI loader.

## 3. Install the bridge

The bridge (`LE1APBridge.asi`) lets the client read and write the game's plot state and hand over items. Unzip
`ArchipelagoME1-bridge-<version>.zip` first, then:

- Right-click `install-bridge.ps1` > *Run with PowerShell*. It finds the game in the usual Steam and EA folders; if it
  does not, run it from a PowerShell window with `-GamePath "<folder that contains Game\ME1>"`.
- Or copy both files from the `ASI` folder into `<Mass Effect Legendary Edition>\Game\ME1\Binaries\Win64\ASI\` by
  hand (delete any older `LE1APBridge*.asi` there).

## 4. Recommended

[Proper Convo-Cutscene Skipper](https://www.nexusmods.com/masseffectlegendaryedition/mods/1681) lets you skip
conversations and cutscenes. Install it through Mod Manager.

## 5. Generate and host

Mass Effect 1 is a custom world, so seeds are generated on your own PC; archipelago.gg can host them.

1. Make your YAML: Archipelago Launcher > **Options Creator** > Mass Effect Legendary Edition 1 (or edit the template
   `Mass Effect Legendary Edition 1.yaml`).
2. Whoever generates puts every player's YAML in `Archipelago/Players` (and installs every custom world in the
   multiworld), then clicks **Generate** in the Launcher. The seed is written to `Archipelago/output/AP_<seed>.zip`.
3. Host it: upload that zip at [archipelago.gg > Host Game](https://archipelago.gg/uploads) (use the latest Archipelago
   release to generate), or click **Host** in the Launcher to host on your own PC (port 38281).

## 6. Play

1. Start the game and start a **new career**. After character creation you are a Spectre on the Normandy.
2. Open the Archipelago Launcher > **Mass Effect LE1 Client** and connect with your slot name. The client says
   "Connected to LE1APBridge with a game world loaded" once a save is loaded.
3. Connect before you open any shop: a shop fills its stock on your first visit, and the client tells the game how many
   shop slots your seed has.
4. Press **F7** in game for a route summary, and check the **Archipelago** assignment in the journal. Keep the client
   running: it keeps the journal and the galaxy-map markers up to date. (To use another key than F7, put its Windows
   virtual-key code, e.g. `0x77` for F8, in a file `LE1APBridge.hotkey` next to `LE1APBridge.asi`.)

The client must run on the same PC as the game. Checks you make while the client is closed are kept in your save and
sent the next time it connects; items you receive while the game is closed arrive when you load your save.

## Updating

Download the new apworld, mod zip and bridge zip. Replace the apworld, import and apply the new mod zip in Mod Manager,
and run `install-bridge.ps1` from the new bridge zip (this version
needs bridge v11: older bridges show the F7 summary as notices, keep the generic shop names, and leave Shepard out of
breath when sprinting). From 0.2.0, an existing career should keep working (shops you already visited have no slots); from 0.1.x, start a
new career.

## Uninstall

In Mod Manager, *Restore* the game (this also brings back the travel videos) (or delete `BioGame\DLC\DLC_MOD_ArchipelagoME1`), then delete `LE1APBridge*.asi`
and `LE1APBridge.checks.tsv` from `Game\ME1\Binaries\Win64\ASI\`.
