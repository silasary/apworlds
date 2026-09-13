# Tony Hawk's Pro Skater 3

## Where is the options page?

The [player options page for this game](../player-options) contains all the
options needed to configure and export a YAML file.

## What does randomization do to this game?

Archipelago controls access to levels, trick categories, and individual career
objectives. Depending on the selected options, received items may also provide
stat points, score bonuses, or additional time.

The selected skater and level pool are chosen during generation. A seed can use
all enabled levels or randomly select a smaller number from that pool.

## What counts as a location?

The location pool can contain any combination of:

- Career objectives and competition medals
- Stat points
- Hidden decks
- A configurable percentage of each enabled level's gaps

Disabled location categories are treated as already completed by the client so
they cannot accidentally send checks.

## What items can be received?

Progression items unlock levels, trick categories, and individual objectives.
Stat Point items provide points for the skater's stats. Filler items grant a
score bonus or one additional second.

Items may be placed in any player's world. Received items and sent checks are
shown through the in-game message display.

## What does another player's item look like?

The original THPS3 objective, collectible, or gap remains in the level. When it
is completed, the in-game message identifies the item, receiving player, and
location instead of replacing the object with a different model.

## What is the goal?

The YAML can require a number of objectives, fully completed levels, Cruise
Ship objectives, gold medals, one objective type, a percentage of selected
gaps, collectibles, total checks, or a number of objectives in every enabled
level.

Required counts are clamped to what the selected level and location pools can
provide.

## Is a separate Archipelago client required?

No. The Archipelago client is embedded in the supplied PartyMod DLL. Configure
the server, slot name, and optional password in `partymod.ini`, then start
THPS3 normally.
