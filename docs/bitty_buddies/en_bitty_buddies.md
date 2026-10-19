# Bitty Buddies

## What is Bitty Buddies?

Bitty Buddies is a short, genre-spanning experience and a love letter to retro handheld gaming. Dust off your Bitty
Boy and slot in one of your 5 favorite cartridges, each containing a unique game to chase high scores in. As your
scores improve, you'll unlock and level up the "buddies" that call each cartridge home. Each of them is proficient
in their own game, but with some experimentation, you'll find that their true talent lies elsewhere...

## How do I create a config (yaml) file for this game?

The [player options page for this game](../../player-options) contains all the options you need to
create your config file.

## What does randomization do to this game?

Buddy level ups, cartridge-specific bonus points, and optionally, buddy power increases, are randomized into the item pool. and random items are sent
when you achieve goal scores in each cartridge or fulfill special "silly" or "skill" checks (see below).
The buddy that you start with will also be randomized.

The gameplay itself is unchanged, but you may find yourself forced to develop new strategies as you play through the
game with a different lineup of buddies than you're used to!

## What's the goal?

The goal is to achieve the total high score specified in your YAML. The default goal score is 999 (the same as the
base game) but you can set it as high as 2000 points if you're looking for a challenge!

## Where's the setup guide?
Right [here](/tutorial/Bitty%20Buddies/guide_en)!

## What are the "Silly Checks" that can be enabled in the options?

The silly checks are 5 extra locations centered around interactions between buddies and their sub-optimal cartridges:
- Bud's silly check (Mean Mugging): Get your shoe stolen by an angry balloon in Bazz's Big Day.
- Biff's silly check (Heavyweight Champion): Drop to the ground without slowing your fall in Acrobird.
- Benson's silly check (Frictionless Fruit): Hit one of the banana peels with your tire in Trash Dash.
- Brie's silly check (Negative Jing): Have Brie fly away from Have at Thee by refusing to block or attack.
- Bazz's silly check (0-Star Review): Pop the tires on a customer's car by getting too close in Treatment To-Go.

## What are the "Skill Checks" that can be enabled in the options?

The skill checks are 5 extra locations for buddies in their optimal cartridges:
- Bud's skill check (Fast Pharma): Deliver orders to three different customers within 7 seconds in Treatment To-Go.
- Biff's skill check (Parry King): Deflect 5 balloons with a single block action in Bazz's Big Day.
- Benson's skill check (Miracle Cure): Go below 0 hp and survive by regenerating health in Have at Thee.
- Brie's skill check (High Flyer): Fly over a paper airplane in Trash Dash.
- Bazz's skill check (Sharpshooter): Score a bullseye on a small, moving target in Acrobird.

## How does death link work in this game?

Death links are sent when you receive a game over in a cartridge without at least matching your previous high score.
This also applies to games you end manually (via the pause menu), so be careful about needlessly resetting!

Received death links can have one of two different effects, based on your settings:
- Game Over: Death links trigger a game over.
- Next Buddy: Death links trigger a transition to the next available buddy (as if the current buddy just failed).

Additionally, when you receive a death link, the affected attempt becomes exempt from sending a death link.