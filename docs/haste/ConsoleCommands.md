# Console Commands

With mods installed, pressing F1 will open the Haste modding menus. The first menu (opened by default) is the console log, and will allow the user to execute certain Archipelago commands by inputting them into the provided textbox. These AP commands are available to help reset certain savedata flags to hopefully fix broken check progression.

As of v0.5.0, the following commands are available:

## ResetFragmentsanity

Command: `HasteAP.ResetFragmentsanity X`\
Where: `X` is the Shard number that you wish to reset progress on, between 1 and 10.\
Purpose: Resets all of the Fragmentsanity flags for the specified Shard back to 0.\
Example: `HasteAP.ResetFragmentsanity 7` will reset the progress for Shard 7

> If playing with Global Fragmentsanity, providing *any* integer for X will reset the global flags.

## ResetShopsanity

Command: `HasteAP.ResetShopsanity X`\
Where: `X` is the Shard number that you wish to reset progress on, between 1 and 10.\
Purpose: Resets all of the Shopsanity flags for the specified Shard back to 0.\
Example: `HasteAP.ResetShopsanity 7` will reset the progress for Shard 7

> If playing with Global Shopsanity, providing *any* integer for X will reset the global flags.

## RecalibrateItems

Command: `HasteAP.RecalibrateItems`\
Purpose: Attempts to fix any broken savedata flags by re-checking for all Haste items (excluding Anti-Spark Bundles) found in the APWorld.

> This command does ***not*** recalibrate location data, which will be handled separately at a later time.

## JacobAsked
Command: `HasteAP.JacobAsked`\
Purpose: Creates a txt file in your Haste Steam folder containing all of your savedata flags. Used so that Jacob (the developer) can get better information on what might be wrong with your game.

> Your Haste Steam folder can be found by right-clicking the game in your Steam Library -> Manage -> Browse local files