# Astalon: Tears of the Earth

## What does randomization do to this game?

Depending on settings, the following things may be randomized:

- Playable characters
- Starting location
- All key items in your inventory except for Monster Ball
- Health pickups
- Attack pickups
- Keys/doors
  - Collecting keys will complete location checks and you will receive individual door unlocks as items
  - You can enable each color individually
- Switches/magic crystals/faces
  - Activating switches will complete location checks and you will receive corresponding block toggles or door opens
      as items
- Elevator destinations
- Unique shop upgrades
- Candles
- How the 2-way void portal connect
  - They can be coupled or decoupled

## What is the goal?

The goal is to complete the main Tears of the Earth campaign. New Game Plus and the other campaigns are not supported.

There is an additional option you can enable that requires you to collect an arbitrary number of Gold Gorgon Eyes from
the mutliworld before you can ride the final elevator and defeat the final boss.

## What Astalon items can appear in other players' worlds?

Any items as noted above can appear in other players' worlds depending on which settings you have enabled.

## What does another world's item look like in Astalon?

Items for your world or another Astalon world will appear as the actual item if there's an applicable icon. Switches,
magic crystals, and faces are all represented by floor switches. Elevators have a custom new sprite.

Items for other worlds will appear as a custom AP logo. Progression+Useful are gold, Progression is default colors,
Useful is blue, and filler is grey.

## Are there any unexpected bits of logic the randomizer uses?

- Arias and Bram can get more height from jumping while attacking
- There are multiple connections between Mechanism and Hall of Phantoms
- If you have Blood Chalice you can damage boost through some obstacles
- If you have Icarus Emblem or Talaria Boots you can clear some gaps you otherwise couldn't
- Kyuli's Shining Ray, Bram's Whiplash upgrade, and Zeek's Magic Block can activate Algus's crystal switches
- Banish Spell and the Arcanist upgrade makes Algus's attacks larger, allowing you to hit otherwise inaccessible
  crystals
- Algus's Meteor Rain and Zeek's Magic Block can kill ghosts without Banish Spell
- Zeek can get blocks stuck in walls, providing extra height
- Athena's Bell is logically required to fight the final boss on easy difficulty

## Is there a tracker?

This APWorld fully supports Universal Tracker, which you can find via the setup guide. It contains maps and the
`/get_logical_path` and `/explain` commands to aid you in navigation.

## Anti-AI Statement

AI sucks for a number of reasons and has no place in a community driven project. AI has not and never will be used in
the creation of this implementation in any way.
