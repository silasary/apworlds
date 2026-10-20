# Mario Tennis GBC Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.7 or later
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) 2.9 or later
- Your own Mario Tennis (USA or Europe) Game Boy Color ROM. The Archipelago community cannot provide this.

### Configuring BizHawk

- Under `Config > Customize`, check "Run in background" so the client stays connected while EmuHawk is not focused.
- Open any `.gbc` file and set up your inputs in `Config > Controllers…`.

## Installing the apworld

Double-click `mario_tennis_gbc.apworld`, or copy it into the `custom_worlds` folder of your Archipelago install.

## Generating and Patching a Game

1. Create your options file (YAML). From the Archipelago Launcher, "Generate Template Options" writes a template for
   every installed game, Mario Tennis GBC included.
2. Follow the general Archipelago instructions for [generating a game](/tutorial/Archipelago/setup_en#generating-a-game).
   Your patch file has the `.apmtgbc` extension.
3. In the Archipelago Launcher, select "Open Patch" and choose your patch file.
4. The first time, you are asked for your vanilla ROM, then for `EmuHawk.exe` in your BizHawk install.
5. A patched `.gbc` is written next to the patch file. The launcher then opens the BizHawk Client, starts EmuHawk with
   the patched ROM, and loads the connector script.

## Connecting to a Server

Opening the patch does steps 1-4 for you. If a window gets closed mid-game:

1. Open the BizHawk Client from the launcher.
2. Load the patched `.gbc` in EmuHawk.
3. In EmuHawk, open `Tools > Lua Console` and, under `Script > Open Script…`, open `data/lua/connector_bizhawk_generic.lua`
   from your Archipelago install. Keep the Lua Console open while playing.
4. Wait for the client to say it recognized Mario Tennis GBC.
5. Enter the room's address and port (e.g. `archipelago.gg:38281`) in the client and click Connect. The ROM already
   knows its slot, so no slot name is needed.

Progress made offline is kept and sent when you reconnect. Without `remote_items`, this world's own items are granted
by the game itself, so a single-player seed can be played without connecting at all.

A cart patched for a different seed erases its save data on boot and starts over.
