# Symphony of the Night (Recomp)

Castlevania: Symphony of the Night played on [SymphonyRecomp](https://github.com/BlackLabelHQ/SymphonyRecomp),
the native PC version of the PlayStation game, with the Archipelago mod. You play from your own unmodified US disc
image: nothing is patched, the mod applies the seed as the game runs.

This world is based on fdelduque's Symphony of the Night world (for BizHawk) and has the same items and locations,
plus optional traps. Its options do the same things, under clearer names, and it adds a shorter goal. It has its own
game name, so both can be installed side by side; a BizHawk player uses fdelduque's world.

## Where is the options page?

This world isn't on the Archipelago website. In the Archipelago Launcher, choose **Generate Template Options** to get
a default options file for "Symphony of the Night (Recomp)".

## What does randomization do to this game?

Items, relics and boss drops are shuffled into the multiworld. Options add enemy drops (enemysanity), shop and
candle randomization, a random starting castle, cosmetic changes and more.

## What is the goal?

Defeat Dracula in the Reverse Center Cube. Reaching him takes the five relics of Vlad and the reverse castle.

With the `goal` option set to `defeat_richter`, the game ends at Richter in the Castle Keep instead (saving him counts
too). It's a shorter game: the reverse castle isn't part of the seed.

## Which items can be in another player's world?

All of them: equipment, consumables, relics, life and heart vessels. Also traps (unless `trap_percentage` is 0), which
go off on you when anyone finds them.

## What is a location check?

Every item in the castle, including the ones behind breakable walls, the relic spots and boss drops. With the
option on, enemies too (enemysanity).

## What does another world's item look like?

An Archipelago badge where the item would be, coloured by what it is: gold for progression, blue for useful and grey
for filler. Traps look like progression, unless `disguise_traps` is off: then they're red. Picking it up shows
"<player>'s <item>" and sends it; you don't get any gold for it.

## What happens when I receive an item?

It goes straight into your inventory (or relics), with a notification, as soon as you're in normal play.

## Items falling out of walls vanish in the vanilla game. Do I lose them?

No. Items that fall out of a wall or vase stay on the ground until you pick them up. Another player's item there is
sent the moment the wall breaks.

A boss's drop, like a wall's item, is gone if you leave the room without it, as in the vanilla game. So that no
game can become unbeatable that way, these spots never hold one of your own progression items (another player's
is sent when the boss dies or the wall breaks).

## I'm stuck

If you walk into the Abandoned Mine or the Center Cube without a way back out, you get a Library card. Otherwise
you probably need an item from another world, or a trick the logic expects.

## How do I get into the hidden area at Castle Entrance?

You need both Soul of wolf and Soul of bat. In the room with water on the lower part, before you meet Death, a big
rock can be broken from both sides: go through it from left to right as a wolf, then come back as a bat, and a door
opens on the lower left.

## Can I reach the left room of the Outer Wall without Form of mist?

Yes. In the upper room, break the wall on the left and stand still inside for about 20 seconds; an elevator takes you
down. This doesn't apply to the Reverse Outer Wall.

## A location is too high

Remember you can chain high jumps with Leap stone, Soul of wolf or Form of mist.
