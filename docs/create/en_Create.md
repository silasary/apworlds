# Create

## What is this game?

Create is a physics-based puzzle game about building contraptions from a large collection of objects. Its themed
worlds contain ten challenges apiece, while Create Chains reward free-form building and experimentation.

## What does Archipelago randomize?

World access and usable Create Objects become items. Challenge Spark rewards are checks, as are the Hub World Create
Chain, its three tutorial parts, and, when enabled, five Create Chains in every world. The optional four II worlds can also join the seed.

The three Hub tutorial parts are always enabled and provide three additional checks at the start.
In single-player seeds, objects needed to get started are placed on early checks, including these parts.
In multiworld seeds, these objects join the shared item pool and can be found in other players' worlds;
the Hub parts can also contain items for other players. The integration does not automatically grant starting inventory.

Objects are locked in-game until their corresponding Archipelago item is received. The external Create Client
synchronizes these unlocks through Dolphin's memory; the game disc image itself is never modified.

## What is the goal?

`Goal World Unlock` requires reaching the selected goal world and earning the first Spark in its final challenge.
When Required Sparks is above zero, collecting that many Archipelago Sparks unlocks the goal world. In `Spark Hunt`, the goal-world option is ignored and victory is awarded as soon as
the required number of Archipelago Sparks has been collected.

With Required Sparks set to 0, Spark Goal Mode is ignored. Goal world access is distributed as a
normal Archipelago item, and earning the first Spark in that world's final challenge finishes the game.
There is no automatic victory or Spark requirement in either mode.

## How do Spark items work?

Sparks appear as 1-, 2-, 3-, and 6-Spark items. Their denominations are distributed as evenly as the selected total
allows. When space is available, the pool adds up to 50% extra Sparks, rounded up, with a maximum total of 610.
At the maximum requirement of 610, there are no extra Sparks. If the selected checks cannot hold the
required Spark items alongside the object pool, generation reduces the requirement to fit.

## How does challenge logic work?

Normal logic contains the intended reliable object requirements. Known alternative solutions remain out of normal
logic, but Universal Tracker can display them as glitched possibilities. Scoretacular's first three Sparks respect
the recorded challenge-specific solutions and their tested limits. Sparks two and three also accept Bouncer or
either Teleporter by itself. Sparks four through six require Bouncer together with Teleporter or Perfect Teleporter.

## Which game version is supported?

The client supports the PAL Wii release with game ID `SECP69`. It requires Dolphin Emulator and Save Slot 3. Other
regions and save slots are not currently supported.

## What do items from other games look like?

Create does not show Archipelago item names inside the game. The Create Client log shows sent checks and received
items instead.

## Where do I configure and install it?

Follow the [setup guide](/tutorial/Create/setup_en) to install the APWorld, create a player YAML, and connect the client.
On an Archipelago web host with Create installed, the [player options page](../player-options) can also export a YAML.

## World options

Random starting and goal worlds are chosen from the enabled worlds. Explicitly selecting a II world
includes that world even when Include II Worlds is off. In Goal World Unlock with a positive Spark
requirement, the goal world is moved to another enabled world if it matches the starting world.

The starting world unlocks immediately. Early hub and Create Chain checks provide starting objects;
any additional objects needed for the first challenge are granted at the start.
