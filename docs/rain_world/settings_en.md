# Rain World player settings

The meanings and implications of the more nuanced player settings are discussed here.

### Extra karma cap increases
How many extra karma cap items are placed into the pool.
When set to `0`, there are exactly enough karma items to raise max karma to 10,
regardless of the selected victory condition.

### Extreme threats
When this setting is enabled, creatures which are extreme threats are assumed to not exist.
Most notably, this means that their associated (expanded) food quest checks are not generated,
but it also affects logic for certain passages such as The Outlaw or The Hunter.
Creatures considered extreme threats 
- Daddy Long Legs (and variants)
- Red Lizards
- Red Centipedes
- Aquapedes
- King Vultures
- Miros Vultures
- Miros Birds

### Glow required for dark places
When this setting is enabled, dark areas are considered inaccessible without The Glow.
However, the client will not stop you from visiting these areas.
Dark areas include:
- Filtration System (and, by extension, Depths and Rubicon and the associated victory conditions)
- Lower west Pipeyard
- Shaded Citadel

### Victory condition
The default victory condition, ascension, logically requires raising max karma to 10
(which requires 8 karma items), accessing Subterranean (or, for Saint, Rubicon),
and The Glow (unless `Glow required for dark places` is disabled).
The story victory condition varies by slugcat, and is only applicable if MSC is enabled.
Each victory condition requires certain items that are placed into the item pool,
as well as certain additional actions that must be taken to actually reach the ending:

| Slugcat          | Items                                                                                             | Actions                                                                                          |
|------------------|---------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| Monk or Survivor |                                                                                                   | - Reach Journey's End (Outer Expanse)                                                            |
| Hunter           | - Slag Key                                                                                        | - Bring the slag key (green neuron) to Looks to the Moon in Shoreline                            |
| Gourmand         | - Mark of Communication                                                                           | - Reach Journey's End (Outer Expanse)                                                            |
| Artificer        | - Mark of Communication<br/>- Citizen ID drone                                                    | - Kill the chieftain scavenger in Metropolis                                                     |
| Rivulet          | - Increased cycle duration (unless **Late Submerged** setting is disabled)<br/>- Rarefaction cell | - Install the rarefaction cell in Submerged Superstructure<br/>- Reunite with Looks the the Moon |
| Spearmaster      | - Spearmaster's pearl<br/>- Moon's message                                                        | - Deliver the pearl to Communications Array                                                      |

Saint and Sofanthiel do not have a story victory condition.
