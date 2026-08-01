# Control Archipelago Setup Guide

## Installation

To play Control in Archipelago mode, a few steps are required:

1. Create the settings file for the game. To do this, you need to install the control.apworld file into the custom_worlds folder of your Archipelago launcher installation. From there, you can use the Launcher's built-in settings generator to configure your Archipelago session. For more information on the available options, see [Options](#available-options).
2. If you are hosting your Archipelago session, you need to generate your world and start the Archipelago server. That is not covered here, but you can follow the instructions on the [official Archipelago website](https://archipelago.gg/tutorial/Archipelago/setup_en).
3. For Archipelago to work, the Ap.Control client and the Ap.Control.Patcher patch are required. For more information, see this [link](https://github.com/Alias-Cynestal/ArchipelagoControlClient).
4. Done! If everything is set up correctly, you should be able to play without any issues!



## Available Options
- __Enable Sector Unlocks and Enable Clearance Level Unlocks__: these are exposed as options, but I am not sure whether they work correctly yet. For now, I would recommend leaving them enabled.
- __Enable Progressive Clearance Level Unlocks__: Lets you choose how clearance level progression works. When true, your clearance level increases based on the number of upgrades you receive. When false, you can obtain any level at any time.
- __* Percentage__: Lets you choose the percentage of each item type among the filler items.

More will be added eventually, and please feel free to share your ideas with me!

## I found a bug, what should I do?
Bugs fall into two categories.
- If it is a bug related to world generation or a logic problem in the order in which items can be obtained, then the issue belongs to this project. In that case, you can open an issue here and I will take a look.
- If it is a bug related to anything else (items not being granted properly, locations not being detected, etc.), it most likely belongs to the client. Please open an issue on the client project's page rather than this one.
- Either way, if you prefer, there is a Control thread on the AP After Dark Discord server. You can post your problem there; I check it regularly.

In any case, if you have questions or want to contribute to the project, don't hesitate to contact me!
