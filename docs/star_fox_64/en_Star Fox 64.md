# Star Fox 64

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a
config file.

## What does randomization do to this game?

To help Star Fox 64 fit into the environment of Archipelago, the map has been changed significantly. When completing a level, you are no longer forced to the next level based on what you did in the previous level. Instead, the map has controls for selecting which level you can go to. The levels available for selection depend on what path or level items you have received. The map also functions as a sort of in game tracker. You can also no longer use the `Change Course` or `Retry Course` options on the map. This menu has been completely changed to allow you to spend lives (Arwings) to heal your team. This is especially useful when going for Medals.

The Pause Menu has also been changed to allow you to Respawn at a checkpoint, or to go back to the map.

The game's state will be saved, allowing you to restart the game and continue your run with the same amount of lives and upgrades.

**Map Controls**

* `D-Pad Right` brings you closer to Venom
* `D-Pad Left` brings you closer to Corneria.
* `D-Pad Up` and `D-Pad Down` change the path from the previous level.

For example, let's assume you have Corneria selected, and have all paths or `Level Access` is set to `Shuffle Levels`. `D-Pad Right` will select Meteo. From here, `D-Pad Up` will select Sector Y. `D-Pad Left` will select Corneria again.

**Map Legend**

* If `Level Access` is set to `Shuffle Levels`:
  * A colored path means that you have access to the level that path comes from.
  * An orbiting star also signifies that you have access to that level. You can take any path to get there.
    * Note that the star is replaced with a Medal if you get the Medal location on that level.
  * Events that depend on other stages (Bill/Katt) will only trigger if you have the other stage.
* If `Level Access` is set to `Shuffle Paths`:
  * A colored path means that you have that path as an item. You will be able to take that path when selecting a level.
* An animating Arwing means that you have access to the level, but haven't yet completed the level in a way that would normally take that path.
* A stationary Arwing means that you have completed the level in a way that would normally take that path.

## What items and locations get shuffled?

* Getting Mission Complete, Mission Accomplished or a level warp is now a location.
  * If `Level Access` is set to `Shuffle Levels`:
    * The level you would normally go to next is now an item.
  * If `Level Access` is set to `Shuffle Paths`:
    * The path you would normally be able to take afterwards is now an item.
* Getting a Medal is now a location. Medals are now an item.
* Freestanding Items in levels are now locations, and they have been added to the pool.
* Checkpoint rings in each level are now a location. The ability to use them is now an item.

## Which items can be in another player's world?

Any of the items which can be shuffled may also be placed into another player's world. It is possible to choose to limit
certain items to your own world.

## Unique Local Commands

The following commands are only available when using the Star Fox 64 Client to play with Archipelago.

* `/autostart` - Toggle `autostart`. This feature allows you to automatically start a program (such as Bizhawk) with the patched ROM.
* `/patch` - Reruns the patcher.
* `/rom_path` - Sets (or unsets) the file path of the vanilla ROM used for patching.
* `/patch_path` - Sets (or unsets) the folder path of where to save the patched ROM.
* `/program_args` - Sets (or unsets) the arguments to pass to the automatically run program. Defaults to passing the lua to Bizhawk.
* `/deathlink` - Toggles Death Link.
* `/ringlink` - Toggles Ring Link. Currency collection in other games translates to Hit count in Star Fox 64.

## Vanilla Medal Requirements

| Mission  | Hit Score |
|----------|-----------|
| Corneria |       150 |
| Meteo    |       200 |
| Sector Y |       150 |
| Katina   |       150 |
| Fortuna  |        50 |
| Aquas    |       150 |
| Solar    |       100 |
| Sector X |       150 |
| Zoness   |       250 |
| Titania  |       150 |
| Sector Z |       100 |
| Macbeth  |       150 |
| Area 6   |       300 |
| Bolse    |       150 |
| Venom    |       200 |
