# A Dance of Fire and Ice

## Where is the options page?
The [player options page for A Dance of Fire and Ice](../player-options) contains all the options you need to configure and export a config file for A Dance of Fire and Ice.

## What does randomization do to this game?
This world randomizes the order in which levels are unlocked and played. The player starts with access to a limited set of starting levels. Each completed level counts as checking a location in Archipelago.
Every location awards an item.
Keys are distributed randomly by the Archipelago item pool and can unlock levels in any possible order.
Victory is triggered by completing each goal levels and reaching the percentage completion goal required.
In multiworlds, triggering the Victory satisfies the slot's completion condition, potentially triggering /release for other players if the server is configured to do so.

# Additional changes to game flow
Levels are locked until their corresponding key item is obtained.Failed attempts do not consume the item — you can retry levels without restriction once unlocked.
Any level can contain progression or filler items depending on the world’s configuration.
There is no penalty for playing unlocked levels in any order.

# Which items are never randomized?
A few items/locations are considered “structural” and are fixed:
Starting keys for the initial playable levels are granted automatically at the beginning of the game.

# What does another world's item look like in ADOFAI?
When completing a level, the result screen will display the name of the obtained item and its sender:
If the item is for your world: it behaves normally and can unlock more content for you.
If the item is for another player: it will still be shown in the completion message, e.g., Shotal found Key_Level_3 for Alice!
There is no visual change to the level itself — the item identity is only revealed upon completion.

# Example gameplay loop
Start with a few unlocked levels.
Complete a level → receive an item (could be for you or another player).
Unlock a new level when you obtain its key.
Repeat until you complete every goal levels and reach your percentage completion goal to finish your slot.

# Multiplayer and special features
DeathLink is supported: if enabled in options, dying in ADOFAI will send a death to all connected DeathLink players and vice versa.
Victory conditions: The slot is marked complete when Victory condition are met.