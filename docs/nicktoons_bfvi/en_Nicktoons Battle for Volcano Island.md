# Nicktoons: Battle for Volcano Island

## Where is the options page?

This custom world is configured locally with the Archipelago Launcher's **Options Creator** after the `.apworld` is installed. The project also provides an [example YAML](../../../Documentation/example.yaml).

## What does randomization do?

The world randomizes the known progression and completion checks from the USA GBA release:

- 23 Rip Zipper Pieces, one for every normal and Secret Level;
- 115 Golden Heart checks, five per level;
- the Fenton Radar, Timmy and Patrick character unlock checks, and the documented ability checks;
- progressive character unlock items when `shuffle_characters` is enabled;
- Diggypants, Patrick's Pants, and Timmy's Comet Sense when `shuffle_abilities` is enabled;
- optional Math Traps in place of some filler Golden Hearts.

The game remains an unmodified ROM running in BizHawk. The BizHawk Client reports checks to the Archipelago server and mirrors received progression into the documented game-memory locations.

## What is the goal?

The default goal is to defeat the final boss. With `goal: all_rip_zippers`, the goal is to receive all 23 Rip Zipper Pieces instead.

## How does progression work?

The known world gates are:

1. The Fenton Radar makes the Beach progression available.
2. Two Rip Zipper Pieces open the Jungle.
3. Six Rip Zipper Pieces, Timmy, and Spongebob Diggypants open the Cave.
4. Diggypants opens the Desert.
5. Patrick and Patrick's Pants open the Forest.
6. Forty, sixty, and eighty Golden Hearts open Secret Levels 1, 2, and 3.
7. Eighteen Rip Zipper Pieces open the final boss route.

The generator reserves six early Beach Golden Heart slots for Rip Zipper Pieces so the known early gates cannot self-lock. Required character and ability items are also restricted to earlier regions by the world rules.

## What happens when I receive an item?

The BizHawk Client reapplies the complete received-item list after connecting or reconnecting. Golden Hearts update the total heart count, Rip Zipper Pieces update their progression bitfields, character unlocks update the character counter, and abilities update the ability byte. Items can arrive before the corresponding vanilla pickup; when the pickup is later completed, the client still reports the story check rather than treating its earlier AP write as the pickup event.

## When are level checks sent?

Golden Hearts and Rip Zipper Pieces are reported when the game reaches its documented stage-complete state. The client uses the heart count cached during the level and prevents duplicate sends. Story checks are observed from their event bytes and also have a stage-completion fallback for cases where the corresponding progression item arrived first.

## PopTracker

The optional PopTracker pack has six tabs: Beach, Jungle, Cave, Desert, Forest, and Secrets / Goal. Each level entrance has one Rip Zipper node on the top light and five Golden Heart nodes on the centered bottom lights. Story checks are shown on their world maps, and the final-boss node is placed over the purple entrance's eye.

## Supported version and coverage

The supported game is the USA ROM with internal title `NICKTOONSBVI` and MD5 `07f3b7415eb3779ff11e51a38d0ad3f8`. The implementation covers the memory addresses documented in `memory_map.md`. It does not randomize graphics, map geometry, music, enemy behavior, or undocumented game systems.
