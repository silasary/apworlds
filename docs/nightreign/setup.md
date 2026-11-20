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

## Steps to Start
1. Run Elden Ring with Easy Anti Cheat (EAC) disabled. There should be guides to do this online.
2. Start a new save file per Archipelago
3. If starting a new file, skip or complete the tutorial (you get a unique relic for beating the tutorial boss)
4. When in Roundtable Hold, open the Nightreign Client
5. Connect to your room and slot.
6. Enjoy! You can confirm it's working as a blue overlay in the bottom right should show your character and, while in expeditions, the boss.


## Something You Received Isn't Unlocked
If a boss or character you've received (including a DLC character like Scholar or Undertaker) isn't selectable,
go to the Roundtable Hold and press "Re-apply unlocks" on the client's Unlocks tab, or type `/unlock`. It doesn't
work from the main menu - your save has to be loaded first.

## Other Mods
Play with other mods at your own risk - given how early access this is, this should be compatible with mods.
