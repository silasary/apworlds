# Sonic Colours (Wii) Archipelago World

Sonic Colours is a Wii platformer in which Sonic explores Eggman's interstellar amusement park and uses the powers of the Wisps. This Archipelago world supports the PAL `SNCP8P` revision 0 release in Dolphin. See the [Setup Guide](setup.md) to get started.

## Goals

- **Nega-Wisp Armor (Final Boss):** defeat the final boss and complete the Terminal Velocity Act 2 escape
- **All Bosses:** complete all boss stages
- **All Red Rings:** collect all 180 physical Red Rings in every stage, regardless of the Red Ring Checks setting

## Locations

- Story Act and boss clears
- Red Ring pickups or collecting all five Red Rings in an Act
- Optional rank checks
- Optional 1-Up object checks
- Optional first discoveries of the seven coloured Wisps
- Optional Game Land stage clears, Eggman Hearts and Chaos Emerald group clears

## Items

- World Access and Wisp unlocks
- Movement abilities, including progressive wisps when Ability Locks are enabled
- White Boost Wisp when its lock is enabled
- Seven Chaos Emeralds for optional Super Sonic
- Red Ring currency for Game Land Stage Unlocks, Random Capsules, Assist Change and Progressive Game Land Speed when applicable
- Rings, 1-Ups and Boost Refills
- Ring Loss, Score Reset and Dead Weight traps

## Campaign Options

- **Goal:** Nega-Wisp Armor + Escaping Terminal Velocity Act 2, All Bosses or All Red Rings
- **World Progression:** unlock Acts in order, or open all Acts instantly except the boss
- **White Boost Wisp Lock:** require the White Boost Wisp for ordinary Boost gains; given Boost Refills remain usable
- **Ability Locks:** lock various movement abilities
- **Super Sonic:** add seven Chaos Emerald items to the item pool, which allows you to use Super Sonic when all are obtained (Logic for this isnt implemented yet)

## Check Options

- **Red Ring Checks:** individual rings or all five rings per Act
- **Rank Checks:** choose which ranks gives a check
- **1-Up Sanity:** add checks for 31 1-Up objects
- **Wisp Discovery Checks:** add checks for discovering coloured Wisps
- **Game Land Checks:** add stage-clear checks and enable AP Red Ring currency
- **Eggman Heart Sanity:** add a heart check for each Game Land stage
- **Chaos Emerald Checks:** add checks for clearing each three-stage Game Land group

## Other Options

- **Game Land Requirement Reduction:** reduce stage unlock costs from 0–99%
- **Trap Percentage:** percentage of filler replaced by traps
- **Trap Weights:** adjust Ring Loss, Score Reset and Dead Weight frequency
- **Music Randomization:** shuffle music
- **DeathLink:** share deaths with other DeathLink players

## Notes

The New Game introduction still begins in Tropical Resort before save selection. Connect **before** starting it so the client can observe checks during the opening Acts.

Physical Red Ring checks are separate from AP Red Ring items used to unlock Game Land stages. Wisp discovery checks do not grant their corresponding Wisp items, and Chaos Emerald checks do not grant the matching Emerald items.

Disabling Game Land Checks also disables its Eggman Heart and Chaos Emerald checks and removes its associated items from the pool.
With Ability Locks enabled, Drill, Hover and Spikes use progressive unlocks; otherwise each has one complete unlock.

## Credits

- **MysticPika:** for doing the majority of the logic.
- **Subna:** for drawing the Logo.
