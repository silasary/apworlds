# Recettear: An Item Shop's Archipelago FAQ

## Gameplay

### What is the goal?

The goal is to reach Day 37 and pay off all 820,000 pixs in the main game.

### What kind of randomization should I expect?

> This AP is in alpha so features are limited as they get added in future releases.

As of v0.1.0, the only significant items are the finance approvals (aka week unlocks). Players will need to find their corresponding approvals to get past each of the four debt payments. All other items in the world are fillers for extra pixs (money), merchant experience, or dreams of sweets (nothing).

The only location checks are for Recette's merchant levels (upto level 50) and paying off the four debt payments. In a solo AP, the world will expect the player to earn up to 10 merchant levels per debt payment. 

### How long does it take to play?

My own playtesting took about 5-6 hours to goal Recettear with my usual Lingo (700 panel level 2) and Yacht Dice (777 score) sync yamls. Recettear had all of its time saving options set to true and I played more optimally with the mechanics. I consider myself average at the game and not a speedrunner so better or worse skill may yield better or worse times.

### What AP Features are supported?

Currently, Recettear only supports release. Collect is experiemental as there is a chance to be locked out of checks with [some options enabled](https://github.com/AurelicButter/Recettear-Archipelago/issues/41). The world has been playtested in single session solo syncs where there was no issues.

There are plans to expand with Universal Tracker, energylink, and deathlink in the future.

## Troubleshooting

### I didn't receive a check!

Outside of the admin commands a multiworld has, players can use `/resync` to resync all of the received items. This will clear and rebuild the client-side values based on what the AP server has at the time. However, this will duplicate all items (such as pixs and merchant exp) and it cannot be reverted.  

This should be taken as a last possible option. If you find yourself using `/resync` often, please note your circumstances and report it as a bug.
