# RVGL

Archipelago world for RVGL, a community-made OpenGL port of the RC car racing game Re-Volt.

Control and race toy RC cars in everyday scenarios like a neighbourhood, supermarkets and gardens!

## Which options are available for this game?

The YAML template with detailed information on all options is available on the [release page](https://github.com/HansyRod/Archipelago-RVGL/releases).

Options available include:

- One of four victory goals to choose
- Logic difficulty
- Starting items
- Which content to include in the item pool
- Which location checks to include in the game

## How do I set up the game?

See the [Setup Page](setup_en.md) for detailed information on how to set up the game.

## What does randomization do to this game?

The randomization changes the way cars, tracks and championship cups are made available to the player.

Players always start with:

- At least one available car
- At least one available track
- Access to the Bronze Cup championship

Extra cars, tracks and cups are unlocked by players in the multiworld completing location checks, instead of using their original unlock rules.

## What is the goal of RVGL?

There are four available goals to choose from:

- Win the Platinum Cup - "Platinum Cup"
- Win a Single Race with each car - "Carsanity"
- Win a Single Race on each track - "Tracksanity"
- Win a Single Race, find the Practice star, and beat the Time Trial on each track (on Normal version for Time Trial) - "Tracksanity Plus"

## What are location checks in RVGL?

All activities listed in the Progress Table are available as location checks.

This includes:

- Winning championship cups
- Winning single races
- Finding practice stars
- Beating time trials in Normal, Reverse, and Mirror versions of a track
- Collecting stars in the Stunt Arena

Championship locations are mandatory; all other activities are optional.

Some activities are also required for some goals (Tracksanity and Tracksanity Plus). Selecting a goal will automatically enable the required locations.

Additionally, Carsanity mode adds location checks to winning single races with each car. These locations can be added even if the Carsanity goal is not chosen.

## Which items can be in another player's world?

The items that can be found by other players include:

- Playable cars
- Tracks: A track item automatically gives access to all of its modes.
- Silver, Gold and Platinum Cups

Filler items that resemble pickups can also be found, but currently don't affect the game state.

## When the player receives an item, what happens?

The received car, track or cup will be available immediately in the main menu.

## When does the game expect locations to be completed?

Most locations have a car requirement that determines which cars are expected to be able to complete it "in logic".

The player can adjust the logic difficulty as a YAML option. There are three difficulty tiers; the exact requirements for each difficulty depend on the check type, but in general:

- Casual: Requires a car of a superior rating to make the check in logic.
    - Example: Silver Cup requires at least an Advanced car to be in logic.
- Standard: Requires a car of the same rating to make the check in logic.
    - Example: Silver Cup requires at least an Amateur car to be in logic.
- Expert: Requires a car of a rating below to make the check in logic.
    - Example: Silver Cup requires at least a Rookie car to be in logic.

Players can still complete locations "out of logic" as soon as they can access the required tracks or cups.

## Can I play offline?

- The game requires at least one initial connection to receive the starting inventory.
- After that, it is possible to play offline, as the game saves all progress made locally, and any pending location checks are synchronized on the next connection.
- However, it is not possible to receive items while offline.

## Is this randomizer compatible with other mods?

Custom cars, tracks and cups are currently not supported.

## What are the future plans for this Archipelago implementation?

In the future I would like to expand this implementation to include some features already available on RVGL Randomizer. These include:

- Access to custom cars and tracks, instead of / in addition to the base game content
- Modifying the cups to use a shuffled list of tracks
- Changing cup options such as number of cars, the car classes added to each cup, the points table, etc.

I also want to use pickup items to provide more interaction between players for RVGL players during races.

- Pickups can generally be granted as boons to the player
- Negative pickups such as the bomb, or negative effects like exploding or being electrocuted, can work as traps and for a Deathlink implementation