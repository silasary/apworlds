# Elden Ring Nightreign Setup Guide

## Required Software

- Elden Ring Nightreign (Steam), no mods or game files need to be modified. The client mostly reads the running
  game's memory to detect what you're doing; if you have the `gate_boss_access` option enabled (on by default), it
  also writes to the game's memory to set the same event flags the game itself uses, revealing secondary Nightlords
  as you receive their "Access" items. The `gate_character_access` option (off by default) does the same thing for
  playable characters instead of Nightlords. It never touches game files on disk.
- Archipelago, from the [Archipelago releases page](https://github.com/ArchipelagoMW/Archipelago/releases), plus
  this game's `.apworld` file installed via the Launcher's "Install APWorld" button (or dropped into your
  Archipelago install's `custom_worlds` folder if running from source).

## Starting a New Save
Play on a fresh save (or a separate save slot) for your Archipelago run, not one where every Nightlord is already
unlocked. With `gate_boss_access` on (the default), the world assumes it's starting from vanilla's own "only your
`starting_boss` is available" state and reveals the rest as you receive their Access items - if every Nightlord is
already unlocked in-game before you connect, there's nothing left for that reveal to do, and the intended
progression won't be visible. The same applies to `gate_character_access` (off by default) and `starting_character`
for playable characters - if you turn it on, start from a save where not every character is already unlocked.

## Playing Offline
Launch the game offline (disconnect from the internet, or use Steam's offline mode) before connecting the client.
This project reads and writes the game's live memory, which requires Anti-Cheat to be disabled (see below) - Anti-
Cheat only runs during an online session, so playing offline is what makes running without it possible in the
first place, and is required every time you play with this client, not just a one-time setup step.

## Turning off Anti-Cheat
This can't be run with Anti-Cheat because it modifies the game's memory. If you run this with EAC enabled and while online, the Nightreign client will instantly close itself.

## Other Mods
Play with other mods at your own risk - given how early access this is, this should be compatible with mods.