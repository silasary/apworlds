# Talos Principle Reawakened

## What does randomization do to this game?

The core gameplay loop is not changed majorly - the overall goal is still to complete puzzles.
Most of what is different is that tetrominoes (puzzle rewards) are randomized, so completing a Golden J puzzle may result in getting a Red L instead, or you could get an item for someone else's game if a multiworld.

## What is the goal of Talos Principle Reawakened when randomized?

The only supported goal, currently, is ascension (climbing the tower) which requires all red tetrominoes.

## What items and locations get shuffled?

Regardless of YAML setup, all tetrominoes (puzzle rewards) will be randomized. If YAML options result in there being less items than locations, filler items will be added to the pool.
The currently implemented filler items are "Segmentation Fault", "Temporary Self-Awareness", "Elohim's Disapproval", and "Divine Pat on the Head". Traps are not currently supported.
It is possible, in the YAML, to also have purple sigils, white sigils, and stars be randomized.

## How can the player customize the randomizer?

The player can customize their experience with the following YAML options:
- Starting tetromino count
- Whether tetrominoes should be reusable
- Whether to randomize purple sigils, white sigils, and stars
- Whether to unlock puzzle mechanics and world gates by being sent tetrominoes as AP items, or to receive AP items which grant exactly enough tetrominoes to unlock each.
- Specifying the order they intend to visit each of the bonus levels and messenger islands