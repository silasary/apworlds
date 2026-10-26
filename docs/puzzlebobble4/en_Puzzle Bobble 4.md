# Puzzle Bobble 4

***Puzzle Bobble 4***, also known as ***Bust-A-Move 4***, is an arcade puzzle video game developed and published by Taito.

**Region:** NTSC-U/C  
**Serial:** SLUS-00754  
**Emulator:** Latest version of DuckStation (at least version 0.1-12083-g00e299795)

## How the Archipelago integration works

Completing each level in Arcade Mode generates a check. The game features 27 worlds with 5 levels each, for a total of 135 checks, including checks for unlocking 25 worlds.

Additional items, such as Level Skips and traps, can be included in the item pool, along with other filler items.

The goal can be configured to either complete a specific world or finish the final 7 worlds. DeathLink is also available as an optional feature.

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

Currently, only Arcade Mode is supported.

### How do I navigate the world-selection screen?

Use **L1** and **R1** to cycle through unlocked worlds. Press **R2** to return to the beginning.

### I cannot move in the world-selection screen. Why?

You probably have not unlocked any worlds yet.

### Why do I always return to the beginning after completing a world?

The client always returns you to the beginning when you enter the world-selection screen. Since the client only unlocks worlds for which you have found the corresponding key, use **L1** and **R1** to navigate between unlocked worlds.

### What did you use to make this project?

The project was developed primarily with the help of AI, along with some code from the MediEvil Archipelago client:
https://github.com/riezahughes/MedievilArchipelagoClient
