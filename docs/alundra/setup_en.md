# Alundra Setup Guide

Patch a USA 1.1 disc and connect it to an Archipelago room through BizHawk.

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.7 or newer
- `alundra.apworld` from this repository's Releases page
- Your own USA 1.1 disc image of Alundra, as a `.bin` file
- [BizHawk](https://tasvideos.org/BizHawk) 2.9 or newer, with the Nymashock core. Versions 2.7 and 2.8 also work after you set their Lua core to Lua+LuaInterface. Connect has the menu path.

The patcher ships inside the apworld and runs on Windows and Linux.

## Install the apworld

1. Install Archipelago.
2. In the Archipelago Launcher, choose Install APWorld and select `alundra.apworld`.

## Create a YAML

A YAML is your slot. The [Archipelago setup guide](https://archipelago.gg/tutorial/Archipelago/setup/en) explains how a multiworld uses it.

After the apworld is installed, choose Generate Template Options in the Launcher. That writes an Alundra YAML with the Default preset and a comment on each setting. The preset is progressive items, split boots, Lake Shrine seals open, all seven crests in the pool, and the starting dagger, cloth armor, and short boots. The [game page](en_Alundra.md) describes the goal, which places count as checks, and how another player's item behaves.

An empty options block is the same preset:

```yaml
name: YourName
game: Alundra
Alundra: {}
```

Generation adds the dagger, cloth armor, and short boots when the starting inventory does not already list them.

## Generate

Put the YAML in Archipelago's `Players` folder and choose Generate in the Launcher. Host the zip from the Launcher, or upload it to [archipelago.gg](https://archipelago.gg).

Each Alundra slot has a file on the room page, offered as Download Patch File. The name ends in `.apalundra`.

## Join a room

Download your `.apalundra` file from the room page. Joining a room someone else generated skips the YAML and Generate steps.

## Patch a disc

1. In the Launcher, open `Alundra Patch`.
2. Choose the `.apalundra` file, then your USA 1.1 `.bin`.

The `Alundra Patch` tool writes a patched BIN/CUE in a folder next to that disc. The folder is named from the patch file. The disc you chose is left unchanged. With the spoiler log left on, the hint log is written in that same folder.

## Connect

Archipelago includes the Lua connector at `data/lua/connector_bizhawk_generic.lua`.

1. Open the patched disc in BizHawk with the Nymashock core. In Config > Customize, enable "Run in background" so the client stays connected when the window is not focused. On BizHawk 2.7 and 2.8, set the Lua core to Lua+LuaInterface under Config > Customize > Advanced, then restart BizHawk.
2. In EmuHawk, open Tools > Lua Console and leave that window open. Choose Script > Open Script and open `connector_bizhawk_generic.lua`.
3. In the Launcher, open BizHawk Client. The first time, it asks you to locate EmuHawk.
4. When the log says `Running handler for Alundra`, enter the room address, for example `archipelago.gg:38281`, and connect. The title screen stays unrecognized until you start the game and it loads.

The client reads the slot name from the disc. The log says `Logged in as <slot name>.` when the room accepts it. A vanilla disc, or a disc patched by a different release, never starts the handler. A disc patched for a different seed disconnects after login.

Once Alundra has control, the client sends opened chests, one-time shop purchases, and completed Merrick trades. An item found for you in another game is granted then. A full stack of a healing item is paid out as gilder. When the ending starts, the client sends the goal.
