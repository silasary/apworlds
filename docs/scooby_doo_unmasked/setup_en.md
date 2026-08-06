# Scooby-Doo! Unmasked Archipelago Setup

## Supported game

This world currently supports only the North American PlayStation 2 release:

- Serial: `SLUS-21091`
- Version: `1.01`
- PCSX2 game CRC: `FE0030D6`

The embedded client checks both the serial and executable signature before it
writes to emulated memory. Other regions and revisions are rejected.

## Install

1. Install Archipelago 0.6.7 or newer.
2. Double-click `scooby_doo_unmasked.apworld`, or copy it into
   Archipelago's `custom_worlds` directory.
3. Use Archipelago Options Creator to make a
   `Scooby-Doo! Unmasked` player YAML, or start from the YAML supplied beside
   the `.apworld`.
4. Generate and host the multiworld normally.

The `.apworld` contains its client. No separate connector, Lua script, or
executable is required.

## PCSX2

1. Use a recent PCSX2 build with PINE enabled.
2. Leave PINE on its normal port (`28011`). The client also scans ports
   `28012` through `28019`.
3. Start `Scooby-Doo! Unmasked` and load or create a save.
4. Open **Scooby-Doo! Unmasked Client** from the Archipelago Launcher.
5. Enter the Archipelago server address and slot name in the client.

The client waits for PCSX2, detects `SLUS-21091`, and reconnects automatically
after game or emulator restarts.

Do not run another PINE memory tool against the same PCSX2 port while the
Archipelago client is active.

## Recommended save

Use the dedicated 99% W5L0 save card when playing with the MFM travel hub.
On the first loaded gameplay level, the client replaces the save's clue,
ingredient, and trap-piece pickup bits with the connected AP slot's checked
locations. Mission clears come from the live, signature-verified `Level
Complete` screen rather than the save's already-capped story counter, and the
99% save's vanilla level bits cannot bypass AP-backed clue use or late-game
access items.

## W5L0 start and mission clues

Opening sends Scooby to the W5L0 travel hub. Chinatown, the Theme Park, and
the Museum are all available from its Mystery Machine immediately after
Opening; fresh seeds do not place or require Hub Access items. The old
`starting_hub` key, Hub Access names, and their IDs remain readable only so
older YAML files and seeds still work.

Fresh seeds start with `Giant Fortune Cookie` and shuffle the other 36
non-Opening clue items. Item names contain only the in-game clue name; physical
check names also include the area where Scooby found them. Across the starting
and shuffled items, 13 clues are progression for the twelve ordinary missions
and the other 24 are useful. The Opening Keycard and Radio Beacon remain
story-controlled. Receiving a progression clue puts it into Velma's notebook,
but the matching mission tape activates only after the player uses that clue
with Velma.

The physical `Chinatown Hub - Giant Fortune Cookie` pickup remains a normal
randomized check; its reward is separate from the guaranteed starting clue.

| Mission unlocked | Required received clue used with Velma |
| --- | --- |
| Cookie Factory | `Giant Fortune Cookie` |
| Sewers | `Dragon Scale` |
| Temple | `Chinese Bell` |
| Zen Tuo's Dragon | `UV Light Bulb Packing Slip` |
| Haunted House | `Haunted House Ticket` |
| Water Park | `Surveillance Tape` |
| Circus Tent | `Def Potatoes Tour Album` |
| Guitar Ghoul | `Music Sheet` |
| Dinosaur Exhibit | `Photo of the Caveman` |
| Medieval Exhibit | `Dinosaur Bone` |
| Undersea Exhibit | `MFM Contract` |
| Caveman | `Video Tape` **and** `Camera Tripod` |

Physical clue pickups report their AP locations but do not grant the clue or
open a tape. Likewise, receiving a clue without using it with Velma does not
activate the hidden mission gate. This keeps completed-save story flags from
bypassing the seed.

