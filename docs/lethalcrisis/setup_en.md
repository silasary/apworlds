# Lethal Crisis Randomizer Setup Guide

## Required Software
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [The Lethal Crisis APWorld](https://github.com/hypergeek7/LethalCrisis-AP/releases/latest/download/lethalcrisis.apworld)
- [Lethal Crisis AP Patch](https://github.com/HyperGeek7/LethalCrisis-AP/releases/latest/download/lethal-crisis-ap.zip)


## Optional Files
- [English Patch](https://zeltraslabs.com/LethalCrisis/LethalCrisisEnglish.v1.0.zip)

## Instructions

### Patching Lethal Crisis
These instructions assume you're using the Steam release of Lethal Crisis on Windows. If you're instead running one of the previous releases with Japanese filenames, the same instructions still apply, but substitute `リーサルクライシス.exe` for `Lethal Crisis.exe`.
- **Back up your save files if you want to keep them.** These are in the `save` folder under your Lethal Crisis install. The AP patch cannot differentiate between "normal" save files and ones associated with an AP game, and it will bork your save data if you accidentally load it.
    - In addition, an issue with Lethal Crisis's Steam implementation means that verifying game files also blasts your saves. This patch makes a backup such that you shouldn't _need_ to do this to get back to a vanilla install, but it's an easy mistake to make if you're running on autopilot.
- If you intend to install the English patch and haven't done it already, do that first. The AP patch can be applied on top of the English patch, but the English patch cannot be applied on top of the AP patch.
- Extract the patch zip into your Lethal Crisis directory. I.e. `lc-ap_patcher.exe`, `ap_patch_files.lczip`, and the `lua` folder should be sitting directly next to `Lethal Crisis.exe` in the game's directory.
- If you're running the Steam release of Lethal Crisis, you should just need to double-click `lc-ap_patcher-x86_64-windows.exe` and let it work.
    - If you're using a release with Japanese filenames, drag `リーサルクライシス.p` onto `lc-ap_patcher-x86_64-windows.exe` instead.
- The patcher should churn for a few seconds and then tell you the patch was successfully installed. If so, you are ready to create a multiworld and play!

### Generating a Game
There's nothing special about Lethal Crisis from AP's side, so just do the normal things:
- Install the apworld via either a double-click or the option from the Archipelago Launcher.
- Create your YAML via the Options Creator in the Archipelago Launcher.
- Either generate a game or pass on your YAML to whoever is generating for you.

### Launching
There _is_ an order of operations to this:
- With the apworld installed, you should have a Lethal Crisis Client added to your launcher.
- Launch the client and log into your slot.
- Once you are connected, launch Lethal Crisis itself.
- If all goes well, you should see the line "Lethal Crisis has connected!" appear in the client shortly after arriving at the title screen. Once you see this, you are free to start a new game.

## Uninstalling

The patcher backs up your unpatched `Lethal Crisis.p` as `Lethal Crisis.p.vanilla` in your Lethal Crisis folder. Simply delete `Lethal Crisis.p` and rename `Lethal Crisis.p.vanilla` to take its place.
