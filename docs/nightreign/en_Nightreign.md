# Elden Ring Nightreign

This is early alpha and these pages are still being developed. No third party mods needed, this runs straight out of the client.

## What is the goal / victory condition?

Configurable via the `goal` option:

- **Night Aspect**: defeat Night Aspect, the vanilla game's own ending/credits boss - any one
- **All Bosses** (default): defeat every Nightlord you opted into, with every character you
  opted into (only applies when `bosses_with_characters` is `boss_and_character` - in `boss`
  mode this is just "defeat every Nightlord you opted into").
  of your opted-into characters' wins counts.
- **All Bosses With Any Character**: defeat every Nightlord you opted into at least once, with any
  one of your opted-into characters - no need to clear every character x Nightlord
  combination.
- **Random**: at generation time, a random number of specific "Defeat X as Y" objectives
  (bounded by `goal_random_min`/`goal_random_max`) are chosen from your included characters
  and Nightlords as the required set. Requires `bosses_with_characters` to be
  `boss_and_character`.

Whichever goal is picked, every included character x Nightlord combination still generates as
a location check - the goal option only changes which of them are required to finish.

## A note on detection accuracy (early alpha)

Boss identification is based on a game-memory value that was found and tested by hand across several live sessions,
not something FromSoftware documents or guarantees. It's solid for the currently-supported roster, but if the client
ever can't confidently identify which Nightlord you just defeated, it will **tell you** instead of guessing - you'll
see a message like `boss_id 72 not found - please report this to the mod owner with your Expedition's Nightlord`.
If you see this, please report it (with the Nightlord you actually fought) so the roster can be corrected. This is
by design: an early alpha should surface uncertainty rather than silently mis-record a check.

## Credits

Thanks to **thefifthmatt**, for their work on Elden Ring Nightreign randomization, which laid groundwork this
project builds on.

Thanks to the Cheat Engine data miners who laid the foundation
for this work.
