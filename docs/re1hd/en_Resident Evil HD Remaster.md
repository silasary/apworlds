# Resident Evil HD Remaster

## What does randomization do to this game?

Every item pickup in the game is shuffled across the multiworld: keys, quest items, weapons,
ammo, herbs and more, from the Mansion through the Courtyard, Residence, Caves and Altar to the
Laboratory. Maps, files and first visits to each room can also be locations.

Optionally, the door lock randomiser changes which key opens which door, and the door
randomiser (experimental, still being tested) changes where doors, ladders and lifts lead.
Every seed is checked to be beatable.

## What is the goal?

By default, escape on the helicopter at the end of the game. The `mansion_escape` goal is a
shorter game that ends when you reach the Garden Shed.

**Boss Rush** (`boss_rush`, experimental): the Signal Rockets are locked behind seven bosses -
the Crypt Crimson Head, Plant 42, Yawn (Library), Black Tiger, Neptune, Lisa Trevor (Altar) and the
Lab Tyrant. When all seven are dead the rockets go straight into Jill's inventory. Beat the other six
before the Lab Tyrant: after it the Laboratory self-destructs. The client's Tracker tab and `/bosses`
show which are left, and the Key Map marks each boss room with a skull.

**The caves below Barry's lift:** the lift only goes down, so the Broken Flamethrower (which opens
Lisa's door, the only way out) is always found down there, and goes straight into Jill's inventory.

## Can I start somewhere other than the Main Hall?

**Random start room** (`random_start_room`, experimental): a new game begins in the Main Hall as
usual, and about ten seconds in the client moves Jill to a random save room - the Dining Room or the
East Wing Storeroom (`mansion_save_rooms`), or also the Mining Area, Cabin or Residence Storeroom
(`save_rooms`). The seed is only made with a start room it can be finished from. The intro plays
again the first time you walk back into the Main Hall, so Barry's Lock Pick check gives junk with
this option (the real Lock Pick is somewhere else in the seed).

## Where do received items go?

Into the item box by default, so nothing is lost when Jill's inventory is full. The Lock Pick
and the Book of Curses (Sword Key) always go straight to Jill.

## Which characters and difficulties are supported?

Jill on Normal.
