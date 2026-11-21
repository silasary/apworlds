# Gotcha Force

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a
config file.

## What does randomization do to this game?

Story mode becomes an Archipelago world. Winning story missions sends
checks, the game's own milestone reward (such as recruiting a GF Commander,
big GF Energy upgrades, the Gotcha Box, the Death Crystals...) are
extra checks, and **the Gotcha Borg gacha itself can become checks as well**.
Every enemy can be randomized, and story progression, upgrades and even borgs 
you can use can be tied to items you receive from the multiworld.

Challenge Mode is not included.

## What is the goal?

Winning the specific mission you set as your win condition in the configuration.
Options are:
  * The **Cosmic Dragon** fight
  * The **Dark Knight** fight
  * The **Galactic Emperor** (aka the final mission)
  * (EXPERIMENTAL) A mission of your choice (goal:custom) or one picked by the seed (goal: random_mission). 
 
The goal mission unlocks by collecting **Death Crystals**.

Which missions fill the road to the goal is also up to your YAML settings (Mission Pool): 
  * MAIN: An arbitrary set of missions that has most of the important story missions.
  * ALL: Every mission in the game (including some hidden dev/debug missions) 
  * (EXPERIMENTAL) A custom/random set, that allows you to pick whichever missions you want.

## What items and locations get randomized?

Items:
- **Death Crystals**: Collect X Death Crystals to unlock the goal mission. 
  You can configure the required number in your YAML.
- **Progressive Story Keys**: your missions are sorted by story
  order and split into batches, that are unlocked by these keys.
- **Progressive GF Energy Cap**: raises your deploy budget. Your GF
  Energy is always handled by the client and the current cap, so you can't farm
  to raise it.
- **Area Access**: missions in a map zone only appear once
  you have its access item.
- **Gotcha Box**: The ability to open and edit your force. Without the Gotcha Box,
  you will only have your starting borg and can't modify it.
- **GF Commanders**: Unlocking a GF Commander becomes an item, an so are their upgrades. In order to play a mission
  where a GF Commander is deployed as your ally, you need to find their GF Commander first.
- **Gotcha Borgs**: whole, or split into their Data Crystal fragments. The number of required fragments for each borg
  is their vanilla requirement.

Locations:
- **Story missions**: each mission you win sends from 1 to 3 checks, based on your YAML configuration.
- **Milestone rewards**: each reward the original game gives at a
  story milestone is a check instead. These are recruiting each
  commander, the GF Energy cap raises, the commander upgrades, the
  three Death Crystals, the Gotcha Box, the upgrade to Neo G Red, etc...
- **Gotcha Borg gacha** : when the  gacha pops after a battle, it sends a check instead of giving you a
  borg. Every borg you can meet as an enemy in your seed has its own checks. 
- **Achievements**: extra arbitrary objectives. You can pick which kinds are included:
  - **Partner Style**: win a mission with a partner while carrying a
    borg of that partner's style. One for each commander.
  - **Rival Style**: beat a commander while carrying a borg of their
    style. You can configure it to get one check per commander, or one for every mission
    where they fight against you.
  - **Tribe Force**: win a mission with a force made of a single
    tribe, worth at least Tribe Force Minimum Cost. 
  - **Theme**: win a themed mission (dragons, bugs, heroes...) while
    carrying a borg of its theme.
  - **Ally Finisher**: win a mission where your partner lands the final blow. 
    The seed picks a random sample of missions that get assigned this achievement as an extra check.
  - **Ace Duel**: defeat each commander while carrying their own original signature borg.


## Which items can be in another player's world?

All of them. If you enable receiving borgs from the multiworld, some of them are forced to be local to make sure you
can actually progress.

## Is there a tracker?

The client already comes with two new tabs that should have all the info you need. The "Progress" tab shows what
you've received so far. The "Tracker" tab shows the current checks available, based on your settings.