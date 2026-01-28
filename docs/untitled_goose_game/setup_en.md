# Untitled Goose Game Archipelago Setup Guide

## Required Software

- Untitled Goose Game (Steam)
- BepInEx 5.4.9.0 x 64 for Unity Mono
- .NET 6.0 Runtime (for the proxy server)
- Archipelago client files (from releases)
- Archipelago server 0.6.4 or higher

## Installation

### Step 1: Install BepInEx

1. Download https://github.com/BepInEx/BepInEx/releases/tag/v5.4.9 x64
2. Extract the contents into your Untitled Goose Game folder
   - Steam: `C:\Program Files (x86)\Steam\steamapps\common\Untitled Goose Game\`
3. Run the game once and close it - this creates the BepInEx folder structure

### Step 2: Install .NET 6.0 Runtime

1. Download the [.NET 6.0 Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/6.0) if you don't have it
2. Run the installer

### Step 3: Install the Mod

1. Download the following files from the releases page:
   - `GooseGameAP.dll`
   - `APProxy.exe`
   - `APProxy.dll`
   - `APProxy.runtimeconfig.json`
2. Place all four of them in `Untitled Goose Game\BepInEx\plugins\`

### Step 4: Install the APWorld

1. Download `untitled_goose_game.apworld` from the releases page
2. Place it in your Archipelago installation's `custom_worlds` folder
   - Or double-click the .apworld file if you have Archipelago's file association set up

### Step 5. Edit the YAML & Generate a Game

1. Create a YAML config file for your game (see template below)
2. Hand your YAML to whoever is generating the game, or generate the game yourself using the Archipelago Launcher
3. If you're the one generating the game, either host locally or on Archipelago.gg (`Get Started -> Host Game`)

### Step 6. Play the Game

1. Launch Untitled Goose Game
2. Press `F1` to open the AP connection menu
3. Enter:
   - **Server**: Your AP server address (e.g., `archipelago.gg:12345`)
   - **Slot Name**: Your player name (must match your YAML)
   - **Password**: (if required)
4. Click Connect

## Gameplay Changes

### Area Progression
In vanilla Untitled Goose Game, areas unlock automatically as you progress. With AP:
- You start with 1 **Random Area** unlocked or whatever was chosen in the yaml
- If you try to enter an area that you do not have access to you will be warped to the Hub area (Well)
- **Garden**, **High Street**, **Back Gardens**, **Pub**, and **Model Village** require AP items
- Complete goals to send checks and receive items from the multiworld

### Tasks = Locations
Every task on your to-do list is a location check:
- Complete "Rake in the lake" → Send check → Maybe unlock someone else's item!
- Someone completes their check → You might receive "High Street Access"!

### Types of Locations
- All main tasks (these are always locations)
- To Do (As Well) tasks
- To Do (Quickly!!) tasks
- First-time prop pickups
- First-time prop dragging
- Interactions (eg. turning on the sprinkler or unplugging the radio)
- Pecking the model church
- Brand new tasks invented for AP!

### Types of Items
- Area Access Items (these are always items)
- NPC Souls
- Props
- Upgrades
- Coins (filler)
- Traps

### Upgrade Items
- Mega Honk (Ugradable honk with final level forcing NPCs to drop their held items)
- Speedy Feet (faster movement up to a total of 150%)
- Goose Day (Force NPCs to have their neutral behaviour for 15s)

### Trap Items
- Tired Goose (slower movement)
- Suspicious Goose (Honk randomly for 10s)
- Confused feet (Random Stick directions for 15s)
- Butterbeak (drop items and be unable to grab anything for 10s)

### Extra Controls

- `| Key    | Action                                                |`
- `|--------|-------------------------------------------------------|`
- `| F1     | Toggle AP UI visibility                               |`
- `| F2     | Toggle Soul UI Visibility                             |`
- `| F3     | Toggle Server UI Visibility                           |`
- `| F4     | Toggle Extra Tasks UI Visibility                      |`
- `| G      | Use a stored Goose Day                                |`
- `| C      | Cycle goose colour                                    |`
- `| Ctrl+C | Reset goose colour                                    |`
- `| F9     | Resync gates (use if gates get stuck after reconnect) |`
- `| 0      | Warp to starting area (if not holding anything)       |`
- `| 1      | Warp to garden (if not holding anything)              |`
- `| 2      | Warp to high street (if not holding anything)         |`
- `| 3      | Warp to back gardens (if not holding anything)        |`
- `| 4      | Warp to pub (if not holding anything)                 |`
- `| 5      | Warp to mode village (if not holding anything)        |`
- `| H      | Warp to the well in the hub (if not holding anything) |`
- `|--------|-------------------------------------------------------|`

## YAML Template

```yaml
name: Goose
description: Untitled Goose Game github template
game: Untitled Goose Game
requires:
  version: 0.6.5

