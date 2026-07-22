# Ratchet & Clank: Size Matters

An Archipelago implementation for Ratchet & Clank: Size Matters

## Where is the settings page?

The [player settings page for this game](../player-settings) contains all the options for configuring your randomizer experience.

## What does randomization do to this game?

All weapons, gadgets, and armour pieces and infobots are shuffled across the following location types:

- Clank Challanges
- Armour & Titanium Bolt pickups
- Skyboard Challanges
- Weapon Vendors
- Skill Points (untested in full)
- Armour Sets

## What is the goal?

Defeat **Otto Destruct** on Quodrona. The client detects the end-boss cutscene completing and automatically sends goal completion to the Archipelago server.

## What items can be in another player's world?

Any weapon, gadget, or armour piece. When progressive modes are enabled, you receive `Progressive Weapon`, `Progressive Gadget`, or `Progressive Armour` items that unlock each in a fixed order.

## When the player receives an item, what happens?

You will be able to visit the planets with whatever infobot you receive, receiving Infobot: Kalidon will unlock Kalidon
for travel within Ratchet's Ship. Upon receiving a weapon it unlocks in ratchet's inventory, which will let you equip it
and use to fire on enemy troops. Progressive upgrades will upgrade your weapons increasing their
firepower.

## Setup guide

See [the Setup Guide](setup_en.md) for full instructions on connecting PCSX2 to Archipelago.
