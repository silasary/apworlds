# Castlevania: Aria of Sorrow Setup Guide

You can play this randomizer in two ways:

- in **BizHawk**, an emulator, with your own US ROM of the game;
- in the **Castlevania Advance Collection** on Steam, on Windows.

The first steps are the same for both. After that, follow the section for the way you play. If you are new to Archipelago, its [general setup guide](/tutorial/Archipelago/setup_en) explains the Launcher, rooms and slots.

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest) 0.6.6 or later, which includes the Archipelago Launcher.
- The `cvaos.apworld` file, from the [releases page](https://github.com/anonymous-heap/Archipelago/releases).
- For BizHawk: [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) 2.7 or later, and the **US version** of the Castlevania: Aria of Sorrow ROM. The Archipelago community cannot provide the ROM.
- For the collection: the [Castlevania Advance Collection](https://store.steampowered.com/app/1552550/) on Steam. It contains its own copy of the game, so you don't need a ROM.

## Installing the apworld

In the Archipelago Launcher, click "Install APWorld" and select `cvaos.apworld`. On Windows, you can double-click the file instead. Then restart the Launcher.

## Creating your options file

Your options file is a YAML file that holds your player name and your settings for the seed. The simplest way to make one is the [options page](../../../games/Castlevania%20-%20Aria%20of%20Sorrow/player-options): choose your settings and a player name, then click "Export Options". "Options Creator" in the Launcher does the same job. "Generate Template Options" in the Launcher writes a template into the `Players/Templates` folder instead, for you to edit by hand.

Every player in a multiworld needs a different name. Your player name is also your slot name, which the map tracker asks for if you start it from the Launcher.

Set "Target Platform" to "GBA" if you will play in BizHawk, or to "Advance Collection" if you will play in the collection. (In the YAML file, these are `gba` and `advance_collection`.) The rest of this guide calls them BizHawk seeds and collection seeds. The seed is the same either way. The setting decides where the base ROM comes from when the patch is applied, and it lets the client warn you if you play the seed on the other platform.

For BizHawk, choose "GBA" even if you own the collection, because the collection's copy of the ROM has no sound outside the collection.

The [game page](/games/Castlevania%20-%20Aria%20of%20Sorrow/info/en) explains the other options.

## Getting your patch file

In a multiworld, one person generates the game for everyone. Use the same version of `cvaos.apworld` as that person, or a newer one.

If someone else generates, send them your options file. They need `cvaos.apworld` installed, but not the ROM or the collection. Once they are hosting the game, they send you a link to its room page. Download your `.apcvaos` patch file from there. The room page also shows the room's address and port.

If you generate, do it on a computer that has `cvaos.apworld` installed. Generating needs neither a ROM nor the collection.

1. Put everyone's options files in the `Players` folder of your Archipelago install.
2. Click "Generate" in the Launcher.
3. Find the new zip in the `output` folder. Each player's `.apcvaos` patch file is inside it.

Archipelago's main site, archipelago.gg, can't generate this game, because it isn't one of Archipelago's built-in games. You can still host the zip there by uploading it on its [upload page](https://archipelago.gg/uploads), as the general guide explains under [From a locally generated game](/tutorial/Archipelago/setup_en#from-a-locally-generated-game).

Then continue with [Playing in BizHawk](#playing-in-bizhawk) or [Playing in the Advance Collection](#playing-in-the-advance-collection).

## Playing in BizHawk

### Setting up BizHawk

Do this once, after installing BizHawk.

- On Windows, run the prerequisites installer from BizHawk's release page before you start BizHawk for the first time.
- Open `EmuHawk.exe`. If you're using BizHawk 2.7 or 2.8, go to `Config > Customize`, switch the Lua Core on the Advanced tab from `NLua+KopiLua` to `Lua+LuaInterface`, and restart EmuHawk.
- Under `Config > Customize`, check "Run in background", so EmuHawk stays connected to the client while you're tabbed out.
- On the Advanced tab of the same window, tick "AutoSaveRAM" and choose "5s". EmuHawk then writes your in-game saves to disk every few seconds, so a crash is less likely to lose them.
- Load any `.gba` ROM, then set up your controls in `Config > Controllers…`. That menu item is unavailable until a ROM is loaded.
- Consider clearing the hotkeys you won't use, in `Config > Hotkeys…`. Select one and press Esc to clear it.

### Starting the game and connecting

1. In the Launcher, click "Open Patch" and select your `.apcvaos` file. Dragging the file onto the Launcher window does the same.
2. The first time, you are asked for your vanilla ROM. Select your US ROM. The collection's `game.exe` is accepted too, but the ROM extracted from it has no sound in BizHawk.
3. The Launcher creates a patched `.gba` file next to the patch file and opens the BizHawk Client. The client starts EmuHawk with the patched ROM and the connector script. The first time, it asks you to locate `EmuHawk.exe`.
4. If the patch came from a room page, the client connects to the room by itself, because the patch holds the room's address. Otherwise, enter the room's address and port (for example `archipelago.gg:38281`) into the client's top text field and click "Connect". If the room has restarted since you downloaded the patch, its port may have changed, so use the address shown on the room page.
5. If the room has a password, the client asks for it. Type it into the bottom text field and press Enter.
6. In EmuHawk, start a **new game** as **Soma**. You never enter a slot name in the game, because your slot is stored in the patched ROM.

### Reconnecting by hand

If you close a window mid-game, opening the patch again with "Open Patch" brings everything back. You can also do it by hand, skipping the steps for any window that is still open:

1. Open "BizHawk Client" from the Launcher.
2. Open the patched `.gba` file in EmuHawk.
3. In EmuHawk, go to `Tools > Lua Console`. Keep this window open while you play.
4. In the Lua Console, go to `Script > Open Script…`, and open `data/lua/connector_bizhawk_generic.lua` in your Archipelago install folder.
5. EmuHawk may freeze every few seconds until it connects to the client. This is expected. The client then shows that it recognized Castlevania: Aria of Sorrow.
6. Connect to the room in the client, as in step 4 of [Starting the game and connecting](#starting-the-game-and-connecting).

### Playing without the client

For a single-player seed, you can close the client and play the patched ROM in any emulator, as long as your options don't depend on the client. The client grants the Progressive Movement souls, your starting inventory and the items at enemy checks, and it switches the game to Hard Mode. A seed that uses any of these may not be finishable without it. Without the client, you also lose hints, the map tracker, skippable cutscenes and the Skull Key that Skull Key Warp uses.

## Playing in the Advance Collection

The collection runs the game in its own emulator, which can't run Archipelago's connector script. Instead, you install your seed *into* the collection, and the Collection Client reads and writes the running game's memory directly.

### Installing a seed

1. Close the collection if it is running.
2. In the Launcher, click "CVAoS Collection ROM Installer".
3. The installer finds the collection in any of your Steam libraries. If it can't, it asks you to select the collection's `game.exe`, and it saves your choice in `host.yaml`.
4. Select your `.apcvaos` file. (A `.gba` file also works, but only if it was patched from the collection's own ROM.)
5. The installer patches the collection's own Aria of Sorrow ROM and swaps the result into the collection's data files. This can take a minute, and a message box tells you when it has finished.

The installer changes files inside your Steam install, so it takes two precautions before its first change. It checks that the collection's Aria of Sorrow ROM is unmodified. It also saves pristine copies of the two data files it changes, `windata/alldata.bin` and `windata/alldata.psb.m`, as `.apbackup` files next to them. It never overwrites those copies, so you can always go back to the stock game.

### Starting the game and connecting

1. Launch the collection and start the **US** version of Aria of Sorrow. The collection also offers the Japanese and European versions, but the installer patches only the US one.
2. Start a **new game** as **Soma**. The collection keeps one set of save files for all seeds, so never load a save from an earlier seed, or a New Game+ started from one. The client could send the pickups and defeats on that save as checks for this seed, as [While you play](#while-you-play) explains.
3. In the Launcher, click "CVAoS Collection Client".
4. Enter the room's address and port from the room page (for example `archipelago.gg:38281`) into the client's top text field and click "Connect". If the room has a password, type it into the bottom text field and press Enter.
5. Once Aria of Sorrow is loaded, the client finds the running game by itself, usually from any screen. It then reads your slot from the installed ROM and logs in.

The client finds the game again if you close and reopen the collection, or switch games inside it. If you install a different seed while the client is open, it reconnects as that seed's slot.

### Going back to the original game

Close the collection, then click "CVAoS Collection Restore" in the Launcher. It puts back the stock files from the installer's backups. Steam's "Verify integrity of game files" restores them too. To play a seed again afterwards, run the installer again.

## While you play

These apply to both ways of playing.

- The client sends checks and delivers items only during normal play in a room. It waits while you're paused, in a menu, in a shop or moving between rooms.
- You can play with the client closed or disconnected. Everything syncs when you reconnect.
- While the client is connected, you can skip cutscenes with Start.
- If you turned on "Hard Mode", the client switches the game to Hard Mode while it is connected, even on a normal file. You don't need to select it in the game's menu.
- The client's bottom text field takes chat and Archipelago's commands, such as `!hint` followed by an item name. The [commands guide](/tutorial/Archipelago/commands_en) lists them.
- Type `/map`, or press the client's "Open map" button, to open a map tracker in your browser. The [game page](/games/Castlevania%20-%20Aria%20of%20Sorrow/info/en) describes what it shows.
- Type `/souls` to list which enemy drops each soul, and how often, or `/drops` to list the items each enemy drops. Both read the patched ROM you are playing.
- The client holds back the checks and goal of a save that has received more items than the server has sent for this seed, and prints a warning. Such a save may belong to another seed, or be a New Game+ started from one. It may also be your own save, if the server lost its most recent checks in a crash or a restart from the seed file. If it is your own save for this seed, type `/trust_save` to send its checks and goal. This lasts until the client reconnects. Otherwise, load this seed's save, and the client sends checks again by itself. A save from another seed is caught only when it has received more items, so the client still sends the checks of one that has received fewer.
- The client keeps a log of your run's play data on your computer. It records the souls you own, your checks, your equipped weapon and armor, and the drops your Enemy List shows, against the game's play timer. Each seed and slot gets its own file, such as `AP_<seed>_P1.jsonl`, in the `cvaos_play_data` folder inside the `logs` folder of your Archipelago install. Nothing in it is sent to the server or to other players.

## Updating

1. Download the new `cvaos.apworld` from the [releases page](https://github.com/anonymous-heap/Archipelago/releases), and install it with "Install APWorld".
2. Restart the Launcher and any open clients. They keep using the old version until they restart. If the Launcher says a restart is required, the new version has still been installed.

A seed generated with this version needs this version of `cvaos.apworld`, or a newer one, both to apply its patch and to play it. An older apworld refuses the patch, and an older client refuses the ROM. If you generate for a multiworld, make sure every Aria of Sorrow player has updated.

This version still plays seeds from the three releases before it: 2026.09.04 and 2026.10.30, whose patch format is V0.3, and 2026.11.01, whose patch format is V0.4. So you can update partway through one of those seeds. A seed from an older release needs the apworld that generated it. If a client refuses the ROM, see the troubleshooting below.

## Troubleshooting

### Installing

**Open Patch does not show my `.apcvaos` file.** The Launcher only lists the patch types of installed apworlds, so install `cvaos.apworld` and restart the Launcher. The Launcher also skips an apworld that needs a newer Archipelago, so check that you have 0.6.6 or later. Also check that your browser kept the `.apcvaos` extension when it downloaded the file.

**Applying the patch fails with "Unknown procedure", or says the patch needs a newer apworld.** The seed was generated with a newer `cvaos.apworld` than yours. Install that version, restart the Launcher, and open the patch or run the installer again.

### BizHawk

**The client says the ROM is unpatched.** You loaded the vanilla ROM instead of the patched `.gba` file.

**The client says the ROM was patched by an incompatible apworld version.** If your apworld is older than the one that generated the seed, update it. If yours is newer, install the version that generated the seed from the [releases page](https://github.com/anonymous-heap/Archipelago/releases), then restart the Launcher.

**The game has no sound in BizHawk.** The patch was applied to the Advance Collection's ROM, which has no sound outside the collection. For a BizHawk seed, click "Open host.yaml" in the Launcher, point `rom_file` under `cvaos_options` at your US ROM, and open the patch again. A collection seed always uses the collection's ROM while the collection is installed, so play that seed in the collection instead.

**The Lua Console warns that BizHawk is newer than the script.** Archipelago 0.6.6 and 0.6.7 show this for BizHawk 2.11 and later. Update Archipelago to 0.6.8 or later, or if something doesn't work, use BizHawk 2.10.

**EmuHawk doesn't start after patching, or the wrong program starts.** The Launcher keeps the `EmuHawk.exe` you selected the first time. Click "Open host.yaml" in the Launcher and correct `emuhawk_path` under `bizhawkclient_options`. To stop EmuHawk starting by itself, set `rom_start` there to `false`.

**Nothing happens when I pick items up.** Check that the Lua Console is still open and the connector script is still running. Remember that the client acts only during normal play in a room.

### Both clients

**I keep getting Skull Keys.** That is expected. A pickup that holds another player's item gives Soma a Skull Key, and the item is still sent. The [game page](/games/Castlevania%20-%20Aria%20of%20Sorrow/info/en) explains more.

**The client says the seed's target platform is the other one.** This is only a warning, because either platform can play either seed. What matters is which ROM the patch was applied to. A patch applied to the collection's ROM has no sound in BizHawk, and a `.gba` file patched from a cart dump can't go into the collection.

### Advance Collection

**The Collection Client says Aria of Sorrow is not loaded yet.** Start the US version of Aria of Sorrow inside the collection. The collection loads a game's ROM only once you start that game.

**The Collection Client says the collection has loaded another game or version.** The client names what it found, such as Aria of Sorrow (Japan) or Circle of the Moon (US). Return to the collection's menu and start the US version of Aria of Sorrow instead.

**The Collection Client says Aria of Sorrow (US) is not patched for Archipelago.** The collection is running its stock game data. Close it and run the installer.

**The Collection Client says the installed seed uses a different patch format.** The seed was made by an apworld version this client can't read. If your apworld is older than the one that generated the seed, update it. If yours is newer, install the version that generated the seed, then restart the Launcher.

**The Collection Client says it found a `game.exe` that is not the Castlevania Advance Collection.** Another program named `game.exe` is running. Close it, and the client finds the collection on its next try.

**The Collection Client says the game is not in normal gameplay yet.** When the client can't find the game's memory directly, it searches for it, and that search only works while you are in a room. Go back to normal play, away from menus, the map and the pause screen. The client keeps trying until you do.

**The installer says the collection is running.** Close the collection fully (check for `game.exe` in Task Manager) and try again.

**The installer says the ROM was patched from a cart dump.** For the collection, the patch must be applied to the collection's own ROM, so select the `.apcvaos` file in the installer instead and let it do the patching.

**The installer says the selected file did not match the collection's `game.exe`.** Make sure you picked `game.exe` in the Castlevania Advance Collection's folder. If you did, Steam may have updated the collection, so please report it.

## Getting help

If your problem isn't listed here, report it on the [issues page](https://github.com/anonymous-heap/Archipelago/issues). Please include the client's log, from the `logs` folder of your Archipelago install.

Logic mistakes, such as a location that needs a soul logic didn't expect, can also be corrected in the [logic spreadsheet](https://docs.google.com/spreadsheets/d/1FraahXhneKxnXsj_FX9LxrFJLJpsDQJNIrsSCmVWqEo/edit?gid=430351875#gid=430351875). It records what each route in the castle needs, and logic is built from it.
