# Locations in Rain World Randomizer

Following is a summary of all randomized locations (checks)
along with the items that would normally be at those locations.

For details on how checks are named (for the purpose of setting the player YAML or hinting),
see [the naming subpage](/tutorial/Rain%20World/naming/en).

## Tokens and pearls
There are several physical checks available in most regions.
These come in the form of tokens -
the small holograms on stalks which unlock things for Arena or Safari -
and the unique colored pearls, which count as checks when broguht to a shelter for the first time.
Not all tokens and pearls are available to every slugcat,
even if they exist in a region that every slugcat can visit.

The Randomizer mod makes collectable tokens re-collectable if you've collected them on the save file already.

For Spearmaster, broadcast tokens are also checks.
Although some broadcast tokens give different chatlogs before and after meeting Five Pebbles,
they are not considered two separate checks.

`Misc2` pearls, such as the one in Subterranean,
though they appear on the interactive map, are not unique and are not checks.

## Karma flowers
If `checks_flowersanity` is enabled, eating a fixed karma flower spawn is a check.
If two karma flowers exist in the same room, they are not two separate checks.

## Echoes
Visiting an echo is a check, and the karma cap increases they would normally give are placed in the item pool.
Whether an echo appears depends on some combination of 
which slugcat is being played, which echo is being met,
current karma, max karma, whether karma flower reinforcement is active,
and the `Low-karma echo appearance` player YAML setting:

- The echoes in The Exterior, Subterranean, Metropolis, and Submerged Superstructure (for Saint) always appear.
- If max karma >= 7:
  - Echoes always appear for Saint.
  - Other slugcats require current karma >= 6.
- If max karma = 5:
  - Echoes always appear for Saint.
  - Other slugcats require current karma = 5.
- If max karma < 5:
  - If `Low-karma echo appearance` is `Never`, echoes do not appear.
  - If `Low-karma echo appearance` is `With Karma Flower`,
    echoes appear if current karma = max karma *and* karma reinforcement is active.
  - If `Low-karma echo appearance` is `Without Karma Flower`,
    echoes appear if current karma = max karma.
  - If `Low-karma echo appearance` is `Unaltered` (default):
    - Echoes always appear for Saint.
    - Artificer requires current karma = max karma *and* karma reinforcement.
    - Other slugcats require current karma = max karma.

Note that current karma is not logically constrained.
This means, for instance, that once max karma >= 5,
all echoes are considered accessible once they are reachable.

## Unique checks
There are several unique checks, mostly associated with the iterators:

| Check                                 | Eligibility                 | Requirements                                                  |
|---------------------------------------|-----------------------------|---------------------------------------------------------------|
| Eat a neuron fly                      | Any                         | Access to a neuron fly                                        |
| Gift a neuron fly to Moon             | Monk, Survivor, or Gourmand | Access to a neuron fly and Looks to the Moon                  |
| Meet Five Pebbles                     | Not Rivulet or Saint        | - Access to Five Pebbles<br/>- The Mark of Communication      |
| Meet Looks to the Moon                | Not Artificer or Sofanthiel | - Access to Looks to the Moon<br/>- The Mark of Communication |
| Revive Looks to the Moon              | Hunter                      | - Access to Looks to the Moon<br/>- The green neuron fly      |
| Remove Five Pebbles' rarefaction cell | Rivulet                     | Access to the heart of The Rot                                |
| Ascend Looks to the Moon              | Saint                       | - Access to Looks to the Moon<br/>-Max karma 10               |
| Ascend Five Pebbles                   | Saint                       | - Access to Five Pebbles<br/>-Max karma 10                    |

## Passages
Completing a passage is a check, and the passage tokens (which allow for fast-travel)
that they would normally give are placed in the item pool.
The logical requirement varies between passages
and also depends on the `Passage progress without Survivor` setting in the player YAML.

There are four passages that may always be earned before The Survivor is earned, regardless of settings:

| Passage           | Eligibility                                 | Requirements                                    |
|-------------------|---------------------------------------------|-------------------------------------------------|
| The Martyr        | Any; MSC enabled                            | None                                            |
| The Mother        | Survivor, Hunter, or Gourmand; MSC enabled  | Access to HI, DS, GW, SH, CC, SI, LF, SB, or VS |
| The Pilgrim       | Any; MSC enabled                            | Access to all eligible echoes                   |
| The Survivor      | Any                                         | Max karma at least 5                            |

There are three passages that may be earned before The Survivor,
but only if the `Passage progress without Survivor` setting is either `enabled` or `bypassed`:

