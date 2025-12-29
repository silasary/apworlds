# Setup guide for Blue Sphere

## Important notes

Blue Sphere is a **hint game**. It can connect to any slot in your multiworld and unlock random location hints,
revealing what items were placed into that world.

This means that it doesn't create a slot, and has no YAML, so you do *not* need to include Blue Sphere when generating
your multiworld.

As we are using BizHawk, this guide is only applicable to Windows and Linux systems.

## Required software

- The latest version of [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory)
- The latest version of [upstream Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest), AND
the latest version of the [Blue Sphere APWorld](https://github.com/FlitPix/ap-bluesphere/releases/latest)
    - Some forks will already include the APWorld. In this case, you don't need to download it.
- Your legally-obtained Blue Sphere ROM for Sega Genesis / Mega Drive. This cannot be provided by Flit or the Archipelago
community.
    - Other versions, such as Sonic Mania/Origins's Blue Sphere, are not supported at this time.
    - It's recommended to use the JP/KOR version of Sonic 1. Other versions may work but are untested for now. Let me know
    if they work for you.
    - Obtaining a ROM:
        - If you have ROMs for Sonic & Knuckles and Sonic 1, you can combine them with this Linux command (use your filenames):
        `cat s&k.md s1.md > bluesphere.md`
        - Blue Sphere is included in the GameCube version of Sonic Mega Collection.
        Follow [this guide](https://sethmlarson.dev/extracting-genesis-and-game-gear-roms-from-sega-gamecube-collections#sonic-mega-collection)
        to extract it.

## Configuring BizHawk

Follow TASVideos's instructions to install and configure BizHawk. This is not in the scope of this setup guide.

## Installing the APWorld

Do one of the following to install the APWorld:

- Double-click it. This will automatically install it for you. The `*.apworld` file extension must be registered to the
launcher for this to work; Windows users don't have to worry about this.
- Move it to the `custom_worlds` subdirectory in your Archipelago folder.

If you previously placed it in the `lib/worlds` subdirectory, delete it from there.

## Joining the multiworld

If you've played any other game using the Archipelago BizHawk Client, the steps are identical.

1.  Load the Blue Sphere ROM in BizHawk.
2.  In the Archipelago Launcher, open the BizHawk Client.
3.  In BizHawk, go to Tools > Lua Console.
4.  In the window that appears, go to Script > Open Script.
5.  In the file selection dialog that appears, navigate to your Archipelago folder, then select `data/lua/connector_bizhawk_generic.lua`.
6.  Ensure "Loading handler for Blue Sphere" appears in the BizHawk Client.
7.  In the BizHawk Client, enter your room address at the top and click Connect.
8.  When prompted, enter your password (if applicable), and your slot name.
9.  Get Blue Spheres!
    - Press `A`, `B`, and `C` at the same time to proceed past the "No Way! No Way! No Way! No Way?" screen.
    - Press `A`, `B`, or `C` on the main screen to switch between Sonic or Knuckles.
    - Press `START` to play a Special Stage.
    - For info on what happens when clearing or failing a Special Stage, see the [game page](/games/Blue%20Sphere/info/en)
