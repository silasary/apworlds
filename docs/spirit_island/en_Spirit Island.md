# Spirit Island

**This Mod is a bit ahead of its time, so some selectable spirits/adversaries/powercards may not be in the digital game yet. Double-check your options.**

## Quick Links
- [Setup Guide](../../../../tutorial/Spirit%20Island/setup/en)
- [Options Page](../../../../games/Spirit%20Island/player-options)
- [Spirit Island Modding GitHub](https://github.com/Wouter17/Spirit-Archipelago)

## How Does the Randomizer Work on the Island?

The *Spirit Island* Randomizer changes the game into the ultimate deck builder. Make your way through both power decks, by incrementally unlocking cards and keeping the ones you like. You can determine what you want your goal to be! Want to beat Scotland 4 with three different spirits you've never played before, or do you want to defeat all adversaries with a single spirit? The choice is yours!

## Items

Each time a powercard is played for the first time or an adversary is defeated by a certain spirit + difficulty combination, an item is unlocked. If playing in a MultiWorld, completing a level may instead give another Archipelago user their item.

Once all items have been obtained, the game will play like the original experience.

The following items are available in the Randomizer:

- Minor and Major power cards.
- Extra energy per turn (+1 Energy)
- Extra cardplays per turn (+1 Cardplay)
- Extra blight at the start of the game (+1 Blight)
- Spirits and aspects unlocks (if `Enabled spirit & aspect unlock items` is selected)
- Elements (filler items, last one turn)
- Friendly greetings from spirits (filler items)

## Locations

Locations can be checked in the following ways:

- Playing a specific power card for the first time.
- Defeating an adversary with a spirit (or aspect) on a difficulty that is set as one of your goals (for the first time). For example, if you set _Defeat The kingdom of Scotland with River Surges in Sunlight on difficulty 4_ as your goal, defeating Scotland with River Surges in Sunlight on that difficulty will check a location.
- Defeating (for the first time) an adversary with a spirit (or aspect) on a difficulty lower than that is set as one of your goals. In the previous example, defeating The kingdom of Scotland with River Surges in Sunlight on difficulty 0 will also check a location.*

*: Defeating an advisary on a certain difficulty with a certain spirit will also collect all checks of the adversary with that spirit on all lower difficulties (eg, beating an adversary at level 3 also counts as defeating them on level 2, 1 and 0).

## Advanced settings
To enter the goals using a yaml structure and/or to have randomized goals, fill in the "Advanced Victory Goals" instead of the "Victory Goals" option.

The spelling of adversaries and spirit/aspect names can be found on the [Spirit Island wiki](https://spiritislandwiki.com/).<br/>
Aspects are formatted as `Spirit-name (Aspect-name)`, just like in the normal Victory Goals.

When not using weights the format is:
```yaml
difficulty:
    adversary: 
        - Spirit1
        - Spirit2
```

or when using weights (higher weights are more likely to be selected):
```yaml
"min": minimum-number-of-goals
"max": maximum-number-of-goals
difficulty:
    adversary:
        Spirit1: weight
        Spirit2: weight
```

For example like this:
```yaml
2:
    "The Kingdom of Sweden":
        - "Finder of Paths Unseen"
        - "A Spread of Rampant Green (Regrowth)"
1:
    "The Kingdom of France (Plantation Colony)": 
        - "Finder of Paths Unseen"
```

Or for weighted goals like this:
```yaml
"min": 2
"max": 4
2:
    "The Kingdom of Sweden":
        "Finder of Paths Unseen": 4
        "A Spread of Rampant Green (Regrowth)": 2
1:
    "The Kingdom of France (Plantation Colony)":
        "Finder of Paths Unseen": 2
```

The `min` and `max` fields are optional and will otherwise default to `1`/`the number of goals` by default respectively.