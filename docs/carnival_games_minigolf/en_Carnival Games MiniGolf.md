# Carnival Games MiniGolf Archipelago World

Carnival Games MiniGolf is a Wii minigolf game with 27 holes across nine themed worlds. This Archipelago world
targets the PAL `RG9P54` release and uses an external Dolphin client.

## Goals

- All Holes: complete all 27 normal holes
- Goal World: receive the selected world's named Access item and finish its three holes on Par or better
- Barker Coin Hunt: receive the configured number of Archipelago Barker Coins

## Locations

- Hole completions
- Par Club Pieces
- Hole-in-Ones on the 19 possible holes
- Adventure minigame Win and Perfect results
- Devil's Brew - Spiders Win
- Barker Coin collectibles
- World secrets
- Pro Shop purchases and Par Club rewards
- Barker Shop purchases

## Items

- World Access items, named `[World Name] Access`
- World-specific Par Club Pieces
- Barker Coins
- Two progression-classified 500 Coin Bundles for each world
- Five useful 100 Coin Bundles and five useful 200 Coin Bundles, each spread across different worlds
- Filler-classified 5, 10, 20, and 50 Coin Bundles
- Optional world-specific Coin Traps

## Campaign Options

- Goal selection:
  - All Holes
  - Goal World
  - Barker Coin Hunt

- Starting World, random or selected
- Goal World, random or selected
- Goal World Access:
  - World Unlock Item
  - Barker Coins
- Required Barker Coins, from 1 to 40

## Check Options

- Minigame Checks:
  - Off
  - Win
  - Perfect
  - Win and Perfect
- Hole-in-One Checks
- Barker Coin Checks
- World Secrets
- Pro Shop Checks
- Barker Shop Checks

## Item Pool Options

- Coin Trap Weight, default 10%

## Notes

This is version 0.1.0 of the Carnival Games MiniGolf APWorld.

The default configuration has 179 locations. Every normal hole always has a Complete and Par Club Piece location.
Hole-in-One locations exist only for the 19 holes where a Hole-in-One is possible. The nine Adventure minigames can
provide Win and Perfect locations; Devil's Brew - Spiders provides Win only.

Par Club Piece locations and received Par Club Piece items are separate. The locations record playing a hole on Par
or better; the received items unlock that world's Pro Shop tiers. Barker counter goals use received Archipelago
Barker Coins and automatically remove Barker Shop locations.

The maximum requirement of 40 Barker Coins remains generatable with every optional check family disabled. In Goal
World mode, the six Complete and Par Club Piece checks in the Goal World are behind its Access item, leaving exactly
enough reachable mandatory checks for 40 Barker Coins and the other seven World Access items.

All Holes and Goal World with item access include the bounded high-value bundle set even when every optional check
family is disabled. Barker Coin Hunt and Barker-based Goal World access reserve the small-pool capacity for their
required Barker Coins, so they use the dedicated Barker pool instead. Normal coins can also be earned repeatedly in
any open world. Coin Traps are optional and default to a weight of 10%.
