# Grand Theft Auto Vice City Setup Guide

## Quick Links

- [Game Info](/games/Grand%20Theft%20Auto%20Vice%20City/info/en)
- [Options Page](/games/Grand%20Theft%20Auto%20Vice%20City/player-options)
- [GTA Vice City Archipelago GitHub](https://github.com/Kryen112/GTA-Vice-City-AP)
- [Releases](https://github.com/Kryen112/GTA-Vice-City-AP/releases)

This mod turns GTA: Vice City into an Archipelago game. Your progress unlocks and
your rewards come from the multiworld, and your checks send items to the other
players in your session.

Vice City connects directly to Archipelago using APCpp. No external Python client
needs to run while you play.

## Standalone Windows setup

Download **GTA-Vice-City-AP-Setup.exe** from the
[releases page](https://github.com/Kryen112/GTA-Vice-City-AP/releases). It installs
the mod without a separate Python or Archipelago installation:

1. Close Vice City and run the setup file. Allow its Windows administrator prompt.
2. Select the folder containing `gta-vc.exe` from the classic PC version 1.0.
   Setup checks the executable itself and confirms **1.0 English**. Other versions
   and files it cannot identify are refused before any downloads or installation.
3. Setup installs the mod and downloads missing runtimes: [Ultimate ASI Loader's
   Win32 dinput8 archive](https://github.com/ThirteenAG/Ultimate-ASI-Loader/releases/download/Win32-latest/dinput8-Win32.zip)
   and CLEO 2.1.1. ASI Loader is checked against GitHub's published SHA-256;
   CLEO uses a pinned SHA-256. A fresh installation needs internet; no room connection is needed.
4. Setup creates `%LOCALAPPDATA%\GtaVcAp\connection.ini` and adds
   **Archipelago Connection Settings.lnk** beside `gta-vc.exe`. Open the shortcut
   to edit your server and slot, or launch Vice City and configure them with **F8**.

Existing loader/CLEO files, connection settings, and saves are kept. Run setup again
to update or uninstall the mod. Uninstall restores backed-up game files and leaves
the shared loader and CLEO installed for other mods. This build is unsigned, so
Windows may show an unknown-publisher warning.

Your host still needs the matching `gta_vice_city.apworld` to generate the session.

## What you need first

- **64-bit Windows** to run the standalone installer.
- **GTA: Vice City, classic PC version 1.0 English**, with its original
  `data/main.scm`. Setup checks the executable and script before installing.
  The Definitive Edition is not supported.
- **Internet access** for setup to download ASI Loader and CLEO when missing.
- **Archipelago 0.6.7 or newer** on the machine generating or hosting the session.

Optional: [Windowed Mode](https://github.com/ThirteenAG/III.VC.SA.WindowedMode)
adds windowed and borderless fullscreen modes. Extract
`III.VC.SA.WindowedMode.asi` beside `gta-vc.exe` and press **Alt+Enter** to switch.

## Updating or uninstalling

Close Vice City and run **GTA-Vice-City-AP-Setup.exe** again. Select your game
folder and choose to install/update or uninstall. Updates preserve connection
settings and saves. Existing seeds do not need to be regenerated for this update.

## Install the Archipelago world for generation and hosting

Download the matching `gta_vice_city.apworld` from the same release. Install it
on the machine generating or hosting your session by double-clicking it with
Archipelago installed, or by copying it into Archipelago's `custom_worlds` folder.
Players install the game mod with **GTA-Vice-City-AP-Setup.exe** as described above.

## Create or join a multiworld

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

## Connection settings

You can configure the connection entirely in game: press **F8**, enter
`/server HOST:PORT`, `/slot NAME`, optional `/password PASSWORD`, then `/connect`.
The console remembers server and slot in `%LOCALAPPDATA%\GtaVcAp\connection.ini`.
Passwords entered with `/password` stay in memory for the run. Changing the server
or slot through F8 also clears any password saved in the file.
Unacknowledged checks are also kept in this user folder and replayed on reconnect.
Old check files beside the ASI are copied there automatically.

To edit the same settings outside the game:

1. Close Vice City. Open **Archipelago Connection Settings.lnk** in the game folder,
   or paste `%LOCALAPPDATA%\GtaVcAp` into File Explorer's address bar and open
   `connection.ini`. Setup creates the folder and file; if updating manually,
   create them with this section:

   ```ini
   [archipelago]
   server=127.0.0.1:38281
   slot=YourSlotName
   password=
   ```

   Replace the address and slot with your room's details. Leave the password
   empty unless the room requires one. 
   When changing rooms manually, don't forget to replace or clear the old password too.
   `host:port` uses TLS for remote hosts;
   use `ws://host:port` for an explicitly unencrypted remote server.
2. Launch Vice City directly. The ASI connects, loads slot data, and reconnects
   automatically. Start a **New Game** for a new seed, or load your existing
   save for this seed. The Python client does not need to run while playing.

Setup and the updated client copy connection details from the old `GtaVcAp.VC.ini`
only when `connection.ini` does not exist. Existing `connection.ini` files are kept.
Future connection edits belong in `connection.ini`. If shortcut creation fails,
setup shows the file's full path.

Enabled, unfinished checks have colored dots on the minimap and pause-menu map:
packages green, robberies light red, rampages dark red, pickups orange,
stunt jumps blue, properties yellow, side events cyan, and shop stock purple.
Each dot has a 5x5 pixel center and a one-pixel black outline.
Missions retain their existing markers. Current seeds work without regeneration.

Items, goals, and DeathLink use the room's slot data. Pending checks remain in
`%LOCALAPPDATA%/GtaVcAp/GtaVcAp.<seed-hash>.json` until the server acknowledges
them, so moving the mod to another folder preserves them.

If your goal is the hidden-package hunt, the last Package Fragment you receive
ends the game for you: whatever you are doing at the time, Tommy goes straight
into the ending of *Keep Your Friends Close...*, credits and all.

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
The installer carries only the differences from that file, and
the setup tool builds the modded script from **your** copy when it installs.

Two things follow from that.

- Your `data/main.scm` has to be the original 1.0 one. If it is not, the setup tool
  says so, prints the fingerprint it found, and installs nothing. Restore
  `data/main.scm` from your own copy of the game files and run setup again. It also
  refuses when `AP_mod_backup\main.scm` exists and is not the original; delete
  that file and run setup again.
- The mod backs your original script up to `AP_mod_backup\main.scm` in the game
  folder the first time it installs, and that backup is the copy it patches from
  every time after. Leave the folder alone. If you delete it, restore `data/main.scm` from your
  own copy of the game files.

Resolve any setup error before launching the game: an unpatched script cannot
provide the Archipelago mission gating and check detection.

## Saves and seed changes

Connect from the main menu using **F8**, `/server HOST:PORT`, `/slot NAME`,
optional `/password PASSWORD`, and `/connect`. Connection settings can also be
set in `%LOCALAPPDATA%\GtaVcAp\connection.ini`. Type `/help` for local commands, `!help` for server commands, or
chat normally. `/hint [item]` asks for hints; `/deathlink [on|off]` controls DeathLink.
Other players' messages, hints, countdowns, releases and goals appear in the console.

Saves select themselves automatically under `AP_Seeds/<seed-and-slot-hash>` in
`GTA Vice City User Files`. Existing career saves and `gta_vc.set` stay in place.
Save access is blocked until the server identifies the seed; connect before
loading or saving. After disconnection, this seed's saves remain available.
Restart Vice City before switching to another seed or slot.

The legacy Python client is no longer included. If it previously moved your
saves, close the game and back up the entire `GTA Vice City User Files` folder
in Documents. Your normal saves are in `AP_Career`, stored seed saves are in
`AP_Seeds/<seed>`, and the active seed's saves are the loose `.b` files in the
main folder. To restore a set, move the loose `.b` files to a separate backup
folder first, then copy the desired set into the main folder. Keep the source
folders and `gta_vc.set`; do not overwrite saves you want to keep.

## If something goes wrong

- **Setup says your `gta-vc.exe` is another build.** It names the build it
  found. The mod attaches to the classic 1.0 executable and to no other, so no
  other build can run it, patched or not.
- **Setup says it could not confirm your `gta-vc.exe` as 1.0 English.** Installation
  stops without changing the game. Compressed, modified, damaged, or unknown
  executables may fail detection even if they launch. Choose an installation with
  a recognizable classic 1.0 English executable; renaming another version's file
  to `gta-vc.exe` does not make it compatible.
- **The game starts but nothing Archipelago happens.** Confirm Ultimate ASI
  Loader is present as `dinput8.dll` and CLEO is installed, both covered in
  the installation instructions above, then run **GTA-Vice-City-AP-Setup.exe**
  with the game closed and relaunch. CLEO
  prints its version in the bottom left corner of the main menu, so no banner
  there sends you back to those two before anything else.
- **Setup says your `main.scm` is not the original 1.0 script.** It prints
  the fingerprint it found and the one it wants. Restore `data/main.scm` from
  your own copy of the game files, and remove `AP_mod_backup\main.scm` if it is
  there and is not the original. Another Vice City mod that replaces the script
  is the usual cause.
- **Setup cannot find the game.** Pick the folder that holds `gta-vc.exe`.
- **The built-in client does not connect.** Check `[archipelago]` in
  `%LOCALAPPDATA%\GtaVcAp\connection.ini` and the room address. Restart the game
  after editing the file, or change settings through F8 and use `/connect`. The pause menu and
  `gtavc_ap_asi.log` report connection errors. The room must be running.
- **Wrong seed save loaded.** Load a save from this room or start a new game.
  Restart Vice City if the server was changed to another seed.
- **The game is very slow, or it crashes when you Alt+Tab away from it.**
  Install Windowed Mode linked above and press Alt+Enter. Vice City's own
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
