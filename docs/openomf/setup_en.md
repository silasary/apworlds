# One Must Fall: 2097 Setup Guide

## Required Software

- [OpenOMF (AP fork)](https://github.com/stubobis1/openomf) — the Archipelago-patched build
- A copy of the original OMF:2097 game data (you must own the game)
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) for generating multiworld seeds

## Installation

1. Build the AP fork of OpenOMF (see `BUILD.md` in the repo) or download a release binary when available.
2. Place your OMF:2097 game data files (`.TRN`, `.BK`, etc.) in the `resources/` directory alongside the OpenOMF executable.
3. Launch OpenOMF.

## Connecting to an Archipelago Server

1. From the OpenOMF main menu, select **Archipelago**.
2. Enter your server details:
   - **Host** — your AP server address (default: `localhost`)
   - **Port** — default `38281`
   - **Slot name** — your player name as configured in your YAML
   - **Password** — leave blank if none
3. Press **Connect**. Once connected, the status indicator in the HUD shows `AP: OK`.

## Configuring your YAML

Download the template from the [player settings page](../player-settings) and adjust:

```yaml
game: One Must Fall: 2097

One Must Fall: 2097:
  goal_tournament: world_championship   # or: north_american_open, katushai_challenge, war_invitational, all_tournaments
  starting_har: random_selection        # or: jaguar, shadow, thorn, pyros, electra, katana, shredder, flail, gargoyle, chronos, nova
  har_stat_max: 9                       # 1–20; vanilla = 9
  pilot_stat_max: 25                    # 1–50; vanilla = 25
  buy_cost_factor: 100                  # 10–1000 (100 = vanilla prices)
  money_small_value: 3000               # base credits per Money (Small) item
  money_large_value: 15000              # base credits per Money (Large) item
```

Money values are further multiplied in-game by a per-tournament prize modifier
(1× NAO / 2× Katushai / 3× WAR / 6× World Championship).

## Gameplay Notes

- Your starting HAR is given immediately on connect; additional HARs arrive as AP items.
- Stat upgrades are **not applied immediately** — they take effect at the start of the next match.
- Money comes from match winnings **and** AP money bundle items. Repair costs still apply (clamped at $0).
- HAR trading and selling upgrades are disabled in AP mode.
- Registration fees for each tournament still apply — earn money by fighting matches first.
- Mechlab purchases and training sessions count as location checks. The stat boost arrives from the AP server, not the purchase itself.
