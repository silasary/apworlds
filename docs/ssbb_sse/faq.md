# FAQ / Troubleshooting

version: v0.2.0

### Is this safe to use in a multiworld?

Yes, the build is currently mostly stable, just very barebones. Due to the nature of the existing progression, playing alongside other games is recommended to avoid making it too linear.

### What are my checks / items?

[See here](./en_SubspaceEmissary.md#what-gets-randomized)

### My client doesn't seem to be connecting to Dolphin / it's not sending or receiving checks correctly.

This is probably an issue with Dolphin memory engine, which has historically been hard to debug. Some notes:

- Dolphin memory engine does **not** work on Mac, and as such this AP implementation is not compatible with Mac.
- Linux distributions have varying degrees of success, installing Dolphin via flatpak has been found to be the most consistent

### Is there character randomization?

No, not yet.

### Is this compatible with Project: M / other mod?

No, due to Archipelago distribution rules PM and other content mods are not supported and there is no plan to do so. Cosmetic mods should be largely compatible and should be bundled into the SD card folder that is generated before packing.

### Where should I go to start playing?

When you've opened Brawl, navigate to the Subspace Emissary and create a new save file. Opening an existing save file will immediately send all the checks that that save file has completed... which I assume is not what you want.

### I started in the Mario vs Kirby fight instead of the map, is that correct?

Yes, that is currently how the game starts.

### I picked up an orange cube, but I'm not getting a check for it!

At the moment, orange cube checks are granted when you leave the room that the cube was in.

### I entered a level and it glitched out for a second and then let me in while playing Mario.

This is a known bug that has something to do with how SSE stores character unlocks. Specifically, entering a level that doesn't have a starting cutscene without having the prerequisite characters available will cause it to do this and default to Mario. This is being investigated.

### The trophies in the Tabuu room don't match the ones I've received.

Make sure that you launched Brawl using the Minus Launcher and NOT using the ROM directly, see the setup for a more thorough walkthrough.

Additionally, there is also currently a bug where receiving too many items at once can cause them to not get received correctly. If you're sure you received the items and everything is working well, you can have the host manually send the bugged trophies.

### I have an idea for what to add to the randomizer!

You can discuss in the Subspace thread in the Archipelago server, but note that there is a basic roadmap planned out already and some of the more esoteric options are going to be lower priority (don't let that stop you from brainstorming things though).
