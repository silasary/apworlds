# FAQ / Troubleshooting

version: v0.1.1

### Is this safe to use in a multiworld?

Yes, the build is currently mostly stable, just very barebones. Due to the nature of the existing progression, playing alongside other games is recommended to avoid making it too linear.

### What are my checks / items?

[See here](./en_SubspaceEmissary.md#what-gets-randomized)

### Where should I go to start playing?

When you've opened Brawl, navigate to the Subspace Emissary and create a new save file. Opening an existing save file will immediately send all the checks that that save file has completed... which I assume is not what you want.

### I started in the Mario vs Kirby fight instead of the map, is that correct?

Yes, that is currently how the game starts.

### I picked up an orange cube, but I'm not getting a check for it!

For some reason, the orange cube completion is not stored in memory (or at least, the part where I found it) until you have the ability to save. This means either going back to the map or a Great Maze save point.

Note: If you've already completed the level, you can go back to map from the pause menu. You can also lose all your lives and go back to the map, and the completion will still be logged.

### Do I have to do the entire Great Maze?

Yes, there is no workaround at the moment unfortunately.

### I didn't get a patch file!

The current version of the APWorld interacts directly with the vanilla version of Brawl, and patching is currently not needed.

### I entered a level and it glitched out for a second and then let me in while playing Mario.

This is a known bug that has something to do with how SSE stores character unlocks. Specifically, entering a level that doesn't have a starting cutscene without having the prerequisite characters available will cause it to do this and default to Mario. This is being investigated.

### I defeated Charizard at the end of The Ruins and the screen went to black and won't progress.

This is a known issue and has something to do with how Pokemon Trainer is handled. Specifically the game will freak out if you don't have Pokemon Trainer as a party member; because there is no starting cutscene to The Ruins, you have to have obtained Pokemon Trainer via a different level. This is a priority investigation

### I have an idea for what to add to the randomizer!

You can discuss in the Subspace thread in the Archipelago server, but note that there is a basic roadmap planned out already and some of the more esoteric options are going to be lower priority (don't let that stop you from brainstorming things though).