Untitled Goose Game:
  starting_area:
    # Which area the player starts with access to. 
    # Without this, you'd be stuck at the hub with nothing to do!
    # Model Village is not an option since it's the finale area.
    garden: 0
    high_street: 0
    back_gardens: 0
    pub: 0
    random: 50

  goal:
    # Victory is always when you steal the Golden Bell and bring it home. Goal settings change how it spawns:
    # only_steal = Simply reach the bell and steal it!
    # find_bell = The Golden Bell is lost somewhere in the multiworld! Find it before you can steal it.
    # all_main_tasks = Complete all four area task lists to spawn the Golden Bell.
    # only_speedrun_tasks = Complete all 'To Do (Quickly!!)' tasks to spawn the Golden Bell.
    # all_tasks_no_speedrun = Complete all four area task lists as well as the 'To Do (As Well)' task lists to spawn the Golden Bell.
    # all_tasks = Complete all task lists to spawn the Golden Bell.
    # four_final_tasks = Complete the final task of each of the four area task lists to spawn the Golden Bell.
    only_steal: 50
    find_bell: 0
    all_main_tasks: 0
    only_speedrun_tasks: 0
    all_tasks_no_speedrun: 0
    all_tasks: 0
    four_final_tasks: 0

  include_npc_souls:
    # When enabled, NPCs won't appear until you receive their soul item.
    # This adds NPC souls to the item pool and gates NPC-related goals behind them.
    'false': 0
    'true': 50

  logically_require_npc_souls:
    # This option is only for when NPC Souls are included in the pool. When enabled, generation will think that all NPCs are required in order to complete the goal.
    # You may be more likely to find them in your seed, which may make the experience more satisfying. NPCs make the final sequence of stealing the bell more difficult and interesting.
    # WARNING: Only enable this option if you know what you are doing. Many NPCs may not be required in order to complete the goal, and doing so without them will be going out of logic!
    'false': 50
    'true': 0

  include_prop_souls:
    # When enabled, items can't be picked up or dragged until you receive them.
    # This adds props to the item pool and gates item interactions behind them.
    # If the find_bell goal is chosen and this option is disabled, the Golden Bell will be the only one added to the pool.
    'false': 0
    'true': 50

  include_extra_tasks:
    # Include post-game extra challenge tasks as locations.
    # Must be enabled when choosing either the all_tasks_no_speedrun or all_tasks goal.
    'false': 50
    'true': 0

  include_speedrun_tasks:
    # Include speedrun challenge tasks (complete areas before noon).
    # Must be enabled when choosing either the only_speedrun_tasks or all_tasks goal.
    'false': 50
    'true': 0

  include_item_pickups:
    # Include first-time item pickups as locations (100+ additional checks).
    # Must be enabled when including prop souls in the pool.
    'false': 0
    'true': 50

  include_drag_items:
    # Include first-time drag item locations (50+ additional checks for heavy/draggable items).
    'false': 0
    'true': 50

  include_interactions:
    # Include interaction locations (ringing bells, spinning windmills, breaking boards, etc.).
    'false': 0
    'true': 50

  include_model_church_pecks:
    # Include locations for pecking the model church apart
    # first_pecks_only - includes two locations; 
    # all_pecks - includes all 35 pecks each as their own location
    none: 0
    first_pecks_only: 50
    all_pecks: 0

  include_milestone_locations:
    # Include extra locations for completing all garden tasks, all high street tasks, etc.
    # - Including extra tasks adds a milestone for completing all To Do (As Well) tasks
    # - Including speedrun tasks adds a milestone for completing all speedrun tasks
    'false': 0
    'true': 50

  include_new_tasks:
    # Include locations for new tasks created for this archipelago!
    # Some of these happen naturally throughout gameplay, and some are more involved.
    # You can view these tasks at any time in-game by pressing F4. New tasks include:
    # - Break the intro gate
    # - Drop some mail in the well
    # - Short out the garden radio
    # - Lock the groundskeeper IN the garden
    # - Trap the TV shop owner in the garage
    # - Break through the boards to the back gardens
    # - Make the woman fix the topiary
    # - Pose as a duck statue
    # - Dress up the bush with both ribbons
    # - Do some interior redecorating
    # - Trip the burly man
    # - Break a pint glass
    # - Perform at the pub with a harmonica
    'false': 0
    'true': 50

  filler_amount_mega_honk:
    # Amount of Mega Honk in the filler pool.
    # Mega Honk effects - upgraded honking abilities
    # Level 1: All NPCs react to honk (draws attention) - default behavior enhanced
    # Level 2: Increased honk detection distance - always heard regardless of distance
    # Level 3: Scary honk - NPCs drop held items
    #
    # You can define additional values between the minimum and maximum values.
    # Minimum value is 0
    # Maximum value is 3
    3: 50
    random: 0
    random-low: 0 # random value weighted towards lower values
    random-high: 0 # random value weighted towards higher values
    random-range-0-3: 0 # random value between 0 and 3

  filler_amount_speedy_feet:
    # Amount of Speedy Feet in filler pool. Speedy Feet increases your run speed.
    #
    # You can define additional values between the minimum and maximum values.
    # Minimum value is 0
    # Maximum value is 10
    10: 50
    random: 0
    random-low: 0 # random value weighted towards lower values
    random-high: 0 # random value weighted towards higher values
    random-range-0-10: 0 # random value between 0 and 10

  filler_active_silent_steps:
    # Whether or not Silent Steps is in the filler pool. Silent Steps prevents NPCs from hearing your footsteps.
    'false': 0
    'true': 50

  filler_amount_goose_day:
    # Amount of A Goose Day in filler pool. A Goose Day causes NPCs to ignore you for 15 seconds.
    #
    # You can define additional values between the minimum and maximum values.
    # Minimum value is 0
    # Maximum value is 3
    3: 50
    random: 0
    random-low: 0 # random value weighted towards lower values
    random-high: 0 # random value weighted towards higher values
    random-range-0-3: 0 # random value between 0 and 3

  filler_weight_coins:
    # Weight for Coins in the filler pool. Set to 0 to disable this filler.
    # Please note that if you turn off all traps below, this filler item will be chosen to fill all remaining spots regardless of chosen weight.
    #
    # You can define additional values between the minimum and maximum values.
    # Minimum value is 0
    # Maximum value is 100
    80: 50
    random: 0
    random-low: 0 # random value weighted towards lower values
    random-high: 0 # random value weighted towards higher values
    random-range-0-100: 0 # random value between 0 and 100

  trap_weight_tired_goose:
    # Weight for Tired Goose trap in the filler pool. Set to 0 to disable this trap.
    #
    # You can define additional values between the minimum and maximum values.
    # Minimum value is 0
    # Maximum value is 100
    5: 50
    random: 0
    random-low: 0 # random value weighted towards lower values
    random-high: 0 # random value weighted towards higher values
    random-range-0-100: 0 # random value between 0 and 100

  trap_weight_confused_feet:
    # Weight for Confused Feet trap in the filler pool. Set to 0 to disable this trap.
    #
    # You can define additional values between the minimum and maximum values.
    # Minimum value is 0
    # Maximum value is 100
    5: 50
    random: 0
    random-low: 0 # random value weighted towards lower values
    random-high: 0 # random value weighted towards higher values
    random-range-0-100: 0 # random value between 0 and 100

  trap_weight_butterbeak:
    # Weight for Butterbeak trap in the filler pool. Set to 0 to disable this trap.
    #
    # You can define additional values between the minimum and maximum values.
    # Minimum value is 0
    # Maximum value is 100
    5: 50
    random: 0
    random-low: 0 # random value weighted towards lower values
    random-high: 0 # random value weighted towards higher values
    random-range-0-100: 0 # random value between 0 and 100

  trap_weight_suspicious_goose:
    # Weight for Suspicious Goose trap in the filler pool. Set to 0 to disable this trap.
    #
    # You can define additional values between the minimum and maximum values.
    # Minimum value is 0
    # Maximum value is 100
    5: 50
    random: 0
    random-low: 0 # random value weighted towards lower values
    random-high: 0 # random value weighted towards higher values
    random-range-0-100: 0 # random value between 0 and 100

  death_link:
    # When you get caught/shooed, everyone dies. When someone else dies, you get teleported to the hub.
    'false': 50
    'true': 0
