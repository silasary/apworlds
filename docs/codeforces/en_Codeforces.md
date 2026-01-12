# Codeforces

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configureand export a
config file.

## What is Codeforces?

Codeforces is an online judge which hosts a large collection of competitive programming problems.

In this archipelago game, you are tasked with solving a collection of randomly selected problems,
which provide various upgrades, and access to more problems.

Crucially, this game is entirely integrated into the client sitting inside its .apworld.
If you have the .apworld installed into your [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
install, you can play APQuest.

## How is this randomized?

The problems available to you will be placed in separate "Problem Banks",
and to begin with you will only have access to the problems in Bank 1.

You will also start with some restrictions on your submission (See the upgrades section for details).

Every time you solve a problem, you can receive an item. This could be a key to one of the other Problem Banks,
it could also be an upgrade that lightens restrictions on your submission.

### How do upgrades work?

There are currently two upgrade paths implemented for Codeforces:

**Memory Upgrades**: This impacts the *size* of your submission, in bytes, that will still be considered a pass.

As an example, you code might have to fit within 500 bytes for your first few submissions.

**Time Limit Upgrades**: Problems in codeforces have a time limit, and this tree enforces a stricter multiplier on this running time.

As an example, you may start with a 0.5x multiplier on your time limit,
so your submission actually needs to run twice as fast as required by the problem.

## Once I'm inside the Codeforces Client, how do I actually play the world?

On your first connection, you'll be prompted to open a configuration file to enter your codeforces handle, and optionally an API Key.

After this, periodically the codeforces client will hit the codeforces api and inspect your recent submissions.
So all you need to do is open the client, connect & configure.

Then you can press the "CF" buttons on the game page to find the problems on codeforces,
then just submit to Codeforces in the manner you normaly would!

## What does "Unable to determine time limit" mean in generation?

This probably means you accidentally rolled a problem with no english statement, please try regenerating a new game.
