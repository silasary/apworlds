# PlateUp! Archipelago Manual Randomizer Setup Guide

<p align="center">
    <img alt="PlateUp Logo"
     src="https://cdn.akamai.steamstatic.com/steam/apps/1599600/header.jpg"
    >
    <!--<h1 align="center">Base Game + DLC Customizable Edition</h1>-->
    <p align="center">v1.0.0</p>
</p>

Last-Updated 2024-04-23 (yyyy-mm-dd)

## Where is the settings page?

The player settings page for this game is located [here (WebHost)](../player-settings). It contains all the options
you need to configure and export a config file.

## What does randomization do to this game?

- Everything in this manual depend on the host level you selected
  - Stuff will get disabled if your host cant access them in game

- Every Main Dish (here called `Recipe`) is an item.
  - You start with 1 randomly chosen

- Every Restaurant size is randomized (here called `floorplans`)
  - You also start with 1 "normal" floorplan

- Every Desk has an item and every Upgrade _branch_ has an item
  - eg. to upgrade tables you need the `Table Upgrades` item and also the `Research Desk` item

## What is the goal of a Manual game when randomized?

Get to a customizable percentage of different Main dish's overtime
By default its 75% of enabled recipes

## Which items can be in another player's world?

Every Items can be in another'S player world except for:

- `Victory Token`

## What if I have items, unlocks, or locations that I'd like to not have randomized?

- If you don't want to go to be required to beat Overtime 3 then there's the `do_overtime` option, when set to False those locations are removed
- If you don't want to do a Main Dish just turn it off using the corresponding Option
- For anything else it's all manual. Just exclude them from either the item or location list.

## How do I install the mod for a Manual game?

There is no mandatory mods for this game. For more info look at the [setup guide (Webhost)](/tutorial/Manual_PlateUp_Nicopopxd/setup/en#base-game-mods) /
[setup guide (Github)](setup_en.md).
