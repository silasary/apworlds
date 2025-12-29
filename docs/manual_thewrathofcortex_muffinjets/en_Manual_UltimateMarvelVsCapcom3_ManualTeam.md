# Manual

## If you are familar with what Archipelago and Manual games are, skip down to "The Wrath of Cortex" below!

## If you are NOT familiar with Archipelago, check out https://archipelago.gg/ to get started!
This "randomizer" functions using the Archipelago Multiworld system and does not work without it.

## What is a Manual game?
A Manual game is a custom game that you've set an item list and location list for so that any game can be included in a multiworld game. You'll manually mark locations checked, and you'll manually restrict what items you use based on the items you've been sent. 

## Where is the settings page?
The player settings page for this game is located <a href="../player-settings">here</a>. It contains all the options
you need to configure and export a config file.

## What does randomization do to this game?
You specify your list of "items" and "locations", and Archipelago will randomize your items across your world and others, and items from this world and others into your locations. Essentially, anything you can use or that progresses your goal can be an item. Anything you can check can be a location. If multiple people are playing the same game as a Manual game, they can all have different items and locations.

## What is the goal of a Manual game when randomized?
The goal is to achieve a "Victory" condition, which is available in the location list in the client. What that Victory condition is... is up to you! It can be beating the game, beating a subset of the game, checking all locations, race to get to an important objective, etc.

## Which items can be in another player's world?
All of the items that you specify in your item list can be in another player's world.

## What if I have items, unlocks, or locations that I'd like to not have randomized?
It's all manual. Just exclude them from either the item or location list. 

## How do I install the mod for a Manual game?
You don't. There is no mod. The tasks of marking locations as checked and limiting your items used based on items received is all performed by you (the player) while using the Manual client and its accompanying tracker.

# Crash Bandicoot: The Wrath of Cortex

## Which version of the game does this work on?
This will work on every version of TWoC, including the PS2, Xbox, and GCN games, as well as every re-release on those platforms.  No content exclusive to any one version (namely, the GBA Crash Bandicoot Blast! minigame) is included, however there are some key version differences that you should understand to get the best experience out of the game, that will be explained below.

## How do I play this game?
Following the progression of the game, each VR Hub is locked away by gathering increments of 5 Power Crystals.  Each collectable featured in each of the levels will send an item to the multiworld:
 - Power Crystals (25 total)
 - Clear Gems (41 total)
 - Colored Gems (Red, Blue, Green, Purple, Yellow, 1 of each)
 - Relics (30 total)

## What is the goal of this game?
There are two options for a goal, but since the logic is identical in both secenarios, the goal choice is NOT a yaml option and is something the player will have to manage on their own.
 - Gather 25 Power Crystals and clear Crunch Time
 - Get 106% completion
Since roughly half of the item pool is locked behind clearing Crunch Time in the form of Time Trials and the levels in the Lab VR Hub and since they all go into logic all at once, this self-defined full-clear goal does not require any special logic.

## Time Trials?  I struggled with those!
Don't worry, none of them go into logic without Crash obtaining the Speed Shoes after beating Crunch Time, which means you'll never be required to clear out any of them.  However, since none of the vehicles benefit from the Speed Shoes, it can be advantageous to go Out of Logic and clear out the Time Trials that you have access to.  In addition, as opposed to Crash Bandicoot 3: Warped, where there was a gem locked behind clearing Gold or Better times in the Time Trials, the skill floor is as low as it'll ever be.

## What about the powerups?
Aside from the Speed Shoes making the Time Trials possible/reasonable, and less than 5 total instances of the Tiptoe ability being required to optimally clear out BONUS rounds, none of the abilities are ever required to beat any level, which makes adding them to the item pool redundant and needlessly complex for a Manual implementation.  

## I recieved a Colored Gem from the multiworld, but I don't have that gem in-game!
That is accounted for.  There are a few instances where the colored gem in-game exists in a much later level than the secret path that it opens up, and in that case, the gem at the end of those secret Colored Gem Paths aren't considered In Logic until you have enough Power Crystals to clear the level that the Colored Gem exists in.  For example: The Yellow Gem in found in Gold Rush (Space VR Hub, locked by 20 Power Crystals) unlocking the path in Compactor Reactor (Earth VR Hub).  Therefore, even though Compactor Reactor requires nothing to access and clear, and even if you recieved the Yellow Colored Gem from the multiworld, you won't be expected to clear the secret path until you get to Gold Rush with 20 Crystals.

## I'm really lagging behind my friends!  This game is so slow!
Yeah, it's a slow game.  Slow movement speed, overinflated crate counts, linear but aimless levels, it all leads to a slower gamefeel.  Due to the nature of Manual Archipelago games, you could be sitting on 20+ locations that are expected to be cleared, but in-game you don't have nearly enough Crystals to get there!  It can lead to a poor experience, your friends waiting on you, and having them most likely finish first. 
THERE IS A SOLUTION:
If you're playing the GCN (GameCube) or Xbox versions, if you input "WOMBAT" as your file name, all of the forcefields around the VR Hubs will be removed to start with, allowing you access to later levels immediately!  PS2 players can have similar functionality, but it requires using a cheat tool such as an Action Replay to activate the debug menu

## So what was that about different versions?
All versions of this game are completely compatible with this implementation.  However, some versions are better than others when it comes to your overall experience:
 - The GCN (GameCube) version easily looks the worst but has speedy load times and Dolphin is (relatively) light on proccessing demands for older hardware.
    - The GCN version also features Crash Bandicoot Blast!, a minigame unlocked by connecting a Game Boy Advance to your game on the title screen.  This is irrelevant to the Archipelago implementation, but can be a fun timekiller if you're ever stuck without something to do.
 - The Xbox version looks the best, but has worse load times when compared to the GCN version.  xemu is also slightly more demanding to run on most machines.
 - The PS2 version has infamously horrendous load times and isn't compatible with the WOMBAT cheat code.  PCSX2, the leading PS2 emulator, also requires a PS2 BIOS file, which can be difficult to obtain, even legitimately.
    - While still lacking the WOMBAT code, the Greatest Hits release of the PS2 game massively decreased the loading times, and is the fastest loading of all the versions overall.

## So yeah, go nuts
Death link is a thing too.  Manuals are hard to "regulate" when it comes to death link, so use and abuse at your own discretion.  TWoC is a very logically simple game, and requires no custom code or special scripts or loopholes to get running in a "Feature Complete" way, so this will probably be the only real release.  If you like playing this, see this file, and the game has broken from a recent change on the AP backend, ping me on Discord (muffinjets) so I can take a look.

