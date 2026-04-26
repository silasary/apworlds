# Crypt of the NecroDancer Archipelago - Trap Reference

## Summary

Given that there are over 70 traps included in the Crypt of the NecroDancer AP world, this document has been made to explain what each trap does, their general duration during play, and the severity of their effects on play. This is to make it evident which traps should be disabled or increased in weight based on the player's needs.

### Durations
- Instant: This trap's effects are applied once instantaneously
- X Seconds: This trap's effects persist for the time specified while in a run
- X Turns: This trap's effects persist for the turns specified while in a run. Will usually be cleared on floor transition regardless
- Floor: This trap's effects persist for the rest of the current floor and end upon completing it
- Run: This trap's effects persist for the rest of the current run. Ending or restart the run will remove the trap's effects

### Severities
- Low: This trap's effects apply a very minor hinderance to a run or are more humorous than directly harmful
- Medium: This trap's effects apply some hinderance to a run or can be slightly detrimental
- High: This trap's effects can potentially cause a run to end if the player isn't prepared for them. Possibly harmful/detrimental
- Extreme: This trap's effects will cause a run to end. Very few traps were designed with this in mind, and are disabled by default

## Table of Contents

1. [144p Trap](#144p-trap)
2. [AAA Trap](#aaa-trap)
3. [Animal Trap](#animal-trap)
4. [Armadillo Trap](#armadillo-trap)
5. [Bald Trap](#bald-trap)
6. [Beetle Trap](#beetle-trap)
7. [Bomb Trap](#bomb-trap)
8. [Bonk Trap](#bonk-trap)
9. [Burn Trap](#burn-trap)
10. [Camera Trap](#camera-trap)
11. [Chaos Trap](#chaos-trap)
12. [Commando Trap](#commando-trap)
13. [Confusion Trap](#confusion-trap)
14. [Cursed Trap](#cursed-trap)
15. [Cutscene Trap](#cutscene-trap)
16. [Dad Trap](#dad-trap)
17. [Damage Trap](#damage-trap)
18. [Dead Ringer Trap](#dead-ringer-trap)
19. [Disable Trap](#disable-trap)
20. [Disarm Trap](#disarm-trap)
21. [Double Damage Trap](#double-damage-trap)
22. [Earth Trap](#earth-trap)
23. [Exposition Trap](#exposition-trap)
24. [Fake Transition Trap](#fake-transition-trap)
25. [Fast Trap](#fast-trap)
26. [Flip Horizontal Trap](#flip-horizontal-trap)
27. [Flip Vertical Trap](#flip-vertical-trap)
28. [Frame Slime Trap](#frame-slime-trap)
29. [Freeze Trap](#freeze-trap)
30. [Gold Scatter Trap](#gold-scatter-trap)
31. [Haunted Shopkeeper Trap](#haunted-shopkeeper-trap)
32. [Help Trap](#help-trap)
33. [Hiccup Trap](#hiccup-trap)
34. [Home Trap](#home-trap)
35. [Ice Floor Trap](#ice-floor-trap)
36. [Instant Death Trap](#instant-death-trap)
37. [Invisible Trap](#invisible-trap)
38. [Isometric Trap](#isometric-trap)
39. [Jump Trap](#jump-trap)
40. [Laughter Trap](#laughter-trap)
41. [Leaping Trap](#leaping-trap)
42. [Market Crash Trap](#market-crash-trap)
43. [Meteor Trap](#meteor-trap)
44. [Monkey Trap](#monkey-trap)
45. [My Turn Trap](#my-turn-trap)
46. [No Return Trap](#no-return-trap)
47. [No Revivals Trap](#no-revivals-trap)
48. [One Hit Trap](#one-hit-trap)
49. [Paper Trap](#paper-trap)
50. [Person Trap](#person-trap)
51. [Satiated Trap](#satiated-trap)
52. [Shake Trap](#shake-trap)
53. [Shrink Trap](#shrink-trap)
54. [Skeleton Trap](#skeleton-trap)
55. [Slime Player Trap](#slime-player-trap)
56. [Slip Trap](#slip-trap)
57. [Slow Trap](#slow-trap)
58. [Spotlight Trap](#spotlight-trap)
59. [Sticky Hands Trap](#sticky-hands-trap)
60. [Stone Trap](#stone-trap)
61. [Swap Trap](#swap-trap)
62. [Tar Trap](#tar-trap)
63. [Teleport Trap](#teleport-trap)
64. [Tempo Trap](#tempo-trap)
65. [Timer Trap](#timer-trap)
66. [Transmute Trap](#transmute-trap)
67. [Tutorial Trap](#tutorial-trap)
68. [Undo Trap](#undo-trap)
69. [W I D E Trap](#w-i-d-e-trap)
70. [Zoom In Trap](#zoom-in-trap)
71. [Zoom Out Trap](#zoom-out-trap)

---

## 144p Trap

**Duration:** 20 Seconds
**Severity:** Low

If the game is windowed, changes the game's display resolution to 256×144. If the game is in fullscreen, zooms the camera significantly out and forces fixed scale mode, emulating 144p resolution on a big screen. The user's display settings are modified during this trap and will revert themselves back after the duration. Modifying settings or changing screen size will attempt to revert back to the 144p resolution/emulation during the trap's duration.

---

## AAA Trap

**Duration:** 5 Seconds
**Severity:** Low

Plays bursts of random boss sound effects from Dead Ringer, the NecroDancer, and Death Metal every beat for 5 seconds. Just serves to be slightly annoying.

---

## Animal Trap

**Duration:** Floor / Animal Health Duration
**Severity:** Medium

Possesses each player as a random animal for the rest of the floor or until the animal that's possessed dies. The eject button associated with Chaunter's possession is disabled during this time.

---

## Armadillo Trap

**Duration:** Instant
**Severity:** Medium

Spawns 2–6 armadillos in vacant tiles within a four tile radius of each player. Higher zones bias the spawn pool toward higher zone armadillo variants.

---

## Bald Trap

**Duration:** Floor
**Severity:** Low

Replaces the player's head sprite texture with a character-specific bald variant. Characters with rift (supporter) skins use matching rift-bald variants that also react to emotional states. Excluded characters: Reaper, Chaunter, Goldman. Has no effect on gameplay otherwise.

---

## Beetle Trap

**Duration:** Instant
**Severity:** Medium

Spawns 2–6 ice/fire beetles in vacant tiles within a four tile radius of each player.

---

## Bomb Trap

**Duration:** Instant
**Severity:** High

Spawns 3–10 lit bombs in vacant tiles within a 3 tile radius of each player.

---

## Bonk Trap

**Duration:** 24 Turns
**Severity:** Medium

Plays a bonk sound effect, squashes the player's sprite, and confuses the player for the duration of the trap. The squashed player effect persists for the rest of the floor even after confusion expires. Cannot be applied while the player is already confused.

---

## Burn Trap

**Duration:** 12 Turns
**Severity:** Medium

Places hot coals under the player each turn for the duration of the trap. Don't stand still!

---

## Camera Trap

**Duration:** 20 Seconds
**Severity:** Low

Rotates the camera by a random angle (0–360°) for the duration of the trap. Controls are not rotated to accommodate to the camera angle, nor are any sprites.

---

## Chaos Trap

**Duration:** Floor
**Severity:** Medium

Replaces every replaceable floor tile in the level with a random floor tile type chosen from any tile in the game.

---

## Commando Trap

**Duration:** Floor
**Severity:** High

Removes all defensive equippable items and body armors from the player's inventory and from the current floor, shops, and other storages. Bans defensive items and body armors from generating for the rest of the run.

---

## Confusion Trap

**Duration:** 24 Turns
**Severity:** High

Inflicts confusion on the player for the trap's duration. Fires only during an action queue event. Cannot be applied while the player is already confused.

---

## Cursed Trap

**Duration:** Instant
**Severity:** Medium

Curses the player's health (A.K.A. makes the player's health temporary). Can be uncursed with healing, as usual.

---

## Cutscene Trap

**Duration:** Instant
**Severity:** Low

Plays a random story cutscene. The run is paused while this cutscene plays and inputs are consumed while the it is active so the player cannot dismiss it early.
---

## Dad Trap

**Duration:** Floor
**Severity:** Medium

Spawns a DorianDad entity soul-linked to the player, like during Cadence's NecroDancer boss fight. Completing the floor with DorianDad will despawn him and should scatter his equipped items on the next floor (if there's room).

---

## Damage Trap

**Duration:** Instant
**Severity:** Low

Deals one heart of damage to the player. If the player is already at 1 HP the damage is skipped, but the player character still makes a hit sound effect.

---

## Dead Ringer Trap

**Duration:** Floor
**Severity:** High

Spawns a Dead Ringer enemy between 2 and 4 tiles away from each player. Plays the global Dead Ringer announcement audio. Given that Dead Ringer's bells don't spawn, Dead Ringer is permanently in charge mode, and will instantly kill anything he hits.

---

## Disable Trap

**Duration:** 16 Turns
**Severity:** Medium

Randomly disables one of the following actions: Move Up, Move Down, Move Left, Move Right, Bombs, Item Use, Weapon Throw, or Digging. Disabled movement keys also disable attacking in that direction. Attempting the blocked action plays an error sound and shows a "Disabled!" flyaway.

---

## Disarm Trap

**Duration:** Instant
**Severity:** Medium

Scatters all carried items from the player's inventory onto nearby floor tiles up to three tiles away. Items immune to being scattered are not scattered.

---

## Double Damage Trap

**Duration:** Floor
**Severity:** High

Doubles all incoming enemy and trap damage to the player for the rest of the floor. Self-inflicted damage is exempt. Fires at most once per floor.

---

## Earth Trap

**Duration:** Instant
**Severity:** Low

Places dirt walls around each player three tiles in each direction, walling them in. Only converts replaceable floor tiles, tiles occupied by an entity are left clear.

---

## Exposition Trap

**Duration:** 33 Seconds
**Severity:** Low

Queues and plays all 6 of Cadence's tutorial voice lines (played with subtitles if enabled).

---

## Fake Transition Trap

**Duration:** 4 Seconds
**Severity:** Low

Fades the screen to black and back (1.5s fade in, 1s hold, 1.5s fade out), mimicking a floor transition without actually loading a new level.

---

## Fast Trap

**Duration:** 32 Turns
**Severity:** High

Increases the song tempo to 125% of normal (faster than a Tempo Trap's maximum of 112.5%) for the duration. Players with an item that makes them immune to tempo changes are immune and get a "Negated" flyaway. Cannot stack.

---

## Flip Horizontal Trap

**Duration:** 20 Seconds
**Severity:** Low

Flips the camera view upside-down (top-to-bottom mirror) for 20 seconds. Gameplay inputs remain unchanged.

---

## Flip Vertical Trap

**Duration:** 20 Seconds
**Severity:** Low

Mirrors the entire camera view vertically (left-right mirror) for 20 seconds. Gameplay inputs remain unchanged.

---

## Frame Slime Trap

**Duration:** Run
**Severity:** Low

Adds 5 animated slimes randomly on the HUD, chosen from eight slime types (green, blue, orange, ice, fire, purple, black, white) for the rest of the run.

---

## Freeze Trap

**Duration:** 10 Beats
**Severity:** Medium

Freezes the player in ice for the duration. Has no effect if the player is immune to freezing.

---

## Gold Scatter Trap

**Duration:** Instant
**Severity:** Low

Steals 60–100% of the player's gold (scaling down at higher amounts) and scatters it as coin piles across the level in vacant tiles. Large amounts have a 30% chance to spawn Leprechauns instead of static coin piles.

---

## Haunted Shopkeeper Trap

**Duration:** Instant
**Severity:** Low

Spawns one Haunted Shopkeeper per player character at the level exit.

---

## Help Trap

**Duration:** Instant
**Severity:** Medium

Opens a chain of five modal dialog boxes with helpful tips about basic game mechanics. The player must click through all five before they can resume playing. The game does not pause while the modals are open, so be careful!

---

## Hiccup Trap

**Duration:** Floor
**Severity:** Medium

Every 5-10 beats forces the player to move one tile in a random cardinal direction, disabling the current action being made. Clears on floor transition.

---

## Home Trap

**Duration:** Instant
**Severity:** Low

Teleports all players back to the level's spawn. Might cause a problem if the song is nearly completed and the miniboss hasn't been beaten.

---

## Ice Floor Trap

**Duration:** 16 Beats
**Severity:** High

Temporarily replaces every changeable floor tile in the level with ice. After the duration, every tile is restored to its exact original type.

---

## Instant Death Trap

**Duration:** Instant
**Severity:** Extreme

Deals 999 damage to all players. A held potion absorbs the kill, same as a regular DeathLink event. Does not trigger a DeathLink. Disabled by default.

---

## Invisible Trap

**Duration:** Floor
**Severity:** Low

Sets all player characters to be cosmetically invisible, having no effect on enemies. Clears on floor transition.

---

## Isometric Trap

**Duration:** 20 Seconds
**Severity:** Low

Rotates the camera to one of four diagonal angles (45°, 135°, 225°, 315°) and also rotates each player's sprite to match. Creates a pseudo-isometric visual effect. Controls are not changed (for now).

---

## Jump Trap

**Duration:** 10 Beats
**Severity:** Medium

Forces the player to hop in place for the trap duration. Player inputs are overridden during this period.

---

## Laughter Trap

**Duration:** 10 Seconds
**Severity:** Low

Plays 1-3 NecroDancer laugh sounds every beat for 10 seconds.

---

## Leaping Trap

**Duration:** Floor
**Severity:** Medium

Gives the player characters untoggleable leaping movement, making each step cover two tiles. Clears on floor transition.

---

## Market Crash Trap

**Duration:** Run
**Severity:** Medium

Multiplies all shop prices by five times for the remainder of the run. Fires at most once per run.

---

## Meteor Trap

**Duration:** Instant
**Severity:** High

Flashes the screen white, plays a loud impact sound, deals 2.5 hearts of damage to the player, and scorches a three to four tile radius around them with hot coals. Also damages other killable entities in the blast radius.

---

## Monkey Trap

**Duration:** Instant
**Severity:** Medium

Spawns a random monkey entity on top of the player characters, grabbing onto them. Coda and Aria players are immune (Monkey Trap Negated). Characters with items that freeze monkey-like enemies (Monkey's Paw) are also exempt.

---

## My Turn Trap

**Duration:** 10-15 Turns
**Severity:** High

Overrides all player inputs with random actions for a random duration. The action pool includes all four movement directions plus diagonals (if available), bomb, item slots, and spells.

---

## No Return Trap

**Duration:** Floor
**Severity:** Medium

Grants the player characters the No Return Mode square if they don't already have it and the mode isn't already active. If No Return Mode is already active, the trap is negated.

---

## No Revivals Trap

**Duration:** Run
**Severity:** Medium

Removes all revival potions from the player's inventory and from the current level. Bans revival potions and other instant revive items from generating for the rest of the run.

---

## One Hit Trap

**Duration:** Floor
**Severity:** High

Reduces the player's max HP to one half-heart for the rest of the floor. The original max HP is saved and restored on floor transition (but not their health at the time).

---

## Paper Trap

**Duration:** Floor
**Severity:** Low

Squashes all characters (not just players) to near-zero width while leaving height normal, making them all paper-thin. Restores to normal on floor transition.

---

## Person Trap

**Duration:** Instant
**Severity:** Low

Spawns 2–6 copies of random playable characters as in vacant tiles within four tile radius. Each spawned person plays its greeting voice line on appearance and is idle.

---

## Satiated Trap

**Duration:** Run
**Severity:** Medium

Removes all food items from the player's inventory and from the current level. Bans food from generating for the rest of the run.

---

## Shake Trap

**Duration:** Floor
**Severity:** Low

Fires a continuous screen shake every beat for the rest of the floor. Clears on floor transition. Cannot stack.

---

## Shrink Trap

**Duration:** 12 Turns
**Severity:** Medium

Shrinks the player characters for the trap duration, making them unable to attack enemies.

---

## Skeleton Trap

**Duration:** Instant
**Severity:** Medium

Spawns 2-6 skeletons, armored skeletons, mages, skeleton knights, and skulls in vacant tiles within a four tile radius of each player. Higher zones favor tougher variants.

---

## Slime Player Trap

**Duration:** Floor
**Severity:** Low

Spawns a slime next to the player and soul-links it so the camera always focuses on both the player(s) and the slime(s). Also deals up to 1 heart of non-lethal damage upon spawning (capped to leave at least 1 HP remaining). The slime is invincible, but will not spawn in the next level.

---

## Slip Trap

**Duration:** Instant
**Severity:** Medium

Forces the player to slide in their current movement direction as though on ice, continuing until they hit a wall.

---

## Slow Trap

**Duration:** 32 Turns
**Severity:** High

Decreases the song tempo to 75% of normal (slower than a Tempo Trap's minimum of 87.5%) for the duration. Players with an item that makes them immune to tempo changes are immune and get a "Negated" flyaway. Cannot stack.

---

## Spotlight Trap

**Duration:** Floor
**Severity:** Medium

Clamps the player's tile and object vision radius to two tiles, creating a small spotlight effect. Vision is restored on floor transition.

---

## Sticky Hands Trap

**Duration:** Floor
**Severity:** Medium

Curses all item slots that the player currently has items equipped in, preventing those items from being dropped, stolen, or replaced. Only the slots the trap cursed are un-cursed on floor transition; pre-existing cursed slots (e.g. Klarinetta's innate cursed weapon) are unaffected.

---

## Stone Trap

**Duration:** 10 Beats
**Severity:** Medium

Petrifies the player for the duration. Has no effect if the player is immune to freezing.

---

## Swap Trap

**Duration:** Instant
**Severity:** Medium

Swaps the player's position with a randomly chosen non-player character on the level. Plays the teleport sound and voice line.

---

## Tar Trap

**Duration:** Floor
**Severity:** Medium

Replaces every changeable floor tile in the level with Tar. Beware the tar man.

---

## Teleport Trap

**Duration:** Instant
**Severity:** Medium

Teleports the player to a random vacant tile at least three tiles away (up to 40 tiles). Plays the teleport sound and voice line.

---

## Tempo Trap

**Duration:** 32 Beats
**Severity:** Medium

Applies a random tempo change (either 87.5% or 112.5% of normal tempo) for the trap duration, akin to a normal tempo change trap in-game. Players with an item that makes them immune to tempo changes are immune and get a "Negated" flyaway. Cannot stack.

---

## Timer Trap

**Duration:** Floor
**Severity:** High

Activates a damage countdown on the player characters: they have 16 beats before taking 1.5 hearts of damage, after which the countdown resets and repeats until the floor is cleared. If they escape the level, the countdown is removed. If a countdown is already active, a "Timer Already Active!" flyaway is shown instead.

---

## Transmute Trap

**Duration:** Instant
**Severity:** Medium

Transmutes all transmutable items in the player's inventory into random unlocked items of the same slot. Protected items are never transmuted. Only transmutes if a valid replacement target exists.

---

## Tutorial Trap

**Duration:** Instant
**Severity:** Extreme

Loads the Tutorial level immediately, ejecting the player from their current run. Shows "Tutorial time!" flyaway before loading. Disabled by default.

---

## Undo Trap

**Duration:** Instant
**Severity:** Medium

Reloads the current floor from scratch, effectively undoing all progress made since entering the floor.

---

## W I D E Trap

**Duration:** Floor
**Severity:** Low

Stretches all player sprites to four times their normal width with no change to height. The effect lasts for the remainder of the floor.

---

## Zoom In Trap

**Duration:** 20 Seconds
**Severity:** Low

Zooms the camera significantly in for the trap duration.

---

## Zoom Out Trap

**Duration:** 20 Seconds
**Severity:** Low

Zooms the camera significantly out for the trap duration.

## TrapLink Mappings

Every row maps an Archipelago item name to a `TrapHandler` ID. `Null` means the item is recognised but has no implementation and is silently dropped. Suggestions are appreciated and should be given in the [Archipelago thread for Crypt of the NecroDancer](https://discord.com/channels/731205301247803413/1192775219740422176).

| TrapLink Trap Name | TrapHandler ID |
|---|---|
| 144p Trap | `144pTrap` |
| Aaa Trap | `AaaTrap` |
| Animal Trap | `AnimalTrap` |
| Animal Bonus Trap | *(Null)* |
| Army Trap | `ArmadilloTrap` |
| Bald Trap | `BaldTrap` |
| Banana Peel Trap | `SlipTrap` |
| Banana Trap | `SlipTrap` |
| Banner Trap | *(Null)* |
| Bee Trap | *(Null)* |
| Blue Balls Curse | `InstantDeathTrap` |
| Bomb | `BombTrap` |
| Bomb Trap | `BombTrap` |
| Bonk Trap | `BonkTrap` |
| Breakout Trap | *(Null)* |
| Bubble Trap | `FreezeTrap` |
| Bullet Time Trap | `FreezeTrap` |
| Burn Trap | `BurnTrap` |
| Buyon Trap | `BeetleTrap` |
| Camera Rotate Trap | `CameraTrap` |
| Chaos Trap | `ChaosTrap` |
| Chaos Control Trap | `FreezeTrap` |
| Chart Modifier Trap | `TempoTrap` |
| Chaser Trap | `HauntedShopkeeperTrap` |
| Clear Image Trap | *(Null)* |
| Confound Trap | `ConfusionTrap` |
| Confuse Trap | `ConfusionTrap` |
| Confusion Trap | `ConfusionTrap` |
| Control Ball Trap | *(Null)* |
| Controller Drift Trap | *(Null)* |
| Cursed Ball Trap | *(Null)* |
| Cutscene Trap | `CutsceneTrap` |
| Damage Trap | `DamageTrap` |
| Deisometric Trap | `IsometricTrap` |
| Depletion Trap | `DisarmTrap` |
| Disable A Trap | `DisableTrap` |
| Disable B Trap | `DisableTrap` |
| Disable C Up Trap | `DisableTrap` |
| Disable Tag Trap | `DisableTrap` |
| Disable Z Trap | `DisableTrap` |
| Disarm Trap | `DisarmTrap` |
| Double Damage | `DoubleDamageTrap` |
| Dry Trap | `DisarmTrap` |
| Eject Ability | `DisarmTrap` |
| Electrocution Trap | *(Null)* |
| Empty Item Box Trap | `DisarmTrap` |
| Enemy Ball Trap | *(Null)* |
| Energy Drain Trap | `DisarmTrap` |
| Expensive Stocks | `CursedTrap` |
| Explosion Trap | `BombTrap` |
| Exposition Trap | `ExpositionTrap` |
| Extreme Chaos Mode | *(Null)* |
| Fake Transition | `FakeTransitionTrap` |
| Fast Trap | `FastTrap` |
| Fear Trap | *(Null)* |
| Fire Trap | `BurnTrap` |
| Fish Eye Trap | *(Null)* |
| Fishing Trap | *(Null)* |
| Fishin' Boo Trap | *(Null)* |
| Flip Horizontal Trap | `FlipHorizontalTrap` |
| Flip Trap | `FlipHorizontalTrap` |
| Flip Vertical Trap | `FlipVerticalTrap` |
| Frame Slime Trap | `FrameSlimeTrap` |
| Freeze Trap | `FreezeTrap` |
| Frog Trap | *(Null)* |
| Frost Trap | `FreezeTrap` |
| Frozen Trap | `FreezeTrap` |
| Fuzzy Trap | *(Null)* |
| Gadget Shuffle Trap | `TransmuteTrap` |
| Gas Trap | `ConfusionTrap` |
| Get Out Trap | `TimerTrap` |
| Ghost | `HauntedShopkeeperTrap` |
| Ghost Chat | *(Null)* |
| Gooey Bag | `SlimePlayerTrap` |
| Gravity Trap | `IceFloorTrap` |
| Help Trap | `HelpTrap` |
| Hey! Trap | *(Null)* |
| Hiccup Trap | `HiccupTrap` |
| Home Trap | `HomeTrap` |
| Honey Trap | `TarTrap` |
| Ice Floor Trap | `IceFloorTrap` |
| Ice Trap | `FreezeTrap` |
| Icy Hot Pants Trap | *(Null)* |
| Input Sequence Trap | *(Null)* |
| Instant Crystal Trap | *(Null)* |
| Instant Death Trap | `InstantDeathTrap` |
| Invert Colors Trap | *(Null)* |
| Inverted Mouse Trap | `ConfusionTrap` |
| Invisiball Trap | *(Null)* |
| Invisible Trap | `InvisibleTrap` |
| Invisibility Trap | `InvisibleTrap` |
| Iron Boots Trap | `SlowTrap` |
| Items to Bombs | `BombTrap` |
| Jump Trap | `JumpTrap` |
| Jumping Jacks Trap | `JumpTrap` |
| Laughter Trap | `LaughterTrap` |
| Light Up Path Trap | *(Null)* |
| Literature Trap | `ExpositionTrap` |
| Mana Drain Trap | `DisarmTrap` |
| Market Crash Trap | `MarketCrashTrap` |
| Math Quiz Trap | *(Null)* |
| Meteor Trap | `MeteorTrap` |
| Metronome Trap | `TimerTrap` |
| Mirror Trap | `FlipHorizontalTrap` |
| Monkey Mash Trap | `MonkeyTrap` |
| My Turn! Trap | `MyTurnTrap` |
| Ninja Trap | *(Null)* |
| No Guarding | `CommandoTrap` |
| No Petals | `SatiatedTrap` |
| No Revivals | `NoRevivalsTrap` |
| No Stocks | *(Null)* |
| No Vac Trap | `DisableTrap` |
| Number Sequence Trap | *(Null)* |
| Nut Trap | *(Null)* |
| OmoTrap | `HelpTrap` |
| One Hit KO | `OneHitTrap` |
| Paper Trap | `PaperTrap` |
| Paralyze Trap | *(Null)* |
| Paralysis Trap | *(Null)* |
| Person Trap | `PersonTrap` |
| Phone Trap | `HelpTrap` |
| Pie Trap | `SlipTrap` |
| Pinball Trap | *(Null)* |
| Pixelate Trap | *(Null)* |
| Pixellation Trap | *(Null)* |
| Poison Mushroom | `ShrinkTrap` |
| Poison Trap | *(Null)* |
| Pokemon Count Trap | *(Null)* |
| Pokemon Trivia Trap | *(Null)* |
| Police Trap | *(Null)* |
| PONG Challenge | *(Null)* |
| Pong Trap | *(Null)* |
| Posession Trap | *(Null)* |
| PowerPoint Trap | `SlowTrap` |
| Push Trap | `LeapingTrap` |
| Radiation Trap | *(Null)* |
| Rail Trap | `IceFloorTrap` |
| Ranch Trap | `HomeTrap` |
| Random Status Trap | *(Null)* |
| Resistance Trap | `TimerTrap` |
| Reversal Trap | `ConfusionTrap` |
| Reverse Controls Trap | `ConfusionTrap` |
| Reverse Trap | `ConfusionTrap` |
| Rockfall Trap | `EarthTrap` |
| Sandstorm Trap | `EarthTrap` |
| Screen Flip Trap | `FlipHorizontalTrap` |
| Shake Trap | `ShakeTrap` |
| Sleep Trap | *(Null)* |
| Slip Trap | `SlipTrap` |
| Slime Player Trap | `SlimePlayerTrap` |
| Slow Trap | `SlowTrap` |
| Slowness Trap | `SlowTrap` |
| Snake Trap | *(Null)* |
| Spam Trap | `MyTurnTrap` |
| Spike Ball Trap | *(Null)* |
| Spooky Time | `SkeletonTrap` |
| Spotlight Trap | `SpotlightTrap` |
| Spring Trap | *(Null)* |
| Squash Trap | `BonkTrap` |
| Sticky Floor Trap | `TarTrap` |
| Sticky Hands Trap | `StickyHandsTrap` |
| Stun Trap | `ConfusionTrap` |
| SvC Effect | *(Null)* |
| Swap Trap | `SwapTrap` |
| Tarr Trap | `TarTrap` |
| Teleport Trap | `TeleportTrap` |
| Text Trap | `HelpTrap` |
| Thwimp Trap | *(Null)* |
| Time Limit | `TimerTrap` |
| Time Warp Trap | `TimerTrap` |
| Timer Trap | `TimerTrap` |
| Tiny Trap | `ShrinkTrap` |
| Tip Trap | `HelpTrap` |
| TNT Barrel Trap | `BombTrap` |
| TNT Trap | `BombTrap` |
| Tool Swap Trap | `TransmuteTrap` |
| Trivia Trap | *(Null)* |
| Tutorial Trap | `TutorialTrap` |
| Underwater Trap | *(Null)* |
| Undo Trap | `UndoTrap` |
| UNO Challenge | *(Null)* |
| W I D E Trap | `WideTrap` |
| Whirlpool Trap | *(Null)* |
| Whoops! Trap | `DisarmTrap` |
| Zoom In Trap | `ZoomInTrap` |
| Zoom Out Trap | `ZoomOutTrap` |
| Zoom Trap | `ZoomInTrap` |
