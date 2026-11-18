# Horse Riding Classic

## What does randomization do to this game?

Apples stop being something you keep. Picking one up sends a check to the
multiworld instead of adding to your total, and the apples that open the gates
between areas arrive as items from other players' worlds. Riding to a known
apple no longer opens the map; someone else finding one does.

The twelve NPCs and quests that reveal hidden apple caches (the wizard, the
crystals, the casino roulette, the gorge race and the rest) are locked behind
their own items. Receiving the item is necessary but not sufficient: you still
have to actually beat the race, win the jackpot or kill the wizard before that
NPC's apples appear.

Five more NPCs guard a single apple each rather than a cache, and they are
locked the same way: the dentist, Doctor Evil, the construction horse, the mole
miner, and the bear asleep in the forest cave, whose item is Bear Spray. An NPC
you cannot talk to yet wears a red cross instead of an exclamation mark, and
riding into them does nothing at all. That is deliberate. Most of these
conversations happen once and replace the NPC with someone who has nothing left
to give, so being allowed to have them early would cost you the apple for the
rest of the run.

The crystal puzzle in the forest will not turn until `Crystals` arrives, for the
same reason.

The nineteen horses caged in the glue factory are checks too, in every
configuration. Freeing one needs the Tooth Sharpener so your horse can chew
through the wires.

Breeding a faster horse normally happens every ten apples you pick up. Here it
happens every ten apples you *receive*, so a smaller apple pool would quietly
mean a slower horse for the whole run. `Breeding Time` items make up the
difference: one for every five apples missing from the pool, plus a rolled share
of the carrots. Receiving one sends you straight to the breeding screen, and if
several arrive at once they queue up rather than collapsing into one. Taking the
golden apple ends the queue, so apples other players find afterwards do not
interrupt a sweep of the last checks.

As a last resort, the rebel general at the final race will not start it for a
horse that cannot win. Talk to them on a slow horse and they breed you a better
one instead, as many times as it takes. A run cannot end up stranded at the
finish line for want of speed.

## What is the goal?

The golden apple behind the grate in the glue factory.

The grate opens after the rebel martyr appears and blows it up, and your yaml
chooses what makes them appear:

- **apples_received**: receive `apple_goal_requirement` apples from the
  multiworld.
- **apples_collected**: pick up `apple_goal_requirement` apples in game. In
  this mode only, `include_horses` can additionally require all 19 horses freed.

Both modes use the same `apple_goal_requirement`, which defaults to 80.

## Which items can be in another player's world?

All of them: apples, the seventeen unlocks, the Tooth Sharpener, Breeding Time,
and carrots.

## What does another world's item look like in this game?

There is no in-world representation. Checks are reported through the mod's
overlay and message log rather than by changing what the apple looks like.

## Locations

118 in every configuration:

- 99 apples, one per apple in the game other than the golden one.
- 19 glue factory cages.

The golden apple is the goal rather than a location.
