# RWBY Grimm Eclipse Setup Guide

## Required Software

- The latest version of RWBY Grimm Eclipse on [Steam](https://store.steampowered.com/app/418340/RWBY_Grimm_Eclipse/) (The Google Play version is unlikely to work, though untested)
- [BepInEx](https://docs.bepinex.dev/index.html)
- The latest version of the [RWBY Grimm Eclipse Archipelago mod](https://github.com/nepcore/RwbyAP/releases)

## Installing the mod

1. Install the latest version of RWBY Grimm Eclipse
2. Install the **32-bit** version of the BepInEx mod loader as described in their [installation guide](https://docs.bepinex.dev/articles/user_guide/installation/index.html) (Linux users: install the windows version of BepInEx)
    * **[Linux only]** Set the launch command in Steam to `WINEDLLOVERRIDES="winhttp=n" %command%`
3. Run the game to have BepInEx generate a config file and close it after it reached the main menu (if the game crashes but a BepInEx config is generated you can ignore the crash for now)
4. Open `BepInEx/config/BepInEx.cfg` in a text editor and under `[Preloader.Entrypoint]` find the lines starting with `Type =` and `Method =` and change them to `Type = MonoBehaviour` and `Method = .cctor` respectively
5. Extract the mod into the `BepInEx/plugins` folder in your game files

# Joining a multiworld

1. Run RWBY Grimm Eclipse
2. In the main menu select the `Archipelago` entry
3. Enter the connection info and press the `Connect` button

**Note:** The mod currently isn't expected to work correctly with online co-op
