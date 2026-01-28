# Changelog
Versions are sorted in ascending order, i.e. the most recent changes are at the top.

## 0.99.1

- Fixed logic being broken entirely (goddammit even double-checking didn't protect me from lambdas in for loops)
- Added `Location modifiers` option with modifiers `Lock task lines`, `Lock operator lines`, and `Lock operator levels tab`
- Tweaked item generation such that starting items are actually taken into account for event generation

## 0.99.0 (pre-mod release)

- Locations:
  - 3-20 Milestones containing up to 12 items
  - 3-200 Task lines containing up to 5 checks
  - 0-100 Operator levels
- Items: 
  - Buildings, space platforms, various mechanics
  - Task line unlocks, operator line unlocks
  - Research points, blueprint points, platform points
- Options:
  - Goal: Milestones, Operator levels
  - Location adjustments: 
    - Milestones, min/max checks per milestone
    - Task lines, min/max checks per task line
    - Operator lines, random operator lines, operator level checks
    - Required shapes multiplier
  - Shape configuration: Tetragonal (for now)
  - Shape generation modifiers: Milestone operator lines
  - Shape generation adjustments: Maximum layers, maximum processors per milestone
  - Blueprint shapes:
    - Regular, hard, insane
    - Randomized
    - Plando
  - Item pool modifiers: Random starting processor, arbitrary research/blueprint points, arbitrary platform items
- Shape generator and downgrader (only tetragonal for now)
- Scenario and preset files as output
- Manual-like client

## 0.0.1 (proof of concept)

Only added 4 shapesanity-like locations, without any gameplay-altering modifications.
