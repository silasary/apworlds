# What is Archipelago?

Archipelago (AP for short) is a multiworld multi-game randomizer.

...what?
<br>
First of all, it's a randomizer, i.e. it takes a part of a game and either shuffles things around 
or puts in completely random values. In shapez 2 specifically, all shape requirements for milestones, jobs,
and operator lines are random and the order in which you unlock all your buildings and mechanics is shuffled 
(and they can even be located in jobs!).

Now, what does the multi-game part mean? - The system that shuffles the buildings and mechanics is standardised in AP, 
which means you can apply it to (theoretically) every game. And as of writing this, hundreds of hobby developers 
have made over 500 games compatible with AP, which now also includes shapez 2 (and shapez 1 has been compatible for 
quite some time already).

And now the "multiworld" part:
<br>
The randomizer allows you to specify more than just one playthrough (here called "world") to be included in 
randomization. In that case, it
will grab all the items out of a game (in shape 2's case, those are the buildings), shuffle them around, and put them 
back into the worlds. This way, player 1 can suddenly find the painter of player 2 in their own game! And if they 
unlock that item, it will be automatically sent to the other player. This essentially creates multiplayer for shapez 2
...no, actually for (theoretically) all games ever created!

And last but not least, if you added 1 and 1 together, you might have figured out that you could specify two players
with different games, which creates **universal cross-game multiplayer!**

Though, the setup is a bit complicated, so let me explain it quickly:

## How to create a randomized shapez 2 playthrough

1. Download the Archipelago software and install it: https://github.com/ArchipelagoMW/Archipelago/releases
2. Download the latest shapez 2 apworld: https://github.com/BlastSlimey/2hapezipelago/releases 
   (this is the "plugin" for the AP software to know how to handle this game)
3. Install the 2hapezipelago mod from the Steam Workshop, allowing Steam to download all of its dependency mods
   - As of writing this, the mod is incompatible with the latest apworld and should thereby be skipped for now
4. Put the apworld into `<AP install folder>/custom_worlds`, or on Windows, double-click it and AP will install it 
   to the custom worlds folder automatically
5. Run the AP Launcher
6. Select Tool -> "Options Creator" -> shapez 2 (you'll have to scroll all the way to the bottom to find it)
7. Change the options to your liking (hovering over an option's name will show you some information)
8. Click "Export Options" and save the file to `<AP install folder>/Players`
9. In the Launcher, click "Generate"
10. If everything went right (i.e. no error message), a zip file has been created in `<AP install folder>/Output`
11. Open that zip file and extract the `.spz2scenario` file with your player name
12. Either double-click the `.spz2scenario` file or click "Open Patch" in the Launcher
    - A folder selection window might pop up if the save data folder could not be detected automatically
    - If everything went right, a success message will pop up at the end
    - Doing so again with a different generated seed will overwrite the already installed scenario
13. Restart the game
14. Create a new save file and select Classic -> "Archipelago (Player name)" as the scenario. However, a bug in the 
    main game causes the button is partially cut off in the UI. If it isn't clickable, change your UI scale in the 
    game's settings. This can also be fixed using LiAuO2's Better Scenario Screen mod from the workshop.

If you play a singleplayer randomizer, you can jump straight ahead into the gameplay. Otherwise, I'd recommend reading
the tutorials on https://archipelago.gg/ since that requires a bit more knowledge if you don't have someone 
else who hosts the "multiworld".

To connect to your multiworld's room, follow the directions on the [setup page](./setup_en.md#playing-your-slot).

If you have any questions, bugs to report, or need help with something (either this game or AP in general), join the
Archipelago Discord server and look for the shapez 2 thread in `#custom-games`.