# Paradise Killer Archipelago
Please please please finish a normal playthrough of the game first. You will do yourself a disservice playing it randomized for the first time.

## What does randomization do to this Game?
- Shuffles nebula drinks, whiskey bottles, relics, key items, Starlight (upgrades), LLD upgrades away from their original items.

## What is the goal of Paradise Killer in Archipelago
The goals of Paradise Killer can be:
- Lady Soda Dies -	get X amount of nebula soda drinks send your way
- Lady Whisky Dies -	get X amount of whisky bottles send your way

Finishing any of these goals will immediately mark your game as complete, eventually this will be changed so that you are allowed to pick up the Investigator's Gun and finish the game with the trial.

## What other adjustments have been made to the base game?
- Sphere limiters are in place for each region as definied on the in-game map for the sole reason to prevent a massive sphere 1. These are currently just logic based, and as such require an instance of [universal tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker) to be active on the side and are require an honor system.
  - Each game area (for example: Beach, Danchi, Opulent Ziggurat) has a seperate unlock item to be received from the multiworld.
  - Whisky License: allows you to pickup whisky bottles.
  - Soda License: allows you to interact with the Dead Nebula vending machines.
- The name of LLD in dialogue is changed to the name of the archipelago slot name.
- One of the Whisky Drinkers is named Moth.

## What does another world's item look like in Paradise Killer?
Items retain their original appearance. You won't know if an item is for another player until you collect it. Once collected they will still popup as if they are their original item, this is something that is yet to be fixed.

## Current oddities in this archipelago implementation
- Item pickups still show their original item first, if it is a item for you a second item popup will appear, this is something I have yet to solve.
  - This also counts for certain item specific dialogue such as the `Judge Call` after picking up the OG starlight, or getting the `Dead Nebula Call` after gettin a check from a vending machine.
- If there are more items then location detected during generation, the excess removed is taken from the random useless relic pool.
- Deathlink setting in the yaml currently does nothing, you can enable deathlink in-game using the `/deathlink` toggle.
- The spehere limiter items do not get a popup in-game except for in the ingame text client.
- You cannot just chat in the in-game text client, if you want to send a normal message use `/say {message}` or `/message {message}`.

## In-Game Client Commands
You can use either the ~ or f10 key to bring up the in-game client. Press it twice to actually see the text client.
- `/connect {address:port} "{slotname}" "{password}"`
  - Used to connect to the multiworld. Password is optional
- `/disconnect`
  - Disconnect from the multiworld
- `/deathlink`
  - Toggles deathlink
- `/say or /message {message}`
  - Send a message to the archipelago chat
- `/blood {#number}`
  - Gives the player #number of blood crystals, in case of debugging.
- `/exile`
  - Teleport the player back to exile, in case the player forgot an item there during the intro sequence.
