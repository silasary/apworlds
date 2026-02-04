# Console Commands

With mods installed, pressing F1 will open the Haste modding menus. The first menu (opened by default) is the console log, and will allow the user to execute certain Archipelago commands by inputting them into the provided textbox. These AP commands are available to help reset certain savedata flags to hopefully fix broken check progression.

As of v0.4.0, the following commands are available:

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