# Mega Man 7

## Where is the options page?

The [player options page for this game](../player-options) contains all the options needed to configure and export a YAML file.

## What does randomization do to this game?

Mega Man 7 randomizes the following into the multiworld:

* Robot Master rewards
* Robot Master Access Codes, when enabled
* Rush items
* Rush Plates
* Proto Man clues and the Proto Shield location
* Selected stage pickups and shop upgrades
* Freestanding stage pickups, when Pickupsanity is enabled
* Wily Access Codes, including the Boss Rush Access Code in Split layout
* Wily boss rewards
* Robot Master rematch checks in Split Boss Rush
* Consumable items

The game is completed by defeating Wily Capsule.

## How do Robot Master Access Codes work?

All eight Robot Master stages are visible on the stage-select screen from the beginning.

By default, all eight stages can be entered immediately. When Robot Master Access Codes are enabled, each Robot Master stage instead requires its corresponding Access Code before it can be entered.

One random Robot Master Access Code is granted at the beginning of the game, and the remaining Access Codes are added to the item pool.

Defeating a Robot Master records the boss as defeated and sends the corresponding randomized reward location. The vanilla weapon is not awarded directly. Robot Master weapons are instead received through Archipelago.

When Boss Weakness Logic is enabled, the generated logic expects the player to possess an accepted weakness before defeating each boss.

When both Robot Master Access Codes and Boss Weakness Logic are enabled, the starting Robot Master is also paired with an appropriate starting weakness so that at least one stage can be completed.

Exit Unit options may provide an alternate way to collect a stage check and leave without defeating the boss.

## How does Pickupsanity work?

When Pickupsanity is enabled, 72 freestanding pickups found throughout the Robot Master and Wily stages become Archipelago location checks.

Pickupsanity includes stage-placed:

* Health Energy
* Weapon Energy
* Bolts
* 1-Ups
* E-Tanks
* W-Tanks
* S-Tanks

Enemy drops are not included. Only fixed pickups that are part of the stage layout are randomized.

Each pickup placement can only be checked once. Some Mega Man 7 pickups normally respawn after leaving the area or re-entering the stage. After a Pickupsanity location has already been checked, later collections of that same placement behave as normal vanilla pickups and do not send another Archipelago check.

Robot Master stage pickups follow the same stage-access rules as the rest of the game. When Robot Master Access Codes are enabled, pickups inside a locked stage cannot be reached until its Access Code has been received.

The generated logic also considers whether the player can safely leave the stage after collecting a pickup. Normally this means being able to complete the stage. If Exit Unit in Uncleared Stages is enabled, a valid Exit Unit route may instead allow the player to collect a pickup and leave without defeating the boss.

Pickup-specific movement or weapon requirements are also respected. For example, some pickups may require Rush Coil, Rush Jet, Freeze Cracker, Thunder Bolt, or another specific method of reaching them.

Pickupsanity includes pickups in Wily 1, Wily 2, Wily 3, and the original Wily 4 area. In Split layout, the Wily 4 pickups are encountered in the Boss Rush portion rather than the Final Wily Stage. Wily-stage pickups require access to their corresponding stage.

Wily 5 pickups are not included because they appear immediately before the final goal and would add little meaningful progression.

## How does checkpoint selection work?

Checkpoint Selection allows previously cleared Robot Master stages to be entered from one of three positions:

* Stage entrance
* Midpoint
* Pre-boss checkpoint

Select a Robot Master stage on the stage-select screen and use **L and R** to cycle between the available checkpoints. The number displayed on the selected portrait indicates the currently selected checkpoint.

Checkpoint selection can optionally be enabled for uncleared stages.

When Robot Master Access Codes are enabled, checkpoints cannot be selected for a stage until its corresponding Access Code has been received.

Checkpoint selection only applies to Robot Master stages and does not affect Wily stages.

## How does Robot Museum work?

Robot Museum becomes available after defeating the configured number of Robot Masters. The default requirement is four.

When Skip Robot Museum is disabled, the player enters Robot Museum and must defeat Mash normally.

When Skip Robot Museum is enabled, Robot Museum is bypassed and the Mash location is checked automatically once the configured Robot Master requirement is reached.

When Boss Weakness Logic is enabled, Mash requires Danger Wrap unless Robot Museum is skipped.

## How do the Wily stages work?

Wily 1, Wily 2, and Wily 3 each have an independent Wily Access Code.

