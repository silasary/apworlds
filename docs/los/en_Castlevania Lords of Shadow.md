# Castlevania: Lords of Shadow

This Archipelago world connects the Windows Ultimate Edition to a multiworld through a local game
bridge. Version 0.6 includes all 101 persistent base-game collectible checks, all 46 base-level
completion checks, and 46 optional retail trial checks. Retail story pickups are not checks; their
vanilla rewards are blocked and their abilities come only from received Archipelago items.

Supported shuffled progression items currently include Hook Tip, Spiked Chain, Stake, Dark
Gauntlet, Cyclone Boots, Seraph Shoulders, Light Magic, Shadow Magic, Dark Crystal, Progressive
Fairies, Progressive Holy Water, Progressive Daggers, and Focus Scroll. Individual Level Access items control
which levels can be entered; no ability is
required merely to enter an unlocked level. The Satan threshold and number of starting levels are
configurable.

The public alpha is a manual drop-in with no custom executable or launcher. Before a run, manually
back up and remove `Castlevania.profile` so the game creates an empty save; leave `Castlevania.cfg`
in place. Install the APWorld, copy the included `dinput8.dll` into the game's `bin` folder, use the
standard Archipelago client, and launch the game normally through Steam.

Progressive Daggers synchronize the retail HUD and three menu actions, while an independent guard on
the retail ranged-attack handler prevents ammunition from bypassing ownership. Dagger capacity
normalization also clamps the currently held amount to its new maximum.
The received loadout is reapplied after deaths and level transitions. Chupacabra theft temporarily
suppresses AP-owned relics and magic until the retail encounter returns them, while Hook Tip, Spiked
Chain, and Stake remain available as Combat Cross upgrades. Valid temporary magic overfill is
preserved during synchronization and by Consumables Refill.

With trials disabled, the reward pool returns all 30 gems of each type as paired gem items. With
trials enabled, it instead uses 30 individual rewards of each gem type. Those 45 extra gem slots
balance 45 trials; Besieged Village's 46th trial adds one refill/trap-family slot. Six Progressive Daggers and
four each of Progressive Holy Water/Fairies combine unlocks with every capacity upgrade. Every seed
contains exactly 25 large XP rewards. By default, all remaining filler slots become Consumables
Refill items. Each Consumables Refill restores owned Light/Shadow Magic, Daggers, Holy Water,
Fairies, and Dark Crystal, but never health. `trap_frequency` can replace 0%, 10%, 30%, or 50% of
only those refill slots with an even mix of Magic Drain and Poison traps. Magic Drain empties the
current owned magic meters without removing the medallions. Poison uses the normal timed retail
effect and can be cured with Light Magic. No Research Token placeholders are generated. During a live session, the Travel Book reads AP-owned abilities and
gem/capacity totals without altering the physical pickup flags used as checks.

The default start has no abilities. `focus_scroll: disabled` places Focus Scroll in the randomized
pool; `focus_scroll: enabled` grants it at the start. `starting_magic` can start with neither medallion, Light,
Shadow, or both. `early_magic` defaults to enabled and guarantees any non-starting Light and Shadow
Magic appear early in the seed because both are required for The Final Fight.

DLC is disabled in this version. `include_dlc` and `trials_as_checks` use the readable choices
`enabled` and `disabled`. All 46 base-game retail trials can be enabled as checks. AP enters levels
through the retail World Map/replay path, so Besieged Village
also begins with its trial active and skips its first-visit tutorials. The client reads the game's
own saved trial-completion records and does not apply a separate forced-Trial patch. Hook Tip, Spiked Chain,
Light Magic, Focus Scroll, and Stake have story-reward suppression but are not locations.
The World Map uses seed-authorized visibility and final-load gates without replacing the retail
ordered progression list. While AP is active, the retail completion call that would add the next
vanilla campaign level is suppressed, leaving AP-authorized availability intact. A three-state AP map display (reachable checks, no currently reachable
checks, and all checks complete) is planned but is not implemented in this development build.
