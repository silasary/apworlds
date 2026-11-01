# Katana ZERO

Katana ZERO is a stylish neo-noir, action-platformer featuring breakneck action and instant-death combat. Slash, dash, and manipulate time to unravel your past in a beautifully brutal acrobatic display.

In the Katana ZERO Archipelago randomizer, access to stages, combat mechanics, weapons, and keys are shuffled into the multiworld item pool.

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a config file.

*(If viewing outside of WebHost, you can generate your YAML file directly in the Archipelago Launcher via **"Generate Template Settings"**, or refer to the [Setup Guide](setup_en.md) for full option descriptions).*

## What Does Randomization Do to This Game?

By default, stages and core abilities are locked until their corresponding items are received from the multiworld:

- **VHS Stage Tapes (11 Items):** Each stage tape grants access to a specific chapter in the game (Factory, Hotel, Club, Prison, Studio 51, Mansion, Chinatown, Dragon Tape, Slaughterhouse, Bunker 1, and Bunker 2).
- **Combat Mechanics:** Control your foundational abilities:
  - `Chronos`: Restores time manipulation (Slow-Motion). Can be toggled on/off in player options (`shuffle_chronos`).
  - `Strength Training`: Unlocks the ability to pick up and throw items (bottles, smoke grenades, explosive barrels, statues). Can be toggled on/off in player options (`shuffle_throw`).
  - `Wall Jump`: Unlocks wall climbing technique.
  - `Deflect`: Unlocks bullet deflection capability.
- **Government Lab Keys (5 Items):** Five unique keys hidden across the multiworld required to breach the Government Lab doors:
  - `Prism Key`
  - `Phoenix Key`
  - `Savant Key`
  - `Master Key`
  - `Prototype Key`
- **Swords (5 Useful Items):** When `shuffle_swords` is enabled, the 5 specialty blades are shuffled into the item pool:
  - `Prism Sword`
  - `Phoenix Blade`
  - `Savant Blade`
  - `Master Sword`
  - `Claymore Prototype`
- **Enemysanity (487 Checks):** When `enemysanity` is enabled, every individual non-boss enemy in the game holds an item check that is immediately sent upon neutralizing the enemy.
- **Audio Randomization:** Optional toggles to shuffle background music tracks across all stages and cutscenes, or randomize sound effects.

## Goals

You can select from three distinct goals:

1. **Government Lab (`government_lab`):** Find all 5 Government Lab Master Keys and breach the final laboratory chamber.
2. **All Tapes (`all_tapes`):** Collect all 11 stage VHS tapes and complete every chapter.
3. **Boss Rush (`boss_rush`):** Track down and eliminate all four major bosses: Mr. V (Studio 51), Kissyface (Chinatown), Headhunter (Bunker 2), and the Psychiatrist (Government Lab).

## Traps

When trap items are rolled into filler slots, receiving a trap triggers an instant disruptive combat event:

- **Chronos Overdose:** Inverts left and right movement controls for 15 seconds.
- **Freeze Trap:** Freezes the player in place for 3 seconds.
- **Chronos Disruptor:** Disables slow-motion for 15 seconds.
- **Screen Flip:** Flips the game camera upside-down for 15 seconds.
- **Spatial Warp:** Teleports the player back to the stage room spawn point.
- **Roll Disruptor:** Disables dodge rolling for 15 seconds.
- **Pacifist Trap:** Disables sword slashing and throwing for 5 seconds.

## DeathLink

When DeathLink is enabled, dying in Katana ZERO broadcasts a DeathLink signal to all connected players with custom Katana ZERO-flavored death messages. The `death_link_amnesty` setting allows players to accumulate a configurable number of free deaths before a signal is transmitted.

## Links & Resources

- **GitHub Repository:** [https://github.com/CheeserLPC/Archipelago-KatanaZero](https://github.com/CheeserLPC/Archipelago-KatanaZero)
- **Bug Reports & Issues:** [https://github.com/CheeserLPC/Archipelago-KatanaZero/issues](https://github.com/CheeserLPC/Archipelago-KatanaZero/issues)
- **Author:** CheeserLPC

## Copyright & Disclaimer

Katana ZERO is developed by **Askiisoft** and published by **Devolver Digital**.
Copyright © 2019 Askiisoft. All rights reserved. All trademarks, character names, game assets, and logos are property of their respective owners (Askiisoft and Devolver Digital).

This Archipelago randomizer is an unofficial community project and is not affiliated with, endorsed by, or sponsored by Askiisoft or Devolver Digital.
