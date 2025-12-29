# Archipelago: How to "Randomize" Path of Exile 
Hi there! If you're reading this, you've been stranded in Wraeclast for far too long. You think you've done it all. You're looking for a new challenge. Something that has lower stakes than the Gauntlet, maybe more restrictive than SSF, but customizable, and something you can still do with your friends. Well, with this guide, you're going to learn about **Archipelago's Multiworld Randomizers!**

## What in the name of Innocence is that?
[Archipelago is an online or locally hosted service](https://archipelago.gg) that can randomize and mix together items and abilities in a game, or multiple games, in order to create a hectic experience that is never the same twice. Using the multiworld randomizer, you can krangle the progression of any supported game into a fresh experience, with only a few minutes of preparation!
What's more, multiple, completely different games can be randomized together, with a different person playing through each, discovering upgrades and trap items to help (or hinder) their teammates! 
For example, Player A completes a mission in Starcraft 2, and discovers Player B's ability to Double Jump in Super Mario 64; this allows Player B to collect the last Star they need to grant Player C the last badge they need to fight the Elite Four in Pokemon Red!

## Hang on, is this going to get me banned? Path of Exile is always online!
You're right. Since so much is processed on the backend of POE's servers, we are relatively limited on how we can interact with the client, while still being within the TOS. Rest assured that this program is completely above-board, we have gone to great lengths to stay within the TOS so that nobody gets banned! If that's enough for you, you can skip to the next section.

The Randomizer uses specifically allowed actions: one-button-one-action macros, reading the Client.txt and API, and editing loot filters. Every process used by the Randomizer only interacts with open information that a normal user could feasibly access, and updates using Path of Exiles Chat commands. The program reads the Client.txt file to see when you enter a new zone, to "unlock" something, and also when you're "breaking the rules" and using something you haven't unlocked yet. When you change zones, the API and the Client update and read your inventory to see what you've collected. Then, it updates your Loot Filter to highlight items that would let you unlock something, and stop highlighting gear you've already "checked".

## Can you boil that down for me a little more? ELI5.
Getting down to brass tacks: 
When you start your "run", you'll have your choice of class (or let the Randomizer decide). You'll log in to the beach, run the program by sending a command, and start bashing zombies. Every time you carry over an item base through a loading screen for the first time, you'll "Check" it for whichever "Item" in the Randomizer has been assigned to it. If you're playing solo, that means it'll probably be a Skill or Support gem, which you can then use for the rest of your run; any items that you haven't Unlocked are off-limits!

## This sounds too hard/too easy/too long! What can I do about that?
*A lot!* There's a bunch of different settings to make your run easier, shorter, more punishing, etc. The scope of your run can be as short as beating Merveil, or clearing all Ubers. You can start with all or none of your flasks unlocked. You can restrict how many gem links you're allowed to have. You can even make it into a Uniques Only, Gucci Hobo run. All of those options, a combination of them, and more, can all be configured freely at the start of your run!

# Getting Started
Okay, so! You've got a picture of how it works, and what happens in a run. Let's start talking about what you need in order to play Path of Exile randomized with Archipelago. *Hold on to yer' cockles!*
**Note: these instructions will be with Windows in mind!** Other operating systems may vary.

### Before We Begin, you will need:
* Path of Exile installed and playable. You can [download it for free here!](https://www.pathofexile.com)
* Python 3.12 installed (Python 3.13 will not work). You can [download that here.](https://www.python.org/downloads/release/python-31210)
Both of those have their own steps, and I believe in you to get them sorted out.
* Your Path of Exile's `Client.txt` file path.
* Your locally installed Loot Filter's file path. (This is optional, but strongly recommended.)

## Act One: Install Archipelago
1. [Download the latest Archipelago release here.](https://github.com/ArchipelagoMW/Archipelago/releases) 
![The Releases section looks something like this. You DO NOT want the Source files.](https://i.imgur.com/FsQAiHS.png)
2. Run the .exe from anywhere, and install Archipelago to a convenient location. You will need to find the files and folders there later.
![Example installation directory.](https://i.imgur.com/o9rSerw.png)
3. Run ArchipelagoLauncher.exe, just to make sure it's working. Consider making a shortcut for it, since you'll be using this specific .exe file a lot!
![Your Archipelago installation folder should look something like this.](https://i.imgur.com/VjUVKAR.png)
4. Download the latest version of the PoE .apworld file. 
![Download poe.apworld. Again, you DO NOT want the Source files.](https://i.imgur.com/oM7p0kP.png)
5. Place the `poe.apworld` file you just downloaded into the `custom_worlds` folder of your Archipelago installation.

![Drag the file itself into the custom_worlds folder. It should not be an archive or in any other folders.](https://i.imgur.com/BVDOAgg.png)

## Act Two: Generate a Multiworld or Solo Run
You need to tell the randomizer what sort of run you want to do, and decide what setting to enable. To do this, you need to create a .yaml file, which is a text file that the program can read.
If you are doing a solo run, then you only need one .yaml file. If you are doing a multiworld with friends, then each person needs their own .yaml file.

There are a couple of ways to do this;
* Using one of these sites
  * https://ap.stripesoo7.org/games/Path%20of%20Exile/player-options
  * https://multiworld.gg/games/Path%20of%20Exile/player-options
* Generate and edit the yaml directly from the Archipelago Launcher.

### YAML Explanation
Okay, this one has a LOT of moving parts. As versions progress, some descriptions may change slightly, and some options may be added. Every option has a short paragraph explaining what it does. However, I will briefly explain some of the important settings: 

* **name**: This is the username for your "player slot" in the multiworld. If you're playing solo, you can leave this as is, but when playing with friends, change it to something relevant, like `ChrisWilsonsBeard`or `Mathil2`. 
* **progression_balancing and accessibility:** TLDR: these make your run easier or harder. I recommend just leaving these alone. 
* **goal**: This determines what your main objective is. By default, it is set to killing Kitava in Act 10. If you want a different run, then set `complete_the_campaign` to `0`. If you still want an act to be your goal, set your desired Act's completion to `50`. If you want the goal to be beating a given set of bosses, change `defeat_bosses` to 50. In that case, you will also need to define how many bosses you need to beat, and what the pool of them is. 
* **starting_character**, **ascendancies_available_per_class**, and **allow_unlock_of_other_characters**: This sets what Class you have available at the start, how many Ascendancies can be unlocked through your run, and whether or not other Classes can be unlocked. `starting_character` is set to `random` by default, so if you want one in particular, set that desired class to `50` and `random` to `0`. 
* **usable_starting_gear**: This determines how many of the items that you get from the Twilight Strand you're allowed to actually use. `starting_weapon_flask_and_gems` means you're playing normally. `starting_weapon_and_gems` means you won't be purely Default Attacking, and is the default. 
* **add_passive_skill_points_to_item_pool**: This option means that your number of spent skill points is capped, and can only be increased by unlocking a higher total.
* **add_leveling_up_to_location_pool**: This option means that your character's level can unlock items in the multiworld.
* **start_inventory**: This is a list of items that you start with. By default, it is empty, but you can add things to it.


There are many ways to play Path of Exile randomized. 
- For a run that still goes through the campaign but doesn't have as much of a grind, you could use an existing character that is already in the late game, respec all the points, deposit all the items, turn on `add_leveling_up_to_location_pool` off, and `add_passive_skill_points_to_item_pool` on, and enjoy! 
- For just a quick run, you could set the goal act, and start with your class's weapon, gem, and flasks unlocked.
- Or the standard run, where you start a character in SSF with nothing, and have to unlock everything as you fight though the campaign.

I encourage you to experiment with the settings to find something that works for you!

### Generating wtih the Launcher
1. Run `ArchipelagoLauncher.exe` either from your installation folder, or a shortcut. 
![Just like before, you can find it here.](https://i.imgur.com/VjUVKAR.png)
2. Generate the Template files for your Game Randomizer settings by clicking Generate Template Options. You can find this button near the bottom of the list, so either scroll down or use the Search bar.
![The Generate Template Options button is close to the bottom. Either scroll until you find it, or simply search for "generate" or "template" in the search bar.](https://i.imgur.com/0TgGtyh.png)
3. Navigate to the `Path of Exile.yaml` template file that was generated, and open it. From the main installation section, you can find it in the Players folder, and then the Templates folder. There will be a LOT of other games in here, so just keep scrolling
![The Template File is in the Templates folder, which is in the Players folder of the main installation.](https://i.imgur.com/NfJjGMm.png)
4. Edit your Randomizer's options by editing the `Path of Exile.yaml` file. 

Once you have your `.yaml` file set up the way you want, you need to save it, and use it to generate a multiworld. If you're doing a solo run, then it's just your file, take it and place it in the Players folder. If you're generating a multiworld, then each person needs their own `.yaml` file in the Players folder.
![Save your .yaml to the Players folder, not the Templates or main folder.](https://i.imgur.com/o19g5bF.png)
### Branching Path: If you are playing a solo Randomizer, or are Hosting a Multiworld:
6. Make sure all relevant `.yaml` files are in the Players folder. If you're solo, then it's just yours, and if this isn't your first run, then ensure that you don't have any old ones in there.
7. Run `ArchipelagoLauncher.exe`, and click Generate. In longer runs, or runs with several games, this process can take more time, and it's also slightly hardware dependent. However, if you're playing Path of Exile, then your computer is plenty strong enough to not take very long here.
![The Generate button is close to the top. If you miss it, you can use the search bar.](https://i.imgur.com/r2L3poo.png)
8. From the [Archipelago website, go to Host Game,](https://archipelago.gg/uploads) and click Upload. This will ask you to select the archive file that was generated into the Output folder.
![There is a way to Host runs locally. That option is outside the scope of this guide... mostly because I have never used it.](https://i.imgur.com/0BUfkVx.png)
9. Click Create New Room, and make note of the Address and Port. It should look something like `archipelago.gg:42069`. 

### Branching Path: If you are in a multiplayer Multiworld, and someone else is hosting it: 
6. Send the Host your `.yaml` file. Make sure that they ALSO have the same `poe.apworld` as you installed into their `custom_worlds` folder.
7. Wait for their link, and the port for the lobby.

## Act Three: Installing PopTracker
This step is ***technically optional, but highly recommended!*** PopTracker is another program that can keep  of, and visually display, the items and gems that you have unlocked. It supports multiple games, so it's not exclusively useful for randomized Path of Exile. 
If you are not interested, skip to Act Four.
1. Download [the latest version of PopTracker from here.](https://github.com/black-sliver/PopTracker/releases).
![PopTracker supports multiple operating systems, but this guide is written for Windows users.](https://i.imgur.com/Qcpm1eG.png)
2. Extract PopTracker to a location of your choice. I chose my Archipelago installation to keep them in the same place.
3. Download [the latest version of the PoE Archipelago PopTracker data.](https://github.com/stubobis1/PathOfExilePoptracker/releases)
![Say it with me: You don't want the source code.](https://i.imgur.com/r170mXv.png)
4. Put that archive file you downloaded into the Packs folder, in the poptracker's folder.
![No need to extract the folder, just put the whole archive into the packs folder.](https://i.imgur.com/ETwXW8T.png)
5. Launch `PopTracker.exe` from the installation folder, or a shortcut wouldn't be a bad idea.
![Right here. A shortcut could be helpful to you.](https://i.imgur.com/Bk9f396.png)
6. Click on the AP button at the top, then fill in the pop-ups with your room's information. If you did that correctly, then the AP button will turn green.
![Your tracker will look like this when it's not connected. That itty bitty AP button is the one you want.](https://i.imgur.com/bYpX79B.png)
7. Sometimes the poptracker will get out of sync with the server. If you think this has happened, then click the refresh button again to fix it.

## Act Four: Start the Client
1. From the Launcher, click the button for Path of Exile. This will open up a new window.
![Scroll down until you find the entry for Path of Exile, or use the search bar at the top of the menu.](https://i.imgur.com/k25azjs.png)
2. At first, the screen will have a list of useful commands to use. In the top bar labeled `Server`, enter the server address and port, and click Connect. Then, enter the name you used in your `.yaml` file at the bottom when prompted.
![We will use these commands in the steps ahead!](https://i.imgur.com/sOgGAvj.png)
3. The client should tell you which class you have access to, this can also be found by using the `/received` command, or in the poptracker.
![You can use /received later as well, but if you do, then it will include EVERYTHING you have unlocked.](https://i.imgur.com/wy2IPp7.png)
4. Use the `/poe_auth` command to authenticate your session with PoE's servers, and click Authorize. This is how the client is able to get information from your account. It is secure, to keep your account information safe from sketchy services, and explains exactly what information will be shared. As you can see, the only information being requested is information that would be visible to anyone looking at your profile online.
![This is a security measure to keep you informed about what information services are requesting. Archipelago doesn't need any info that wouldn't be visible at a glance on your website profile page.](https://i.imgur.com/xhkS4yq.png)
5. In Path of Exile, choose your character. Note your character name for the next step.
6. Use the `/char` command **followed by your character's name** in the Archipelago Client to set which character the Randomizer is tracking.
![This one's easy.](https://i.imgur.com/nCGocCk.png)
7.  Set your  `client.txt`  path by using the  `/client "C:\File\Path\Here"` command.  Adjust the file path as needed - you did write this down earlier when I asked, right? Note the Quotation marks, they ARE important!
![You MUST include the quotation marks, but you don't need to append "Client.txt", the program can detect that on its own.](https://i.imgur.com/IOPNHEW.png)
8. Set your base item filter by using the `/filter <filterNameHere>.filter` command. This needs to be an item filter that you've saved locally, not one that you've subscribed to. Usually, this place is something like `C:\Users\<USERNAME>\Documents\My Games\Path of Exile`. I created a custom filter specifically for Archipelago, but you can use any filter as a base, such as one of the Neversink variants.
![I created a custom filter specifically for Archipelago, but you can use any filter as a base, such as one of the Neversink variants.](https://i.imgur.com/pEnvwWf.png)
9. if you want to change your deathlink setting, you can use the `/deathlink` command to toggle it on or off.
10. Use the `/start` command to officially start your run. If you did the above steps properly, then you should see something like this image: a weird yellow-ish weapon label on the ground - indicating that it's an item you haven't checked yet - and the message `Item Filter loaded successfully.` in chat. 
![If you reached this point and did it all properly, then what you see should be something like this.](https://i.imgur.com/JpgjZ4Z.png)
# Epilogue: Tips, Tricks, and Commands
If you successfully got this far using this guide, then I am a happy man! Now we get to talk about some of the more boring stuff. If you're having some troubles, then this section should be useful. 


## Server Commands
This is a short and sweet, quick reference list of commands that you might want to use during your run.**In order to use them, you must whisper them to yourself in-game,** and not send them in any other chat channel, nor use them in the Archipelago client! For example: `@StabStainSteve !goal` will remind you what your run's target goal is. 
```
!ap char                  - Set your character
!deathlink                - Toggle DeathLink
!goal                     - View your current goal
!passive or !p            - List usable passive points
!usable skill gems        - List usable skill gems (by level)
!usable support gems      - List usable support gems
!usable utility gems      - List usable utility gems
!usable gems              - List all usable gems
!main gems                - Show main skill gems received
!support gems             - Show support gems received
!utility gems             - Show utility gems received
!all gems or !gems        - Show all gems received
!gear                     - Show usable gear
!weapons                  - Show usable weapons
!armor                    - Show usable armor
!links                    - Show maximum link allowance
!flasks                   - Show flask unlocks
!ascendancy               - Show unlocked ascendancies
!help                     - Show help message
```
## General Troubleshooting and Notes

- Keep the Archipelago client running while you play PoE. Not only is it necessary, but it also tells you what Items are sent, when they're sent, and which player is sending and receiving them! 
- Checks are only sent when you  **enter a new zone**. If you pick something up and nothing happens, don't panic!
- If you're using a gem you shouldn't be, too many flasks, or any other thing that you don't have unlocked, then you are considered "Out of Logic" and will be unable to send Unlocks until you resolve this issue! The in-game chat will message you with a brief explanation.
- Make sure your PoE logs are being read (client should detect zone changes and chat whispers). If you haven't seen any update in a while, make sure that your file paths are set correctly.
- F11 will restart the client if you run into issues.
- F12 will force the client to do a check. The API still only updates when changing zones, but this is helpful if something gets messed up. (Such as if the client.txt is unreadable, or you move in a new zone before the command is sent.)
- If you get problems when you are trying to write the filter, it could be Windows OneDrive interfering. Try disabling OneDrive. 

## Personal Advice
After playing through a few runs, I've learned a few pieces of advice that might be useful to you. Or not. I'm just an Exile. 
* The starting levels before you get a couple solid skills can be very slow and very rough. Having to fight Brutus with an unlinked Burning Arrow and a white bow is not out of the question. I often have to fist-fight Hailrake to death. There's no shame in starting with your class's gem, weapon, and flasks all unlocked!
* Speaking of which, starting with no flasks can make it take even longer. Think about how many times you use a skill before you beat Brutus to get Clarity... and then remember that you would have to *Unlock* Clarity before you can even use it.
* Using a Town Portal to offload some items to check from your inventory is not only valid, but encouraged. 
* As any SSF Enjoyer would tell you: vendor recipes are extremely useful, and don't neglect your crafting bench! 
* Many skills are considered Bad in endgame, but if all you have to do is kill Kitava, then there are many, many more options on the table. Use the tools you have!
* If you're diligent in picking up items, then it's very likely that you'll fully clean up the list of checks as you go through an act. Speedrunning is nice, but remember, more loot means more unlocks!
* **Most important above all else:** This is still a game. *If you're having fun, that's the only thing that matters!*
---