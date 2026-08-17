# Scorpion Swamp

## What is Scorpion Swamp?

Scorpion Swamp is a gamebook written by Steve Jackson (US) for Steve Jackson (UK) and Ian Livingstone's Fighting 
Fantasy series. It features the player choosing one of three quests and entering the titular swamp to complete them.

This implementation connects to a specialized companion app that facilitates communication with Archipelago and
automates statistic and inventory management, but you will still require a copy of the book.
For more details, read the [setup guide](setup_en.md).

## What is randomized in this game?

Each one of the locations within the game in which you find an item not directly related to your quest is a viable
location for this game. The 'quest' items (Amulets, the Map to Willowbend, and the Antherica Berry) are not shuffled
to ensure that you won't just end up goaling the game before even really getting a chance to begin.

Beyond that, there are options to include all the Spell Gems that you can be given throughout the game as additional
locations, add extra locations at each of the game's bad endings, to restrict which quests you have access to until you 
receive unlock items for them, and to restrict access to the clearings within the
swamp behind getting items to allow you to enter them. The developer recommends turning all of these options on as 
without them the game is quite short and completely open, but feel free to mix and match as you desire. Playing without
these options will give a nearly vanilla experience which could be preferable for an initial playthrough.

Alongside adding additional locations there is also the option to add progressive statistics. These items increase the
base level of your Skill, Stamina, and Luck when your character is created at the beginning of each run by one (two in
the case of Stamina). So, for example, with three Progressive Skills your Skill will range from 10-12 rather than the
usual 7-12. Note that these items are never considered by logic; all battles are considered winnable and all statistic
checks passable with nothing. These items are just for convenience.

Logic may expect for you to fail statistic  checks (usually Tests of Luck); there is an option built into the Ren'Py
port that will make it so that you always fail ensuring that these are always accessible even if you have high stats.
Logic, especially with -sanity settings on, will likely require you to restart the game at least once.