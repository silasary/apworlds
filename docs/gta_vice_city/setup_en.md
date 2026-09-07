# Grand Theft Auto Vice City Setup Guide

## Quick Links

- [Game Info](/games/Grand%20Theft%20Auto%20Vice%20City/info/en)
- [Options Page](/games/Grand%20Theft%20Auto%20Vice%20City/player-options)
- [GTA Vice City Archipelago GitHub](https://github.com/Kryen112/GTA-Vice-City-AP)
- [Releases](https://github.com/Kryen112/GTA-Vice-City-AP/releases)

This mod turns GTA: Vice City into an Archipelago game. Your progress unlocks and
your rewards come from the multiworld, and your checks send items to the other
players in your session.

Setup is three parts: install the Archipelago world, prepare your game folder,
then connect the client. The client installs the in-game mod for you.

## What you need first

- **Archipelago 0.6.7 or newer.**
- **GTA: Vice City, the original classic PC release, executable 1.0**
  (`gta-vc.exe`), with its original `data/main.scm`. This is the classic game,
  not the Definitive Edition, which is a different game the mod does not run on.
  The client checks both and refuses to install when either is wrong, naming
  which build of the game it found and what it wanted.
- **[Ultimate ASI Loader](https://github.com/ThirteenAG/Ultimate-ASI-Loader)**,
  installed in your game folder as `dinput8.dll`. Vice City does not load `.asi`
  plugins on its own, so this is required.
- **[CLEO for Vice City](https://github.com/cleolibrary/III.VC.CLEO)**,
  installed in your game folder.
- **Optional, and strongly recommended:
  [Windowed Mode](https://github.com/ThirteenAG/III.VC.SA.WindowedMode)**, which
  runs the game in a window, or in borderless fullscreen, instead of the
  fullscreen mode Vice City uses on its own. On a modern PC that fullscreen mode
  can make the game very slow, and it can cause crashes. This plugin fixes both,
  and it does not change anything in the game itself.

All three are free community tools, and each link goes to the project's own
GitHub, where the downloads and the source both live. Section 2 says which
download to take from each.

## 1. Install the Archipelago world

You need one file, `gta_vice_city.apworld`, from the
[releases page](https://github.com/Kryen112/GTA-Vice-City-AP/releases). Whoever
is hosting your session may hand it to you directly instead.

- Double-click it and let the Archipelago Launcher install it, **or**
- copy it into the `custom_worlds` folder of your Archipelago installation.

That single file contains the world, the client, and the in-game mod. You do not
download the mod separately.

## 2. Prepare your game folder

1. Confirm your `gta-vc.exe` is the original 1.0 build. The client checks this
   before it installs and before it launches the game, and tells you which build
   it found, so you do not have to know how to look; the mod attaches to 1.0 and
   to nothing else.
2. Install Ultimate ASI Loader into the folder that holds `gta-vc.exe`. Take
   `Ultimate-ASI-Loader.zip` from its
   [releases page](https://github.com/ThirteenAG/Ultimate-ASI-Loader/releases).
   Vice City is a 32-bit game, so every `_x64` asset there is the wrong one. The
   archive holds a single `dinput8.dll`, already under the name Vice City needs,
   so extract it next to the executable and you are done.
3. Install CLEO into the same folder. Take the Vice City archive from its
   [releases page](https://github.com/cleolibrary/III.VC.CLEO/releases), not the
   GTA III one, since that page serves both games from the same release, and
   extract it there. It brings `VC.CLEO.asi` and a `CLEO` folder. The mod is
   verified against CLEO 2.1.1; if a newer release misbehaves, that is the one
   to fall back to.
4. Optional, and strongly recommended: install Windowed Mode into the same
   folder. Take the archive from its
   [releases page](https://github.com/ThirteenAG/III.VC.SA.WindowedMode/releases)
   and extract `III.VC.SA.WindowedMode.asi` next to the executable. One file
   covers GTA III, Vice City and San Andreas, so you do not have to pick a
   version. Press **Alt+Enter** in game to switch between a window and
   borderless fullscreen. Newer releases also add an ini file next to the
   plugin, which sets which of the two the game starts in. Archipelago does not
   need this plugin, but the entry **The game is very slow, or it crashes when
   you Alt+Tab away from it**, under **If something goes wrong** at the end of
   this page, explains what it fixes.

You do not copy any Archipelago mod files by hand. The client does that in
section 4, Connect and play.

## 3. Create or join a multiworld

This is the standard Archipelago flow. If you have played Archipelago before, it
is the same here; the game name is **Grand Theft Auto Vice City**.

1. In the Archipelago Launcher, generate the options template for Grand Theft
   Auto Vice City.
2. Edit your `Grand Theft Auto Vice City.yaml`: set your name, choose which check
   classes are enabled, and pick your goal. Each option explains itself in the
   file, and the
   [options page](/games/Grand%20Theft%20Auto%20Vice%20City/player-options) says
   the same thing in the browser.
3. Send your YAML to whoever is hosting the session, or host the generation
   yourself. The host produces the room you connect to.

## 4. Connect and play

1. In the Archipelago Launcher, open the **GTA Vice City Client**.
2. Connect it to the room address, using your slot name from the YAML.
3. **First connection only:** a folder picker opens. Choose the folder that holds
   `gta-vc.exe`. The choice is saved, so later connections skip this.
4. The client installs the in-game mod into that folder and launches the game for
   you. Start a **New Game** to begin the seed.

If your goal is the hidden-package hunt, the last Package Fragment you receive
ends the game for you: whatever you are doing at the time, Tommy goes straight
into the ending of *Keep Your Friends Close...*, credits and all.

### Client commands

Type these in the client console:

| Command | What it does |
| --- | --- |
| `/play` | Launch the game, or relaunch it after quitting. |
| `/setfolder` | Re-pick the install folder (the one holding `gta-vc.exe`). |
| `/installmod` | Reinstall or update the bundled mod. Close the game first. |
| `/restore` | Restore your normal saves and stop Archipelago save isolation. Close the game first. |
| `/uninstall` | Take the mod out of the game folder, put your original `main.scm` back, and restore your normal saves. Close the game first. |
| `/deathlink` | Turn DeathLink on or off for this session, or hand it back to your YAML with `/deathlink seed`. |

## The Archipelago page

Pause the game and pick **ARCHIPELAGO**, above Quit Game. The page shows
everything about your seed the game cannot tell you anywhere else: whether the
client is connected, how many checks you have sent of how many, how many items
have arrived, the game's own completion percentage, which way to the mainland is
open, and, for whatever your YAML enabled, which abilities are locked, which
content classes are still held, which radio stations you have, and whether the
radar is hidden.

## What the mod does to your game folder

The mod's mission gating lives in the game's own script file, `data/main.scm`.
The apworld does not carry a copy of that file: it carries the differences, and
the client builds the modded script from **your** copy when it installs.

Two things follow from that.

- Your `data/main.scm` has to be the original 1.0 one. If it is not, the client
  says so, prints the fingerprint it found, and installs nothing. Restore
  `data/main.scm` from your own copy of the game files and connect again. It also
  refuses when `AP_mod_backup\main.scm` exists and is not the original; delete
  that file and reconnect.
- The mod backs your original script up to `AP_mod_backup\main.scm` in the game
  folder the first time it installs, and that backup is the copy it patches from
  every time after. Leave the folder alone. `/uninstall` puts the backup back and
  then removes it; if you delete it yourself, restore `data/main.scm` from your
  own copy of the game files.

The client will not launch the game when the install is refused, since a Vice
City running on an unpatched script sends no checks and receives no items.

## Saves are kept separate

Each seed gets its own save slots, and your existing Vice City saves are left
untouched. Run `/restore` (with the game closed) to switch back to your normal
saves.

## If something goes wrong

- **The client says your `gta-vc.exe` is another build.** It names the build it
  found. The mod attaches to the classic 1.0 executable and to no other, so no
  other build can run it, patched or not.
- **The client says it could not tell which build your `gta-vc.exe` is.** It
  installs anyway and this may be nothing: a compressed or repacked executable
  is unreadable from the outside and unpacks to a perfectly good 1.0 once the
  game starts. It is worth remembering only if nothing Archipelago then happens
  in game.
- **The game starts but nothing Archipelago happens.** Confirm Ultimate ASI
  Loader is present as `dinput8.dll` and CLEO is installed, both covered in
  section 2, then run `/installmod` with the game closed and relaunch. CLEO
  prints its version in the bottom left corner of the main menu, so no banner
  there sends you back to those two before anything else.
- **The client says your `main.scm` is not the original 1.0 script.** It prints
  the fingerprint it found and the one it wants. Restore `data/main.scm` from
  your own copy of the game files, and remove `AP_mod_backup\main.scm` if it is
  there and is not the original. Another Vice City mod that replaces the script
  is the usual cause.
- **The client cannot find the game.** Run `/setfolder` and pick the folder that
  holds `gta-vc.exe`.
- **You started before connecting.** Progress re-derives from the server on every
  load and reconnect, so connect the client and reload your save.
- **The game is very slow, or it crashes when you Alt+Tab away from it.**
  Install Windowed Mode from section 2 and press Alt+Enter. Vice City's own
  fullscreen mode takes over your whole screen, which modern PCs handle badly.
  It is worse if your screen has a high refresh rate, or if you have more than
  one screen. That same fullscreen mode can also crash the game when you switch
  to another window. Windowed Mode runs the game in a window instead, and avoids
  both. This is a Vice City problem, not an Archipelago one: it happens the same
  way without the mod, so the client cannot fix it for you.
- **The game crashes a few seconds after you start it, in `quartz.dll`.** Those
  are the two intro videos. The game plays them with an old Windows video
  component that does not always work any more. Rename `GTAtitles.mpg` and
  `Logo.mpg` in the `movies` folder, to `.bak` or anything else, and the game
  skips them. This is normal Vice City behavior, not Archipelago, and the game
  starts faster without them.
