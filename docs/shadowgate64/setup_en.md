
# SETUP GUIDE FOR SHADOWGATE 64 ARCHIPELAGO

## Important

As we are using BizHawk, this guide is only applicable to Windows and Linux systems.

## Required Software and Hardware

-   BizHawk:  [BizHawk Releases from TASVideos](https://tasvideos.org/BizHawk/ReleaseHistory)
    -   Version <b>2.9.1</b> and later are supported.
    -   Detailed installation instructions for BizHawk can be found at the above link.
    -   Windows users must run the prereq installer first, which can also be found at the above link.
-   A Shadowgate 64 ROM (English).
-   The github releases contains the shadowgate64 connector. Put this in your <b>Archipelago\data\lua</b> folder.

## Playing on BizHawk
### Configuring BizHawk

Once BizHawk has been installed, open EmuHawk and change the following settings:

-   Under Config > Customize, check the "Run in background" and "Accept background input" boxes. This will allow you to continue playing in the background, even if another window is selected.
-   Under Config > Hotkeys, many hotkeys are listed, with many bound to common keys on the keyboard. You will likely want to disable most of these, which you can do quickly using  `Esc`.
-   If playing with a controller, when you bind controls, disable "P1 A Up", "P1 A Down", "P1 A Left", and "P1 A Right" as these interfere with aiming if bound. Set directional input using the Analog tab instead.
-   Under N64 enable "Use Expansion Slot". (The N64 menu only appears after loading a ROM.)
-   Under Config -> Speed/Skip, I recommend playing on speeds between 150% or 200%.

It is strongly recommended to associate N64 rom extensions (*.n64, *.z64) to the EmuHawk we've just installed. To do so, we simply have to search any N64 rom we happened to own, right click and select "Open with…", unfold the list that appears and select the bottom option "Look for another application", then browse to the BizHawk folder and select EmuHawk.exe.

### Setup - BizHawk
- Run Launcher.exe and select Shadowgate 64 Client
- If this is your first time running this version, it will prompt for your Shadowgate 64 ROM
- The patched rom is located in your Archipelago root folder
    - The exact path is also printed on the Shadowgate 64 Client
    - You can also click "Browse Files" in the Launcher which will take you to this folder
- Connect the Archipelago Client with the server.
    - To connect the client to the multiserver simply put  `<address>:<port>`  on the textfield on top and press `connect` (if the server uses password, then it will prompt after connection).
- Open Bizhawk (2.9.1+) and open your patched Shadowgate 64 game
- Once you are in the game title menu or game select screen, drag and drop the shadowgate64_connector lua script (which should be data/lua folder of Archipelago) onto the Lua console window.