After receiving an Access Code, its corresponding Wily stage becomes selectable from the Wily box on the stage-select screen. Available Wily stages can be cycled with **L and R**.

Wily 1, Wily 2, and Wily 3 can be completed in any order.

Previously cleared Wily stages remain selectable. This is especially useful when Pickupsanity is enabled and a stage still contains unchecked pickups.

The Boss Rush and Final Wily Stage can be configured using one of three layouts:

* **Vanilla:** Boss Rush, Wily Machine, and Wily Capsule remain one continuous final stage, similar to the original game.

* **Split:** Boss Rush and Final Wily Stage become separate selectable stages. Boss Rush requires its own Boss Rush Access Code. Completing all eight Robot Master rematches returns the player to stage select. The Final Wily Stage begins immediately before Wily Machine and Wily Capsule.

* **Skip:** Boss Rush is skipped. The Final Wily Stage begins immediately before Wily Machine and Wily Capsule.

In Split layout, Boss Rush contains eight additional Archipelago locations, one for each Robot Master rematch.

Boss Rush progress is preserved when leaving the Split Boss Rush. The Exit Unit can also be used freely from the Split Boss Rush, allowing the player to leave without clearing it.

Access to the Final Wily Stage is configurable. It can require:

* A selected number of cleared Wily stages
* A selected number of defeated Robot Masters
* A selected number of received Robot Master weapons
* Defeating Proto Man

When the requirement is based on cleared Wily stages, Wily 1, Wily 2, and Wily 3 each count as one cleared stage. In Split layout, completing Boss Rush can count as a fourth cleared Wily stage.

When Boss Weakness Logic is enabled, the Wily bosses, Boss Rush rematches where applicable, and Wily Capsule require their configured weaknesses.

## What Mega Man 7 items can appear in other players' worlds?

* Freeze Cracker

* Danger Wrap

* Thunder Bolt

* Junk Shield

* Slash Claw

* Wild Coil

* Noise Crush

* Scorch Wheel

* Robot Master Access Codes, when enabled

* Rush Coil

* Rush Search

* Rush Jet

* Rush Plates

* Proto Man clues

* Proto Shield

* Hyper Bolt

* Exit Unit

* Hyper Rocket Buster

* Energy Balancer

* Beat

* Wily 1, Wily 2, and Wily 3 Access Codes

* Boss Rush Access Code, when using the Split Boss Rush / Final Stage layout

* 1-Ups

* E-Tanks

* W-Tanks

* S-Tanks

The Super Adaptor is not a randomized item. It is granted after receiving all four Rush Plates.

## What is considered a location check in Mega Man 7?

* Robot Master weapon rewards

* Proto Man meetings

* Proto Shield

* Rush item pickups

* Rush Plate pickups

* Hyper Bolt

* Exit Unit

* Hyper Rocket Buster

* Energy Balancer

* Beat rescue

* Mega Bolts

* Mega Health Capsule

* Intro Stage clear

* Mash / Robot Museum clear

* Wily 1, Wily 2, and Wily 3 boss rewards

* Eight Robot Master rematch locations in the Split Boss Rush

* 72 freestanding stage pickups when Pickupsanity is enabled

Some items can be obtained either from an in-stage pickup or by purchasing them in Auto's shop. Both methods point to the same Archipelago location, so each location can only be checked once.

Pickupsanity locations are also one-time Archipelago checks. If the same stage pickup respawns after it has already been checked, collecting it again does not create another check.

## When the player receives an item, what happens?

The effect of the item is applied immediately in-game.

Weapons and Rush items become usable as soon as they are received.

Robot Master Access Codes immediately unlock their corresponding stage when the option is enabled.

Rush Plates are tracked independently. Receiving all four Rush Plates grants the Super Adaptor.

Consumables such as 1-Ups and tanks are added to the player's inventory.

Wily 1, Wily 2, and Wily 3 Access Codes unlock their corresponding Wily stages.

When using the Split Boss Rush / Final Stage layout, the Boss Rush Access Code unlocks the separate Boss Rush stage.


## What options are available?

### Boss Rush / Final Stage Layout

This option controls how the original game's final Wily stage is divided.

**Vanilla**

Boss Rush, Wily Machine, and Wily Capsule remain one continuous stage. After completing the Robot Master rematches, the player continues directly to the final bosses.

**Split**

