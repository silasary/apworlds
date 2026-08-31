# Mega Man Zero 3 Archipelago

Welcome to my project. Things are still under development, but here you will find my development of a custom Archipelago World for Mega Man Zero 3 on the GBA. You should probably read everything here so you know what to expect before playing!

<div align="center">
<img width="800" height="296" alt="logo" src="https://github.com/user-attachments/assets/0954b2d4-f197-4c53-8bff-699af4b382a5" />
</div>

## General Information (IMPORTANT)
- **Locations:** All 180 secret disks, stage clears, an A+ rank clear in each of the 15 stages, the nine armor chips, both sub tanks, Cerveau's Recoil Rod and Shield Boomerang, ten extra life pickups, and eleven miniboss fights.
- **Item pool:** 180 secret disks, the four weapons as progressive upgrade unlocks, nine armor chips, twelve EX Skills, two sub tanks, fifteen stage access items and two Story Progress items. E-Crystals are filler.
- There's a modified mission select screen, which allows you to select from any level as long as you have its access item.
  - Boss portraits are in groups of four like in vanilla, but now you can tab between the pages with left and right on the d-pad (the shoulder buttons work too).
  - Hovering a level tells you its name, how many of its disks you have found, whether it's LOCKED / OPEN / CLEARED, as well as your best rank on that stage if it has been cleared.
  - Picking a level you have already beaten asks you how you want to run it. EXPLORE is the vanilla revisit for picking up disks you missed. RETRY MISSION plays the level as a real mission again, so the boss is back and you get another attempt at the A+ rank check.
- To beat the game, clear the Abandoned Research Laboratory. It won't open until you have cleared every other stage AND you are holding a configurable number of secret disks (default: 120)
- Later NPC conversations, and the checks attached to them, are gated behind the two Story Progress items.
- EX Skills are awarded based on your score on the level you just completed, rather than on your average score going into that level. (Yes, that's how they worked in the vanilla game). Your global rank score is calculated based on your average of all of your highest scores on completed levels.

## Weapon Progression

Each of the four weapons is a progressive item. For example, the item pool holds several copies of "Progressive Z-Saber", and every copy you receive moves that weapon one step up its upgrade path. This feature works very similar to the weapon XP system from Zero 1 and 2.

The first copy sends you the weapon itself, the ones after it unlock that weapon's abilities, and the last three are attack power boosts (ripped from the E-Reader cards).

The upgrade progress is shown in game as stars in the pause menu, like in Zero 1 and 2.

| Weapon | Progressive Upgrades |
| --- | --- |
| Buster | weapon, semi charge, full charge, damage (+1, +2, +3) |
| Z-Saber | weapon, 2nd slash, 3rd slash, charged slash, damage (+1, +2, +3) |
| Recoil Rod | weapon, charged rod,  damage (+1, +2, +3) |
| Shield Boomerang | weapon, charged throw,  damage (+1, +2, +3) |

Note: Anything you list in `starting_weapons`  begins at step 1. You will still have to collect the progressive items in order to upgrade it.

## Quality of Life Stuff
- The pause menu shows you how many secret disks are required to collect in order to unlock the final stage.
- All skippable cutscenes are skippable by default.
- You can leave any level at any time.
- Pressing SELECT during gameplay swaps your sub weapon to the next one you own.
- When Archipelago gives you an item, a small icon pops up over Zero's head with a unique icon displayed for each item.
- Collecting certain lore related secret disks will simultaneously unlock a random e-Reader graphical change. A full list can be seen [here](https://tcrf.net/Mega_Man_Zero_3/e-Reader_Functions).
- Your player rank is based on the average of your best clear in each stage.

## Options
- `required_secret_disks`:  
  How many disks you need to be holding before the final stage will open (In addition to clearing every other level). Default is 120, max is 180.

- `starting_weapons`:  
  Which of the four you begin with. To give all, use `starting_weapons: ['Buster', 'Z-Saber', 'Recoil Rod', 'Shield Boomerang']` 

- `easy_ex_skill`:  
  Always sends the EX Skill location check at the end of a level, whatever your rank was.

- `death_link`:  
  Standard DeathLink. Dying sends, and receiving kills you.

## Hinting and Tracking

Items and locations are sorted into groups. Try using `!hint`.

| locations | |
| --- | --- |
| per stage | `Resistance Base` (all three mission sets), `Aegis Volcano Base`, `Sunken Library`, and so on |
| by type | `Secret Disks`, `Stage Clears`, `Chips`, `A+ Rank Clears`, `Subtanks`, `Weapons`, `1-UPs`, `Minibosses` |

| items | |
| --- | --- |
| by type | `Secret Disks`, `Stage Access`, `Chips`, `Body Chips`, `Foot Chips`, `Head Chips`, `EX Skills`, `Subtanks`, `Weapons` |

For example: `!hint Stage Access` or `!missing Sub Arcadia`.


## Known Bugs.
- There have been repeated issues of trackers reporting currently unobtainable items as obtainable. Be sure to report any instance of that.
- The item popup only shows one at a time, skipping multiple if they arrive at the same time, or if you received them during a cutscene.
- I hope to soon bring this world from unstable to stable, so report anything that seems off, not just bugs!
  
## Planned Features.
- A weapon wheel on SELECT for swapping chips and weapons without opening the menu. Right now it just cycles sub weapons.
- Other collectables as location checks. Like static health pickups, E-Crystals, breakable containers, etc.
- Level geometry, enemy, or entrance randomization.
  - Enemy Randomization is currently being worked on.
- Option to change the rank required to earn an Ex Skill check (higher or lower).
- Something to do with the minigames.

---
If you have any questions, feel free to contact me on Discord: Stingrays110, though I'd prefer if you kept it to the Zero channel on the Archipelago Discord.

And if you'd like to see the source code for the ROM, [check it out here!](https://github.com/brodieberger/rmz3/tree/ap). 

Huge thanks to akatsuki105, [whose WIP decompilation of RMZ3 laid the groundwork for this world!](https://github.com/mmzret/rmz3)

And a thank you to Shadyrix Phantom (@OfficialPhantomX) for the logo artwork.
