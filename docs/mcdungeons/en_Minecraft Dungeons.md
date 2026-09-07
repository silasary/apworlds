# Minecraft Dungeons

## Where is the settings page?

The [player settings page for this game](../player-settings) contains all the options you need to configure and
export a config file.

## What does randomization do to this game?

For now, only zone access is locked. Each mission (other than Squid Coast, the tutorial) requires an Access item
before you can enter it.

## What is the goal?

Beat a specific mission and/or reach a set amount of emeralds, depending on your settings.

## Where can you find other worlds' items?

- Chests and Supply Chests, you need to found a set amount per zone
- Beating a mission
- [Optional] Killing a boss for the first time
- [Optional] Getting more chests than a zone's set amount (Bonus Chest)

## What items from Minecraft Dungeons are in other players' worlds?

**Progression items:**
- Every zone except Squid Coast (the tutorial) can be unlocked
- Progressive Enchant Slot - gives your items more enchant slots
- [Optional] Progressive Pickup - pickups can't be picked up until unlocked

**Useful items:**
- Random Item (type) - gives an item based on item type and which DLC you have
- Random Item (zone) - gives an item pulled from a specific zone's loot table

**Filler items:**
- Emerald Reward (100, 300, 500) - gives a set amount of emeralds

## Can I play co-op with this?

Probably - it's never been tested, and it will likely cause bugs.

## Unique Local Commands

The client adds a few local commands beyond the usual Archipelago client commands:

- `/status` - Show current game state (zone, health, attach status).
- `/unlocked` - List zones unlocked so far this run.
- `/debug_interacts` - Devtool to get information on what the player interacted with.
- `/reset_progress` - Safety feature if a chest is skipped - shouldn't happen normally.
- `/give_safe` - Only use it if the game clears your inventory - it shouldn't happen, but again, it's for safety.
