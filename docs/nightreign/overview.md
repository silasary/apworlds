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

## DeathLink

**New and not yet tested with other players - please report any feedback or bugs.**

Set with the `death_link` option:

- **Off** (default): no DeathLink.
- **Dead**: a DeathLink goes out only when you fully die. Being downed and then saved (a
  teammate's revive, Wending Grace, the solo boss-fight revive) doesn't count.
- **Downed**: a DeathLink goes out as soon as you're downed, even if you're saved a moment later.

Solo, outside the three boss fights, there's no downed state - you die outright, so both modes
behave the same there.

When someone else's DeathLink reaches you, your HP drops to 0 and the game handles it exactly like
a fatal hit: in a boss fight or in co-op you're downed and can still be saved, otherwise you die. A
full death in the Nightlord fight ends the expedition. A red banner on the game shows who died.
DeathLinks that arrive while you're in the Roundtable Hold, already down, or flying in are skipped.

If several linked players are in the same co-op party, a down caused by a received DeathLink is
never sent back out, so one death doesn't bounce around the party.

Type `/deathlink` in the client to turn it on or off mid-session, or `/deathlink dead` /
`/deathlink downed` / `/deathlink off` to pick a mode.

## Credits

Thanks to the Cheat Engine data miners who laid the foundation
for this work.
