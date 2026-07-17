# I Hate You, Please Suffer Archipelago Setup Guide

NOTE: Although there's no reason to suspect that this wouldn't work on Linux or MacOS, the version of mkxp-z included in the setup files is for Windows. You will have to source your own copy of mkxp-z for your desired platform if you wish to play outside of windows

## Required Software

- v10 of I Hate You, Please Suffer from [itch.io](https://scitydreamer.itch.io/i-hate-you-please-suffer), or the 1/5/26 update from [Steam](https://store.steampowered.com/app/2583620/I_Hate_You_Please_Suffer__Complete/)
- The latest version of ihypsap_win.zip from [the latest release on Github](https://github.com/chloebangbang/Archipelago/releases)
- A ROM patcher that can use BPS patch files (you can use an online one, but I prefer [Floating IPS](https://github.com/Alcaro/Flips/releases/tag/v198))

## Installation Instructions

1. BACK UP YOUR GAME FILES. The installation process is currently destructive, and you will need to have your original files if you wish to update in the future. I truly wish I didn't need to do it like this.

2. Extract the inner contents of ihypsap_win.zip into the root of the game folder.

3. Using your ROM patcher of choice, use the patch file to overwrite Game.rgss3a with a patched version of it.

## Connecting

1. Open the game with Start Game.bat. If you don't use the batch file, the game will boot, but you will be unable to connect.

2. After starting a new save file, use the key item AP Connect.

3. Follow the prompts on-screen!

## Changes to watch out for

- You can cancel quests by interacting with the quest board again. I would highly recommend attempting to avoid this where possible, as I imagine things are highly likely to break.
- The only goal currently implemented is the Tower ending after defeating Gacy. I don't think I stopped you from being able to turn in the letter for money so. Don't do that.
- Things might still be buggy. Be prepared to have to manually release checks using the debug console. I'm ironing them out as I find them
- The tracker item will tell you anything that doesn't show up in your inventory.
- Conversation points are also randomized.