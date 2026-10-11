# XCOM 2 War of the Chosen Archipelago Setup Guide

## Required Software

- [XCOM 2](https://store.steampowered.com/app/268500/XCOM_2/) with the [War of the Chosen DLC](https://store.steampowered.com/app/593380/XCOM_2_War_of_the_Chosen/) installed through Steam
- [XCOM 2 WotC Archipelago Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3281191663)
    - Files for [manual installation](https://github.com/Snyax/Archipelago/blob/main/worlds/x2wotc/docs/mod_manual_installation.md) available [here](https://github.com/Snyax/WOTCArchipelago/releases)
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- [XCOM 2 WotC APWorld](https://github.com/Snyax/Archipelago/releases)

## Optional Software

- **(Strongly recommended)** Any dedicated XCOM 2 WotC Mod Launcher like the [Alternative Mod Launcher (AML)](https://github.com/X2CommunityCore/xcom2-launcher)
- **(Strongly recommended)** [Mod Config Menu for WotC](https://steamcommunity.com/sharedfiles/filedetails/?id=667104300)
- **(Strongly recommended)** [Universal Tracker APWorld](https://github.com/FarisTheAncient/Archipelago/releases)
- Alien Hunters and Shen's Last Gift DLCs are supported but not required.

## Setup

### XCOM 2 War of the Chosen Mod

1. Install [XCOM 2](https://store.steampowered.com/app/268500/XCOM_2/) and the [War of the Chosen DLC](https://store.steampowered.com/app/593380/XCOM_2_War_of_the_Chosen/) through Steam.
2. Subscribe to the [XCOM 2 WotC Archipelago Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3281191663).
3. **(Optional)** Install any dedicated Mod Launcher (e.g. [AML](https://github.com/X2CommunityCore/xcom2-launcher)).
4. Launch XCOM 2 War of the Chosen with the AP mod enabled.

### XCOM 2 WotC AP Client

1. Download and install the latest [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) release.
2. Download the latest release of the [XCOM 2 WotC APWorld](https://github.com/Snyax/Archipelago/releases). Double-click it to install automatically, or copy it to your Archipelago installation's `custom_worlds` folder manually.
3. **(Optional)** Download the latest release of the [Universal Tracker APWorld](https://github.com/FarisTheAncient/Archipelago/releases). Double-click it to install automatically, or copy it to your Archipelago installation's `custom_worlds` folder manually.
4. Launch the XCOM 2 War of the Chosen AP Client from the Archipelago Launcher.

## Generating a Multiworld

1. Follow the general [Archipelago Guide](https://archipelago.gg/tutorial/Archipelago/setup/en) for generating and hosting a Multiworld.
    - Multiworld will have to be generated locally but can be hosted on the website.
    - [APWorld](https://github.com/Snyax/Archipelago/releases) can be found on GitHub.
    - [Options Template](https://github.com/Snyax/Archipelago/releases) can be generated with the 'Generate Template Options' button in the Archipelago Launcher, or found on GitHub.

## Joining a Multiworld

0. Before you can connect to a slot, the AP mod must be installed. Make sure you've followed the setup instructions above.
1. In the client, connect to the address the Multiworld is hosted at.
2. Provide your slot name (the name you entered into your YAML).
3. If asked, provide the room password that was set during generation.
4. You may be prompted to provide the path to your installation of XCOM 2, most likely ending in `/XCOM 2`.
    - If the client doesn't find the AP mod there, it will also ask for your Steam workshop directory. This should only concern you if you have the mod installed in a different Steam archive to the game, e.g. on another drive.
    - If you set the path incorrectly, you can change it anytime with the `/game_path` client command, or reset it with `/reset_paths` so the client will prompt you again on the next connection attempt. The same goes for `/workshop_path`.
5. If everything worked, the client will tell you that you're connected. Restart the game if it was already running and start playing!
