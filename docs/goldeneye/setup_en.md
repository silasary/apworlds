# GoldenEye 007 Setup Guide

## First-time setup

Install:

1. Archipelago 0.6.7 or newer
2. BizHawk (Should work on any 2.9+, but was optimized on 2.10)
3. The newest goldeneye.apworld on the releases page.

Restart Archipelago after installing the world.
You need your own legally dumped USA GoldenEye 007 ROM in `.z64` format.
A pre-patched ROM will not work.

## Play from a room

1. Download your `.apge` patch from the Archipelago room page.
2. Open it with Archipelago Launcher. On Windows, use **Open with**, select
   `ArchipelagoLauncher.exe`, and choose to always use it for `.apge` files.
3. On first use, select your base GoldenEye ROM and `EmuHawk.exe` when asked.

The launcher creates a patched `.z64` beside the download, starts BizHawk,
loads GoldenEye's Lua script, enables the 8 MiB Expansion Pak, and opens the
client. This ROM NEEDS the Expansion Pak so don't turn that off.
The ROM supplies your slot and seed. Room downloads supply the server
address. If there's no password, just leave that blank if it asks.

## Host Server / Play Solo

Use the Options Creator in Archipelago Launcher or manually configure your 
GoldenEye player YAML and use ArchipelagoGenerate.exe. Upload the generated
game to a room or use ArchipelagoServer.exe to run locally. The seed host should 
not need a base ROM.
