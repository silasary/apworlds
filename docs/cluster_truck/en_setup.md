# ClusterTruck Multiworld Setup Guide

## If you are hosting
1. Download and install [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases).
2. Open Archipelago
3. Download `cluster_truck.apworld` from the [releases page](https://github.com/Nullctipus/ArchipelagoClusterTruck/releases) and click Install APWorld in Archipelago, selecting cluster_truck.apworld when prompted
4. Download `cluster_truck.yaml` from the [releases page](https://github.com/Nullctipus/ArchipelagoClusterTruck/releases) and place it in the Players folder
5. Edit `cluster_truck.yaml` to change any options you may want
6. Make sure you have everyone's APWorld and yaml installed and click generate
7. Go to [Upload Multidata](https://archipelago.gg/uploads) and start the server.

## If you are playing
1. Download BepInEx.zip from the [releases page](https://github.com/Nullctipus/ArchipelagoClusterTruck/releases)
2. Extract in your ClusterTruck directory (default is `C:\ProgramFiles (x86)\Steam\SteamApps\Common\ClusterTruck`)
3. Download and install [.NET Desktop Runtime 9](https://dotnet.microsoft.com/en-us/download/dotnet/9.0)
4. Optionally: enable console in `BepInEx/config/BepInEx.cfg` by setting `Logging.Console.Enabled = true`
5. Start the game.
6. Optionally: press `F1` to edit the mods settings.
7. On the upper left type in Address, Slot Name, and optionally Password.
8. Click Connect
9. Optionally: enable DeathLink on the upper left
10. Have Fun

## Linux
0. THE SNAP VERSION WILL NOT WORK, EITHER USE PROTON OR SWITCH TO NATIVE/FLATPAK
   1. Make sure you have mono and dotnet 9.0 installed
1. Download BepInEx.zip from the [releases page](https://github.com/Nullctipus/ArchipelagoClusterTruck/releases)
2. Extract in your ClusterTruck directory (default is `~/.local/share/Steam/steamapps/common/Clustertruck`)
3. Delete `BepInEx/Core`
4. Download [BepInEx_linux_x64_5.4.23.2.zip](https://github.com/BepInEx/BepInEx/releases/tag/v5.4.23.2)
5. Extract to game folder
6. Edit `run_bepinex.sh` so that `dll_search_path_override="unstripped"`
7. Set Launch Options to `./run_bepinex.sh "%command%"`
8. Continue from step 3 of above list

## Inside BepInEx.zip
If you don't want to download the zip you can make it yourself

1. Download the required files:
   - [corlibs 5.3.4](https://unity.bepinex.dev/corlibs/5.3.4.zip)
   - [Newtonsoft.Json](https://github.com/JamesNK/Newtonsoft.Json/releases/latest)
   - [BepInEx 5](https://github.com/BepInEx/BepInEx/releases/tag/v5.4.23.2)
   - [BepInEx.ConfigurationManager for BepInEx5](https://github.com/BepInEx/BepInEx.ConfigurationManager/releases/latest)
   - [ArchipelagoClusterTruck.zip](https://github.com/Nullctipus/ArchipelagoClusterTruck/releases)
2. Extract the files. All paths are relative to ClusterTrucks game directory
    - extract only `System.Runtime.Serialization.dll` from corelibs zip to `unstripped`
    - extract only `Bin/net35/Newtonsoft.Json.dll` from Newtonsoft.Json zip to `unstripped`
    - extract BepInEx5 to the Game Directory
    - extract BepInEx Configuration Manager to Game Directory
    - extract ArchipelagoClusterTruck to `BepInEx/plugins`
3. Run game then close
4. Edits
   - Edit `doorstop_config.ini` to replace `dll_search_path_override = ` with `dll_search_path_override = unstripped`
   - Edit `BepInEx/config/BepInEx.cfg` to replace `Preloader.Entrypoint.Type = Application` with `Preloader.Entrypoint.Type = Camera`