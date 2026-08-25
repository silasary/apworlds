# Sekiro: Shadows Die Twice Randomizer Setup Guide

## Required Software

- [Sekiro: Shadows Die Twice]
- [Sekiro: Shadows Die Twice AP Client]
- [Sekiro: Shadows Die Twice AP World]

[Sekiro: Shadows Die Twice]: 
https://store.steampowered.com/app/814380/Sekiro_Shadows_Die_Twice/
[Sekiro: Shadows Die Twice AP Client]:
https://github.com/antonovanton000/SekiroArchipelagoClient/releases
[Sekiro: Shadows Die Twice AP World]:
https://github.com/yenix4/ArchipelagoSekiro/releases

## Optional Software

[Poptracker] (still early in development and not complete):

[Poptracker]: 
https://github.com/vonTungsten/Sekiro-Poptracker/releases


## Setting Up

First, download the client for your OS from the link above 
(`randomizerAP_*_*.zip`). Extract the contained randomizerAP folder into your 
Sekiro game directory.

This randomizer _only_ supports the latest version of _Sekiro_, 1.06. This
is the latest version, so you don't need to do any downpatching! However, if
you've already downpatched your game to use an older version of the randomizer, 
you'll need to reinstall the latest version before using this version. You 
should also delete the `dinput8.dll` file if you still have one from an older 
randomizer version.

### Client Operation

1. Whenever you want to connect to a multiworld, run
   `randomizerAP\SekiroAPClient.exe` from your game directory.

2. Put in your Archipelago room address (usually something like
   `archipelago.gg:12345`), your player name (also known as your "slot name"), 
   and your password if you have one. This will be filled out already if you 
   already connected to a slot.

3. Click `Connect` and **wait until the client displays the item tracker.** 
   (When you first connect to a multiworld, the client will generate the local 
   data files for your world's randomized item and (optionally) enemy locations.
   Therefore, the first connection will take some time.)

4. To prevent you from getting penalized, **make sure to set _Sekiro_ to offline
   mode in the game options.**

To run _Sekiro_ in Archipelago mode on **Windows**:

5. Simply press the `Launch Game` button in the opened client.

6. Start playing as normal. An "Archipelago connected" message will appear
   onscreen once you have control of your character and the connection is 
   established.

### Does this work with Proton or Steam Deck?

The *Sekiro* Archipelago randomizer supports running on Linux under Proton or 
even Steam Deck. There are a few things to keep in mind:

* Because `SekiroAPClient.exe` relies on the .NET runtime, the Linux release is
  shipped with .NET Runtime 10 already included for your convenience.

* Follow the client operation guide until the end of step 4. You will notice the
  `Launch Game` button is missing. Instead, follow the instructions below:

1. The following line must be added to the Launch Options of Sekiro on Steam: 
   `WINEDLLOVERRIDES="dinput8=n,b" %command%`

2. To run the game itself, launch it via Steam while having the client window 
   open and connected to your slot. 

3. After that, start playing as normal. An "Archipelago connected" message will 
   appear onscreen once you have control of your character and the connection is 
   established.

## Frequently Asked Questions

### Where do I get a config file?

The [Sekiro: Shadows Die Twice AP World] includes an Options template. You can 
also use the Options Creator in the Archipelago Launcher to configure your 
personal options and export them into a config file. Please read the
documentation in the template carefully before asking questions about the 
options, most things will be explained there already.

## Troubleshooting

### Enemy randomizer issues

The Sekiro Archipelago randomizer uses [thefifthmatt's Sekiro enemy and 
item randomizer], essentially unchanged for the enemies. Unfortunately, this 
randomizer has a few known issues, including enemy AI not working, enemies 
spawning in places they can't be killed, and, in a few rare cases, enemies
spawning in ways that crash the game when they load. These bugs should be 
[reported upstream], but unfortunately the Archipelago devs can't help much 
with them.

[thefifthmatt's Sekiro enemy and item randomizer]: 
https://www.nexusmods.com/sekiro/mods/543

[reported upstream]: https://github.com/thefifthmatt/SoulsRandomizers/issues

Because in very rare cases the enemy randomizer can cause seeds to be impossible 
to complete, we recommend disabling it for large async multiworlds for safety
purposes.

### `SekiroAPClient.exe` isn't working

Potentially, the client may not function for you. This is usually caused by some
issue communicating with Steam to launch it properly. If this is happening to 
you, make sure:

* You have Sekiro 1.06 installed. This is the latest patch as of August 2026.

* Steam is not running in administrator mode. To fix this, right-click
  `steam.exe` (by default this is in `C:\Program Files\Steam`), select
  "Properties", open the "Compatibility" tab, and uncheck "Run this program as 
  an administrator".

* There is no `dinput8.dll` file in your Sekiro game directory. The client 
  directory brings its own Modengine instance with it, existing files of other
  mods can mess this up.

If you've checked all of these, you can also try:

* Running `SekiroAPClient.exe` as an administrator.

* Reinstalling Sekiro or even reinstalling Steam itself.

* Making sure Sekiro is installed on the same drive as Steam (A number of users 
  are able to run these on different drives, but this has helped some users.)

If none of this works, unfortunately there's not much we can do. We use
ModEngine2 to launch Sekiro with the Archipelago mod enabled, but unfortunately
the support for Sekiro is limited and there are always unknown bugs that can 
happen.