Boss Rush and Final Wily Stage become independent selectable stages.

Boss Rush requires the Boss Rush Access Code and contains eight additional Archipelago checks, one for each Robot Master rematch.

After all rematches are completed, the player returns to stage select instead of continuing directly to Wily Machine.

The Final Wily Stage starts immediately before Wily Machine and Wily Capsule and is unlocked according to the configured Final Wily Stage Requirement.

**Skip**

Boss Rush is omitted. Once the Final Wily Stage Requirement is met, the Final Wily Stage begins immediately before Wily Machine and Wily Capsule.

### Final Wily Stage Requirement

The Final Wily Stage can be configured to require:

* Cleared Wily stages

* Defeated Robot Masters

* Received Robot Master weapons

* Defeating Proto Man

The required count is configurable for the Wily stage, Robot Master, and weapon requirement types. The Proto Man requirement is satisfied by completing the Proto Man fight associated with the Proto Shield location.

When using cleared Wily stages:

* Wily 1, Wily 2, and Wily 3 can each contribute one cleared stage.

* In Split layout, completing Boss Rush can contribute a fourth cleared stage.

* In Vanilla and Skip layouts, only Wily 1 through Wily 3 count toward this requirement.

### Robot Master Access Codes

When enabled, each Robot Master stage requires its corresponding Access Code before it can be entered.

One random Access Code is granted at the beginning of the game, and the remaining seven are added to the item pool.

When disabled, all eight Robot Master stages can be entered from the beginning.

### Boss Weakness Logic

When enabled, the generated logic expects the player to have an accepted weakness before defeating bosses.

When used together with Robot Master Access Codes, the starting Robot Master is given an appropriate starting weakness.

### Pickupsanity

When enabled, 72 freestanding stage pickups become additional Archipelago locations.

These locations include fixed Health Energy, Weapon Energy, Bolt, 1-Up, and Tank pickups throughout the eight Robot Master stages and Wily 1 through Wily 4.

Enemy drops are not randomized.

Each fixed pickup placement can only send its Archipelago check once. If that pickup later respawns, subsequent collections behave normally and do not send additional checks.

The logic accounts for both the requirements needed to physically reach a pickup and the ability to leave the stage afterward.

Robot Master Access Codes, Boss Weakness Logic, Exit Unit in Uncleared Stages, and relevant movement or weapon requirements can therefore affect when a Pickupsanity location is considered reachable.

### Checkpoint Selection

When enabled, L and R can be used on the stage-select screen to choose between the entrance, midpoint, and pre-boss checkpoints of eligible Robot Master stages.

By default, checkpoint selection is only available after the stage has been cleared.

Checkpoint Selection in Uncleared Stages allows the selector to also be used before defeating the Robot Master.

When Robot Master Access Codes are enabled, a locked stage cannot use checkpoint selection until its Access Code has been received.

### Starting Resources

The following starting resources are configurable:

* Lives
* Bolts
* E-Tanks
* W-Tanks
* S-Tanks

### Exit Unit Options

Exit Unit can optionally be used in stages that have not already been cleared.

This option is especially relevant to Pickupsanity. When Exit Unit in Uncleared Stages is enabled, generated logic may allow the player to enter a stage, collect an available pickup or other check, and leave without defeating the boss.

Paid Exit Unit allows the player to use Exit Unit before receiving the actual item by spending the configured number of bolts.

Paid Exit Unit in Logic allows generated logic to consider that paid use as a valid method of leaving a stage.

### Skip Intro Stage

When enabled, the Intro Stage is skipped and its corresponding Archipelago location is checked automatically.

### Robot Museum Options

The number of Robot Masters required to access Robot Museum can be configured from one to eight.

When Skip Robot Museum is enabled, the stage and Mash fight are skipped, and the Mash location is checked automatically at the configured threshold.

### DeathLink

When enabled, dying in Mega Man 7 sends a DeathLink to other participating players.

Receiving a DeathLink causes Mega Man to die once he is in an active gameplay state where the death can be applied safely.

## What is the goal?

The goal is to defeat Wily Capsule.

## Current limitations

This is a playable pre-release.

* The vanilla password system does not preserve Archipelago items, checks, or progression. Use emulator save states to resume a game after closing the emulator.
* On-screen item receive messages are not currently implemented.
* The Wily stage letter on the stage-select screen may use a different color depending on the most recently displayed Robot Master name. This is a cosmetic issue.