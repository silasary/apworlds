# Jak 3 (ArchipelaGOAL 3)

## What does randomization do?

The game currently contains the following Location Checks:
- All 60 Main Missions
- All 50 Side Missions 

These may contain items for different games, as well as items within Jak 3.
In addition, the rewards that you get from the main missions are scattered across the multiworld!

## What are the Special Items? What do they unlock (if applicable)?

### Morph Gun
- Scatter Gun
- Wave Concussor
- Plasmite RPG
- Blaster
- Beam Reflexor
- Gyro Buster
- Vulcan Fury
- Arc Wielder
- Needle Lazer
- Peacemaker
- Mass Inverter
- Super Nova

### Movement Upgrades
- JET-Board

### Vehicles
- Tough Puppy
- Sand Shark
- Gila Stomper
- Dune Hopper
- Slam Dozer
- Heat Seeker
- Desert Screamer
- Dust Demon

### Dark Jak (+ Abilities)
- Dark Jak
- Dark Bomb
- Dark Blast
- Dark Invisibility
- Dark Strike

### Light Jak (+ Abilities)
- Light Jak
- Light Regeneration
- Light Flash
- Light Shield
- Light Flight

### Security Passes

| Item Name                    | What it Unlocks                                                                               |
|------------------------------|-----------------------------------------------------------------------------------------------|
| Gate Pass To Spargus         | The Desert                                                                                    |
| Pass To Metal Head Section   | Makes the Metal Head City Section Breakable (Need Dark Jak and Dark Strike to fully break it) |
| Pass To Industrial Section A | First Part of the Industrial Section                                                          |
| Pass To Industrial Section B | Second Part of the Industrial Section                                                         |
| Pass To Slums/New Haven      | The Slums/New Haven Sections                                                                  |
| Pass To Outside Palace Runis | The Outside of Palace Ruins                                                                   |
| Air Train Pass               | Use of the Air Train                                                                          |

### Armor
- Braces Armor
- Leg Armor
- Should Armor
- Chest Armor

### All Eco Crystals
- Light Eco Crystal 1
- Light Eco Crystal 2
- Light Eco Crystal 3
- Light Eco Crystal 4
- Dark Eco Crystal 1
- Dark Eco Crystal 2
- Dark Eco Crystal 3
- Dark Eco Crystal 4

### Story Related Items
- Seal of Mar
- Holo Cube
- Beam Generator
- Prism
- Quantum Reflector
- Time Map
- Cypher Glyph
- Gun Turret
- War Amulet Piece 1
- War Amulet Piece 2
- War Amulet Piece 3

## How do I know what Special Items I have?

Use the built-in Inventory Screen in the Pause Menu to see what items you have.

## What is the goal of the game once randomized?

Currently, the default goal is to Defeat the Final Boss by going through Palace Ruins, So you'll need every Pass to get there as well as the following
- All Eco Crystals (Dark and Light) and all War Amulet Pieces
- Both the Sand Shark and Slam Dozer
- JetBoard
- Dark Jak with Dark Strike and Light Jak with Light Flight

In addition, you may also choose to complete a given number of missions of your choosing. Five missions at minimum, and
110 at max!

## What happens when I complete a mission, main or side?

When you complete a mission in game, two things will occur. Firstly, the task will be marked as completed in the game's 
mission list, and your Jak 3 client will tell you what item you sent out or received.
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

Open the pause menu, navigate to `Restart/Quit`, then `Go to Spargus`, then `Yes`.
Selecting this option will put you back into Spargus. From there, you can make your way
back to where you were prior to getting stuck.

## I think I found a bug, where should I report it?

Depending on the nature of the bug, there are a few options:

* If you found a logical error in the randomizer, please create a new Issue
[here](https://github.com/Blake645/Archipelago/issues). Use this page if:
  * An item required for progression is unreachable.
  * The randomizer didn't respect one of the Options you chose.
  * You see a mistake (typo, incorrect information, etc.) on this page.
  * You see an error or stack trace appear in the text client.

* If you encountered an error in OpenGOAL, please create a new Issue
[here](https://github.com/Blake645/ArchipelaGOAL-3/issues). Use this page if:
  * You encounter a crash, freeze, reset, etc. in the game.
  * You fail to send Items found in game to the Archipelago server.
  * You fail to receive Items the server sends to you.
  * Your game disconnects from the server and cannot reconnect.
  * You look for an item that has disappeared before you could reach it.

* Please upload your config file, spoiler log file, an in-game/text client screenshot, and any other logs generated in
the Issue, so that we can troubleshoot the problem.