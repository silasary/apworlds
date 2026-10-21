# New Super Mario Bros Wii Archipelago Randomizer Setup Guide

## Software
- [Archipelago V0.6.7](https://github.com/ArchipelagoMW/Archipelago/releases/latest) 
- [Dolphin emulator](https://dolphin-emu.org/download/) (minimum 2503)
- [NSMBW AP-World](https://github.com/Miiroun/Archipelago-NewSuperMarioBrosWii/releases/latest)
- A legally dumped copy of New Super Mario Bros Wii (US rev 2) (both .iso and .wbfs works but not .nikt.iso)
  - If this is not the edition of your copy, see [en_NSMBW.md](../docs/en_NSMBW.md#known-quirks--bugs--help-with-debug) for list of features known to be broken on other versions.
  - To dump your game first install the [wii homebrew channel](http://wiibrew.org/wiki/Homebrew_setup), likely by using [Wilbrand](http://wiibrew.org/wiki/Wilbrand) or [Str2hax](https://wiibrew.org/wiki/Str2hax) (recommended).
  - Optionally install [Open Shop Channel](https://oscwii.org/), which you can then use to install one of the following programs.
  - Use [cleanrip](https://wiibrew.org/wiki/CleanRip) or [usb loader gx](https://usbloadergx.com/) (recommended) to dump your game to the SD-card.
- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases) (minimum 0.3.5, optional) 


## Setup
1) Download and install archipelago (needs at least v0.6.7) and Dolphin.
2) Download the ap-world file from [NSMBW World](https://github.com/Miiroun/Archipelago-NewSuperMarioBrosWii/releases/latest), doubleclick it, and it's installed (or manually move it to custom_worlds), restart the ap-launcher.
3) Then create a player yaml file from the option creator in the launcher.
   -  Default yaml is recommended for new players. It has 441 locations (as of 0.2.0).
   - If you want to play with a lower location count disable star coins (231 locations).
   - See [en_NSMBW.md](../docs/en_NSMBW.md#options) for all options, etc.
4) Note that the ap client is bundled with launcher.
5) Open dolphin, change the following settings:
   - `Options → Configuration → Advanced → Memory Override` to `Off`
6) Inside the client press `CONNECT` and then enter your player name (from the yaml).
   - Make sure you do NOT have the game open when you press CONNECT.


## How to play
0) Verify these points before continuing your setup.
   - In `host.yaml`, under the section `nsmbw_settings`. Make sure they are their default values `auto_open` : `false` and `auto_open_riivolution` : `true`.
   - On macOS, you might need to [resign](https://github.com/aldelaro5/dolphin-memory-engine#macos-code-signing) your dolphin copy.
   - If you disabled `use_riivolution` use [this](../dev_files/dev_docs/secret_options.md#how-to-play-use_riivolution-disabled) guide instead.
1) Open the archipelago launcher (restart if it was open before) and find the NSMBW Client, open it.
2) You will be promoted for the location of your dolphin install if they are not located automatically. 
   - You can change their values later on in `host.yaml`. BE CAREFUL use `/` or `\\` NOT `\` as path separators.
   - Linux only: On Desbian distros like Fedora and Arch users (including SteamOS) you have to install `dolphin-emu-tool` separate from dolphin. It is included in the ´flat-pak´ version.
3) Enter your connection details and press `CONNECT` in the client.
   - Do NOT have dolphin open before and during this step.
4) The game will now open automatically.
   - If it does not, you can right-click your game in dolphin → `start with riivolution patch`. Enable just the patch for this multiworld and start the game.
5) Select `SAVEFILE 2` to play on.
6) Play the game: Beat levels and collect star coins. Prepare to beat bowser once and for all.
7) See the quirks section in [en_NSMBW.md](../docs/en_NSMBW.md) for quirks with the implementation.
7) Save in game to save progress. You can also use savestates but be carful loading them
   - To close the client run `/exit` to make sure everything is saved correctly.


## Tracker 
- You can optionally use the built-in universal tracker extension to track available locations.
- Simply download [universal tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker) and put it into your custom worlds folder (or double click it).
- UT is integrated into the NSMBW client if you have it in your custom worlds folder.
- 0.4.0 includes an internal location and image tracker; for it to work make sure you have UT 0.3.5 or newer.

