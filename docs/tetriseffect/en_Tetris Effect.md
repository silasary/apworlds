# Tetris Effect: Connected

This is the Archipelago randomizer for Tetris Effect: Connected. For information on how to setup, visit the [setup guide](/worlds/tetriseffect/docs/setup_en.md)

## What does randomizing this game do?
You can expect the following things when randomizing this game:
### Items
These will be shuffled in the multiworld and you will need to receive their corresponding item to be able to use them/play them:
- All levels on the story mode.
- Optionally all Effect modes, with the ability to exclude the modes you wouldn't like to play.
- The zone mechanic
- (Unimplemented) Tetrimino pieces

### Locations
The following are things you can do to send checks in the multiworld:
- Completing a stage or Effect mode
- Obtaining ranks. The maximum obtainable rank is configurable as to accommodate logic for the player's skill. This locations can also be disabled on your YAML.
- Doing tricks, such as making a certain amount of Tetris clears and T spins, combos, all clears and T spin triples.
- Finishing zones with a certain amount of lines, from octotris to kirbtris.
The amount of trick and zone locations can be configured as to allow for amounts that the player would like to do, and to disable those that they don't feel like doing or are impossible skill-wise.

### Goal
Your goal is to clear your set amount of level clears in your YAML and clear the final stage of the story mode, Metamorphosis.
More conditional goals, such as requiring to full clear the story mode, will be added later.


## How to set-up
For information on how to generate and install the mod, head over to [the setup guide.](/worlds/tetriseffect/docs/setup_en.md)
If you are having trouble, reach out to me in the discord thread and I'll help you!


## Things to note
### Online features and scores
The mod can be capable of slightly boosting your score in the form of filler items, therefore, offline mode is forcibly on to prevent non realistic entries for the player to the leaderboards. It is nothing big anyways, it will at most give you 1000 points of score, not put you at 999 million or something stupid.
New personal bests might still get saved as I haven't found a reliable way to prevent saving (altho again, the score boosts are nothing huge).

### What is planned for the mod?
This mod is still in development and is missing features. This will be a checklist for what needs to be added for being called a stable release, somewhat ordered on priority:
- Implement minosanity
- Implement filler items actually doing something
- Make the text log fade out when inactive
- Implement Connected mode

### How to report a bug
If you want to report a bug please explain what happened with your log file attached either on the Tetris Effect: Connected thread in the Custom Games channel on the Archipelago server or open a new issue here on GitHub.
Your log file should be located on `<Game Location>\Tetris Effect Connected\TetrisEffect\Binaries\Win64\ue4ss\UE4SS.log`. Have in mind that the log file gets cleared every time you open the game.


## How do I return to the normal game?
There are 3 options to do this. See the [Returning back to the normal game](https://github.com/ZatchyBeeps/Archipelago-TEC/blob/main/worlds/tetriseffect/docs/setup_en.md#Returning-back-to-the-normal-game) section on the setup docs.


## Know issues
This is a list of issues I already know of
### Unlock by groups causes generation errors
This issue is acknowledged and I'm trying to fix it, altho this is requiring a rewrite that is currently in progress
## Lines given by traps or death link don't have holes
While they can be detrimental on quantity, they are not permanent. Simply use the zone and they will not only go away when finished but they will also be added to the zone's total amount of lines cleared. This is obviously not the case if the zone is locked so unfortunately you would slowly get screwed in this case.
I am still looking on how to add their holes.