# The Magical Quest Starring Mickey Mouse

## What does randomization do to this game?

The order in which you enter Stages is randomized. Costumes and Big Hearts are Items shuffled into the multiworld.
Mickey needs to find his Costumes to be able to traverse through the Stages and defeat the bosses.

## What is the goal?

Beat Emperor Pete at the end of Pete's Castle and save Pluto.

### Pete's Emblems

Every time you defeat a Stage Boss, you will receive a "Pete's Emblem" Item. Collect 5 to be able to face Emperor Pete. You need 5 Pete's Emblems to be able to enter the boss room, otherwise you will be transported to the start of the level.

## Which Locations are checks?

63 Locations:

- 37 Treasure Boxes (all boxes now drop apples and send an AP Item when you open them).
- 5 Stage Clears and the 5 Stage Bosses.
- 3 Mini-bosses and their 3 Rematches.
- When you enter a Stage where you would receive a Costume, you get a Location check instead (3 Locations).
- Important items in Stores (2 Big Hearts and 2 Upgrades).
- The Beaver in Treetops 1-3 has a Location check in his home.
- Clearing Snowy Valley 5-2 in under 15 seconds and under 25 seconds gives one Location check each.

## What does the Item pool look like?

- The 3 Costumes (Wizard, Firefighter and Mountaineer)
- Big Hearts (these increase Mickey's maximum health)
- Magic Upgrade (uses half the magic energy of the regular Wizard Costume)
- Water Upgrade (uses half the water of the regular Firefighter Costume)
- Mickey Coins (used to buy items in the General Store)
- Mickey Dolls (1-up)
- Small Hearts, Magic Lamps and Fire Hydrants (health and ammo)

### Unique Randomizer Items:

- Map Fragments (Stage unlocks)
- Pete's Emblems (Boss defeat medal)

## What happens when I receive an Item?

You receive the item as soon as you are in normal play.

## Changes from the base game

There are many changes to the original game in order to allow a randomizer to be possible.

### Stage Select

The original game is strictly linear, so players are only able to advance in the game's normal order.
In this randomizer, players are able to choose a Stage in the World map by pressing Left and Right on the D-pad.
Players are also able to revisit a Stage as many times as they want.

### Pause and Quit

At any moment during gameplay, players are able to Pause the game and then press Select to return to the World Map.
There are many moments when you won't own the required Costume required to progress, so you will need to Pause and Quit to choose a different Stage.

### Costume Order

Costumes are received in any order, so it may be possible to explore Treetops with the Firefighter Costume or Fire Grotto with the Mountaineer Costume.

### Snowy Valley

- Clearing 5-2 fast counts as two Location checks. The original game doesn't have any secrets in this Level.

### Pete's Castle

- It is possible to get Pete's Castle as your first level, in which case you may be required to Pause and Quit if you fall in the water.

### Small Layout Changes

- Fire Grotto's Mini-boss room now has Red Blocks allowing Mickey to defeat it without a Costume.
- Some Blocks and Grappling Hook targets have been added to make the game more open.

## Possible Future Improvements

- Death Link
- Traps
- Entrance Randomization
- Basic abilities removed, and placed into the item pool as items that any player can find.
- Custom art (for example, Treasure Boxes drop an Archipelago Item, Stores show AP Item icons)

## Credits

- RetroAchievements Code Notes and decoded achievement logic (credited to: Jaarl, Dissection).
- bogaa's "Sandbox" romhack. Its disassembly and labels were fundamental for the development of this project.
- Mesen (emulator and debugger: breakpoints, memory viewer, Lua scripting) for all the testing and reverse-engineering.
- Asar (SNES assembler) for the ROM patch.

## AI usage disclosure

This world was developed with substantial help from an AI assistant (Claude Sonnet 5.5). Particularly, the AI helped interpret CPU captures and disassembly excerpts the author provided to reverse-engineer how the game works (for example, which RAM addresses hold which state, and which routines run at what moment). These were fundamental in patching the ROM to allow for new functions such as pause and quitting and enabling Costumes in any order. No "vibe coding" or AI-generated code is used in this project.