Connect the client to the room while the game is still on its main menu. The
game preloads the post-Opening destination as soon as Opening starts, so the
W5L0 selector cannot take effect if the client is first connected from inside
an already-running tutorial. The client warns when this happens.

## Hub checks

Completed world hubs cannot normally be revisited. To prevent missable
locations, solving a world's mystery automatically reports every still
unreported clue, ingredient, costume-coin, and enabled SnackSanity check in
that hub:

- Chinatown mystery: releases remaining Chinatown Hub checks.
- Theme Park mystery: releases remaining Theme Park Hub checks.
- Museum mystery: releases remaining Museum Hub checks.

Already reported checks are ignored.

Hub ingredients and costume coins remain valid checks, but they are excluded
from advancement placement because several appear only after later story
phases. This prevents a required item from waiting on the mystery-completion
auto-release that requires that same item.

## SnackSanity

Set `snack_sanity: true` in the player YAML to add 135 locations for rewards
worth 100 Scooby Snacks. Every location has a stable level/entity ID: 115 are
placed boxes, eight are created by Guitar Ghoul's two reward phases, and 12
are deterministic boxes spawned by fixed breakables. Loose snacks, random
enemy drops, and reusable breakable-drop templates are not checks.

For an unchecked cataloged box, the client reports that box's AP location and
suppresses only its vanilla +100 reward. It never treats a received Snack Pack
or an unrelated change to Scooby's snack counter as a location. Verified
mission boxes use normal randomized placement. Deferred hub boxes and the
not-yet-ordered Haunted House and Back-to-MFM boxes remain excluded from
advancement placement.

Opening cannot be revisited, so its one remaining SnackSanity location is
released when Opening completes. Enabled hub boxes follow the same
mystery-completion release rule as the other hub collectibles.

## RatSanity

Set `rat_sanity: true` in the player YAML to add 62 locations for the
rat holes that Scooby can block. The catalog covers nine
mission levels and gives every hole a stable level/entity ID and a numbered
area name, such as `Cookie Factory - Rat Hole 01`.

Blocking a cataloged hole reports that hole's AP location while retaining the
game's blocked-hole visual state. The physical hole can respawn after an
overlay reload, so the client deduplicates its AP check and continues to
suppress repeat vanilla rewards while tracking is active. Generic rat
generators and structural holes that Scooby cannot block are not checks.
RatSanity locations use normal randomized placement, with the same
verified costume-machine boundaries as standard mission checks.

## Porta-Kitchen Recipes

Ten global sequential Porta-Kitchen checks are included in every fresh seed.
The sequence advances at any Porta-Kitchen, so a recipe is not tied to the
level containing the kitchen where Scooby completes it.

Scooby starts with 3 health medals and has ten vanilla upgrades, reaching a
maximum of 13. Accordingly, shuffled seeds contain ten `Progressive Health
Upgrade` items; Recipe Checks and health items remain separate so a recipe
can contain any randomized item.

| Recipe | Additional ingredients | Cumulative ingredients |
| ---: | ---: | ---: |
| 1 | 2 | 2 |
| 2 | 3 | 5 |
| 3 | 4 | 9 |
| 4 | 5 | 14 |
| 5 | 6 | 20 |
| 6 | 7 | 27 |
| 7 | 8 | 35 |
| 8 | 9 | 44 |
| 9 | 10 | 54 |
| 10 | 10 | 64 |

All 64 ingredient locations and the ten recipe checks are included in every
fresh seed. Generation places 64 one-unit `Sandwich Ingredient Bundle` items
and classifies all 64 as progression so the full cumulative cost is represented
in Archipelago logic.

The client records and reconciles the sequential recipe state through
AP-backed runtime data and the server's acknowledged recipe locations. A
reconnect, save reload, or save-state change cannot duplicate an acknowledged
recipe check or roll it back.

The exact maximum location totals are:

| Other optional checks | Maximum locations |
| --- | ---: |
| None | 146 |
| SnackSanity | 281 |
| RatSanity | 208 |
| SnackSanity and RatSanity | 343 |

## Trap weights

