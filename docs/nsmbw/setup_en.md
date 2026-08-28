# New Super Mario Bros Wii Archipelago Randomizer Setup Guide

## Required Software
- [Archipelago V0.6.7](https://github.com/ArchipelagoMW/Archipelago/releases/latest) 
- [Dolphin emulator](https://dolphin-emu.org/download/) (minimum 2503)
- [NSMBW AP-World](https://github.com/Miiroun/Archipelago-NewSuperMarioBrosWii/releases/latest)
- A legally dumped copy of New Super Mario Bros Wii (US rev 2) (both .iso and .wbfs works but not .nikt.iso)
  - If this is not the edition of your copy, see [en_NSMBW.md](../docs/en_NSMBW.md) for list of features known to be broken on other versions.
  - To dump your game first install the [wii homebrew channel](http://wiibrew.org/wiki/Homebrew_setup), likely by using [Wilbrand](http://wiibrew.org/wiki/Wilbrand) or [Str2hax](https://wiibrew.org/wiki/Str2hax) (recommended).
  - Optionally install [Open Shop Channel](https://oscwii.org/), which you can then use to install one of the following programs.
  - Use [cleanrip](https://wiibrew.org/wiki/CleanRip) or [usb loader gx](https://usbloadergx.com/) (recommended) to dump your game to the SD-card.
- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases) (Optionally) 


## Setup
1) Download and install archipelago (needs at least v0.6.7) and Dolphin.
2) Download the ap-world file from [NSMBW World](https://github.com/Miiroun/Archipelago-NewSuperMarioBrosWii/releases/latest), doubleclick it, and it's installed (or manually move it to custom_worlds), restart the ap-launcher.
3) Then create a player yaml file from the option creator in the launcher.
   -  Default yaml is recommended for new players. It has 441 locations (as of 0.2.0).
   - If you want to play with a lower location count disable star coins (231 locations).
   - See [en_NSMBW.md](../docs/en_NSMBW.md) for all options, etc.
4) Note that the ap client is bundled with launcher.
5) Open dolphin, change the following settings:
   - Options → Configuration → Advanced → Memory Override → Off
   - Options → Configuration → Interface → Hotkeys Require Window Focus → Off
   - Options → Hotkey Settings → Save and Load State. Make sure saving (e.g. shift + F8 or @(Shift+F8)) and loading (e.g. F8) save states from slot 7 and 8 are their default values.
   - If you care about your dolphin savefiles then back them up.
6) Inside the client press CONNECT and then enter your player name (from the yaml).
   - If you do NOT have the use_riivolution option (0.3.0) enabled:wait to CONNECT until you are at the level select menu in world 1.
   - If you do have it enabled make sure 


## How to play (use_riivolution disabled) (0.2.2 or earlier)
1) Open the AP launcher (restart if it was open before) and find NSMBW Client, open it.
2) This should prompt you for your game file. (You can repromt it by removing the nsmbw_settings in host.yaml, do NOT edit it manually).
   - If you want the game to auto start
3) Clear save file 2 (you can make a copy of it if you care about it). Then select the now empty savefile 2 to play on.
4) After you have entered the world map press CONNECT in the client, and enter your slot name and password.
5) Open the in game world-select menu and move to the world you have unlocked.
6) See the quirks section in [en_NSMBW.md](../docs/en_NSMBW.md) for quirks with the implementation.
7) Make save-states to save the game and run /save often.
   - Do NOT save when you are in world 9, it can delete your save.
   - Don't use the in game save feature and make a new save state after every level clear.
   - To close the game run /exit


## How to play (use_riivolution enabled) (only on 0.3.0 or newer versions)
0) In `host.yaml`, under the section `nsmbw_settings`. assert `auto_open` is `false` and `auto_open_riivolution` is `true`.
1) Open the archipelago launcher (restart if it was open before) and find the NSMBW Client, open it.
2) You will be promoted for the location of your dolphin install if they are not located automatically. You can change their values later on in `host.yaml`.
 - Linux only: On some distros like Fedora and Arch users (including SteamOS) you have to install `dolphin-emu-tool` separate from dolphin. It is included in the ´flat-pak´ version.
3) Enter your connection details and press CONNECT in the client.
4) The game will now open automatically. If it does not, you can right-click your game in dolphin → start with riivolution patch. Enable just the patch for this async and start the game.
5) Select SAVEFILE 2 to play on.
6) Play the game: Beat levels and collect star coins.
7) See the quirks section in [en_NSMBW.md](../docs/en_NSMBW.md) for quirks with the implementation.


## Tracker 
- You can optionally use the built-in universal tracker extension to track available locations.
- Simply download [universal tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker) and put it into your custom worlds folder (or double click it).
- It is automatically integrated into the client if you have it in your custom worlds folder and is integrated into the client.

