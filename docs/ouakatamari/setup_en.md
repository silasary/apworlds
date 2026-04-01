# Once Upon a Katamari Multiworld Setup Guide

## Quick Links

- [Once Upon a Katamari (Steam)](https://store.steampowered.com/app/1880620/Once_Upon_A_KATAMARI/)
- [Archipelago Mod (Once Upon An Archipelago)](https://github.com/ItsSeafoamy/Once-Upon-an-Archipelago/releases)
- [BepInEx 6](https://builds.bepinex.dev/projects/bepinex_be)

## Setup
1. Download the Bleeding Edge build of [BepInEx 6](https://builds.bepinex.dev/projects/bepinex_be).
Choose "BepInEx Unity (IL2CPP) for Windows (x64) game".
2. Extract the contents into the game's root folder. By default, this is 
`C:\Program Files (x86)\Steam\steamapps\common\OnceUponaKATAMARI`.
3. Download the Archipelago plugin 
[(Once Upon an Archipelago)](https://github.com/ItsSeafoamy/Once-Upon-an-Archipelago/releases), and extract its contents
into `BepInEx/plugins`.
4. Start Once Upon a Katamari to generate the necessary configuration files, and then close it

## Joining a MultiWorld
1. Open `BepInEx/config/OnceUponAnArchipelago.cfg`, and enter the correct server address, slot name and, if applicable,
password.
2. Make sure the Archipelago server is running before launching the game. 
3. Launch Once Upon a Katamari
4. The game will automatically connect on startup. If successful, you will see a message saying "Archipelago: Connected"
at the bottom of the screen.
5. If you see a red "Archipelago: Not Connected", close the game, check your settings and that the server is running,
and relaunch the game. There is currently no way to reconnect whilst the game is running.
6. Start a new save