`trap_percentage` controls how many otherwise-filler item slots become traps.
`snack_trap_weight` and `scare_trap_weight` then control the relative mix of
those traps. A weight of `0` disables that type. If both weights are `0`, the
world generates no traps even when `trap_percentage` is above zero.

## DeathLink

Set `death_link: true` to exchange deaths with other DeathLink-enabled players.
When Scooby's current health falls from a positive value to zero during stable
gameplay, the client sends one death. A received death reduces Scooby's current
health to zero. The client waits for a stable loaded level and suppresses menu,
loading, tally-screen, and repeated-zero transitions so one event is not sent
or applied more than once.

Enter `/deathlink` in the client command box to test the incoming-death path
locally. The command works even when this seed has DeathLink disabled, waits
for a verified gameplay frame, and does not send the test to the AP server.

## Goal

`goal: defeat_pterodactyl` is the standard objective: complete all three
mysteries and defeat the Pterodactyl. `goal: all_trap_pieces` additionally
requires receiving all nine randomized `Trap Piece` items. This counts AP
items received from any world, not the nine physical trap-piece locations,
which can contain items for any player.

`Back to MFM Access` and all three solved mysteries unlock Back to MFM. Movie
Set Access is not required for that mission and remains a shuffled item. The
Pterodactyl level requires Back to MFM to be cleared, `Movie Set Access`, and
three Progressive Health Upgrades. It also requires the first tier of Kung
Fu, Bat, and Robin Hood because the fight uses all three. The alternate goal
additionally requires all nine received `Trap Piece` items at that final gate.

## Mystery Machine hub travel

The MFM Studios exterior (`W5L0`) is the neutral travel hub. The Mystery
Machine in W5L0 and in each world hub keeps the normal mission entries, but
repurposes the three MFM-labelled tapes:

- `MFM` travels to the Chinatown hub.
- `MFM 2` travels to the Theme Park hub.
- `MFM 3` travels to the Museum hub.

After Opening, all three hub tapes are selectable from W5L0. In Chinatown,
Theme Park, or Museum, the tape matching the current hub returns to W5L0;
either other tape travels directly to that world hub. Hub Access items are not
part of fresh seeds. The MFM tapes never substitute `W4L1` or `W4L2`.

The W5L0 front studio door is context-sensitive. Without `Back to MFM Access`
it redirects to Opening (`W0L1`), allowing the player to recover missed
tutorial checks. With that item it enters Back to MFM (`W4L1`). Clearing W4L1
returns to W5L0. If shuffled `Movie Set Access` has also arrived and the final
goal requirements are met, W4L2 becomes usable; otherwise the player can keep
searching from W5L0. The client clears conflicting vanilla unlocks from
completed save files, so a 99% save cannot bypass the Archipelago goal.

The twelve ordinary mission tapes are independent of the three hub-return
tapes. Once Opening is complete, each requires its exact named clue to be
received and used with Velma. Mission Access and Hub Access items are absent
from fresh pools. Costumes remain logical traversal requirements for checks
inside a mission rather than hiding a clue-unlocked level tape.

Costume requirements are divided at the real obstacle inside each mission.
Checks reached before the relevant Kung Fu barrier, Bat fan or glide route,
or Robin Hood target stay in logic without that costume. The player may take
those checks, leave, and return after receiving the costume for the remaining
section. Cookie Factory has no costume requirement.

Opening sends Scooby directly to W5L0. After a hub mystery is solved, allow
its normal clear sequence to finish; the client routes that transition back
to W5L0. Use the Mystery Machine there to choose any of the three hubs.

## Version 0.1.0 notes

- Optional SnackSanity adds 135 uniquely identified 100-Scooby-Snack box
  checks without changing any core location ID.
- Optional RatSanity appends 62 uniquely identified, player-blockable rat-hole
  checks without changing any core or SnackSanity location ID.
- Ten always-on Porta-Kitchen recipe locations follow the core, SnackSanity,
  and RatSanity ID ranges. All previously assigned IDs remain unchanged.

