# Totally Accurate Battle Simulator Setup Guide

## Required Software

- [Totally Accurate Battle Simulator](https://store.steampowered.com/app/508440/Totally_Accurate_Battle_Simulator/).
The mod has only been tested on the Steam version, but the Epic version may work as well.
- The [TABS_AP randomizer mod/APWorld](https://github.com/duckboycool/TABS-Archipelago/releases/latest)
- [BepInEx 5](https://docs.bepinex.dev/articles/user_guide/installation/index.html)

## Mod Installation

Download BepInEx from the [GitHub releases](https://github.com/BepInEx/BepInEx/releases) page. Make sure to use BepInEx
5 instead of 6, and to download the x64 version for your platform. Then extract the contents of the zip file into the
main `Totally Accurate Battle Simulator` folder where the game is installed. If you open the game, you should see a log
created in the `BepInEx` folder.

Once BepInEx is installed, download the `TABS_AP.zip` from
[GitHub](https://github.com/duckboycool/TABS-Archipelago/releases/latest). Create a folder in `BepInEx/plugins` called
`TABS_AP`, and extract the contents of the zip into it. Then, go to the game's managed DLLs in
`Totally Accurate Battle Simulator/TotallyAccurateBattleSimulator_Data/Managed` and remove the `Newtonsoft.Json.dll`
file from the base game by either putting it somewhere else or deleting it (it can be restored later if needed by
validating files on Steam). Now if you open the game, there should be a UI to connect to an Archipelago server in the
top left corner. Enter the connection details and press the connect button to connect to the server and begin playing.
