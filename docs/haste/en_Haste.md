# Haste

## What does randomization do to this game?

Shards are locked behind an unlock item. Abilities are shuffled into the item pool. Various other options exist to customize what is available in the APWorld.
This mod will also set all story flags and several meta-progression flags and is therefore **not** recommended to be used with non-AP savefiles.

## What are the Items in this APWorld?

- Progressive Shard: Unlocks the next Shard
- Ability (Board, Cowl, Javelin, Hourglass): Grants the player that ability
- NPC (Daro, Niada, Wraith, The Captain, Fashion Weeboh): Unlocks that NPC to appear to in the Hub
- Captain's Upgrade (Health, Lives, Energy, Rarity, Starting Sparks, Sparks-in-Shard): Grants the player that permanent stat upgrade
- Permanent Speed Upgrade: Grants +10% base speed (Zoe's base speed is reduced to 60% at the start of the game) up to 120%
- Persistent Items: Grants an in-game item at the start of a Shard; [grouped by rarity & function](https://github.com/WritingHusky/haste_apworld/blob/main/docs/ItemCategories.md)
- Anti-Spark Bundle: Grants you an amount of Anti-Sparks
- Traps: Disrupts your gameplay for one fragment

## What location are in the APWorld?

- Shard Boss: Defeating the boss in its respective Shard
- Shop Purchases: Purchasing a unique Archipelago Shop Item in a shop
  - Can be configured to be Global for any purchase in any shop, or Per-Shard for any purchase in each available Shard
  - Can be configured to activate on any shop purchase, not just unique AP Items
- Fragment Clears: Completing a fragment by touching the portal at the end
  - Can be configured to be Global for a fragment clear in any Shard, or Per-Shard for a fragment clear in each available Shard
- Ability (Cowl, Javelin, Hourglass) Purchase: Purchasing from the respective character in the Hub
- Captain's Upgrades: Purchasing each of the 23 stat upgrades from The Captain in the Hub
- Fashion Weeboh Purchases: Purchasing the (up to) 9 costumes from Fashion Weeboh in the Hub

## What is the goal of Haste?

The goal of Haste is to beat the boss of the configured Shard Goal (default is Shard 10) by accumulating enough Progressive Shard unlocks to reach it.

## When the player receives an item, what happens?

The item will immediately come into effect.

If `Force Reload` is enabled and you are in the Hub, getting a Progressive Shard or NPC will reload the Hub to update. This may cause issues if you are talking to an NPC when this reload happens. Otherwise, you will need to exit and re-enter the Hub for the hub to update.

## I need help! What do I do?

Refer to the troubleshooting steps in the [setup guide](https://github.com/WritingHusky/haste_apworld/blob/main/docs/setup_en.md). Then, if you are still stuck, please ask in the [Haste thread](https://discord.com/channels/731205301247803413/1356638437872111687) (under `future-game-design`) in the [Archipelago Discord](https://discord.gg/archipelago).

## State of the Rando

See [state of the world](https://github.com/WritingHusky/haste_apworld/blob/main/docs/CurrentState.md) for more information about the current state (as I understand it) about this randomizer.

## Credits

This randomizer would not be possible without the help from:

- Landfall games: for making the game with modding in mind
- People in the Haste Discord mod-developer-chat: for helping me learn to mod games
