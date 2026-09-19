# Donut County

Donut County is a physics puzzle game where you control an ever-growing hole in the ground.
The randomizer makes each level available from the start, requiring certain ability items to progress further in each level.
Completing levels and sections of levels sends items to other players.
Either the Boss Fight or Aftermath level is locked behind gathering a number of `Quadcopter Piece` items.
Once that is completed, you can enter Aftermath to win!
Oh, and the raccoon's name is BK.

## Extra tips

The mod adds some quality-of-life settings to the menu:
- You can makes some achievements easier / less tedious.
- You can allow skipping through dialogue / texting.
- You can enable/disable the indicator circles on uncollected trash.

If you hate cutscenes, you can exit out of most levels as soon as they're completed.

## Debug tools

For the early releases of the mod, some debug tools are available:

Press `F3` while connected to open a debug menu. you can scroll or use Page Up/Down to go between the pages.
It has your current slotdata and a list of every item/location in the game.

While the debug menu is open, you can press `F4` to temporarily unlock every trash soul, but it disables the ability to collect trash locations.

While the debug menu is open, you can press `F5` to label every object in the scene. This is probably not useful to users.

Additionally, you can press `F3` when disconnected to start a debug session without connecting to AP.

The game's built-in debug menu is also enabled, on the <code>`</code> key. This can probably do some cool things but I haven't looked into it.

<!-- TODO: some more info on kinds of items/locations -->

<!-- this is misinfo btw
## A note on starting inventory

Some YAML options (notably, `levels`, `hole` and `catapult`) add items that act as keys, where having more than one means nothing.
If you want to disable the effect of a particular key, you would usually add it to `start_inventory_from_pool`, which removes that item from the itempool.
The item that is removed will be replaced by a filler item, even if that space could be used to add more `Quadcopter Piece`s.
For that reason, this APWorld specifically makes `start_inventory` for key-like items remove that item from the itempool,
but allows the item to be replaced by a `Quadcopter Piece` if the number of pieces is set higher than the number of free locations.
-->