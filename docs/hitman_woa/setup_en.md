# Setup Guide for HITMAN World of Assassination

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- Hitman World of Assassination from either [Steam](https://store.steampowered.com/app/1659040/HITMAN_World_of_Assassination/) or [Epic Games Store](https://store.epicgames.com/p/hitman-3)
    - Any Edition is compatible, except for "HITMAN World of Assassination Episode: Sapienza" and the Demo "HITMAN Free Starter Pack"
- [Peacock](https://github.com/thepeacockproject/Peacock/releases/latest)
- The [Archipelago Plugin for Peacock](https://github.com/BenDipp/Archipelago/releases/latest) and the [Hitman APworld](https://github.com/BenDipp/Archipelago/releases/latest)

## Optional software

- [Hitman AP Tracker](https://github.com/BenDipp/HitmanPopTracker/releases/latest), for use with
[PopTracker](https://github.com/black-sliver/PopTracker/releases)

## Installation

### Peacock

If you already have installed Peacock, it is still recommended to install a seperate instance for Archipelago, as the obtaining of items and unlocks will mess with your Peacock progression.

More information about the installation can be found on the [Peacock website](https://thepeacockproject.org/wiki/intel/installation/)

 1. Download the latest version of [Peacock](https://github.com/thepeacockproject/Peacock/releases/latest).
 2. Unzip the files into an easily accessible place.
    - Do not place them in the game folder or the "Program Files" folder of Windows.
 3. In that unziped folder run both `Start Server.cmd` and `PeacockPatcher.exe`.
 4. Start Hitman to verify it worked. The Main Menu should feature a Panel stating "Powered by The Peacock Project".
 5. Close `Start Server.cmd` and place `archipelago.plugin.js` in the `plugins`-folder.
 6. Run `Start Server.cmd` again. The Server Console should feature a line with the text `[Info | Archipelago Plugin] Plugin Loading.`

### APworld

To install the APworld, simply double click it or drag and drop it into the running Archipelago Launcher. Alternatively, you can choose the option `Install APWorld` in the Archipelago Launcher or drop the `.apworld` file into the `custom_world`-folder in your Archipelago install.

After installing, restart the Launcher and `HITMAN World of Assassination Client` should appear as an option in the `Client` list.

If your Peacock Server is not running locally on your machine, you must change the address that the Client uses to connect to Peacock in the `host.yaml` of your Archipelago installation.

## Joining a Multiworld 

 1. Run both `Start Server.cmd` and `PeacockPatcher.exe` from the folder where Peacock is installed
 2. Run the `Archipelago Launcher` and choose `HITMAN World of Assassination Client` in the `Client` list.
 3. Enter room's address and port (e.g. `archipelago.gg:12345`) into the top text field of the client and click Connect.
 4. Enter your slot name.
 5. Start Hitman from the Launcher of your choice. Your unlocked Levels can be found under `Campaigns > Archipelago`.
    - If you recieved a level while in the main menu, the campaigns tab will not update unless you enter and leave a level, or click "Go Offline" and then "Go Online" in the main menu.  

## Uninstalling

To play Hitman unmodified, simply launch Hitman without having `PeacockPatcher.exe` open to connect to official IOI Servers.

To play Hitman with Peacock but without Archipelago, simply delete `archipelago.plugin.js` from the `plugins`-folder and Launch Hitman with `PeacockPatcher.exe` and `Start Server.cmd` open.