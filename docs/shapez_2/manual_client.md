# How to use the manual-like client

If you generated a singleplayer seed, then you can just start playing the custom scenario without further setup.
If there are multiple worlds in the generated multiworld, you will need to connect to the multiworld using the 
2hapezipelago mod. However, as of writing this page, the mod is not compatible with the latest apworld version yet. 
So in order to still be able to play it, you'll need to use the manual-like client and ingame cheats.

### Sending locations using the manual-like client

Open the Archipelago Launcher and select `shapez 2 Client`. A client window that looks like the text client should then 
appear. Connect to the multiworld like you would do with the standard text client and switch to the various tabs. 
There you can click the milestone, task, or operator level you just completed in order to send the location check(s).
Do note that the client will show you more locations than you actually have in your world. Clicking them won't have any 
effect.

### Receiving items from other players without the mod

If you've found one of your own items in your game, then no further action is needed as the game already added it to 
your inventory automatically. If instead another player finds your item, open the debug console by pressing `F1` 
on your keyboard, type in `cheats.enable`, and lastly type in `research.set [remote name] true`, where `[remote name]` 
is the internal name used for the item. [Here](remote_items.md) is a list of all items and their corresponding remote 
name. However, do note that research credits, blueprint credits, and platform capacity 
**cannot be received (currently)** due to the limitations of custom scenarios.