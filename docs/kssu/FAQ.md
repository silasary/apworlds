# Frequently Asked Questions
  ***

### How would I dump this game from my console to play it with AP?

Here are a couple guides you can use to get a legal dump of your USA Kirby Super Star Ultra:

[Getting your 3DS set up](https://3ds.hacks.guide/) 

[Dumping your KSSU Catridge](https://wiki.hacks.guide/wiki/3DS:Dump_titles_and_game_cartridges)
___
### Does this project use AI? If so, how is it utilized?

- Kirby Super Star Ultra Archipelago is **not** vibe-coded
- Kirby Super Star Ultra Archipelago does **not** contain AI Art
- AI has not and will not be used to brainstorm or design any ideas or new features.
- LLMs have been used as a means to better understand the logic of certain functions (Which was done by looking through Ghidra's de-compiled C code).
- LLMs were rarely used as a [rubber duck](https://en.wikipedia.org/wiki/Rubber_duck_debugging) to help diagnose bugs early in development.
- The APWorld itself re-uses and tweaks some code from pre-existing worlds. For more information, please refer to the [credits](https://github.com/GhostCappy/KirbySuperStarUltra/blob/main/worlds/kssu/docs/credits.md) page.
- Documentation for all assembly changes can be found [here](https://docs.google.com/document/d/17oQgLhXj-Uu3xDFecNxVluyk4rJFPOidhxv2isrZJZo).

___  
### Is there a tracker for this game?

There is no dedicated tracker for this game at the moment. However, it was made in mind to be compatible with Universal Tracker, which
can be found [here](https://github.com/FarisTheAncient/Archipelago/releases)

___  
### How do I check the gold thresholds for TGCO (and other important items)? 

Inside the client, you can run /sub_area (area) to see how much gold is required to progress.
Ex. /sub_area Old Tower

There are also some other useful commands inside the client, including:
- /games (Shows all the games you currently have unlocked)
- /planets (Shows all the planets you currently have unlocked)
- /ability (Shows all the abilities you currently have unlocked)
- /keys (Shows all the keys / progressive stages you currently have.)
- /sub_area (Tells you the gold threshold to progress through an area in TGCO.)

___
### Will there be PAL or JPN support in the future?

Most likely not, at least not from me. As the only dev at the moment, I only own the US version of the game.
In addition to this, it would be quite a long process as certain addresses greatly vary across versions.
If you're looking to help with this, feel free to reach out!

___
### Are there any known bugs?

- Occasionally in MWW, the abilities on the bottom screen will be the wrong color.
- The abilities on MWW's pause screen are not what abilities were recieved, but which ones were collected. (Selecting them does nothing unless already collected)
- When watching the beginner show, you may experience some visual bugs. It's best to skip these.
- Swallowing two enemies will still give you at least one of the abilities or mix, even if the ability isn't unlocked.
- When a progressive key is recieved for TGCO or MKU, the barrier will still be there visually (read more below)
- Reloading Dyna Blade will sometimes spawn Iron Mam, even when defeated.
- If an ability is recieved while playing MWW, it won't appear until the game is exited and re-entered.
- Hard restarting or re-opening the game will re-send every item.

___
### I found another bug, where do I report it?

Report in the discord thread, which can be found [here](https://discord.com/channels/731205301247803413/1373856853775220836).
I will review it and try to fix it for a future version.

___
### When I try to enter a game, it kicks me back out to the game select menu!

This happens when you try to enter a game you do not have unlocked yet. Double-check to make sure you are properly connected
with the LUA and to the Archipelago server.

___
### I got a progressive key in The Great Cave Offensive / Meta Knightmare Ultra, but the block is still there!

Try pausing and unpausing your game to see if it disappears. Otherwise, please report this bug to me directly.
This bug will happen in Meta Knightmare Ultra when re-loading your save. Please make sure to try this first.
(You can also just walk through the block, it'll only be there visually but not physically.)

In a future update, this problem will hopefully be resolved in a better fashion.

___
### I beat a boss/level in Meta Knightmare Ultra, but the check didn't send!

Use the save point to send any checks that may have not been sent. If this does not work, make sure to save
(both in-game and using Control+S in bizhawk) and restart the game.

If this does not work, double check that you are connected before sending a bug report.

___
### Are there any features you plan to add?

Most updates will focus on bug fixes and quality of life. Outside of those, some features I plan to add at a later date are:
- Traps
- Deathlink
- Locking helpers in Helper to Hero based on abilities unlocked
- "Helpersanity" (Locations for each helper in Helper to Hero)
- "Foodsanity" (Locations for each food item)
- "Essencesanity" (Locations for each essence in other modes)

There is no estimate time for when these will be implemented. Other possible ideas can be found in the Trello.

___
### I lost my save game! How do I make sure this doesn't happen again?

In some versions of Bizhawk, there is an option that tries to save the game, but fails. You can turn this options off by
going to Config→Customize, switching to the advanced tab and turning off AutoSaveRAM. If it is turned off, you can
try instead turning it on.

Another way to ensure that Bizhawk saves properly is by saving the game and then going to File->Save Ram->Flush Save Ram,
or pressing Control+S

