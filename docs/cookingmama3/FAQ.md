# Frequently Asked Questions
  ***
### How is this meant to be played?
Cooking Mama 3 makes heavy use of the DS hardware. This makes it especially awkward to play on PCs via emulator. However, the original feel of the game can be mostly restored by using a drawing tablet, or a device with a touchscreen or pen built in; as long as it can come reasonably close to the feel of the original DS touchscreen. This AP assumes that you have some method to play the game with somewhat natural touchscreen emulation, so if you only have access to a mouse, you may need to alter your settings to lower the difficulty. Unfortunately, it's just not recommended to play this one with a mouse. It's inevitable, with how strongly this game is tied to the original DS hardware, that it isn't the most accessible game to play on PC.

The microphone, on Bizhawk, is bound, by default, to M. This can be changed in the settings. Just hold this key/button to supply white noise to the game and emulate the microphone.

___

### The pen works very poorly on Windows!
Normal. DS emulators, in general, don't play nice with the default tablet settings on Windows. To fix this, go into your tablet driver settings and disable Windows Ink. Also see if there is an option somewhere to disable pressure support. The specifics of where these options are will change depending on your specific make and model of tablet, so just look around. It's a good idea to make sure that this is a separate profile from your default, if you actually use your tablet for art.

___
### What's the goal?
Cooking Mama 3 isn't a super linear game, so it doesn't really have an endgame, so to speak. It does have trophies, though, which were used as inspiration for this AP's goal conditions. There are 4 goal conditions, which can be separately enabled and disabled, and all take effect at the same time, with the player needing to complete all enabled goal conditions to goal the game. The requirements themselves also have a configurable percentage of completion. You can check your progress towards your goal at any time by entering the Options menu from the Top menu. You also get a trophy on the top screen for each goal condition that has been met.

- Number of Recipes: Recipe Unlocks from the multiworld can act as a goal condition, where a configurable number of received recipes must be obtained. They don't need to be attempted for this setting, just received. At maximum, all 81 recipes will need to be obtained from the multiworld.
- Number of Gold Medals: getting a perfect score, or gold medal, on a recipe will count towards this goal condition. The minimum difficulty at which a gold medal will count is configurable. Each recipe can only contribute one medal, max, to this condition. At maximum, all 81 recipes will need a medal.
- Number of Fed Friends: When a friend has been cooked a meal successfully, it counts towards this condition. It doesn't matter whether the dish is perfect, or which difficulty it's completed in, as long as the dish is successful. At maximum, all 8 friends will need to be fed.
- Number of Special Items: The game has exclusive items that, in the normal game, are meant to be sent from a copy of Gardening Mama via local comms. They normally only unlock one contest each, so they can be configured to also act as goal mcguffins for this AP. There are 4 at max.

___
### Where's the patch? How do I patch it?
No patch! The current version of the apworld depends entirely on client memory editing. Please use a vanilla US ROM. If you usually just double-click the patch on other games to open them in AP, and aren't sure what to do here, consult the setup guide.

