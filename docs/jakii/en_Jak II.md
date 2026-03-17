# Jak II (ArchipelaGOAL II)

## What does randomization do?

The game currently contains the following Location Checks:
- All 65 Main Missions
- All 27 Side Missions (all the ones listed on the wiki, plus two races and the jet board challenge)

These may contain items for different games, as well as items within Jak II.
In addition, the rewards that you get from the main missions are scattered across the multiworld!

## What are the Special Items? What do they unlock (if applicable)?

### Morph Gun/Upgrades
- Scatter Gun
- Blaster
- Vulcan Fury
- Peacemaker
- Morph Gun Ammo Upgrade
- Morph Gun Fire Rate Upgrade (Scatter Gun)
- Morph Gun Damage Upgrade

### Movement Upgrades
- JET-Board

### Dark Jak (+ Abilities)
- Dark Jak
- Dark Bomb
- Dark Blast
- Dark Giant
- Dark Invincibility

### Security Passes

| Item Name            | What it Unlocks             |
|----------------------|-----------------------------|
| Red Security Pass    | Industrial Sector<br/> Port |
| Yellow Security Pass | Market<br/> Garden          |
| Green Security Pass  | Stadium                     |
| Purple Security Pass | The Baron's Palace          |
| Black Security Pass  | The Weapons Factory         |
| Air Train Pass       | Use of the Air Train        |

### Mountain Temple Items
- Lens
- Gear
- Shard

### Story Related Items
- Ruby Key
- Heart of Mar
- Time Map
- Precursor Stone
- Life Seed
- Titan Suit (Mech Suit)
- Gunpod (Gun Turret)
- Dig Seal Piece
- Brutter's Seal Piece
- Onin's Seal Piece
- Rift Rider

## How do I know what Special Items I have?

Open the Pause Menu, navigate to `Game Options`, then `Archipelago Options`, then `Item Tracker`.
This will show you a list of the Special Items of the game.
Indications of "Locked" or "Unlocked" determine whether the items are currently in your possession.

## What is the goal of the game once randomized?

Currently, the default goal is to raid the Metal Head Nest and defeat Metal Kor. In order to do so, you need access to 
the Air Train, any gun, and all the following:
- The Heart of Mar
- The Time Map
- The Rift Rider
- The Precursor Stone
- Dark Jak

In addition, you may also choose to complete a given number of missions of your choosing. Five missions at minimum, and
ninety-two at max!

## What happens when I complete a mission, main or side?

When you complete a mission in game, two things will occur. Firstly, the task will be marked as completed in the game's 
mission list, and your Jak II client will tell you what item you sent out or received.
In the case of the side missions, a similar case will occur, in that you will receive the respective precursor orbs in 
game, as well as your text client telling you what you found and who it belongs to.

## What do traps do?

When creating your player YAML file, you have the option of replacing a certain percentage of filler items with traps.
You can choose which traps you want to generate in your seed, as well as how long they last. A random assortment will
then be chosen to populate the item pool.

When you receive one, you will hear a warning sound and some kind of negative effect will occur in game. These traps
range from a small nuisance to maddeningly annoying. When the trap ends, the game _should_ return to its previous state.
Multiple traps can be active at the same time, and they may interact with each other in strange ways.

## What kind of traps are there?

## Jak and Daxter Traps
### "(almost) All the traps you love, back for more mischief!"

| Trap Name        | Effect                                                                           |
|------------------|----------------------------------------------------------------------------------|
| Trip Trap        | Jak trips and falls                                                              |
| Slip Trap        | The world gains the properties of a _strangely familiar_ mountain's ice lake...  |
| Gravity Trap     | Jak falls to the ground faster and takes fall damage more easily                 |
| Camera Trap      | The camera remains fixed in place, no matter how far away Jak moves              |
| Darkness Trap    | The world gains the properties of a _creepy_ cave...                             |
| Earthquake Trap  | The world and camera shake profusely                                             |
| Teleport Trap    | Jak immediately teleports to the Underground Hideout                             |
| ~~Despair Trap~~ | ~~The Warrior sobs profusely~~ Coming Soon...                                    |
| Pacifism Trap    | Jak's physical attacks have no effect on enemies, crates or buttons              |
| ~~Ecoless Trap~~ | ~~Jak's eco is drained and he cannot collect new eco~~                           |
| Health Trap      | Jak's health is set to 0 - not dead yet, but he will die to any attack or bonk   |
| Ledge Trap       | Jak cannot grab onto ledges                                                      |
| ~~Zoomer Trap~~  | ~~Jak mounts an invisible zoomer (model loads properly depending on the level)~~ |
| Mirror Trap      | The world is mirrored                                                            |

## Jak II Traps
### "More fun for the whole multiworld!"

| Trap Name       | Effect                                                                |
|-----------------|-----------------------------------------------------------------------|
| High Alert Trap | "Arrest him!"                                                         |
| Ammo Trap       | Jak has all of his ammo taken away from him, making his guns unusable |
| Dark Trap       | Jak gives into his anger, forcefully transforming into Dark Jak       |
| Speed Trap      | Jak and the world around him are suddenly extremely fast              |
| Slow Trap       | Jak and the world around him are suddenly at a snail's pace           |
| Hero Trap       | The world gains the properties of the game's "Hero Mode" difficulty   |

## I got soft-locked and I can't leave, how do I get out of this?

Open the pause menu, navigate to `Restart/Quit`, then `Go to Hideout`, then `Yes`.
Selecting this option will put you in the alleyway outside the Underground Hideout. From there, you can make your way
back to where you were prior to getting stuck.

## I think I found a bug, where should I report it?

Depending on the nature of the bug, there are a few options:

* If you found a logical error in the randomizer, please create a new Issue
[here](https://github.com/narramoment/Archipelago/issues). Use this page if:
  * An item required for progression is unreachable.
  * The randomizer didn't respect one of the Options you chose.
  * You see a mistake (typo, incorrect information, etc.) on this page.
  * You see an error or stack trace appear in the text client.

* If you encountered an error in OpenGOAL, please create a new Issue
[here](https://github.com/narramoment/ArchipelaGOAL-II/issues). Use this page if:
  * You encounter a crash, freeze, reset, etc. in the game.
  * You fail to send Items found in game to the Archipelago server.
  * You fail to receive Items the server sends to you.
  * Your game disconnects from the server and cannot reconnect.
  * You look for an item that has disappeared before you could reach it.

* Please upload your config file, spoiler log file, an in-game/text client screenshot, and any other logs generated in
the Issue, so that we can troubleshoot the problem.