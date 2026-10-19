# Setup Guide for TimeSplitters: Future Perfect Archipelago

## Requirements

* [Archipelago](https://archipelago.gg/tutorial/) 0.6.0 or newer (tested on 0.6.3)
* The TimeSplitters Future Perfect `.apworld`
* [Dolphin Emulator](https://dolphin-emu.org/)
* TimeSplitters: Future Perfect for GameCube, North American version (game ID `G3FE69`). You must
  provide your own copy. Any format Dolphin can run should work as long as the game ID matches
  (ISO and NKit have been used; others are untested). The PAL, PlayStation 2 and Xbox versions
  are not supported.
* Optional: [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker).
  It adds a tracker tab to the client listing the checks you can reach, which is the easiest way
  to see which mission you started with. Without it the client works the same, minus that tab.
* Optional: [Mouse & Keyboard Injector for Dolphin](https://github.com/CrashOveride95/MouseInjectorDolphin).

## Installing

1. Double-click the `.apworld` (or copy it into Archipelago's `custom_worlds` folder) and restart
   the Archipelago Launcher.
2. In Dolphin, turn cheat codes off: Config > General > Enable Cheats. With them on, the Behead
   The Undead score multipliers and receiving Death Links do not work (the client log says so).

## Playing

1. Start Dolphin and the game, and open "TimeSplitters Future Perfect Client" from the Archipelago
   Launcher. The client says "Dolphin connected successfully."
2. Enter the server address at the top of the client, then your slot name at the bottom.
3. With the client open and connected, create a NEW save profile in the game. Use that profile
   for this seed only.
4. Keep the client open and connected to Dolphin while you play.

## Important notes

* **Connect the client before you load a profile or enter Story mode.** The client has to change
  how story levels unlock before the game first uses that part of its code. If you forget,
  restart the game with the client already open.
* **One profile per seed.** The client reads trophies and story completions from the profile you
  load and sends them all as checks. Loading a profile that already has progress sends every
  check tied to it, and a profile that has beaten 1924 Future Perfect finishes your game at once.
* **Do not play that profile without the client.** The game's normal unlocks come back when the
  client is not running, so the profile would gain things you have not received.
* **Story objectives are only seen as they happen.** An objective completed while the client is
  closed has to be completed again. Trophies and level completions are read from the save and
  are never missed.
* **After a crash:** your items and the checks already sent are safe, because the server keeps
  them. Anything the game had not saved (a trophy or a level completion) is missing from the
  profile, which matters for the 1924 Future Perfect requirements and the Trophy Hunt goal: earn it
  again.
