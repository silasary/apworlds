Installation instructions:
1. Download the AP world from https://github.com/zane31415/ArchipelagoBG3/releases and double-click the downloaded apworld to install to Archipelago. Launch Archipelago, click "generate templates" (this generates the yaml file).
2. Now for the BG3 mod part. Go to https://github.com/Norbyte/bg3se/releases and follow the installation instructions for the Script Extender.
3. Launch BG3 and at the bottom left of the main menu there should be text for "script extender installed". Start a new game and save, then exit (this is silly, yes, but it generates the Script Extender folder we'll be using later, and we only need to do it once)
4. Go to https://github.com/zane31415/BG3ArchipelagoMod/releases and download the .pak file from the latest release. (https://github.com/zane31415/BG3ArchipelagoMod/blob/main/Archipelago_9d8340ef-8f94-1397-4634-3297a02800d5.pak). Copy it to AppData\Local\Larian Studios\Baldur's Gate 3\Mods\ or wherever your system has your BG3 installation + mod folder.
5. Launch the client: the easiest way is to **double-click the `.apbg3` file** that generation put next to your seed's output — it opens the correct client with your slot name pre-filled. (Alternatively, open "Baldur's Gate 3 Client" from the Archipelago Launcher. Note: this is the Baldur's Gate 3 client, **not** the Text Client — the Text Client will connect fine but items will never reach the game.)
6. Launch BG3, go to mod manager, check the box for Archipelago. Exit mod manager, start new game.
7. If it worked, when you spawn on the tutorial ship a "Archipelago Sync" spell will be added to your inventory.

Items are delivered automatically within a second or so of being received; the Archipelago Sync scroll remains as a manual "force a sync now" button.

Press **U** in-game to open the Archipelago status window: connection state, items/checks counters, recent items, gate locks and a resync button. If the game can't detect a running BG3 client for ~15 seconds it will warn you in-game (that warning is also how you find out you accidentally launched the Text Client).
Changes to base game: Characters will not level naturally, and most rare+ equipment has been removed from lootables.
Items are Level Fragments, and most uncommon+ equipment available in the game, depending on yaml selection.
Locations are either questsanity (complete quest updates) or killsanity (kill hostile creatures).

There is a poptracker available at https://github.com/jeditobe1/bg3-ap-tracker/releases/latest. UT also supports this poptracker.

FAQ:
How stable is this?
Both acts are overall pretty stable (no major bugs in a while). There will still be the odd "hey this check didn't work correctly" as people find obscure paths through quests that I didn't predict (I fix them as I find them), so it is still recommended to save frequently to be able to go back and get missed checks. You can load an old save, do a thing for a check, then re-load your further save and that should work fine.
Known complications: Killsanity targets must be killed by the player- talking bosses to death don't count, and neither does sparing the hag. If you really want the hag's hair with killsanity on, you'll have to kill her and then reload to a save right before killing her.
Some users may experience frequent desyncing from the client- this is frequently due to uncapped fps on Baldur's Gate 3 stealing all the gpu. If you cap it at 60 fps it should work better.

What should I do if I find a bug?
Mostly let me know in the After Dark Archipelago Server, Baldur's Gate 3 channel. If it's new and not obvious, I'll likely ask if you can upload the relevant ap_out.json file in your Baldur's Gate 3/Script Extender/ folder.

Will this work with mods?
If the mod modifies the experience table, no (level 20 mod is the most common problem. Archipelago mod will have to be loaded after it). If the mod removes/replaces monsters, it won't work with killsanity. Few mods modify the story file but if they did it might kill the sync scroll. If the mod adds more items, they won't be randomized. If the mod adds more monsters, they won't be locations for killsanity. Other than that, should work fine.

Does this work in multiplayer?
Yes. Only the host should connect to AP. Other players will still need SE and the mod.

Do you intend to add a specific feature?
I have a long list of planned feature implementation that would probably last me several months at the rate I'll likely have free time to work on it. So if it was a good idea, then probably, but will likely be a while.

Are only levels progression?
Currently. Next version may have more.

What happens if I miss checks?
You should probably make a save for entering the grove the first time, before killing the last goblin leader, and any of the "plot advances" door transitions. I'm not yet at the point that I can change the game to make checks unmissable.

How long will this take?
"Rescue Halsin" is designed to be playable in a 4-6 hour sync if you're reasonably familiar with the game.
Wwargaz is generally a 10-15 hour commitment.
Myrkul is roughly 15-25 hours.
These times are just guidelines- there exist people that will be lower or higher.