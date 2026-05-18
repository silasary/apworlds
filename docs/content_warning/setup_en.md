# Content Warning Archipelago Setup Guide

## Required Software

- [Content Warning](https://store.steampowered.com/app/2506130/Content_Warning/) (Steam)
- [Content Warning APWorld](https://github.com/Jakeodude/cw-arch/releases) *(link to be updated)*

**Either:**

- [BepInEx (Unity Mono)](https://github.com/BepInEx/BepInEx/releases)
- [Content Warning Randomizer Mod](https://github.com/Jakeodude/cw-arch/releases) *(link to be updated)*

**OR**

- [Thunderstore Mod Manager](https://www.overwolf.com/app/Thunderstore-Thunderstore_Mod_Manager)

---

## Installing the Mod

### Thunderstore (Recommended)

Details to be added once the mod is published to Thunderstore.

### Manual Installation

1. Download **BepInEx (Mono)** from the link above and extract its contents
   into your Content Warning game directory:
   - **Steam**: `Steam\steamapps\common\Content Warning`

2. Launch Content Warning once to let BepInEx initialize, then close the game.

3. Download the latest `Content Warning Randomizer` mod release and place the
   extracted `Archipelago` folder into `BepInEx\plugins` inside your game
   directory.

4. Launch the game — a small Archipelago connection panel should appear on
   the main menu if the mod installed correctly.

---

## Installing the APWorld

1. Download the latest `content_warning.apworld` release file.

2. Place the `.apworld` file in the `custom_worlds` folder inside your
   Archipelago install directory.

   **OR** open the **Archipelago Launcher** and click **Install APWorld**,
   then browse to the downloaded `.apworld` file.

---

## Configuring Your YAML Options

After installing the `.apworld`, open the **Archipelago Launcher** and click
**Generate Template Options**. Locate the generated YAML for *Content Warning*
in the `players\Templates` folder and edit it to your liking.

### Available Options

| Option | Default | Description |
|---|---|---|
| `goal` | `viral_sensation` | Win by reaching 645,000 views OR by filming every monster & artifact |
| `include_hats` | `true` | Include all 31 Phil's Hat Shop purchases as check locations |
| `include_emotes` | `true` | Include all 16 emote purchases as check locations |
| `include_sponsorships` | `true` | Include sponsorship checks as locations |
| `dungeon_logic` | `easy` | `easy` requires safety gear for dangerous monsters; `hard` has no gear requirements |

---

## Connecting to the Multiworld

1. Launch Content Warning.
2. Open the Archipelago connection panel (top-left of the main menu).
3. Enter your **server address**, **slot name**, and **password** (if any).
4. Click **Connect**.
5. Start or load a save file and begin filming!

---

## Gameplay Notes

- **Locations are checked automatically** when you film a monster/artifact,
  meet a view quota, reach a view milestone, or purchase a store item.
- **Items** received from the multiworld appear as in-game currency, upgrades,
  or equipment depending on their type.
- **Traps** (Camera Malfunction, Monster Swarm, etc.) will trigger in-game
  effects when received from other players.
- The **goal item** ("Viral Sensation") appears at the Victory location once
  your goal condition is met.
