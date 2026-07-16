# New Super Mario Bros Wii Archipelago Randomizer Setup Guide

## Required Software
- [Archipelago V0.6.7](https://github.com/ArchipelagoMW/Archipelago/releases/latest) (Needs at least V0.6.7, the latest version as of 2026-05-19)
- [Dolphin emulator](https://dolphin-emu.org/download/)
- [NSMBW AP-World](https://github.com/Miiroun/Archipelago-NewSuperMarioBrosWii/releases/latest)
- A legally dumped copy of New Super Mario Bros Wii (US rev 2) (both .iso and .wbfs works)
  - If this is not the edition of your copy, see [en_NSMBW.md](../docs/en_NSMBW.md) for list of features known to be broken on other versions.
- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases) (Optionally) 


## Setup
1) Download and install archipelago (needs at least v0.6.7) and Dolphin.
2) Download the ap-world file from [NSMBW World](https://github.com/Miiroun/Archipelago-NewSuperMarioBrosWii/releases/latest), doubleclick it, and it's installed (or manually move it to custom_worlds).
3) Then create a player yaml file from the option creator in the launcher.
   -  Default yaml is recommended for new players. It has 441 locations (2026-05-17).
   - If you want to play with a lower location count disable star coins (231 locations).
   - See [en_NSMBW.md](../docs/en_NSMBW.md) for all options, etc.
4) Note that the ap client is bundled with launcher.
5) Open dolphin, go to options → Configuration → Interface → Hotkeys Require Window Focus → off, this is IMPORTANT for death-link and movement to work correctly
6) Inside the client press CONNECT (when you are on the world map in game) and then enter your player name (from the yaml).
7) If you care about your dolphin savefiles then back them up.


## How to play
1) Open the AP launcher (restart if it was open before) and find NSMBW Client, open it.
   - On linux you will need to do this with root access.
2) This should prompt you for your game file. (You can change it later in host.yaml).
3) Clear save file 2 (you can make a copy of it if you care about it). Then select savefile 2 to play on.
4) After you have entered the world map press CONNECT in the client, and enter your slot name and password.
5) Open the in game world-select menu and move to the world you have unlocked.
6) See the quirks section in [en_NSMBW.md](../docs/en_NSMBW.md) for quirks with the implementation.
7) Make save-states to save the game and run /save often.
   - Do NOT save when you are in world 9, it can delete your save.
   - Don't use the in game save feature and make a new save state after every level clear.
   - To close the game run /exit


## Tracker 
- You can optionally use the built-in universal tracker extension to track available locations.
- Simply download [universal tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker) and put it into your custom worlds folder (or double click it).
- It is automatically booted up if you have it in your custom worlds folder and is integrated into the client.
- It might prompt you for an external pop tracker pack, this can simply be ignored as that pack is still in development.

