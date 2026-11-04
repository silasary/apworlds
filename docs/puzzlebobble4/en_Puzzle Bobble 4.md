# Puzzle Bobble 4

***Puzzle Bobble 4***, also known as ***Bust-A-Move 4***, is an arcade puzzle video game developed and published by Taito.

**Region:** NTSC-U/C  
**Serial:** SLUS-00754  
**Emulator:** Latest version of DuckStation (at least version 0.1-12083-g00e299795)

## How the Archipelago integration works

Completing each level in Puzzle/Arcade generates a check. The game features 27 letter worlds with 5 levels each, for a total of 135 checks. World Unlock items gate the other 25 worlds; A and B are available from the start.

**Puzzle/Arcade Simple** is a separate reduced mode. A and B are available from the start, and Archipelago selects exactly one world from each of the five later groups (CDE, FGHI, JKLMN, OPQRST, and UVW?XYZ). Each selected world has five level checks, for 35 checks total. Only the five selected World Unlock items are included. This mode has no victory goal. Puzzle/Arcade Complete retains the full 135-check setup.

Puzzle/Story adds 110 checks: 22 Tarot cards with 5 levels each. Fool is available from the start, and the other 21 cards require their corresponding Tarot Unlock items. Two unlocks are guaranteed in Fool, with one more guaranteed at a random level (1–5) of each newly unlocked card; remaining Tarot Unlocks are placed by Archipelago and can land in either active mode. Tarot level difficulty is selected per level using the configured Normal/Expert weights. The `only_world` goal is to complete the Tarot card World; `all_tarot` requires completing every Tarot card.

The goal can be configured to complete one selected final Arcade world, all seven final Arcade worlds, the World Tarot card, or all 22 Tarot cards. Additional items, such as Level Skips and traps, can be included in the item pool. DeathLink is also available as an optional feature.

## Important: Single-Player Games

When playing a single-player game, it is recommended to enable only **Level Skips** in the item pool and disable all traps.

Location checks are sent when a level is completed. Since checks are sent when a level is completed, filler items and traps received from that check cannot affect the level that has already ended. Level Skips are the exception, as they can still be used to skip a subsequent level.

For multi-player games, the default item pool can be used as intended, since items may be received from other players while a level is still in progress.

## Quality-of-Life Features

### World Selection

- **Infinite Time:** The world-selection timer is unlimited.
- **Character Selection:** Press **Up** or **Down** to change characters.
- **Start from the Beginning:** You always start at the beginning of the world-selection sequence.
- **Switch Unlocked Worlds:** Press **L1** or **R1** to cycle through unlocked worlds.
- **Return to the Start:** Press **R2** to jump back to the beginning of the world-selection sequence.

### During a Level

- **Use a Level Skip:** Press **R2** to skip the current level if you have a Level Skip available.
- **Level Skip Counter:** Your remaining Level Skips are displayed in the upper-right corner of the screen.
- **Free Skips for Completed Levels:** You can skip a level for free if you have already completed it.
- **Return to World Selection:** Press **L2** to return to the world-selection screen.

## Disconnecting and Resuming a Session

- **Disconnect:** Close the Puzzle Bobble 4 client to disconnect from the Archipelago session.
- **Resume:** Return to the game's **Game Menu**, launch/connect the client again, and wait for the client to apply the session updates to the game before continuing.

## DeathLink

When DeathLink is enabled:

- Dying in any level sends a DeathLink signal to the session.
- When another player dies, your current level will restart, but only if you are currently playing a level.
- DeathLink events are displayed in the client.

## Frequently Asked Questions

### What game modes are available in Archipelago?

Puzzle/Arcade, Puzzle/Story, VS/Story, and VS/Contest are supported. Each mode can be configured as Simple, Complete, or disabled.

### How do I navigate the world-selection screen?

Use **L1** and **R1** to cycle through unlocked worlds. Press **R2** to return to the beginning.

### I cannot move in the world-selection screen. Why?

You probably have not unlocked any worlds yet.

### Why do I always return to the beginning after completing a world?

The client always returns you to the beginning when you enter the world-selection screen. Since the client only unlocks worlds for which you have found the corresponding key, use **L1** and **R1** to navigate between unlocked worlds.

### What did you use to make this project?

The project was developed primarily with the help of AI, along with some code from the MediEvil Archipelago client:
https://github.com/riezahughes/MedievilArchipelagoClient

For `all_tarot` and `all_u_z`, every final-level check remains a normal item location; the client tracks server-confirmed checks and sends the goal status only when all required final levels have been checked. Single-goal modes retain a locked victory item.


## VS/Story

VS/Story Simple adds one check for each opponent victory (`vs ENEMY win`): 12 checks, or 13 with Secret enabled. All 16 playable characters start locked. The `Unlock VS/Story` progression item unlocks every character and is placed in a check outside VS/Story Simple; until it is received, VS/Story Simple checks are inaccessible. The client unlocks the next opponent locally after each confirmed win. This mode does not define its own Goal.

VS/Contest Simple adds one check for each consecutive-win milestone. All 16 playable characters start locked. The separate `Unlock VS/Contest` progression item unlocks every character and is placed outside VS/Contest Simple; until it is received, VS/Contest Simple checks are inaccessible. The VS/Story and VS/Contest global unlocks never unlock each other's characters.

VS/Story Complete selects `vs_story_characters` characters from the 16 playable characters and chooses one of those as the starting character. The remaining characters require `Unlock CHARACTER` items. Bob is the initial opponent; `Progressive Enemy` items unlock the next opponent globally for every unlocked character. There are 12 checks per selected character, or 13 when Secret is enabled, named `vs ENEMY win as CHARACTER`. The first check for the starting character (win against Bob) is fixed to a `Progressive Enemy` item so the opening cannot be blocked by a filler item.

When the `vs_story` Goal is selected, the player must win against Dreg with every selected character. Dreg checks remain normal item checks; the client reports Goal completion after the server confirms all required Dreg checks.


The `Extra_level_skips` option sets how many usable Level Skips the client starts with. It accepts 0–25 and defaults to 3. These are granted at the start and are separate from Level Skip items found during the seed.
