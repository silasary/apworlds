# Donut County

Donut County is a physics puzzle game where you control an ever-growing hole in the ground.
The randomizer makes each level available from the start, requiring certain ability items to progress further in each level.
Completing levels and sections of levels sends items to other players.
Either the Boss Fight or Aftermath level is locked behind gathering a number of `Quadcopter Piece` items.
Once that is completed, you can enter Aftermath to win!
Oh, and the raccoon's name is BK.

<!-- TODO: some more info on kinds of items/locations -->

<!-- this is misinfo btw
## A note on starting inventory

Some YAML options (notably, `levels`, `hole` and `catapult`) add items that act as keys, where having more than one means nothing.
If you want to disable the effect of a particular key, you would usually add it to `start_inventory_from_pool`, which removes that item from the itempool.
The item that is removed will be replaced by a filler item, even if that space could be used to add more `Quadcopter Piece`s.
For that reason, this APWorld specifically makes `start_inventory` for key-like items remove that item from the itempool,
but allows the item to be replaced by a `Quadcopter Piece` if the number of pieces is set higher than the number of free locations.
-->