
# SETUP GUIDE FOR SHADOWGATE 64 ARCHIPELAGO

## Important

This guide is only applicable to Windows and Linux systems.
To run this implementation, you need to run the following in order:
 - Open the Shadowgate64 Client
 - Patch your ROM
 - Open your Emulator and wait until its connected
 - Connect to your slot (AFTER your emulator is connected)

## Required Software and Hardware

- PC Emulation:
    - Tested emulators and recommended settings:
        -   BizHawk:  [BizHawk Releases](https://tasvideos.org/BizHawk/ReleaseHistory)
            -   Version **2.10** and later are supported
            -   Detailed installation instructions for BizHawk can be found at the above link
            -   Windows users must run the prereq installer first, which can also be found at the above link
        -   Project64 3.0: [Public Releases](https://www.pj64-emu.com/public-releases)
            -   Version **3.0.1** supported
            -   Default settings should work.
            -   enable Input Plugin N-Rage if you are having issues setting up your controller.
            -   disable debugging in Options > configuration > Debugging
            -   to reduce lag:
                1. Open the ROM
                2. Options > Config: > Counter Factor = 0 or 1
        -   Luna64: [Latest Releases](https://github.com/Luna-Project64/Luna-Project64/releases)
            -   Version **3.6.5** tested
            -   Emulate Frame Buffer need to be enabled:
                - Options > Graphic Settings > Frame Buffer > Emulate Frame Buffer
                - disable debugging in Options > configuration > Debugging
            -   to reduce lag:
                1. Open the ROM
                2. Options > Config: > Counter Factor = 0 or 1
        -   RMG: [Latest Releases](https://github.com/Rosalie241/RMG/releases)
            -   Version **0.8.9** tested
            -   Default settings should work.
            -   to reduce lag:
                1. Open the ROM
                2. Settings > Game > Counter Factor = 0 or 1

    - Supported emulators but untested (use at your own discretion)
        -   simple64
        -   Parallel Launcher
        -   RetroArch (mupen64plus_next):
            - For MacOS users, enable Settings > Network > Network Commands and leave the Network Command Port at 55355.
        -   Gopher64
        -   Ares
        -   Project64 4.0

## Playing on BizHawk

Once BizHawk has been installed, open EmuHawk and change the following settings:

- Under Config > Customize, check the "Run in background" and "Accept background input" boxes. This will allow you to continue playing in the background, even if another window is selected
- Under Config > Hotkeys, many hotkeys are listed, with many bound to common keys on the keyboard. You will likely want to disable most of these, which you can do quickly using  `Esc`
- If playing with a controller, when you bind controls, disable "P1 A Up", "P1 A Down", "P1 A Left", and "P1 A Right" as these interfere with aiming if bound. Set directional input using the Analog tab instead
- Under N64 enable "Use Expansion Slot". (The N64 menu only appears after loading a ROM.)
- Under Config -> Speed/Skip, click "Audio Throttle" as this will fix the off pitch sounds while playing

It is strongly recommended to associate N64 rom extensions (*.n64, *.z64) to the EmuHawk we've just installed. To do so, we simply have to search any N64 rom we happened to own, right click and select "Open with…", unfold the list that appears and select the bottom option "Look for another application", then browse to the BizHawk folder and select EmuHawk.exe.


