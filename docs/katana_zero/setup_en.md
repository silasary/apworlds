# Katana ZERO Archipelago Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) (v0.5.0 or later)
- Katana ZERO (Steam PC version)
- The Katana ZERO APWorld (`katana_zero.apworld`) or Archipelago fork with Katana ZERO support

## Installation

### For Players (Using the APWorld Bundle)
1. Download `katana_zero.apworld` from the latest release.
2. Place `katana_zero.apworld` into your Archipelago installation's `custom_worlds/` directory (or `lib/worlds/`).
3. Start or restart the **Archipelago Launcher**.
4. You will see **Katana ZERO Client** appear in the client list.

### For Developers (Using the Archipelago Fork)
1. Clone the Archipelago repository fork:
   ```bash
   git clone https://github.com/CheeserLPC/Archipelago-KatanaZero.git
   cd Archipelago-KatanaZero
   git checkout katana-zero
   ```
2. Install dependencies:
   ```bash
   python -m pip install -r requirements.txt
   ```
3. Run the Launcher:
   ```bash
   python Launcher.py
   ```

## Creating a YAML Configuration

1. In the Archipelago Launcher, click **"Generate Template Settings"**.
2. Locate `Katana ZERO.yaml` in your `Players/Templates` directory and copy it to `Players/`.
3. Configure your desired options:

| Option | Type | Default | Description |
|---|---|---|---|
| `goal` | Choice | `government_lab` | Win condition: `government_lab`, `all_tapes`, or `boss_rush`. |
| `starting_tape` | Choice | `factory` | Which stage tape is unlocked at start. |
| `required_tapes` | Range | `8` | Number of stage tapes required to fight the Psychiatrist (1–11). |
| `shuffle_swords` | Toggle | `true` | Shuffles the 5 collectible swords into the item pool as useful progression. |
| `shuffle_chronos` | Toggle | `true` | Locks Slow-Motion at start and shuffles Chronos into the multiworld item pool. If disabled, Chronos is unlocked at start. |
| `shuffle_throw` | Toggle | `true` | Locks item throwing at start and shuffles Strength Training into the item pool. If disabled, Throw is unlocked at start. |
| `enemysanity` | Toggle | `false` | Every non-boss enemy in the game becomes an individual item check (adds 487 checks). |
| `trap_percentage` | Range | `10` | Percentage of junk items replaced with combat traps (0–100). |
| `death_link` | Toggle | `false` | Shares deaths between players in the multiworld. |
| `death_link_amnesty` | Range | `0` | Number of free deaths allowed before a death signal is broadcast (0 = every death). |
| `randomize_music` | Toggle | `false` | Shuffles all 47 background music tracks across stages, cutscenes, and boss fights. |
| `randomize_sfx` | Toggle | `false` | Shuffles all sound effects (slashes, gunshots, explosions, screams). |

## Generating a Game

1. Place your configured YAML in the `Players/` folder.
2. Run `Generate.py` (or click **"Generate"** in the Launcher).
3. Host the generated `.zip` file on [Archipelago](https://archipelago.gg) or run a local server:
   ```bash
   python Server.py --multidata output/AP_xxxx.zip
   ```

## Connecting & Playing

1. Launch **Katana ZERO** on Steam.
2. In the Archipelago Launcher, launch the **Katana ZERO Client** (or run `python -m worlds.katana_zero.client.Launch`).
3. Enter your server connection details:
   - Server Address (e.g. `archipelago.gg:38281` or `localhost:38281`)
   - Slot / Player Name
   - Room Password (if applicable)
4. The client will automatically detect and attach to `Katana ZERO.exe`:
   - A connection banner with process PID and status will be logged.
   - Stage progress, item unlocks, enemy defeats, and DeathLink will synchronize in real time.
   - If the game is restarted or closed, the client remains open and automatically re-hooks when the game is relaunched.
