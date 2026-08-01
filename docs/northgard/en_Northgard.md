# Northgard

## What does randomization do to this game?

Northgard's Conquest mode always unlocks its battles in the same fixed branching tree
(Chapter 01 leads to a Top/Bottom pair, each of those leads to another pair or a single
battle, and so on up to Chapter 07). Normally you unlock the next battle just by winning
the current one. In this randomizer, unlocking a Chapter instead requires receiving that
Chapter's item from the multiworld -- it may be found in your own world or someone else's.

Two Progression Modes control exactly how that gate works:
- **Linear** (default): same as vanilla Conquest's own flow -- a Chapter also needs an
  adjacent Chapter beaten first, on top of owning its item.
- **Non-Linear**: a Chapter unlocks the moment you receive its item, letting you jump
  around the tree out of order. A separate option can require a number of other battles
  be won first before Chapter 07 specifically unlocks, so it can't be rushed immediately.

## What is the goal?

Win Chapter 07, the final battle of the Conquest tree.

## What items and locations get shuffled?

Each of the 11 Chapter positions has one unlock item. Each Chapter also has up to 10
locations ("Chapter N - Item 01" .. "Item 10"), sent together the moment you win that
Chapter's battle; the exact count per Chapter is set by the "Items per Chapter" option
(1-10, default 4).

## What does another world's item look like in Northgard?

There's no special in-game notification -- the companion client applies a received
Chapter item quietly in the background (you'll see it in the client's own log), and the
next time you look at the Conquest map, that Chapter is selectable.
