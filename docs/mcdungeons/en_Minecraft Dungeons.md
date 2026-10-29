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
- `/void` - Devtool, DO NOT TOUCH: it changes how the bridge protects the game during level transitions, and changing it can crash the game.
- `/reset_progress` - Safety feature if a chest is skipped - shouldn't happen normally.
- `/give_safe` - Only use it if the game clears your inventory - it shouldn't happen, but again, it's for safety.
- `/health` - Devtool for problems that are not crashes. Shows whether the game is running or loading, how long the game thread has been quiet, the slowest game call the client made, how many calls each blocking feature swallowed, and the latest alerts: game frozen (with a freeze report saved in dungeons_bridge_crash.log), window not responding, black screen while playing, picture frozen, a stuck or slow call of the client's own, a level load that never ends. The first serious alert saves a crash bundle automatically. `/audit` lists the last checks the client sent with the code that asked for each; `/audit flagged` shows only the suspicious ones (many at once, right after a level change, with no player in the world, during a load, or repeated) - the first thing to read when a check fires that you did not earn.
- `/crash` - Devtool for crash diagnosis. `/crash` prints a summary of the newest report written by the DLL (dungeons_bridge_crash.log): which exception, where, and the likely culprit (our own game call, our own code, the game right after one of our calls, a level change). `/crash crumbs` shows what the DLL has been doing lately, `/crash build` shows the DLL build and whether it matches this client, `/crash test` writes a harmless test report. After a crash, the newest zip in `crash_bundles` starts with SUMMARY.txt - attach that file when reporting a problem.
- `/villager` - Devtool for the Villager Checks option. `/villager list` shows the five captured camp merchants (Village Merchant, Mystery Merchant, Luxury Merchant, Gift Wrapper, Blacksmith) and whether each is unlocked in your camp, `/villager events` shows the merchant unlocks the client saw, `/villager unlock <name>` unlocks one right now. With the **Villager Checks** option on, freeing a captured villager in its mission (Creeper Woods, Pumpkin Pastures, Cacti Canyon, Soggy Swamp, Redstone Mines) sends a check instead of unlocking the merchant in your camp, and each merchant is an item you receive from the multiworld. Needs the matching dungeons_bridge.dll. Use a fresh character/profile: a merchant that is already unlocked in your save stays unlocked.
- `/miniboss [type]` - Devtool, try to summon a mini boss (powerful mob) next to you to test the Powerful Mob checks. `/miniboss` lists the types; `/miniboss <type>` (evoker, ghast, redstonegolem, skeletonhorseman, enderman, illusioner, drownednecromancer, ...) spawns one through the bridge's protected call path. Do not use UUU (Universal Unreal Engine 4 Unlocker) with this client: it bypasses the bridge's protections and crashes the game. The mob's Blueprint class is learned, guessed (BP_<Name>_C) or found by scanning the loaded classes, which takes 10-30 seconds the first time. `/miniboss find <text>` lists matching classes, `/miniboss class <ClassName>` spawns a class by exact name, `/miniboss learn` records the class names of the mobs in your current zone, and `/miniboss functions` lists functions that may promote a mob to powerful. Untested in-game: the mob may be an ordinary one rather than a powerful one. `/miniboss create <type|ClassName> [dry]` builds a mini boss from the game's own classes only, with no mob needed nearby: it picks the class from the game's class table, reads the EntityType from the game's enum and finds the powerful bit by asking the game's `IsEventMob`; `dry` only shows what it would do. `/miniboss reflect <type|ClassName> [word]` lists what the game declares on a mob class (written to `miniboss_reflect.txt`). `/miniboss create random [load] [dry]` draws a mini boss at random (the six Endersent variants are left out): by default only types whose class is already in memory, so nothing has to be loaded; `load` also draws types that must be loaded from a saved asset path. `/miniboss preload [type|all]` loads those classes at a moment you choose and says how long the game was busy. Every create ends with a line telling what it cost the game; the object lookups that used to freeze the game (one full object-table scan each) are now answered from an index read from Python.
- `/chests [zone|all]` - Number of chests (and supply chests) in a zone: no argument = the zone you are in (with the live counter of the level), `all` = every zone. The live part also scans the level for chest actors, including the hidden ones the map counter misses.
