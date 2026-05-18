# Death Road to Canada - Archipelago Setup Guide

## Overview

This guide will walk you through setting up Death Road to Canada for Archipelago multiworld randomizer. The setup requires modified game files, a Python client, and the APWorld file.

---

## Requirements

### Software Requirements

| Software | Version | Notes |
|----------|---------|-------|
| Death Road to Canada | Steam version | GOG/Epic may work but untested |
| Python | 3.8 or later | Download from [python.org](https://www.python.org/downloads/) |
| Archipelago | 0.5.0 or later | Download from [archipelago.gg](https://archipelago.gg/) |

### Python Dependencies

Open a command prompt and run:
```
pip install websockets
```

Or if `pip` isn't in your PATH:
```
py -m pip install websockets
```

---

## Installation

### Step 1: Locate Your Game Folder

Find your Death Road to Canada installation:

**Steam (Windows):**
```
C:\Program Files (x86)\Steam\steamapps\common\DeathRoadToCanada\
```

**Steam (Mac):**
```
~/Library/Application Support/Steam/steamapps/common/DeathRoadToCanada/
```

The mod files go in the `deathforth` subfolder.

### Step 2: Install Modified Game Files

**⚠️ IMPORTANT: Back up your `deathforth` folder before making changes!**

You need to install these modified base game files. These add the hooks that allow the Archipelago mod to track your progress:

#### Main Folder (`deathforth/`)

| File | Purpose |
|------|---------|
| `boot.df` | Loads the Archipelago mod |
| `things.df` | Adds container and toilet loot tracking hooks |
| `cyoa-charstats.df` | Adds recruit tracking hook |
| `game-save-state.df` | Adds save state hook |

#### Subfolders

| File | Purpose |
|------|---------|
| `events/siege/siege.df` | Adds siege completion tracking |
| `events/finale/end-of-the-road.df` | Adds victory tracking |

#### New Mod Files (place in `deathforth/`)

| File | Purpose |
|------|---------|
| `archipelago.df` | Main Archipelago integration mod |
| `customdoggo.df` | Custom dog character creator (optional) |
| `dogfix.df` | Fixes for custom dog spawning (optional) |

### Step 3: Install the APWorld

1. Locate your Archipelago installation folder
2. Find the `custom_worlds/` subfolder (create it if it doesn't exist)
3. Copy `death_road_to_canada.apworld` into that folder
4. Restart Archipelago if it was running

### Step 4: Set Up the Client

1. Place `DRTC_Client.py` somewhere convenient (e.g., your Documents folder)
2. You can create a shortcut to it for easy access

---

## Connecting to a Multiworld

### Step 1: Generate Your Game

1. Create a YAML file with your settings (see YAML Options below)
2. Submit it to the Archipelago generator along with other players' YAMLs
3. Download the generated multiworld

### Step 2: Start the Game

1. Launch Death Road to Canada
2. You should see **"ARCHIPELAGO MOD LOADED"** in the console/log
3. Go to the main menu

### Step 3: Start the Client

1. Open a command prompt
2. Navigate to where you saved the client:
   ```
   cd C:\path\to\client
   ```
3. Run the client:
   ```
   python DRTC_Client.py
   ```
4. Enter the server address (e.g., `archipelago.gg:12345`)
5. Enter your slot name
6. Enter the room password (if any)
7. Click **Connect**

### Step 4: Start Playing

1. In Death Road to Canada, select **ARCHIPELAGO** from the main menu
   - **DO NOT** use the regular "New Game" option!
2. Select your game mode (only unlocked modes will be available)
3. Start your road trip!

---

## Important Gameplay Notes

### Save Slot

- Archipelago **exclusively uses Save Slot 1**
- Slots 2 and 3 remain available for non-Archipelago games
- **Never** manually load or save to Slot 1 outside of Archipelago mode

### Progress Persistence

- **Progress is cumulative across all runs!**
- Dying does NOT reset your milestone progress
- Kills, containers, toilets, weapons collected, etc. all persist
- Mode victories are tracked per-mode

### Game Modes

- By default, only **Normal Mode** is unlocked
- Other modes are received as items from the multiworld
- You must complete your **goal mode(s)** to finish the game
- Your goal modes are set in your YAML configuration

### Location Checks

Locations are checked when you:

| Category | Trigger |
|----------|---------|
| Day Start | Begin a new day in any/specific mode |
| Day Clear | Survive/complete a day in any/specific mode |
| Victory | Reach Canada in an enabled mode |
| Kills | Reach cumulative kill milestones (50, 100, 150...) |
| Containers | Loot cumulative containers |
| Toilets | Search cumulative toilets |
| Weapons | Collect cumulative weapons |
| Sieges | Survive siege events |
| Recruits | Recruit characters |
| Weapon Types | Find your first weapon of each category |

### Items You Can Receive

| Category | Examples |
|----------|----------|
| Resources | Food, Gas, Medical Supplies, Ammo |
| Stat Training | Strength, Fitness, Shooting, Medical, Mechanical |
| Weapons | Pistol, Shotgun, AK-47, Random weapons of various tiers |
| Car Upgrades | Engine repair, Mechanic kit |
| Mode Unlocks | Familiar Characters, Deadlier Road, Marathon, etc. |
| Special | Zombo Points, Mystery Box, Legendary Weapons |
| **Traps** | Food Spoiled, Gas Leak, Car Damage, Bandits, etc. |

Items are delivered when you're on the road map or during missions.

---

## YAML Configuration Options

```yaml
Death Road to Canada:
  # Which mode victories count as completing your goal
  # You must win in ALL listed modes to complete
  goal_modes:
    - normal
  
  # Which modes generate locations (days, victories)
  # More modes = more locations = longer game
  enabled_modes:
    - normal
  
  # Maximum day locations per mode (1-30)
  max_days_per_mode: 15
  
  # Include per-mode day tracking
  include_day_start: true
  include_day_clear: true
  
  # Include global day tracking (across all modes)
  include_global_day_start: false
  include_global_day_clear: false
  
  # Milestone settings
  kill_milestone_max: 1000        # Max kills tracked (0-11000)
  kill_milestone_interval: 50     # Check every X kills
  
  container_milestone_max: 300    # Max containers (0-880)
  container_milestone_interval: 10
  
  toilet_milestone_max: 25        # Max toilets (0-110)
  toilet_milestone_interval: 5
  
  siege_milestone_max: 10         # Max sieges (0-65)
  siege_milestone_interval: 1
  
  recruit_milestone_max: 10       # Max recruits (0-65)
  recruit_milestone_interval: 1
  
  weapon_milestone_max: 50        # Max weapons (0-220)
  weapon_milestone_interval: 5
  
  location_visited_max: 50        # Max locations visited (0-320)
  location_visited_interval: 5
  
  # Include weapon category discoveries
  include_weapon_categories: true
  
  # Put mode unlocks in the item pool (true) or start with them (false)
  mode_unlocks_in_pool: true
  
  # Percentage of filler items that become traps (0-100)
  trap_percentage: 20
  
  # Death Link - die when others die, they die when you die
  death_link: false
```

### Milestone Scaling

The number of milestone locations available scales with enabled modes:

| Modes Enabled | Kills | Containers | Toilets | Weapons | Sieges | Recruits |
|---------------|-------|------------|---------|---------|--------|----------|
| 1 | 1,000 | 80 | 10 | 20 | 5 | 5 |
| 5 | 3,000 | 240 | 30 | 60 | 17 | 17 |
| 10 | 5,500 | 440 | 55 | 110 | 32 | 32 |
| 21 (all) | 11,000 | 880 | 110 | 220 | 65 | 65 |

---

## Console Commands

Open the game console and type these commands:

| Command | Effect |
|---------|--------|
| `ap-reset-progress` | **Reset ALL Archipelago progress** (for starting a new seed) |
| `ap-print-stats` | Print current milestone counts |

---

## Troubleshooting

### "on-toilet-loot doesn't exist" or similar errors

You're missing the modified base game files. Make sure you installed ALL the files listed in Step 2, not just `archipelago.df`.

### Client window closes immediately

Run from command prompt to see the error:
```
python DRTC_Client.py
```

Common causes:
- Python not installed → Install Python 3.8+
- Missing websockets → Run `pip install websockets`

### Items not being received

1. Make sure the client is connected (green status)
2. Check that the client has the correct save path
3. Make sure you're in a mission or on the road (not in menus)

### Progress not saving

- Archipelago auto-saves when returning to the road
- Always complete missions normally (don't force-quit)
- Check console for save errors

### Mode not appearing in menu

- That mode's unlock item hasn't been received yet
- Check the client log to see what items you've received
- Open a text client and !hint for "mode unlock - O*P*P " etc.

### Client crashes with large multiworlds

Update to client version 3.1.1 or later, which removes the message size limit.

---

## File Locations

### Game Save Path

The client needs to know where your game saves are:

**Windows:**
```
%APPDATA%\.madgarden\DR2C\
```

**Mac:**
```
~/Library/Application Support/.madgarden/DR2C/
```

**Linux:**
```
~/.madgarden/DR2C/
```

### Communication Files

The mod and client communicate via text files in your save folder:

| File | Purpose |
|------|---------|
| `ap_inbox.txt` | Items sent TO the game |
| `ap_outbox.txt` | Location checks sent FROM the game |
| `ap_goal.txt` | Goal completion flag |
| `ap_progress.sav` | Persistent milestone progress |

---

## Credits

- **Mod Development**: PixelShake92
- **Game**: Rocketcat Games / Madgarden
- **Archipelago**: The Archipelago team

## Support

If you encounter issues not covered here, check:
1. The Archipelago Discord server
2. The Death Road to Canada community