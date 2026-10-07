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

## DLC Characters
DLC characters aren't going to show up in the list of available characters by default. You have to go through the vanilla route of actually speaking to them. However, the client should still trigger the event where you fight the Dreglord with the DLC characters which opens up the room with them in it (where you can then recruit them). If the Iron Menial isn't coming up to you to tell you about the small jar, attempt quitting out to main menu then continuing your save file. That should trigger the event. If not, you can yell at me in the discord.

## Playing Offline
The game must be launched offline or the client will refuse to open. Selecting the "play offline" option within the menu is insufficient - since this implementation reads and writes data, it can only be play with EAC disabled. 

## Other Mods
Play with other mods at your own risk - given how early access this is, this should be compatible with mods.