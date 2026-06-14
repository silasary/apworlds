# Vacation Simulator Multiworld Setup Guide

## Required Software

- Vacation Simulator: [Steam](https://store.steampowered.com/app/726830/Vacation_Simulator/)
- BepInEx v6.0.0-pre.1 (BepInEx_UnityIL2CPP_x64_6.0.0-pre.1.zip): [GitHub](https://github.com/BepInEx/BepInEx/releases/tag/v6.0.0-pre.1)
- Archipelago Mod: [GitHub](https://github.com/ret724/APVacationSimFixed/releases/latest)

## Setup

1. Install BepInEx with the guide in the [BepInEx Docs](https://docs.bepinex.dev/master/articles/user_guide/installation/unity_il2cpp.html)

2. Extract the Archipelago mod so the fle path is `\Vacation Simulator\BepInEx\plugins\APVacationSim`

3. You can check that the mod is working properly by loading a new save file in game, and if 
Vacation Bot does **not** greet you before letting you into your hotel room.

## Connecting

1. Open the `.json` file at `\Vacation Simulator\BepInEx\plugins\APVacationSim\APLogin.json` and
fill in the connection details, putting both the address and port into the `port` field with the 
following format: `address:port`. Make sure to save the file.

2. Launch the game. Once you reach file select your game should connect using the details in the 
`APLogin.json` file automatically. Select either a new file if this is a new game, or select 
whichever file you were using last time you played in whatever multiworld you are playing.