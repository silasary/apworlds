## Installing

Download the mod and the AP world. The mod will be a zip file with your OS name
- [Latest Mod Release](https://github.com/Axertin/mth-apclient/releases/latest)

- [Latest AP World release](https://github.com/FyreDay/Archipelago-MinaTheHollower/releases/latest)

### Switch to the Experimental Modding Beta
 The mod requires a Steam copy of Mina the Hollower on the **experimental-modding Beta** It also requires 
 `-mod -mod-allow-code` launch options set (this enables loading a mod's code library).

If you have never done this before, 
1. navigate to Steam->Mina The Hollower->Properties->Game Versions & Betas
2. Select `experimental-modding` in the version list

### Windows

Unzip the mod.zip (containing a `apclient` folder with a `mod.dll` and `mod.yc`) inside into:

```
%APPDATA%\Yacht Club Games\Mina the Hollower\mods
```
so that the .dll and .yc files are in
```
%APPDATA%\Yacht Club Games\Mina the Hollower\mods\apclient\
```

Set Steam launch options for Mina the Hollower:

```
-mod -mod-allow-code
```

The game's mod loader writes `%APPDATA%\Yacht Club Games\Mina the Hollower\mod.log` each run;
the mod's own runtime log is `%LOCALAPPDATA%\mth-apclient\mthap_*.log`.

### Linux

The mod is installed into Mina The Hollower's save directory (the SDL prefix path), not the install dir.

Unzip the mod.zip (containing a `apclient` folder with a `mod.so` and `mod.yc`) inside into:, 

```
~/.local/share/Yacht Club Games/Mina the Hollower/mods
```
so that the .dll and .yc files are in
```
~/.local/share/Yacht Club Games/Mina the Hollower/mods/apclient/
```
Set Steam launch options for Mina the Hollower:

```
-mod -mod-allow-code
```

The game's mod loader writes `~/.local/share/Yacht Club Games/Mina the Hollower/mod.log` each
run (whether a mod loaded, version-check or load failures) - check it first if the mod doesn't
appear. The mod's own runtime log is `~/.local/share/mth-apclient/mthap_*.log` (one file per run).

## Running
An ImGui overlay window should appear allowing connection and disconnection to an AP server. If it
doesn't appear or you want to hide it once connected, it can be toggled by pressing `F2`.

You will see "disconnected" instead of "Start Game" until you are connected to a multiworld.

You will automatically load into a save once you click "Start game"

## Debugging

There is also a console you can access by presssing **F1**. type ```help``` to see commands
