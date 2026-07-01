# One Must Fall: 2097

## Where is the settings page?

The [player settings page for this game](../player-settings) contains all the options for configuring your randomizer experience.

## What does randomization do to this game?

In vanilla OMF:2097, you earn money by winning matches, then spend it in Mechlab to upgrade your HAR's stats.
In the Archipelago randomizer:

- **HAR Unlocks** are items in the multiworld. You start with one HAR and receive others as items from the AP server.
- **Stat upgrades** (HAR and pilot) are progressive items. Buying an upgrade slot in Mechlab sends a location check; the actual stat boost arrives as an item from the server.
- **Match wins** and **tournament victories** send location checks.
- Money still matters — match winnings and AP money bundle items fund your Mechlab purchases and tournament registration fees.

## What is the goal?

Win the tournament configured as your goal (default: World Championship). Your client sends `goal_complete` to the AP server when you win it.

## Which items can be in another player's world?

- HAR Unlock items (Jaguar, Shadow, Thorn, Pyros, …)
- Progressive Tournament Access (unlocks Katushai → WAR → World Championship in order)
- Progressive HAR stat upgrades (ARM Power, LEG Power, ARM Speed, LEG Speed, Armor, Stun Resist — per HAR)
- Progressive HAR Enhancement upgrades (per HAR)
- Progressive Pilot stat upgrades (Power, Agility, Endurance)
- Ability to change HAR color
- Money (Small) / Money (Large) — filler credits

## What does another player's item look like in my game?

When the AP server sends you an item, a brief notification plays in the HUD and a sound effect confirms receipt. Stat upgrades are applied at the start of the next match.

## Unique local commands

None beyond the standard Archipelago client interface. Connection settings (host, port, slot, password) are entered in the **Archipelago** menu on OpenOMF's main menu.
