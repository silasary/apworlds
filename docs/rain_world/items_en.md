# Rain World items

### Progression and useful items
Randomization adds the following _unique items_ to the pool,
meaning that these items will not necessarily appear in their normal locations.
For instance, echoes do not necessarily increase karma,
and completing a passage does not necessarily award a fast-travel token.

| Item                                                        | Name                          | Count                                   |
|-------------------------------------------------------------|-------------------------------|-----------------------------------------|
| Karma cap increases                                         | `Karma`                       | Eight, plus `extra_karma_cap_increases` |
| Gate keys                                                   | `Gate: REGION_A to REGION_B`  | One per accessible gate                 |
| Fast-travel tokens                                          | `Passage token: PASSAGE_NAME` | One per accessible passage              |
| The Mark of Communication                                   | `The Mark`                    | One                                     |
| The Neuron Fly glow                                         | `The Glow`                    | One                                     |
| Green Neuron Fly / Slag key                                 | `Slag key`                    | One, for Hunter only                    |
| Artificer's citizen ID drone ("Sofanthiel")                 | `Citizen ID drone`            | One, for Artificer only                 |
| Increased cycle duration and reduced shelter failure chance | `Longer cycles`               | One, for Rivulet only                   |
| Rarefaction Cell                                            | `Rarefaction Cell`            | One, for Rivulet only                   |
| Spearmaster's unique data pearl                             | `Spearmaster's Pearl`         | One, for Spearmaster only               |
| Moon's final message to the local group                     | `Moon's final message`        | One, for Spearmaster only               |

### Expedition Perks
Optionally, certain perks present in the game's Expedition mode can be added to the item pool.
These can each be added individually via the "Expedition Perks" option in the yaml.
Perks that the chosen slugcat innately has will have no effect when received.

| Name             | Description                                                                 |
|:-----------------|-----------------------------------------------------------------------------|
| Back Spear       | Enables storing a spear on your back.                                       |
| Dual Wielding    | Enables holding two spears at one time.                                     |
| Blast Resistance | Explosions are unable to kill you.                                          |
| Explosive Jump   | Enables you to perform Artificer's special jump ability.                    |
| Explosive Parry  | Enables you to perform Artificer's special parry ability.                   |
| Item Crafting    | Enables crafting items together to make new things. No effect on Artificer. |
| Aquatic          | Greatly extends underwater lung capacity.                                   |
| Agility          | Greatly increases speed and movement capabilities.                          |


### Filler
Randomization adds the following filler items to the pool:
- Several vanilla weapons
(rocks, spears, explosive spears, grenades, flashbangs, sporepuffs, and cherrybombs)
- Several vanilla foods
(blue fruit, bubble fruit, eggbug eggs, jellyfish, mushrooms, slime mold)
- A few other types of items (karma flowers, vulture masks, lanterns)
- Several MSC weapons, if enabled (electric spears, lilypucks, singularity bombs, joke rifles)
- Several MSC foods, if enabled (firebug eggs, glow weed, gooieducks)
- Several Watcher weapons / foods, if enabled (poison spears, graffiti bombs, boomerangs)

### Traps
Randomization adds the following trap items to the pool.
Although they are "traps," some of them can be exploited for personal gain (or are neutral).
The only thing that all traps have in common is that they affect the game world instantly.
- **Stun**: Slugcat is briefly stunned.
- **Creature**: a dangerous creature spawns in an adjacent room.
This may be a Red Lizard, Red Centipede, Spitter Spider, Brother Long Legs, or Daddy Long Legs.
When Watcher is enabled, Blizzard Lizard is also added.
The creature is aware of Slugcat's position for a short while.
- **Timer**: the current cycle timer is shortened.
- **Zoomies**: Slugcat suddenly starts moving much faster.  The effect wears off after a short while.
- **Alarm**: every creature in the region is made aware of Slugcat's position for a short while.
- **Rain**: a heavy (but not crushing) rain suddenly starts and lasts a short while.
- **Gravity**: gravity is disabled for a short while. 
Has no effect in rooms that already have an active gravity effect.
- **Responsibility**: (MSC only) A slugpup spawns in an adjacent room. 
It is aware of Slugcat's position for a short while.
- **Ripple Spawn**: (Watcher only) Many Ripple amoeba appear in the current room and target slugcat.
Before the Glow is obtained these are invisible.
Because of this, this trap's default weight is 0 and must be purposefully enabled.