# APWorld Mods

> [!IMPORTANT]
> The vast majority of mods that don't drastically alter base game content will not cause any issues in conjunction with the Archipelago Multiworld mod, but new content such as additional research, enemies, items, etc. will not be incorporated into the randomizer experience. This document is meant to illustrate how to use certain features of the APWorld that allow for this new content to be included in the multiworld.

## Available Mods

A small number of APWorld mods are distributed with the APWorld:

- [`Long War of the Chosen`](https://steamcommunity.com/sharedfiles/filedetails/?id=2683996590)
- [`Flame Viper - WotC`](https://steamcommunity.com/sharedfiles/filedetails/?id=1160638944)
- [`Muton Destroyer - WotC`](https://steamcommunity.com/sharedfiles/filedetails/?id=2482812108)

To play with any of these mods, simply add its name (from the list above) to the `active_mods` option when creating your yaml, subscribe to it on the Steam workshop, and make sure it is enabled when launching the game.

### Long War of the Chosen

The most notable currently available APWorld mod is for Long War of the Chosen, courtesy of [@copyrite](https://github.com/copyrite). It adds new research projects, expands on Enemysanity, Itemsanity, and Ranksanity, includes more filler items, and comes with a complete logic overhaul to accomodate LWOTC changes. Some additional compatibility considerations:

- Enemy rando is not supported
- Mission skips are not supported

\+ more info and advice that can be found in the pins of the Discord thread [here](https://discord.com/channels/731205301247803413/1037751568700805141/1449901527685923009).

## Adding Mods

Creating a new APWorld mod involves writing APWorld code and requires Python fundamentals, a rough familiarity with the structure of an APWorld, and, ultimately, a more intimate familiarity with the structure of this particular APWorld. To get started on the last point, check out the entire APWorld code [here](https://github.com/Snyax/Archipelago/tree/main/worlds/x2wotc)!

The `mods` directory contains code for the APWorld mods listed above, as well as a lightly commented blueprint in `mods/example`. See the Flame Viper and Muton Destroyer implementations for minimal working examples, then check out LWOTC for some more advanced ideas. If you create an APWorld mod you think others might enjoy, feel free to open a PR so it can be added to the project!
