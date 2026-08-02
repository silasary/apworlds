# Mega Man Zero 3 Archipelago

Welcome to my project. Things are still under heavy development, but here you will find my development of a custom Archipelago World for Mega Man Zero 3 on the GBA. You should probably read everything here so you know what to expect before playing!

## General Information
- As of right now, the randomized items include: All secret disks, armor chips, and EX Skills, and subtanks.

- To beat the game, the player must defeat the final boss while collecting a configurable number of secret disks (default: 80). You can set this number using the required_secret_disks option in your YAML file.

- EX Skills are awarded based on your score on the level you just completed, rather than on your average score going into that level. (Yes, that's how they worked in the vanilla game).

- You can leave every level at will (Except for the opening level and first intermission). In the vanilla game, you would only escape levels that you have beaten previously. This change will be much more important later once the routing changes are implemented.

- Collecting certain lore related secret disks will simultaneously unlock a random e-Reader graphical change. A full list can be seen [here](https://tcrf.net/Mega_Man_Zero_3/e-Reader_Functions). 

- All skippable cutscenes are skippable by default.

## Options

- `goal`:  
  - `default` - Beat the final boss with enough Secret Disks (default).
  - `vanilla` - Beat the final boss regardless of disks.

- `required_secret_disks`:  
  Set the number of disks needed for completion. Default is 80, max is 180.

- `easy_ex_skill`:  
  Always sends the EX Skill location check at the end of a level. Recommended, as EX Skills are currently missable without loading an earlier save or savestate.

- `reward_notification`:
  Items awarded to the player will be displayed in game through a message box at the bottom of the screen. This feature is optional, as of right now, it is very slow and distracting. I will be improving this later, but the choice is there now if you want it.

## Known Bugs

- Certain rewards given by NPCs require you to make the correct dialogue choices. Right now these are broken, and you will always receive the disk regardless of what you say.

- EX Skills are currently missable. If you do not receive an 'A' rank or higher on a level that has an EX Skill check, there is no way to revisit that level without loading an earlier save or savestate. This will be fixed in a later update. Consider using the "Always reward EX-Skill" option for now.

- There's a chance that I may have missed out on a few dialogue related rewards. If there are any issues, please ping me in the discord!

- There's probably some more bugs especially with world generation; I haven't done too much testing, so provide any feedback if something goes wrong!

## Planned Features
- Routing changes. 
  - Like how Mega Man 2 limits the available robot masters you could fight until you have the proper AP item, this world should likely do the same. 
  - Limiting Zero's default abilities (wall climb, dash, charge attack, sword combo) like how Mario World does it could also work. Although it would require editing the first level, as it cannot be completed without wall climbing.
- All four available weapons added to the item pool.
- Deathlink support.
- Filler items (Energy Crystals, Health, Extra Lives). These are in the item pool but are currently unimplemented.
- Other collectables as location checks. Like static health pickups, extra lives, etc.
- Level, enemy, or entrance randomization.

---
If you have any questions, feel free to contact me on Discord: Stingrays110, though I'd prefer if you kept it to the Zero channel on the Archipelago Discord
