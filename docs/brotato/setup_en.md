# Brotato Randomizer Setup Guide

## Required Software

- Brotato, purchased either via
  [Steam](https://store.steampowered.com/app/1942280/Brotato/) or [Epic Games
  Store](https://store.epicgames.com/en-US/p/brotato-ed4097).

  - Note that the Xbox/Game Pass version of Brotato does NOT work, because it does not
    ship with `ModLoader`, which is necessary for the mod to work.

### Steam (Workshop Install)

**WARNING:** The workshop mod automatically updates whenever a new version is available.
If you need to use an older version of the mod to complete a multiworld, you will need
to use the manual installation instructions below.

1. Open the [Steam Workshop for
   Brotato.](https://steamcommunity.com/app/1942280/workshop/)
2. Search for the "Archipelago" mod.
3. Subscribe to the mod to install it.

### Steam (Manual Install)

As of the 1.1.0.0 update, Brotato does not accept mods added any way apart from via the
Workshop. As a workaround, we can use the placeholder mod, and place the Archipelago mod
in that folder.

1. Download [`RampagingHippy-Archipelago.zip` from the latest
   release.](https://github.com/SpenserHaddad/Brotato-ArchipelagoClient/releases/latest)
2. Open the [Steam Workshop for
   Brotato.](https://steamcommunity.com/app/1942280/workshop/)
3. Subscribe to the [[Modders]
   mode](https://steamcommunity.com/sharedfiles/filedetails/?id=3369699033) to download
   it.
4. In a File Explorer, navigate to your Brotato Steam Workshop folder. On Windows, this
   defaults to `C:\Program Files (x86)\steamapps\workshop\content\1942280` (`1942280` is
   Brotato's Steam ID).
5. Open the folder titled `3369699033` in the above directory.
6. Copy the zip file we downloaded in step 1. into this folder.
  - **DO NOT UNZIP THE FILE.**
  - **DO NOT REMOVE ANY OTHER FILES HERE.**

### Epic Games Store

1. Download [`RampagingHippy-Archipelago.zip` from the latest
   release.](https://github.com/SpenserHaddad/Brotato-ArchipelagoClient/releases/latest)
2. Copy the zip file to `<brotato_installation>/mods`.
  - **DO NOT UNZIP THE FILE.**
  - To confirm, there is be a file called `add your zipped mods here` in the folder.
  - If you don't know where to look:
    1. Find Brotato in your EGS library
    2. Click on the three horizontal dots next to its name.
    3. In the window that opens, click the folder+magnifying glass next in the
       "Installation" row.
## Archipelago Text Client

The Brotato mod acts as a client to Archipelago, so you do not need to launch a separate
client. However, you may find it useful to keep the Archipelago Text Client (included in
the Archipelago installation by default) open alongside Brotato to keep track of
Multiworld progress.