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

## Credits

Thanks to the Cheat Engine data miners who laid the foundation
for this work.
