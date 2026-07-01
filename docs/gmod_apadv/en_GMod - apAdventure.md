# apAdventure
apAdventure is a custom gamemode for Garry's Mod which is designed to let people play with a large variety of Source Engine Content in Archipelago by leveraging GMods massive workshop and ability to load maps and assets from almost any Source Engine game, allowing you to play Half-Life maps, Source Schmovement maps (mainly bunnyhopping and surfing for now, I may try to replicate other source movement tech in the future), set up your own "adventure saves" and minigames using GMod workshop content and more. Multiplayer is supported.

It provides players with a bunch of tools which they can use in the Sandbox gamemode to place Locations, Entrances, Exits and any Entity which supports the GMod Duplication System in any map to create a "Map Config". These Map Configs can then be fed into the generator, which then stitches Entrances and Exits together to create a randomized campaign, allowing anyone to add new maps to their run. Configs for some Half-Life 2 maps are included by default.

More advanced users can also use Lua to create custom items or add additional behaviors to the configs they make and people knowledgable with Hammer, the Source Engine Map Editor, are also provided a bunch of custom map entities which can be used to add more complex behaviors without needing to know Lua.

## What items and locations are randomized in apAdventure?

Items in apAdventure are mainly weapons and "Map Items" (which are mostly used as keys), but custom items may be defined through Lua, which are able to do pretty much anything. Items in apAdventure may have "Capabilities" assigned to them, which access rules will look at to determine accessibility rather than being hard-coded to look for specific items, allowing custom items to fill in for their "vanilla" counterparts.

Locations in this implementation are mainly floating Archipelago icons, but it is possible for Lua coders and map makers to make any event they can attach code or Hammer I/O to into a location, in which case they most likely will not have a physical representation. The built-in tracker will always list all locations that exist in the current map.