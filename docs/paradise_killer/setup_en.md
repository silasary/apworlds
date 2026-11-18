# Paradise Killer randomizer setup guide
Please please please finish a normal playthrough of the game first. You will do yourself a disservice playing it randomized for the first time.

## Required software
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker)
- Paradise Killer: [Available on Steam](https://https://store.steampowered.com/app/1160220/Paradise_Killer/) (only tested on the steam release, should work on other stores)
- Paradise Killer APworld: [GitHub](https://github.com/Chloe-Bt/Paradise-Killer-APworld/releases)
- Paradise Killer mod: [GitHub](https://github.com/Chloe-Bt/Paradise-Killer-APworld/releases)

## Mod installation
1. Go to the [releases page](https://github.com/Chloe-Bt/Paradise-Killer-APworld/releases) and download the latest `AParadiseKiller.zip` file. Similarly place the Universal Tracker `tracker.apworld` here as well.
2. In your library locate the `./steamapps/common/Paradise Killer/ParadiseKiller/Binaries/Win64/` folder. This folder should contain the `ParadiseKiller-Win64-Shipping.exe` file.
3. Extract all files from the AParadiseKiller.zip file in here, such that the `UE4SS.dll` is in the same folder as `ParadiseKiller-Win64-Shipping.exe`.
### Linux
If you use Linux, make sure to add `WINEDLLOVERRIDES="dwmapi=n,b" %command%` as a custom launch option on Steam.

## Generating a game
1. Go to the [releases page](https://github.com/Chloe-Bt/Paradise-Killer-APworld/releases) and download the latest `Paradise Killer.apworld` file.
2. Place `Paradise Killer.apworld` into your `./Archipelago/worlds/` folder.
3. Restart the Archipelago launcher.
4. Place all yamls for the particular seed into the `./Archipelago/Players/` folder.
5. Run the `generate` option in the archipelago launcher.
6. A zip file will be added to your `./Archipelago/output/` folder, which can hosted on the [Archipelago website](https://archipelago.gg/uploads) or hosted locally.

## Joining a Multiworld Game
1. Launch Paradise Killer and create a new save file.
2. Once in game, and past the opening dialogue in LLD's bedroom, press either ~ or f10 twice to bring up the in-game text client.
3. Type `/connect {address:port} "{slotname}" "{password}"`
    - The password field is optional
    - Note the slotname and password require "" surrounding them.
4. If entered correctly, a message should appear that you are connected.
