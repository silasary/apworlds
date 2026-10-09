# Secret Agent Clank

An Archipelago implementation for Secret Agent Clank

## FAQ
- [Where is the settings page?](#where-is-the-settings-page)
- [What does randomization do to this game?](#what-does-randomization-do-to-this-game)
- [What options are available?](#what-options-are-available)
- [What is the goal?](#what-is-the-goal)
- [What items can be in another player's world?](#what-items-can-be-in-another-players-world)
- [When the player receives an item, what happens?](#when-the-player-receives-an-item-what-happens)
- [Setup guide](#setup-guide)

## Where is the settings page?

The [player settings page for this game](../player-settings) contains all the options for configuring your randomizer experience.

## What does randomization do to this game?

All weapons, gadgets for both Clank and Ratchet, level access (depending on the yaml setting) are shuffled into the item pool and placed on the following location
types: end of level completion, mission completion, cutscenes watched, titanium bolt locations, skill point completions, challenges completed in special missions/as gadgetbots/as Ratchet,
weapon vendor purchases, the 3 keycard locations, all 27 alien code locations, weapon and nanotech levels, and stealth takedowns in each Clank case.
## What options are available?

The full option list with all details lives on the [player settings page](../player-settings).

**Keycard Hunt** (`keycard_hunt: true`) adds Red, Blue, and Yellow Keycards to the
Archipelago item pool. Received cards open the keycard door inside the Treehouse;
collecting the alien codes still unlocks access to the Treehouse itself. When
**Keycards & Alien Codes** locations are enabled, you must still collect each
physical keycard to complete its check. Receiving an AP keycard never completes
that location. Keycard Hunt is off by default.

## What is the goal?
The player can specify their goal for the multiworld from the following selection:
- **Defeat Klunk:** Complete the showdown with Klunk in the Klunk's Lair case file.
- **Qwark Opera:** Complete the Madam Butterqwark case file.
- **All Gadgetbots:** Complete all Gadgetbot case files.
- **Ratchet Prison Escape:** Help Ratchet survive the prison life and complete all Ratchet case files.
- **These Are the Real Adventures of Captain Qwark:** Follow Captain Qwark's awesome adventure and complete all Qwark case files.
- **Alien Codes:** Scan all 27 alien codes.
- **Chalice of Power:** Obtain the Chalice of Power (this option can result in a lengthy seed).
- **Any:** Complete any one of the goals above to goal your seed.
- **Pick and Mix:** Complete every goal you select in Pick and Mix Goals.

## What items can be in another player's world?

Any weapon, gadget, level access. When progressive modes are enabled, you receive `Progressive Weapon` or `Progressive Planet` items that unlock each weapon level / case file in a fixed order instead.

## When the player receives an item, what happens?

You will be able to visit the case file with whatever case file/progressive planet/planet/agent you receive, receiving 
Case File: Boltaire Museum will unlock the Boltaire Museum Case file. Getting Progressive Hydrano will unlock the first
case file on Hydrano: Dam's Edge, Hydrano. Hydrano Access unlocks all case files taking place on Hydrano.
Play as Ratchet unlocks all Ratchet case files.
Upon receiving a weapon it unlocks in the respective character's inventory, which will let you equip it
and use to fire on enemy troops. Progressive upgrades will upgrade your weapons increasing their
firepower.

## How does the weapon vendor's up/down view work?

Any weapon's vendor menu has two views, swapped with D-Pad Up/Down:
- **Up (default) view** — the normal purchasable list: whatever's still available to buy at this vendor. If a weapon has already been fully purchased here, the vendor opens straight into the right view instead, since there's nothing left to show on the left.
- **Down view** — your full owned inventory instead, so you can buy ammo for a weapon you already own that isn't (or is no longer) listed on this vendor's purchasable side.

## Setup guide

See [the Setup Guide](setup_en.md) for full instructions on connecting PCSX2 to Archipelago.
