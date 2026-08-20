# Armored Core 3 Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [The Armored Core 3 apworld](https://github.com/Aleksandylmao/Armored-Core-3-PCSX2-Archipelago/releases) 
- [PCSX2 Emulator](https://pcsx2.net/downloads/)
- A legally-obtained Armored Core 3 ISO 
	- NTSC-U, SLUS-20435 
	
## Optional 
- [Analog Controls](https://github.com/VanLaser/analog-controls-for-armored-core-ps2?tab=readme-ov-file#qol-enhancements-analog-controls-for-armored-core-ps2-series-ac2-ac2-another-age-ac3-ac-silent-line)

## Installing the World
1. Download `armoredcore3.apworld` from the [releases](https://github.com/Aleksandylmao/Armored-Core-3-PCSX2-Archipelago/releases) page.
2. Double-click it, drag it onto `ArchipelagoLauncher.exe` or put it in your Archipelago/lib/worlds folder.

## Generating
- To generate a game, follow [the official instructions.](https://archipelago.gg/tutorial/Archipelago/setup/en#generating-a-game)

## Configuring PCSX2
By default, PINE features are disabled in PCSX2. Please follow these steps to enable it: 

1. In PCSX2: **Tools -> Show Advanced Settings**.
2. **System -> Settings -> Advanced -> PINE Settings**: check **Enable**,
   Slot **28011**.   

## Connecting

1. Open the **Armored Core 3 Client** from the Archipelago launcher.
2. It will try to auto-detect PCSX2 over PINE.
3. To connect the client to the server, enter your room's address and port (e.g. archipelago.gg:38281) into the top text field of the client and click Connect.
4. Open PCSX2 and launch Armored Core 3.
5. After the client has connected to both PCSX2 and the Archipelago server, you can start playing!

You should now be able to receive and send items. It is possible to make progress offline if you're already loaded into a mission when you drop your connection, but the mission menu restructuring code requires a connection to the Armored Core 3 Client.

Ensure that you create a brand new save file each time you start a fresh Archipelago world. 
If you take a break and come back to the game, ensure you resume from the same save file you have been using.
