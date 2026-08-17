# Mega Man Zero 3 Archipelago

Welcome to my project. Things are still under development, but here you will find my development of a custom Archipelago World for Mega Man Zero 3 on the GBA. You should probably read everything here so you know what to expect before playing!

## General Information
- As of right now, the randomized items include: All secret disks, armor chips, EX Skills, subtanks, the four weapons, stage access items, and story progress. E-Crystals are filler.

- Every stage is locked behind its own access item. You start in the Resistance Base with no stages accessible. The first access item is guaranteed to be early local, so check around the base and talk to NPCs.

- There's a modified mission select screen, which is visually very WIP. It works, and everything it tells you is correct, but it does not look finished yet.
  - Boss portraits are in groups of four like before, but now you can tab between the pages with left and right on the d-pad (the shoulder buttons work too). 
  - Hovering a level tells you its name, how many of its disks you have found, whether it's LOCKED / OPEN / CLEARED, and your best rank in it.
  - Picking a level you have already beaten asks you how you want to run it. EXPLORE is the vanilla revisit for picking up disks you missed. RETRY MISSION plays the level as a real mission again, so the boss is back and you get another shot at the A+ rank check.

- To beat the game, clear the Abandoned Research Laboratory. It won't open until you have cleared every other stage AND you are holding a configurable number of secret disks (default: 120).

- EX Skills are awarded based on your score on the level you just completed, rather than on your average score going into that level. (Yes, that's how they worked in the vanilla game). Your global rank score is calculated based on your average of all of your highest scores on completed levels.


## Quality of Life Stuff

- All skippable cutscenes are skippable by default.

- You can leave any level at any time.

- Pressing SELECT during gameplay swaps your sub weapon to the next one you own. This will be turned into a weapon wheel later.

- When Archipelago gives you an item, a small icon pops up over Zero's head with a sound. This is still an early WIP, so most items just show up as the AP logo.

- Collecting certain lore related secret disks will simultaneously unlock a random e-Reader graphical change. A full list can be seen [here](https://tcrf.net/Mega_Man_Zero_3/e-Reader_Functions). 

- Your player rank is now based on the averages of your highest clears.



## Options

- `required_secret_disks`:  
  How many disks you need to be holding before the final stage will open (In addition to clearing every other level). Default is 120, max is 180.

- `randomize_weapons`:  
  Puts the Buster, Z-Saber, Recoil Rod and Shield Boomerang into the item pool. With this off you get all four from the start and starting_weapons does nothing.

- `starting_weapons`:  
  Which of the four you begin with when randomize_weapons is on. Those ones stay out of the pool. Zero can't hurt anything bare handed, so if you leave this empty you get one weapon anyway.

- `easy_ex_skill`:  
  Always sends the EX Skill location check at the end of a level, whatever your rank was.

- `death_link`:  
  Standard DeathLink. Dying sends, and receiving kills you.

## Known Bugs

- The level select screen is visually early access. It works, and everything it tells you is correct, but it does not look finished yet. Specifically:

  - The page with Area X-2 on it draws three portraits instead of four. The fourth one is there and selectable, and the name and info at the bottom are right, but the portrait doesn't render correctly.

  - The last page is invisible. Those four levels (Derelict Spacecraft, Missile Factory, Sub Arcadia and Weil's Lab) have no boss portrait art yet. But the text at the bottom of the screen is correct and the levels are selectable as normal.

  - Talking to the operator in the command room takes you straight to the stage select. Press up next to Ciel and you get the choice of her or the operator, so you can still talk to her.

- This world has recently underwent a massive overhaul from the ground up, I'm sure there are plenty of undocumented bugs, so please try to report as much as possible!

- There's probably some more bugs especially with world generation; I haven't done too much testing, so provide any feedback if something goes wrong!

## Planned Features
- Finishing the level select screen.
  - Fix the visual issues on the page that has Copy-X on it.
  - Boss portraits greyed out until you unlock them.
  - Arrows on either side so you can tell there are more pages.
  - Include portrait art for the four levels that don't have any. They all exist in game, just have to render them.
  - Maybe randomize the order that the bosses appear on, just cause.
- A weapon wheel on SELECT for swapping chips and weapons without opening the menu. Right now it just cycles sub weapon.
- Progressive weapon upgrades. 
  - The first one gives you the weapon
  - Each one after unlocks an upgrade (similar to Zero 1 and 2).
  - Lastly you get attack power boosts, which are ripped from the E-Reader cards.
  - This will hopefully fix an issue where weapons can be hard to find in the current game.
- Other collectables as location checks. Like static health pickups, extra lives, etc.
- Level, enemy, or entrance randomization.
- Option to change the rank required to earn an Ex Skill check (higher or lower).
- Something to do with the minigames.

---
If you have any questions, feel free to contact me on Discord: Stingrays110, though I'd prefer if you kept it to the Zero channel on the Archipelago Discord

And if you'd like to see the source code for the ROM, [check it out here!](https://github.com/brodieberger/rmz3/tree/ap). 

Huge thanks to akatsuki105, [whose WIP decompilation of RMZ3 laid the groundwork for this world!](https://github.com/mmzret/rmz3) 