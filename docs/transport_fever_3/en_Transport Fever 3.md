# Transport Fever 3

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a
config file.

## What does randomization do to this game?

The game locks what you have not received, and a mod sends your checks to the multiworld:

- **Items**: one item per transport mode (tram, rail, water and air; the road is free), the vehicles of each mode by
  era (before 1920, 1920 to 1960, after 1960), road and track types, five construction tools, four cargo classes,
  company levels, money and traps.
- **Checks**: population, company levels, passengers and cargo transported, the first line of each mode, deliveries of
  each cargo and missions of the game completed. Every check is shown in the game as a contract.
- **Goals**: population, company level, passengers or cargo. The game is won when every active goal is reached.

## What is the goal of the game when randomized?

Reach every active goal of your options. Archipelago then releases the items you have not received to the other players.

## Which items can be in another player's world?

Money grants and money losses (traps) count as filler. The cargo class items are useful, every other item is
progression.

## What does another world's item look like in Transport Fever 3?

When a check of yours holds an item for another player, the contract of that check shows the item and the player it
goes to, and the game announces it with a notification when you complete it.

## When the player receives an item, what happens?

The mod unlocks it at once (a mode, a tier of vehicles, a tool...) or books it (money), and the game shows a
notification with the sender and the check it came from.

## Balance and feedback

This world is young. The number of checks, the amounts of the contracts, the logic that spreads the unlocks, the money
amounts and the cargos of each climate were chosen from the game's own data and a few test games, so they can still be
improved, and that needs feedback from real multiworlds. If a game felt too easy, too hard, too slow or too fast, tell the
maintainers which options you used (start year, climate, goals, number of checks) and how long the game lasted.

An idea for later: unlocking vehicles one by one instead of by tier (three eras per mode). It is not started, and it would change how many items and checks a game needs.

## How this world was made

This world was built with the help of an AI assistant, Claude (Anthropic): it was used to reverse engineer the game and to write most of the code, the tests and the documentation. The author is a professional developer who read the code, tested the mod in the game and went through the documentation. What has not been tested in the game is listed in the README of the project.
