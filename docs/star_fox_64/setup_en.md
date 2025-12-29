# Setup guide for Star Fox 64

## Prerequisites

You will need the Star Fox 64 v1.1 ROM. MD5s of supported files:
* `741a94eee093c4c8684e66b89f8685e8`
* `ef9a76901153f66123dafccb0c13cd94`

You can play either on Bizhawk, on Project 64 4.0 or on a real n64 console using an EverDrive64 (either v3.0 or X7)
* [Bizhawk](https://tasvideos.org/BizHawk/ReleaseHistory)
  * Version 2.10 and later is supported.
  * Detailed installation instructions for BizHawk can be found at the above link.
  * Windows users must run the prereq installer first, which can also be found at the above link.
* [Project 64 4.0](https://www.pj64-emu.com/nightly-builds)
  * Project 64 4.0 is currently in developement, however Dev-4.0.0-6555-9034bc6 was tested and no issues were found.
  * You can either use the installer, or the zip, both of which can be found at the above link.
* EverDrive 64
  * You will need to install the USB driver for your OS.
    * [Windows](https://ftdichip.com/wp-content/uploads/2021/08/CDM212364_Setup.zip)
    * [Linux](https://ftdichip.com/wp-content/uploads/2022/07/libftd2xx-x86_64-1.4.27.tgz)
  * For EverDrive v3.0, the OS version needs to be 3.06 to be compatible. The X7 can use the latest OS version.
  * The Nintendo 64 Expansion Pak is required

# Configuration & Playing

## In development

This world is currently in development, which means you must manually place some files in certain locations. The [releases](https://github.com/Auztin/AP-Star-Fox-64/releases/latest) page has all of the files you need. Use the Archipelago Launcher's `Browse Files` button to find the Archipelago directory.
* `star_fox_64.apworld` - This needs to go in the `Archipelago/custom_worlds/` folder. You can also double click this file to have Archipelago do this for you.
* `connector_sf64_bizhawk.lua` - If you will be using Bizhawk, this needs to go in the `Archipelago/data/lua/` folder. The `/autostart` command can do this for you.

## Patched ROM

Once `star_fox_64.apworld` is in the correct location, you will find the `Star Fox 64 Client` in the Archipelago Launcher. When you start this client for the first time, it will ask you to provide the original `Star Fox 64 v1.1` ROM. Once provided, the client will then generate a patched ROM in the Archipelago folder. This patched ROM can be used for all generated seeds of the same version. The location of the original ROM will be saved and automatically used to patch new versions.

## Generic instructions

* Open the `Star Fox 64 Client` using the Archipelago Launcher.
* If prompted, provide the original `Star Fox 64 v1.1` ROM.
* If you will be using Bizhawk and want the client to start Bizhawk for you, type the command `/autostart`.
  * This will ask you to provide the location of `EmuHawk.exe`.
  * It will then start Bizhawk with the patched ROM and lua automatically loaded for you.
  * The client will remember the location of `EmuHawk.exe` and automatically start it in the future.
* If you are not using Bizhawk, or prefer not to use `/autostart`:
  * Open the [patched ROM](#patched-rom) on your platform of choice.
  * Load the connector for your platform of choice.
* With the game running (not paused in the emulator), you should see it successfully connected in the `Star Fox 64 Client`.
* Once you have a room hosted, connect the `Star Fox 64 Client` to the room.
* You are now ready to play!

It's worth noting that `/autostart` can also work for other platforms. You just need to provide the location of the executable.
* Project64 - It can launch the emulator with the game loaded, but it can't load the script automatically.
* EverDrive64 - It can automatically launch the connector, but you must load the game manually.

The configuration for `/autostart` is located in the `host.yaml` file in your Archipelago folder.

## Platform specific instructions

* [Bizhawk](#bizhawk)
* [Project 64](#project-64)
* [EverDrive 64](#everdrive-64)

## Bizhawk

No specific configuration is necessary for Bizhawk. However, it is recommended to enable AutoSaveRAM. Every 5s is fine.

Either use the `/autostart` command or load the [patched ROM](#patched-rom), and then load `Archipelago/data/lua/connector_sf64_bizhawk.lua`. Use the Archipelago Launcher's `Browse Files` button to find the Archipelago folder.

## Project 64

* Click `Options` -> `Configuration`
* Under `General settings`:
  * Uncheck `Pause emulation when window is not active`
  * Uncheck `Hide advanced settings`
* Under `General settings` -> `Advanced`:
  * Check `Enable debugger`
* Click OK
* Click `Debugger` -> `Scripts...`
* Click the `...` button. This will open the scripts folder. Place the `connector_sf64_pj64.js` file here

Load the [patched ROM](#patched-rom), and then load the connector script.

## EverDrive 64

No specific configuration is necessary for EverDrive 64.

Load the [patched ROM](#patched-rom), and then run the `connector_sf64_ed64` executable.
