# Donkey Kong Country Returns (Wii) Setup Guide

## Required Software

* Latest version of the [Dolphin Emulator](https://github.com/dolphin-emu/dolphin)
* At least version 0.6.7 of the [Archipelago Launcher](https://github.com/ArchipelagoMW/Archipelago)
* Latest [DKCR AP World](https://github.com/CallmeZewo/DKCR_APWorld/releases)

## Other Requirements

This AP World requires the following Gecko Code to be enabled in Dolphin:

```text
C22E5CD8 00000007
387B0010 39C00020
7C6373D6 1DC30020
7DCED850 39CE0010
3DE0817F 61EFC3A8
1C630004 7C637850
80630000 7C637430
70630001 00000000
0410A23C 4800001C
0410A388 48000014
```

The steps below explain how to install the AP World and add this code to Dolphin.

## Installation

1. Download the latest release of the [DKCR AP World](https://github.com/CallmeZewo/DKCR_APWorld/releases).

2. Install the `.apworld` file by either:

   * Double-clicking the file, or
   * Placing it in the `custom_worlds` folder inside your Archipelago installation.

3. Open Dolphin and select **Options → Configuration**. In the **General** tab, make sure **Enable Cheats** is enabled.

4. Right-click **Donkey Kong Country Returns** in your Dolphin game list and select **Properties**.

   Make sure you are using the correct version of the game. In the **Info** tab, under **Game Details**, the following should be shown:

   ```
   Name: Donkey Kong Country Returns (Disc 1, Revision 1)
   Country: USA
   ```

   Other regions or revisions are not currently supported.

5. Open the **Gecko Codes** tab and select **Add New Code**.

   Enter a name and creator, then paste the Gecko Code from above into the **Code** section. Save the code and make sure the checkbox next to it is enabled.

6. Launch **Donkey Kong Country Returns** in Dolphin, then launch the **Donkey Kong Country Returns Client** from the Archipelago Launcher.

7. Enter your server address, port, and slot name in the client. Once connected, start a new save file in the game.

8. Have fun!

## PopTracker

A [PopTracker pack for DKCR AP](https://github.com/MagicMason1000/DKCR-AP-PopTracker-Package/releases) is available if you want a visual tracker for your locations and progression.

## Notes

* No game patch or modified ISO is required.
* The AP World runs through memory injection while using an unmodified game.
* The Gecko Code must be enabled for the AP World to communicate with the game.
* The supported game version is the **USA release of Donkey Kong Country Returns (Disc 1, Revision 1)**.
* Other regions or game revisions may not work correctly.