- Clue and ingredient pickups use their persistent individual bitfields.
- All 39 clue locations use the clue's actual in-game name and its area.
- All 39 bare clue names also exist as items, while their physical locations
  retain area-qualified names. Each fresh seed starts with `Giant Fortune
  Cookie`, shuffles the other 36 non-Opening clues, and never generates the old
  generic `Clue Bundle`. Thirteen exact clues are progression for the twelve
  ordinary missions; Caveman needs both Undersea Exhibit clues. The two Opening
  clues remain story-controlled.
- After Opening reaches W5L0, an ordinary mission activates only when its
  received clue has been used with Velma. It does not wait for an earlier
  mission clear or a Hub Access item.
- Retired Hub Access and ordinary mission Access item IDs remain supported so
  older seeds still work, but fresh seeds do not place them.
- Mission clears use the matching disc level's signature-verified `Level
  Complete` tally state. The capped 99% story counter is not required to
  increase, and quitting or warping out of a mission does not create a check.
- Opening retains a W0L1-to-W5L0 transition repair in case the client misses
  its tally screen. Legacy seeds retain the equivalent world-hub arrival
  repair.
- Velma's native use flags for received progression clues drive the verified
  ordinary-mission doorway bits. `Back to MFM Access` and `Movie Set Access`
  continue to drive their separate late-game gates.
- Mystery solutions require a counter increase while playing that world.
- Costume coins release through the hub rule because received costumes share
  their vanilla tier field.
- Trap-piece checks use the game's nine persistent collection bits.
- Physical trap pieces retain their normal game behavior and report checks.
  Received `Trap Piece` items are not written into the physical-check bits,
  because that would falsely report locations. They become progression and
  gate the final level when `goal: all_trap_pieces` is selected.
- Physical ingredients report Archipelago checks without entering Shaggy's
  inventory. Scooby Snack Packs modify only Scooby Snacks, while each newly
  received Sandwich Ingredient Bundle adds one unit to Shaggy's 23-slot food
  inventory exactly once. Normal cooking consumes that unit permanently. The
  client selects a food sprite supported by the loaded level and remaps any
  unsupported live slot rather than displaying the question-mark texture.
- All 64 one-unit Sandwich Ingredient Bundles are progression items and the
  ten cumulative Porta-Kitchen completions are
  reconciled from AP-backed runtime state.
- The opening Magnetic Keycard and Radio Beacon are AP checks only, just like
  every later clue. Their persistent physical check bits directly drive the
  electrical barrier and exit platforms without granting the vanilla clue,
  opening its review screen, entering Velma's notebook, or incrementing the
  vanilla clue total.
- Received named clue items are placed in Velma's notebook. The hidden
  ClueManager door flags are cleared and rebuilt only after those AP-backed
  clues are used with Velma, preventing physical clues or a completed save
  from bypassing seed logic.
- When those AP-backed flags change in Opening, Chinatown, the Theme Park, or
  the Museum, the client re-arms the loaded level's native gate-validation
  pass so doors, collision, platforms, and related objects update live without
  reloading the save.
- Received health, costumes, late-game access, and named clues are written to
  their verified fields. Named clues enter Velma's notebook but never Shaggy's
  food inventory.
- Mission-access bits now match the game's level-select masks exactly, fixing
  lit mission tapes that previously refused to load.
- Every hub's three MFM tapes provide cross-hub travel after Opening; the tape
  for the current world returns to W5L0 so the player cannot be stranded.
- The W5L0 studio door redirects to W0L1 until `Back to MFM Access` is
  received, then enters W4L1. It is never left as a locked dead end.
- All three hubs branch independently and may be completed in any order from
  the W5L0 Mystery Machine.
- Optional DeathLink exchanges stable in-level health deaths while suppressing
  duplicate menu, loading, tally, and already-dead transitions.
- A genuine hub-mystery completion routes the game's own `LoadHub` transition
  to W5L0 without changing the Opening destination.