There are some pretty notable implementation constraints with not using a patch, but for the most part, I was able to duct tape everything together with just the client. I know nothing about ASM hacking, but would LOVE to learn and hope to use this AP as an excuse to do so. Future versions may require a patch if this ever comes to pass. (If you're knowledgeable on this subject and want to help, please reach out!)

___
### How do I know what I have unlocked?
Recipes, Friends, and shopping minigames will be inaccessible when locked, so those are pretty simple. For ingredients, the client will print out a list of what you have whenever you enter the Let's Match menu, and you'll be immediately kicked out if you try to do a recipe you can't do yet. For cooking contest challenges, look for a stamp on it that says "NEW". It'll look a little off, because it's only supposed to show up on the Special Items challenges, but the client will add this emblem to challenges that are allowed to be attempted. Like before, you'll be immediately kicked out of the minigame if you aren't allowed to do it yet.

To view your special items, go to the Options page in the Top Menu and select "Gardening Mama". you'll be able to see what you have behind the buttons on the bottom screen. For anything else that you may want to check, type /received into the client or check the tracker on the website.

___
### I lost my save/am missing progress/am on a new PC/etc!
Reset the game! Click "Emulation" > "Hard Reset". This will force the server to resync your progress.

___
### Why is my game in italian? / Why are the recipe names scrambled?

![GET BABELED](https://laxbby.space/mama-babel-trap.gif)

# GAME GUIDE:
 ***
#### "Cook With Mama" Mode
this is the top left option in the top menu. Essentially a freeplay mode, it allows you to select unlocked recipes and prepare them. In this mode, there is a screen between recipe steps with instructions. There's also a way to practice individual minigames.

#### "Let's Cook" Mode
this is the top center option in the top menu. This is a "challenge" mode, where you select a friend to cook for, and then try to complete a full dish without failing. In this mode, there is no break between recipe steps, and some guiding marks within the minigames may not be present. It has two submodes:

- **"Make" Mode**: the standard challenge mode, accessed by selecting "Make" on the recipe select screen. In this mode, you may get a silver medal on some minigames and still be allowed to continue.
- **"Platter" Mode**: accessed by selecting the cloche on the recipe select screen. In this mode, if you don't get a gold medal on a recipe step, you automatically fail the dish. You can only get 2 scores: Failure and Perfect (denoted by a crying face and smiling face icon on the recipe respectively)

#### "Let's Match" Mode
The top right option in the top menu. This is how you access the secret recipes in the game. You select 2 ingredients, and are able to prepare the dish as if you were playing in Cook With Mama mode. Each combination of the 6 ingredients will provide a unique recipe, with 15 total. the recipe itself is unknown until you "discover" it, AKA. finish it and get any medal in it. When a secret recipe is discovered, it is also added to the Let's Cook mode menu to be attempted there.

#### "Let's Shop" Mode
The middle left option in the top menu. Here, you can play the shopping minigame, which is basically a frogger-style game where you try to find all of the specified items within the time limit while avoiding bumping into other shoppers. Bumping into them will either make you lose a heart immediately, or force you into a minigame. Minigames occur for a set time, and if done perfectly, can be used to regain a heart, or if failed, can cost a heart. A score is calculated based on how many of the items you obtained, how much time you spent, and how many hearts remain. There are 4 difficulties of the shopping minigame, each with different maps, shoppers and minigames, and items to obtain.

#### "Cooking Contest" Mode
the center option in the top menu. This is effectively a Time Trial or Time Attack mode. You must finish a task as many times as you can within the time limit to aim for the high score. There are 16 that are normally available immediately, and an additional 4 can be unlocked by transferring items from a copy of Gardening Mama over local comms.

#### "Write in Diary" Mode
the middle right option in the top menu. Any time you complete a dish, you have the option to add a picture of it to this diary. From this menu, you can look at your pictures and apply unlocked stickers to them. These stickers play a silly little animation when tapped with the stylus.

#### "Let's Get Fancy" Mode
the bottom left option in the top menu. Used to dress up Mama with the clothing items that you have unlocked. This is purely visual.

#### "Change Design" Mode
the bottom center option in the top menu. Used to customize the kitchen appliances and top screen. Also purely visual.

#### "Options"

the bottom right option in the top menu. Allows the save file to be deleted, allows the player to view the Special Items which can be obtained via local communication with Gardening mama, allows sending a demo of the game over DS Download Play, and finally allows you to view the credits.

When this option is selected in the randomizer, it will tell you your goal progress and a few relevant settings.

 #### Other Stuff

 - **Medals**: In all 3 cooking modes, each step has its own score, which is tallied at the end to give a score of 0-100 for the whole dish. A perfectly cooked dish is a Gold Medal, a well-cooked dish is a Silver Medal, a poorly cooked dish is a Bronze Medal, and a failed dish is a Lead Medal. Unique to the "Let's Cook!" Platter mode is the Smiley Face, which acts as a gold medal, and the frowney face, which encompasses everything else.
 - **Bonus!**: Completing a recipe step especially well will award you with a "Bonus!". When the dish is completed, the Bonuses you earned will be tallied up: every 5 bonuses, you get a prize.
 - **Presents**: As mentioned above, you get presents for getting enough bonuses to fill the bonus meter. They also appear when reaching certain milestones in the cooking modes, shopping modes, and challenges. In the vanilla game, this is how you unlock Recipes, Friends, and accessories. These popups still appear in the randomizer but are nonfunctional.