| Passage           | Eligibility | Requirements                                                                                                                              |
|-------------------|-------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| The Dragon Slayer | Not Saint   | - Vanilla: Access to Blue, Pink, Green, Yellow, Black, and White Lizards<br/>- MSC: Red, Cyan, Strawberry, and Caramel Lizards also count |
| The Friend        | Any         | Access to one lizard                                                                                                                      |
| The Wanderer      | Any         | Access to every story region for the given slugcat; each individual pip is also a check                                                   |

The remaining seven passages require The Survivor unless
`Passage progress without Survivor` is `bypassed`:

| Passage       | Eligibility                                             | Requirements                                                                                                                                                                                |
|---------------|---------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The Chieftain | Not Artificer                                           | Access to a Scavenger (or Scavenger Toll if `The Chieftain requires toll` is set)                                                                                                           |
| The Hunter    | Not Saint                                               | Access to several types of meat (number depends on `The Hunter difficulty` setting)                                                                                                         |
| The Monk      | Any                                                     | - For Hunter, Artificer, and Spearmaster: Access to SI, LF, SS, or DM<br/>- For other slugcats: Access to several types of non-meat foods (number depends on `The Monk difficulty` setting) |
| The Nomad     | Any; MSC enabled                                        | Access to several regions (number depends on `The Nomad difficulty` setting)                                                                                                                |  
| The Outlaw    | Not Saint                                               | Access to several eligible creatures (number depends on `The Outlaw difficulty` setting)                                                                                                    |
| The Saint     | Any                                                     | - For Hunter, Artificer, and Spearmaster: Access to SI, LF, SS, or DM<br/>- For other slugcats: No requirements                                                                             |
| The Scholar   | Not Monk unless MSC is enabled; Not Saint or Sofanthiel | - The Mark of Communication<br/>- Access to three colored pearls<br/>- For Monk, Survivor, and Gourmand: access to Looks to the Moon                                                        |

## Food quest
If an MSC gamestate is selected and the `Food quest` setting is enabled,
each item of the food quest is a check when completed.
Like the passages, food quest checks are awarded upon successful hibernation.
Each slugcat has the ability to fulfill at least some part of the food quest.

| Food                                                                                                                           | Monk<br/>Survivor<br/>Rivulet | Hunter<br/>Gourmand | Artificer    | Spearmaster | Saint |
|--------------------------------------------------------------------------------------------------------------------------------|-------------------------------|---------------------|--------------|-------------|-------|
| Neuron Fly<br/>Mushroom                                                                                                        | ✔                             | ✔                   | ✔            | ✔           | ✔     |
| Glow Weed                                                                                                                      | ✔                             | ✔                   | <sup>a</sup> |             | ✔     |
| Blue Fruit<br/>Bubble Fruit<br/>Dandelion Peach<br/>Gooieduck<br/>Lilypuck<br/>Slime Mold                                      | ✔                             | ✔                   | ✔            |             | ✔     |
| Batfly<br/>Hazer                                                                                                               | ✔                             | ✔                   | ✔            | ✔           |       |
| Black Lizard<br/>Salamander / Eel Lizard<br/>Yellow Lizard<br/>Cyan Lizard<br/>Jetfish<br/>Snail<br/>Eggbug<br/>Grappling Worm |                               | ✔                   | ✔            | ✔           |       |
| Aquapede / Red Centipede<sup>b</sup><br/>Centiwing                                                                             | ✔<sup>c</sup>                 | ✔                   | ✔            | ✔           |       |
| Jellyfish                                                                                                                      | ✔                             | ✔                   | ✔            |             |       |

- <sup>a</sup> Artificer can eat Glow Weed, but does not find any in their worldstate.
- <sup>b</sup> This check is not generated unless the `Extreme threats` setting is enabled.
- <sup>c</sup> Monk and Survivor can only find Red Centipedes by lineage -
which is not in logic - but Aquapedes are available without lineage.

### Expanded food quest
If the food quest is enabled and `Expanded food quest` is enabled,
then an additional set of food quest checks are added.

