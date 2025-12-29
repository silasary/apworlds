# TOEM: A Photo Adventure

"Set off on a delightful expedition and use your photographic eye to uncover the mysteries of the magical TOEM in this hand-drawn adventure game. Chat with quirky characters, solve their problems by snapping neat photos, and make your way through a relaxing landscape!"

## Quick links

- [Setup](https://github.com/bbernardoni/Archipelago/blob/toem/worlds/toem/docs/setup_en.md)
- [Releases page](https://github.com/bbernardoni/Archipelago.TOEM/releases/latest)

## What does randomization do to this game?

Stamps and compendium photos are always randomized. Items, cassettes, and achievements can also be randomized via options (only items are randomized in the default yaml). Achievements are only location checks and add filler compendium photo items to the item pool to compensate.

Basic items such as the camera, backpack, cassette player, and community card are not randomized. The Basto Ticket is also not randomized.

By default stamps are progressive where any stamp item will give you a stamp for the earliest region that still needs stamps for the bus ticket. Turning this off will make each stamp item specific to a region. The number of stamps required to move on is customizable for each region. Additionally, the honk attachment can be added to `early_items` which forces it to be in some player's sphere one. These options can be tweaked to help avoid the player being BK'ed when in a multiworld with games that have a lot of checks.

## What is the goal?

The default goal is to Experience TOEM and beat the base game. If the Basto DLC is included via an option the goal is changed to the Basto bonfire event.