```

## Troubleshooting

**Game won't start / crashes on launch**
- Make sure you're using BepInEx 5.x, not 6.x
- Check that all files are in the correct folders

**Can't connect to server**
- Check that APProxy.exe started (should appear automatically)
- Verify the address and port are correct
- Check your slot name matches exactly (case-sensitive)
- Make sure the server is running and you have network access

**Proxy won't start**
- Install .NET 6.0 Runtime if you haven't already
- Make sure all three proxy files are in the game folder (same folder as Untitled Goose Game.exe)

**Gates not opening after receiving items**
- Press F9 to force a gate resync
- If that fails, try reconnecting

**Stuck in an area**
- Check the UI to see which access items you have
- You may need to wait for another player to send you the required item

**A specific prop got bugged (eg. drawer won't come out, or can't pull the rose box)**
- Use the in-game reset
- If that fails, disconnect and reconnect while on the title screen
- If all else fails, close Untitled Goose Game and reopen
- If the prop just isn't there, you have it somewhere in the pool and it wasn't sent to you yet

## Credits

APWorld and BepInEx mod by PixelShake92 and MiaSchemes

## Links

- [Archipelago Discord](https://discord.gg/archipelago)
- [GitHub Repository](https://github.com/PixelShake92/Untitled-Goose-Game-Archipelago)
