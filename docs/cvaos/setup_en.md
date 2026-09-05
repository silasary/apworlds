# Castlevania: Aria of Sorrow Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest).
- One of the following ways to run the game:
  - A Castlevania: Aria of Sorrow ROM of the **US version** specifically, played in
  [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) 2.7 or later. The Archipelago community
  cannot provide the ROM.
  - The [Castlevania Advance Collection](https://store.steampowered.com/app/1552550/) on Steam
  (Windows only). No separate ROM is needed: the collection's own copy of the game is used. See
  [Playing in the Castlevania Advance Collection](#playing-in-the-castlevania-advance-collection).

### Configuring BizHawk

Once you have installed BizHawk, open `EmuHawk.exe` and change the following settings:

- If you're using BizHawk 2.7 or 2.8, go to `Config > Customize`. On the Advanced tab, switch the
Lua Core from `NLua+KopiLua` to `Lua+LuaInterface`, then restart EmuHawk. (If you're using BizHawk
2.9 or later, you can skip this step.)
- Under `Config > Customize`, check the "Run in background" option to prevent disconnecting from the
client while you're tabbed out of EmuHawk.
- Open a `.gba` file in EmuHawk and go to `Config > Controllers…` to configure your inputs. If you
can't click `Controllers…`, load any `.gba` ROM first.
- Consider clearing keybinds in `Config > Hotkeys…` if you don't intend to use them. Select the
keybind and press Esc to clear it.

## Generating and Patching a Game

1. Create your settings file (YAML). You can make one on the
[Castlevania: Aria of Sorrow options page](../../../games/Castlevania%20-%20Aria%20of%20Sorrow/player-options).
Set **Target Platform** to `gba` if you will play in BizHawk, or `advance_collection` if you will
play in the Steam collection. The generated seed is the same either way; the choice only decides
where the base ROM comes from when the patch is applied, and lets a client warn you if you connect
the other one.
2. Follow the general Archipelago instructions for
[generating a game](/tutorial/Archipelago/setup_en#generating-a-game). This will generate an output
file for you. Your patch file will have the `.apcvaos` file extension. The host does not need a ROM
or the collection.
3. Open `ArchipelagoLauncher.exe`.
4. Select "Open Patch" on the left side and select your patch file.
5. If this is your first time patching, you will be prompted to locate your vanilla ROM. You may
select the US ROM **or** the Advance Collection's `game.exe`; if you pick the exe, the base ROM is
extracted from the collection for you. (An `advance_collection` seed skips this prompt and takes
the ROM from the installed collection.)
6. A patched `.gba` file will be created in the same place as the patch file.
7. On your first time opening a patch with BizHawk Client, you will also be asked to locate
`EmuHawk.exe` in your BizHawk install.

If you're playing a single-player seed, and you don't care about hints, you can stop here, close the
client, and load the patched ROM in any emulator of your choice. However, for multiworlds and other
Archipelago features, continue below using BizHawk as your emulator.

## Connecting to a Server

By default, opening a patch file will do steps 1-5 below for you automatically. Even so, keep them
in mind in case you have to close and reopen a window mid-game.

1. Castlevania: Aria of Sorrow uses Archipelago's BizHawk Client. If the client isn't still open from
when you patched your game, you can re-open it from the launcher.
2. Ensure EmuHawk is running the patched ROM.
3. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing.
4. In the Lua Console window, go to `Script > Open Script…`.
5. Navigate to your Archipelago install folder and open `data/lua/connector_bizhawk_generic.lua`.
6. The emulator may freeze every few seconds until it manages to connect to the client. This is
expected. The BizHawk Client window should indicate that it connected and recognized Castlevania:
Aria of Sorrow.
7. To connect the client to the server, enter your room's address and port (e.g.
`archipelago.gg:38281`) into the top text field of the client and click Connect.

You should now be able to receive and send items. You'll need to do these steps every time you want
to reconnect. It is perfectly safe to make progress offline; everything will re-sync when you
reconnect.

### Starting a file

Start a **new game** on the patched ROM as **Soma**. Your slot's identity is baked into the ROM, so
the client authenticates automatically once the connector script is attached — you do not enter a
slot name into the emulator.

Every patched ROM is marked as "cleared data", which makes cutscenes skippable with Start.

If you enabled the **Hard Mode** option, you do not need to select Hard Mode in the menu; the client
forces the difficulty while a game is loaded, so the Hard Mode-only pickups spawn on a normal file.

## Playing in the Castlevania Advance Collection

The Steam collection runs the game in its own emulator with no connector, so Archipelago works with
it differently from BizHawk: the seed is installed *into* the collection, and a dedicated client
attaches to the running game.

Only the single build of the collection that Steam has ever shipped is supported. The installer and
the client check the game's files and refuse anything else.

### Installing a seed

1. Generate with **Target Platform** set to `advance_collection`. The seed ships as a `.apcvaos`
patch; nobody needs a ROM to generate.
2. Close the collection if it is running.
3. Open `ArchipelagoLauncher.exe` and click **CVAoS Collection ROM Installer**. Select your
`.apcvaos` file (a patched `.gba` also works).
4. The installer looks for the collection at the default Steam location
(`C:\Program Files (x86)\Steam\steamapps\common\Castlevania Advance Collection\game.exe`). If yours
is installed elsewhere, set `collection_exe` under `cvaos_options` in your `host.yaml` to the full
path of that `game.exe` before running the installer.
5. The installer extracts the collection's own Aria of Sorrow ROM, applies the patch to it, and
swaps the result into the collection's data files (`windata/alldata.bin` and
`windata/alldata.psb.m`).

**The installer modifies files inside your Steam install.** Before its first change it saves
pristine copies as `alldata.bin.apbackup` and `alldata.psb.m.apbackup` next to the originals, and it
never overwrites those, so you can always go back to stock. Installing a new seed replaces only the
game data; the backups stay.

### Going back to the original game

Steam's **Verify integrity of game files** restores the stock data at any time. The installer's
restore option (`--restore`) does the same from the backups. If you verify the files in Steam and
then want to play a seed again, simply run the installer again.

### Connecting the Collection Client

1. Launch the collection, choose Aria of Sorrow, and start a **new game** as **Soma**.
2. In the Archipelago Launcher, click **CVAoS Collection Client**.
3. Enter your room's address and port into the client and click Connect. The client attaches to
the running game on its own once Aria of Sorrow is loaded (any screen will do), reads your slot's
identity from the installed ROM, and authenticates. Checks and item delivery happen only during
normal in-room gameplay, exactly as in BizHawk.

The client re-attaches by itself if you close and reopen the collection or switch games inside it.
Everything else (item delivery, DeathLink, Hard Mode forcing, cleared-data marking) works exactly as
it does in BizHawk.

## Troubleshooting

**The client says the ROM is unpatched.** You loaded the vanilla ROM instead of the `.gba` produced
in step 6 of patching.

**The client says the ROM was patched by an incompatible version.** The seed was generated with a
different version of the world than the client you are running. Both players and the host need
matching versions; re-generate or update.

**Nothing happens when I pick items up.** Check that the Lua Console is still open and the connector
script is still running. The client only reads and writes memory during normal in-room gameplay — not
while paused, in a menu, in a shop, or during a room transition.

**I keep getting Skull Keys.** That is expected: a pickup holding *another* player's item physically
hands Soma a Skull Key as a placeholder. The check is sent regardless. The client trims your Skull
Key count every tick so the consumable cap can't block further pickups.

**The Collection Client says no Aria of Sorrow ROM was found.** Select Aria of Sorrow inside the
collection first; the game only loads a ROM once a title is chosen.

**The Collection Client says the collection's ROM is unpatched.** The collection is running its
stock game data. Close it and run the installer.

**The Collection Client says the game is not in normal gameplay yet.** Its fallback way of locating
game memory needs you to be in a room. Leave menus, the map, and pause screens; it keeps trying on
its own.

**The installer says the collection is running.** Close the collection fully (check for `game.exe`
in Task Manager) and try again.

**The installer says the ROM was patched from a cart dump.** For the collection, the patch must be
applied to the collection's own ROM. Let the installer apply the `.apcvaos` itself, or pick
`game.exe` when prompted for the base ROM.

**Playing a `gba` seed in the collection, or the other way round.** Either works; the client only
warns that you connected the other one. A ROM patched against a cart dump must not be installed into
the collection, though, and the installer refuses it.