| Food                                                                                                                                                                                                                                                                                                                               | Monk<br/>Survivor<br/>Rivulet | Hunter | Gourmand | Artificer | Spearmaster | Saint | Sofanthiel |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------|--------|----------|-----------|-------------|-------|------------|
| Popcorn Plant<sup>a</sup>                                                                                                                                                                                                                                                                                                          | ✔                             | ✔      | ✔        | ✔         | ✔           | ✔     | ✔          |
| Centipede<sup>b</sup><br/>Noodlefly<sup>b</sup><br/>Vulture Grub                                                                                                                                                                                                                                                                   | ✔                             | ✔      | ✔        | ✔         | ✔           |       | ✔          |
| Green Lizard<br/>Blue Lizard<br/>Pink Lizard<br/>White Lizard<br/>Red Lizard<sup>c</sup><br/>Caramel Lizard<br/>Big Spider<br/>Spitter Spider<sup>c</sup><br/>Mother Spider<sup>c</sup><br/>Lantern Mouse<br/>Cicada<sup>d</sup><br/>Dropwig<br/>Miros Bird<sup>c</sup><br/>Scavenger<sup>d</sup><br/>Rot<sup>c</sup> <sup>d</sup> |                               | ✔      | ✔        | ✔         | ✔           |       | ✔          |
| Strawberry Lizard<br/>Train Lizard<sup>c</sup>                                                                                                                                                                                                                                                                                     |                               |        |          |           |             |       | ✔          |
| Vulture<br/>King Vulture<sup>c</sup>                                                                                                                                                                                                                                                                                               |                               | ✔      | ✔        | ✔         | ✔           |       |            |
| Miros Vulture<sup>c</sup>                                                                                                                                                                                                                                                                                                          |                               |        |          | ✔         | ✔           |       | ✔          |
| Yeek                                                                                                                                                                                                                                                                                                                               |                               |        | ✔        |           |             |       | ✔          |
| Pole Plant<br/>Monster Kelp<br/>Leviathan<sup>c</sup><br/>Inspector                                                                                                                                                                                                                                                                |                               |        |          |           | ✔           |       |            |

- <sup>a</sup> This includes the seeds that drop during the blizzard for Saint. 
- <sup>b</sup> This includes infants or adults.
- <sup>c</sup> This check is not generated unless `Extreme threats` is enabled.
- <sup>d</sup> This includes all variants.

## Shelters
If the `Sheltersanity` setting is enabled, then every functional shelter is a check when visited.
Shelters which do not function in a given worldstate are not counted.

| Region                   | Vanilla shelter count | MSC shelter count | Notes                                                                                                                  |
|--------------------------|:----------------------|-------------------|------------------------------------------------------------------------------------------------------------------------|
| Chimney Canopy           | 4                     | 6                 |                                                                                                                        |
| Drainage System          | 4                     | 4                 |                                                                                                                        |
| The Exterior             | 7                     | 7                 |                                                                                                                        |
| Farm Arrays              | 7                     | 7                 | 1 is broken for Hunter, Artificer, Spearmaster, and Saint.                                                             |
| Five Pebbles             | 5                     | 5                 |                                                                                                                        |
| Garbage Wastes           | 8                     | 9                 |                                                                                                                        |
| Industrial Complex       | 6                     | 6                 | 1 is broken for Hunter, Artificer, Spearmaster, and Saint.                                                             |
| Outskirts                | 3                     | 4                 | 1 is only accessible for Monk, Survivor, and Gourmand through Outer Expanse.                                           |
| Shaded Citadel           | 10                    | 11                |                                                                                                                        |
| Shoreline                | 10                    | 14                | 1 is broken for Survivor, Hunter, Gourmand, Artificer, and Saint.<br/>1 other is only accessible to Rivulet and Saint. |
| Sky Islands              | 3                     | 4                 |                                                                                                                        |
| Subterranean             | 7                     | 9                 |                                                                                                                        |
| Looks to the Moon        |                       | 12                |                                                                                                                        |
| Metropolis               |                       | 9                 |                                                                                                                        |
| Outer Expanse            |                       | 7                 | 1 is broken for Monk.                                                                                                  |
| Pipeyard                 |                       | 10                | 1 is broken for Artificer and Spearmaster.                                                                             |
| The Rot                  |                       | 9                 |                                                                                                                        |
| Silent Construct         |                       | 14                |                                                                                                                        |
| Submerged Superstructure |                       | 10                | 1 is broken for all slugcats except Monk.<br/>3 others are only accessible for Rivulet.                                |
| Undergrowth              |                       | 4                 |                                                                                                                        |
| Waterfront Facility      |                       | 10                | 1 is only accessible for Spearmaster.                                                                                  |

## Notes

By default, the logic does not expect you to get creatures
from precycle-only spawns or lineage dens (not even the first creatures of lineage dens)
for the food quest or passages like The Dragon Slayer.
