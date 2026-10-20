# Wizard of Legend

## Where is the options page?

The [player options page for this game](../Options.py) contains all the options you need to configure and export a config file.

## What does randomization do to this game?

Wizard of Legend is a fast-paced action roguelike focused on spell-slinging combat. In the Archipelago MultiWorld implementation:
* **Arcana Slots & Relics**: Your ability slots (Standard Arcana, Signature Arcana, and Bonus Slots) and Relic slots are locked initially and must be unlocked via MultiWorld progression items.
* **Element Licenses**: If enabled, picking up or using Arcana of specific elements (Fire, Water, Earth, Air, Lightning) requires finding the corresponding Element License.
* **Dungeon Access & Biomes**: Stage progression requires finding **Boss Keys**, while accessing elemental chests and specific elemental enemies requires **Biome Keys**.
* **Shops & NPCs**: Spawn shops (Outfit, Relic, Arcana) require **Shop Upgrades** to unlock higher inventory tiers.

## What is the goal of Wizard of Legend?

The goal is to reach the final arena and defeat **Master Sura** (`FinalBoss Defeated`).

To access the final showdown against Master Sura, you must:
1. Collect **3 Boss Keys** to progress through Zones 1, 2, and 3.
2. Collect the required number of **Chaos Fragments** (7 by default out of 10 available in the pool) to access the final boss zone.

## What Wizard of Legend items can appear in other players' worlds?

Items in the multiworld pool include:
* **Progression Items**: `Boss Keys`, `Chaos Fragments`, `Biome Keys` (Fire, Water, Earth, Air, Lightning), `Shop Upgrades`, `Element Licenses`, `Arcana Slot Unlocks`, and `Relic Slot Upgrades`.
* **Outfits & Upgrades**: `Outfits` (Venture, Awe, Fall, Pride, etc.), `Max HP Boosts`, `Gold Packs`, and `Chaos Gems Packs`.
* **Arcanas & Relics**: Randomized `Arcanas` (Tier 1–5) and `Relics` (Tier 1–5).
* **Traps**: `Cursed Trap`.

## How many location checks are there?

With default options, there are **488 location checks** in total.

Locations are categorized as follows:
* **Bosses & Minibosses**: Defeating Council Bosses, Minibosses, and reaching defeat count milestones (e.g. defeating a boss 5 times).
* **Enemies**: Kill count milestones (25 or 50 kills) for standard and elemental enemies.
* **Chests & Milestones**: Opening elemental, miniboss, and boss chests, plus total chest milestones (10, 25, 50, 75, 100 chests opened).
* **Spawn Shops & NPCs**: Purchasing items from Outfit, Relic, and Arcana shops in town, plus interacting with dungeon NPCs (Doctor Song, Savile, Nox, Nocturne, Cremire, Doki, Time Keeper).
* **Progression & Gameplay Milestones**: Stage clear milestones, breaking paintings, falling, dashing, accumulating gold/gems, and perfecting a boss.

## Is Archipelago integrated into the game UI?

Yes. The mod modifies the main title screen with a direct **CONNECT TO ARCHIPELAGO** option. In-game interfaces (SpellBook, Equipment Menu, and HUD Cooldowns) dynamically reflect your unlocked slots, element licenses, and active checks in real-time.