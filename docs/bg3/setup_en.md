Changes to base game: Characters will not level naturally, and most rare+ equipment has been removed from lootables.

Items are Level Fragments, and most uncommon+ equipment available in the game, depending on yaml selection.

Locations are either questsanity (complete quest updates) or killsanity (kill hostile creatures) or containersanity (open chests/vases/bookcases).


Installation instructions:
1. Download the AP world from https://github.com/zane31415/ArchipelagoBG3/releases and double-click the downloaded apworld to install to Archipelago. Launch Archipelago, click "generate templates" (this generates the yaml file).
2. Now for the BG3 mod part. Go to https://github.com/Norbyte/bg3se/releases and follow the installation instructions for the Script Extender.
3. Launch BG3 and at the bottom left of the main menu there should be text for "script extender installed".
4. Go to https://github.com/zane31415/BG3ArchipelagoMod/releases and download the .pak file from the latest release. (https://github.com/zane31415/BG3ArchipelagoMod/blob/main/Archipelago_9d8340ef-8f94-1397-4634-3297a02800d5.pak). Copy it to AppData\Local\Larian Studios\Baldur's Gate 3\Mods\ or wherever your system has your BG3 installation + mod folder.
5. Launch BG3 and at the bottom left of the main menu there should be text for "script extender installed". Go to mod manager, check the box for Archipelago. Exit mod manager, start new game (with the archipelago mod enabled), cast the sync scroll once, then save and exit (this is silly, yes, but it generates the Script Extender folder we'll be using later, and we only need to do it once). Now exit that game.
6. Launch the client: the easiest way is to **double-click the `.apbg3` file** that generation put next to your seed's output — it opens the correct client with your slot name pre-filled. (Alternatively, open "Baldur's Gate 3 Client" from the Archipelago Launcher. Note: this is the Baldur's Gate 3 client, **not** the Text Client — the Text Client will connect fine but items will never reach the game.)
7. Launch BG3, go to mod manager, make sure the Archipelago box is checked (probably still checked from earlier, but still). Exit mod manager, start new game.
8. Play the game. Enjoy!

If you are playing in v0.7.0 or later, you can press **U** in-game to open the Archipelago status window: connection state, items/checks counters, recent items, gate locks and a resync button. If the game can't detect a running BG3 client for ~15 seconds it will warn you in-game (that warning is also how you find out you accidentally launched the Text Client).
If for some reason the connection seems to stall out or if blocked entrances aren't cleared, casting the sync scroll has a backup system attached to it that _should_ fix any issues. If it doesn't, please let me know.

There is a poptracker available at https://github.com/jeditobe1/bg3-ap-tracker/releases/latest. UT also supports this poptracker.

FAQ:
How stable is this?
BG3 currently supports Act 1 and 2, with location checks being killsanity, questsanity, and/or containersanity and allows entrance blocking as a toggle. I am treating the game as Stable in that very few game breaking bugs have surfaced for a while, mostly individual checks being slightly wonky, but I address those as people find them. Still, there are some things to note:
1) A lot of people have difficulty with first run setup. It is highly recommended that you start a solo run to the point that you see locations sending in the client before adding it to a multiworld.
2a) Killsanity is quite stable, I don't think I've had a report on that in ages (and when I do it's because the player wasn't the one that killed the NPC - no environment or cutscene deaths).
2b) Questsanity is skirting at the Stable line at this point- there are frequently bugs that are confusing that get fixed as they get reported. Players will occasionally hit a "oh that's a path to do that quest I didn't account for", but usually this can be resolved by reloading a save and trying differently. The game is very friendly to reloading saves- you will get all of the gear and levels even if you reload a very early save, and then you can go back to your main save. These problems are usually pretty sparse, but they can happen, and they were why I took a while to mark this as Stable.
2c) Containersanity is test only.
3) Block entrances is relatively new- adding hard logic instead of soft logic (experience levels) to the game. There have been minor logic bugs but they are pretty rare edge cases and I'm fixing them as we find them.
4) v0.6.3 has more questsanity bugs in it, while v0.7.0 includes a connection channel change that is new - while it has been tested, there are potentially edge case issues. If you want the most stable version possible, v0.6.3 killsanity only is probably it.
What should I do if I find a bug?
Mostly let me know in the After Dark Archipelago Server, Baldur's Gate 3 channel. If it's new and not obvious, I'll likely ask if you can upload the relevant ap_out.json file in your Baldur's Gate 3/Script Extender/ folder.

What are Blocked Entrances?
* Nautiloid Control Panel
* Wither's Crypt
* Blighted Village Well / Underdark (it's only the Well for Halsin goal, otherwise Underdark)
* Goblin Camp
* Hag's Fireplace
* Zhentarim Basement
* Grymforge
* Mountain Pass
* Creche
* Act 2
* Last Light Basement
* Reithwin's Mason's Guild
* Shar Trials
* Progressive Moonlight Towers * 5

Will this work with mods?
If the mod modifies the experience table, no (level 20 mod is the most common problem. Archipelago mod will have to be loaded after it). If the mod removes/replaces monsters, it won't work with killsanity. Few mods modify the story file but if they did it might kill the sync scroll. If the mod adds more items, they won't be randomized. If the mod adds more monsters, they won't be locations for killsanity. Other than that, should work fine.

Does this work in multiplayer?
Yes. Only the host should connect to AP. Other players will still need SE and the mod.

Do you intend to add a specific feature?
I have a long list of planned feature implementation that would probably last me several months at the rate I'll likely have free time to work on it. So if it was a good idea, then probably, but will likely be a while.

Are only levels progression?
Levels are soft progression gates, and Block Entrances (if enabled) are hard progression gates.

What happens if I miss checks?
You should probably make a save for entering the grove the first time, before killing the last goblin leader, and any of the "plot advances" door transitions. I'm not yet at the point that I can change the game to make checks unmissable.

How long will this take?
"Rescue Halsin" is designed to be playable in a 4-6 hour sync if you're reasonably familiar with the game.
Wwargaz is generally a 10-15 hour commitment.
Myrkul is roughly 15-25 hours.
These times are just guidelines- there exist people that will be lower or higher.