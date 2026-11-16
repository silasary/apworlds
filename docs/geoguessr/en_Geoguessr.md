# Geoguessr

## Where is the options page?

For now, the best way to check the options available is to download the extension (see [setup guide](./setup_en.md)) and use the YAML Generator (available at the bottom of the extension tab, in the footer).

## What does randomization do to this game?
At game generation, a certain amount of countries are randomly drawn across the Geoguessr-covered areas.
Each country will be unlockable behind its Continent region: unlocking the associated Continent map will allow
contained unlocked Country maps to be playable.

Locations are collected by collecting medals on all of those maps. There are four medals : Bronze, Silver, Gold, Platinum. There is also a location for each map's first 5k round.

Each map will have possibly different medal score thresholds for each medal.

## What is the goal of Geoguessr when randomized?
The goal can be one of the following, depending on what the player chose:
- Obtain a certain amount of medals
- Obtain a certain amount of platinum medals

## Which items can be in another player's world?
All the items are randomized accross all worlds. These items can be any of the maps (country or continent) or gamemodes, individual to each map.

For example, you can unlock ``Europe``, ``Monaco``, ``Move (Europe)``, ``Pan (Monaco)``, etc...

## What does another world's item look like in Geoguessr?
There are no visual sprites of items; collecting locations (visible on the client tab) will collect the associated items.

Collecting a location will play a *ding* sound effect.

## When the player receives an item, what happens?
When you receive an item, a *pop* sound effect will play. The associated map or gamemode unlocked will immediately be available to you.

We recommend to use the message log located near the top of the page to track who sent which items to who.

NOTE: you have to regenerate a game for new gamemodes unlocked after last generation.