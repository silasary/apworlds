# Crypt of the NecroDancer Archipelago - Trap Reference

## Summary

This document explains what each trap does, its general duration during play, and the severity of its effects. Traps come in two tiers:

- **Item Pool Traps** can appear as items in the multiworld. Their frequency is controlled per trap by the `trap_weights` option (weight 0 removes a trap from the pool and blocks it from incoming TrapLink traps).
- **TrapLink-Only Traps** never appear as items. They only trigger when another player's linked trap maps to them (see [TrapLink Mappings](#traplink-mappings)), and can be blocked with the `traplink_excluded_traps` option.

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

### Item Pool Traps

1. [Animal Trap](#animal-trap)
2. [Bald Trap](#bald-trap)
3. [Bomb Trap](#bomb-trap)
4. [Camera Trap](#camera-trap)
5. [Chaos Trap](#chaos-trap)
6. [Confusion Trap](#confusion-trap)
7. [Cursed Trap](#cursed-trap)
8. [Cutscene Trap](#cutscene-trap)
9. [Dad Trap](#dad-trap)
10. [Damage Trap](#damage-trap)
11. [Dead Ringer Trap](#dead-ringer-trap)
12. [Disarm Trap](#disarm-trap)
13. [Double Damage Trap](#double-damage-trap)
14. [Earth Trap](#earth-trap)
15. [Freeze Trap](#freeze-trap)
16. [Gold Scatter Trap](#gold-scatter-trap)
17. [Haunted Shopkeeper Trap](#haunted-shopkeeper-trap)
18. [Hot Coals Trap](#hot-coals-trap)
19. [Ice Floor Trap](#ice-floor-trap)
20. [Isometric Trap](#isometric-trap)
21. [Leaping Trap](#leaping-trap)
22. [Market Crash Trap](#market-crash-trap)
23. [Monkey Trap](#monkey-trap)
24. [No Return Trap](#no-return-trap)
25. [One Hit Trap](#one-hit-trap)
26. [Shake Trap](#shake-trap)
27. [Shrink Trap](#shrink-trap)
28. [Spotlight Trap](#spotlight-trap)
29. [Summon Trap](#summon-trap)
30. [Swap Trap](#swap-trap)
31. [Tar Trap](#tar-trap)
32. [Teleport Trap](#teleport-trap)
33. [Tempo Trap](#tempo-trap)
34. [Timer Trap](#timer-trap)
35. [Transmute Trap](#transmute-trap)
36. [Undo Trap](#undo-trap)

### TrapLink-Only Traps

1. [144p Trap](#144p-trap)
2. [AAA Trap](#aaa-trap)
3. [Bonk Trap](#bonk-trap)
4. [Commando Trap](#commando-trap)
5. [Disable Trap](#disable-trap)
6. [Exposition Trap](#exposition-trap)
7. [Fake Transition Trap](#fake-transition-trap)
8. [Frame Slime Trap](#frame-slime-trap)
9. [Help Trap](#help-trap)
10. [Hiccup Trap](#hiccup-trap)
11. [Home Trap](#home-trap)
12. [Instant Death Trap](#instant-death-trap)
13. [Invisible Trap](#invisible-trap)
14. [Jump Trap](#jump-trap)
15. [Laughter Trap](#laughter-trap)
16. [Meteor Trap](#meteor-trap)
17. [My Turn Trap](#my-turn-trap)
18. [No Revivals Trap](#no-revivals-trap)
19. [Paper Trap](#paper-trap)
20. [Satiated Trap](#satiated-trap)
21. [Slime Player Trap](#slime-player-trap)
22. [Slip Trap](#slip-trap)
23. [Sticky Hands Trap](#sticky-hands-trap)
24. [Tutorial Trap](#tutorial-trap)
25. [W I D E Trap](#w-i-d-e-trap)

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

## Bald Trap

**Duration:** Floor
**Severity:** Low

Replaces the player's head sprite texture with a character-specific bald variant. Characters with rift (supporter) skins use matching rift-bald variants that also react to emotional states. Excluded characters: Reaper, Chaunter, Goldman. Has no effect on gameplay otherwise.

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

## Camera Trap

**Duration:** 20 Seconds
**Severity:** Low

Applies one of five camera effects: Rotate (random 0–360° angle), Flip Horizontal (top-to-bottom mirror), Flip Vertical (left-to-right mirror), Zoom In, or Zoom Out. The variant is chosen at random unless a specific one is forced by an incoming TrapLink trap. Gameplay inputs and sprites are unchanged.

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
**Severity:** Medium

Deals one heart of damage to the player. This damage can kill; deaths are attributed to the Damage Trap on the death screen.

---

## Dead Ringer Trap

**Duration:** Floor
**Severity:** High

Spawns a Dead Ringer enemy between 2 and 4 tiles away from each player. Plays the global Dead Ringer announcement audio. Given that Dead Ringer's bells don't spawn, Dead Ringer is permanently in charge mode, and will instantly kill anything he hits.

---

## Disable Trap

**Duration:** 16 Turns
**Severity:** Medium

Randomly disables one of the following actions: Move Up, Move Down, Move Left, Move Right, Bombs, Item Use, Weapon Throw, or Digging. Disabled movement keys also disable attacking in that direction. Attempting the blocked action plays an error sound, and a pulsing indicator naming the disabled action is shown above the player while active.

---

## Disarm Trap

**Duration:** Instant
**Severity:** Medium

Scatters all carried items from the player's inventory onto nearby floor tiles up to three tiles away. Items immune to being scattered are not scattered.

---

## Double Damage Trap

**Duration:** Floor
**Severity:** High

Doubles all incoming enemy and trap damage to the player for the rest of the floor. Self-inflicted damage is exempt. Fires at most once per floor. A pulsing "x2 DMG" indicator is shown above the player while active.

---

## Earth Trap

**Duration:** Instant
**Severity:** Low

Encases each player in a ring of dirt walls two tiles out, then splatters scattered dirt walls across the surrounding area (up to five tiles away). Only converts replaceable floor tiles; tiles occupied by a player are left clear.

---

## Exposition Trap

**Duration:** ~45 Seconds
**Severity:** Low

Queues and plays all 6 of Cadence's tutorial voice lines back-to-back (with subtitles if enabled). Lines play on a real-time schedule, so standing still doesn't pause the monologue.

---

## Fake Transition Trap

**Duration:** 4 Seconds
**Severity:** Low

Fades the screen to black and back (1.5s fade in, 1s hold, 1.5s fade out), mimicking a floor transition without actually loading a new level.

---

## Frame Slime Trap

**Duration:** Run
**Severity:** Low

Adds 5 animated slimes randomly on the HUD, chosen from eight slime types (green, blue, orange, ice, fire, purple, black, white) for the rest of the run.

---

## Freeze Trap

**Duration:** 10 Beats
**Severity:** Medium

Freezes the player for the duration, as either Ice or Stone (petrification) — mechanically identical stuns with different flavor. The variant is chosen at random unless forced by an incoming TrapLink trap. Has no effect if the player is immune to freezing.

---

## Gold Scatter Trap

**Duration:** Instant
**Severity:** Low

Steals 60–100% of the player's gold (scaling down at higher amounts) and scatters it as coin piles across the level in vacant tiles. One Leprechaun spawns per 100 gold scattered (up to three), always taking the largest piles.

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

Every 5-10 beats forces the player to move one tile in a random cardinal direction, disabling the current action being made. Clears on floor transition. A pulsing "Hiccups!" indicator is shown above the player while active.

---

## Home Trap

**Duration:** Instant
**Severity:** Low

Teleports all players back to the level's spawn. Might cause a problem if the song is nearly completed and the miniboss hasn't been beaten.

---

## Hot Coals Trap

**Duration:** 12 Turns
**Severity:** Medium

Places hot coals under the player each turn for the duration of the trap. Don't stand still!

---

## Ice Floor Trap

**Duration:** 16 Beats
**Severity:** High

Temporarily replaces every changeable floor tile in the level with ice. After the duration, every tile is restored to its exact original type.

---

## Instant Death Trap

**Duration:** Instant
**Severity:** Extreme

Deals 999 damage to all players. A held potion absorbs the kill, same as a regular DeathLink event. Does not trigger a DeathLink. Blocked by default via the `traplink_excluded_traps` option.

---

## Invisible Trap

**Duration:** Floor
**Severity:** Low

Sets all player characters to be cosmetically invisible, having no effect on enemies. Clears on floor transition.

---

## Isometric Trap

**Duration:** 20 Seconds
**Severity:** Low

Rotates the camera to one of four diagonal angles (45°, 135°, 225°, 315°) and also rotates each player's sprite to match, creating a pseudo-isometric visual effect. Movement inputs are rotated to match the view — pressing a direction moves toward that screen direction, which is a diagonal on the world grid.

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

Closes all shops for the remainder of the run: every item for sale is removed and its floor tile is replaced with an "Out of Stock" tile, on the current floor and every floor after. AP shop slots are unaffected. Fires at most once per run.

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

Overrides all player inputs with random actions for a random duration. The action pool includes all four movement directions plus diagonals (if available), bomb, item slots, and spells. A pulsing "My Turn!" indicator is shown above the player while active.

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

Reduces the player's max HP to one half-heart for the rest of the floor. The original max HP is saved and restored on floor transition (but not their health at the time). A pulsing "One Hit!" indicator is shown above the player while active.

---

## Paper Trap

**Duration:** Floor
**Severity:** Low

Squashes all characters (not just players) to near-zero width while leaving height normal, making them all paper-thin. Restores to normal on floor transition.

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

## Spotlight Trap

**Duration:** Floor
**Severity:** Medium

Clamps the player's tile and object vision radius to two tiles, creating a small spotlight effect. Vision is restored on floor transition.

---

## Sticky Hands Trap

**Duration:** Floor
**Severity:** Medium

Curses all item slots that the player currently has items equipped in, preventing those items from being dropped, stolen, or replaced. Only the slots the trap cursed are un-cursed on floor transition; pre-existing cursed slots (e.g. Klarinetta's innate cursed weapon) are unaffected. A pulsing "Sticky Hands!" indicator is shown above the player while active.

---

## Summon Trap

**Duration:** Instant
**Severity:** Medium

Spawns 2–6 entities from a randomly chosen summon group in vacant tiles within a four tile radius of each player. Current groups: Skeletons (skeletons, armored skeletons, mages, knights, and skulls; higher zones favor tougher variants), Armadillos (higher zones bias toward higher-zone variants), ice/fire Beetles, and — rarely — friendly Persons (idle playable characters that greet you). Incoming TrapLink traps can target a specific group (e.g. Buyon Trap always summons beetles).

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

Applies a tempo change for the trap duration, akin to a normal tempo change trap in-game. Rolls a random 87.5% or 112.5% of normal tempo, unless an incoming TrapLink trap forces the harsher Fast (125%) or Slow (75%) variant. Players with an item that makes them immune to tempo changes are immune and get a "Negated" flyaway. All tempo effects share one active slot and cannot stack.

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

Loads the Tutorial level immediately, ejecting the player from their current run. Shows "Tutorial time!" flyaway before loading. Blocked by default via the `traplink_excluded_traps` option.

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

## TrapLink Mappings

Every row maps an Archipelago item name to a `TrapHandler` ID, optionally with handler-specific arguments (e.g. a forced Summon Trap variant). `Null` means the item is recognised but has no implementation and is silently dropped. Suggestions are appreciated and should be given in the [Archipelago thread for Crypt of the NecroDancer](https://discord.com/channels/731205301247803413/1192775219740422176).

| TrapLink Trap Name | TrapHandler ID |
|---|---|
| 144p Trap | `144pTrap` |
| Aaa Trap | `AaaTrap` |
| Animal Trap | `AnimalTrap` |
| Animal Bonus Trap | *(Null)* |
| Army Trap | `SummonTrap` (Armadillo variant) |
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
| Bubble Trap | `FreezeTrap` (Ice variant) |
| Bullet Time Trap | `FreezeTrap` (Ice variant) |
| Burn Trap | `BurnTrap` |
| Buyon Trap | `SummonTrap` (Beetle variant) |
| Camera Rotate Trap | `CameraTrap` (Rotate variant) |
| Camera Trap | `CameraTrap` |
| Chaos Trap | `ChaosTrap` |
| Chaos Control Trap | `FreezeTrap` (Ice variant) |
| Chart Modifier Trap | `TempoTrap` |
| Chaser Trap | `HauntedShopkeeperTrap` |
| Clear Image Trap | *(Null)* |
| Confound Trap | `ConfusionTrap` |
| Confuse Trap | `ConfusionTrap` |
| Confusion Trap | `ConfusionTrap` |
| Control Ball Trap | *(Null)* |
| Controller Drift Trap | *(Null)* |
| Cursed Ball Trap | *(Null)* |
| Cursed Trap | `CursedTrap` |
| Cutscene Trap | `CutsceneTrap` |
| Dad Trap | `DadTrap` |
| Damage Trap | `DamageTrap` |
| Dead Ringer Trap | `DeadRingerTrap` |
| Deisometric Trap | `IsometricTrap` |
| Depletion Trap | `DisarmTrap` |
| Disable A Trap | `DisableTrap` |
| Disable B Trap | `DisableTrap` |
| Disable C Up Trap | `DisableTrap` |
| Disable Tag Trap | `DisableTrap` |
| Disable Z Trap | `DisableTrap` |
| Disarm Trap | `DisarmTrap` |
| Double Damage | `DoubleDamageTrap` |
| Double Damage Trap | `DoubleDamageTrap` |
| Dry Trap | `DisarmTrap` |
| Earth Trap | `EarthTrap` |
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
| Fast Trap | `TempoTrap` (Fast variant) |
| Fear Trap | *(Null)* |
| Fire Trap | `BurnTrap` |
| Fish Eye Trap | *(Null)* |
| Fishing Trap | *(Null)* |
| Fishin' Boo Trap | *(Null)* |
| Flip Horizontal Trap | `CameraTrap` (FlipHorizontal variant) |
| Flip Trap | `CameraTrap` (FlipHorizontal variant) |
| Flip Vertical Trap | `CameraTrap` (FlipVertical variant) |
| Frame Slime Trap | `FrameSlimeTrap` |
| Freeze Trap | `FreezeTrap` (Ice variant) |
| Frog Trap | *(Null)* |
| Frost Trap | `FreezeTrap` (Ice variant) |
| Frozen Trap | `FreezeTrap` (Ice variant) |
| Fuzzy Trap | *(Null)* |
| Gadget Shuffle Trap | `TransmuteTrap` |
| Gas Trap | `ConfusionTrap` |
| Get Out Trap | `TimerTrap` |
| Ghost | `HauntedShopkeeperTrap` |
| Ghost Chat | *(Null)* |
| Gold Scatter Trap | `GoldScatterTrap` |
| Gooey Bag | `SlimePlayerTrap` |
| Gravity Trap | `IceFloorTrap` |
| Haunted Shopkeeper Trap | `HauntedShopkeeperTrap` |
| Help Trap | `HelpTrap` |
| Hey! Trap | *(Null)* |
| Hiccup Trap | `HiccupTrap` |
| Home Trap | `HomeTrap` |
| Honey Trap | `TarTrap` |
| Hot Coals Trap | `BurnTrap` |
| Ice Floor Trap | `IceFloorTrap` |
| Ice Trap | `FreezeTrap` (Ice variant) |
| Icy Hot Pants Trap | *(Null)* |
| Input Sequence Trap | *(Null)* |
| Instant Crystal Trap | *(Null)* |
| Instant Death Trap | `InstantDeathTrap` |
| Invert Colors Trap | *(Null)* |
| Inverted Mouse Trap | `ConfusionTrap` |
| Invisiball Trap | *(Null)* |
| Invisible Trap | `InvisibleTrap` |
| Invisibility Trap | `InvisibleTrap` |
| Iron Boots Trap | `TempoTrap` (Slow variant) |
| Isometric Trap | `IsometricTrap` |
| Items to Bombs | `BombTrap` |
| Jump Trap | `JumpTrap` |
| Jumping Jacks Trap | `JumpTrap` |
| Laughter Trap | `LaughterTrap` |
| Leaping Trap | `LeapingTrap` |
| Light Up Path Trap | *(Null)* |
| Literature Trap | `ExpositionTrap` |
| Mana Drain Trap | `DisarmTrap` |
| Market Crash Trap | `MarketCrashTrap` |
| Math Quiz Trap | *(Null)* |
| Meteor Trap | `MeteorTrap` |
| Metronome Trap | `TimerTrap` |
| Mirror Trap | `CameraTrap` (FlipHorizontal variant) |
| Monkey Mash Trap | `MonkeyTrap` |
| Monkey Trap | `MonkeyTrap` |
| My Turn! Trap | `MyTurnTrap` |
| Ninja Trap | *(Null)* |
| No Guarding | `CommandoTrap` |
| No Petals | `SatiatedTrap` |
| No Return Trap | `NoReturnTrap` |
| No Revivals | `NoRevivalsTrap` |
| No Stocks | *(Null)* |
| No Vac Trap | `DisableTrap` |
| Number Sequence Trap | *(Null)* |
| Nut Trap | *(Null)* |
| OmoTrap | `HelpTrap` |
| One Hit KO | `OneHitTrap` |
| One Hit Trap | `OneHitTrap` |
| Paper Trap | `PaperTrap` |
| Paralyze Trap | *(Null)* |
| Paralysis Trap | *(Null)* |
| Person Trap | `SummonTrap` (Person variant) |
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
| PowerPoint Trap | `TempoTrap` (Slow variant) |
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
| Screen Flip Trap | `CameraTrap` (FlipHorizontal variant) |
| Shake Trap | `ShakeTrap` |
| Shrink Trap | `ShrinkTrap` |
| Sleep Trap | *(Null)* |
| Slip Trap | `SlipTrap` |
| Slime Player Trap | `SlimePlayerTrap` |
| Slow Trap | `TempoTrap` (Slow variant) |
| Slowness Trap | `TempoTrap` (Slow variant) |
| Snake Trap | *(Null)* |
| Spam Trap | `MyTurnTrap` |
| Spike Ball Trap | *(Null)* |
| Spooky Time | `SummonTrap` (Skeleton variant) |
| Spotlight Trap | `SpotlightTrap` |
| Spring Trap | *(Null)* |
| Squash Trap | `BonkTrap` |
| Sticky Floor Trap | `TarTrap` |
| Sticky Hands Trap | `StickyHandsTrap` |
| Stone Trap | `FreezeTrap` (Stone variant) |
| Stun Trap | `ConfusionTrap` |
| Summon Trap | `SummonTrap` |
| SvC Effect | *(Null)* |
| Swap Trap | `SwapTrap` |
| Tar Trap | `TarTrap` |
| Tarr Trap | `TarTrap` |
| Teleport Trap | `TeleportTrap` |
| Tempo Trap | `TempoTrap` |
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
| Transmute Trap | `TransmuteTrap` |
| Trivia Trap | *(Null)* |
| Tutorial Trap | `TutorialTrap` |
| Underwater Trap | *(Null)* |
| Undo Trap | `UndoTrap` |
| UNO Challenge | *(Null)* |
| Vintage Trap | *(Null)* |
| W I D E Trap | `WideTrap` |
| Weather Cloudy Trap | *(Null)* |
| Weather Rainy Trap | *(Null)* |
| Weather Stormy Trap | *(Null)* |
| Weather Sunny Trap | *(Null)* |
| Well Done Trap | *(Null)* |
| Whirlpool Trap | *(Null)* |
| Whoops! Trap | `DisarmTrap` |
| Zoom In Trap | `CameraTrap` (ZoomIn variant) |
| Zoom Out Trap | `CameraTrap` (ZoomOut variant) |
| Zoom Trap | `CameraTrap` (ZoomIn variant) |
