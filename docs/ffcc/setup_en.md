# Final Fantasy Crystal Chronicles Multiworld Setup Guide

## Installation Procedures (Windows)

1. Download the latest FFCC Randomizer release and the FFCC apworld, and install the apworld. Use a randomizer
   and an apworld from the same release: the patcher warns you if your seed was made with a different apworld
   version, since some fixes won't apply.
2. Get your `.apffcc` file: download it from your room's page, or find it in the output zip if you generated
   locally. Seeds made with an apworld older than 0.3.0 use `.ffcc` instead, which works the same way.
3. In the FFCC Randomizer's AP Patch tab, choose your clean NTSC-US ISO and your `.apffcc` file, and patch.

## Joining a MultiWorld Game

1. Start the patched ISO in Dolphin.
2. Open your `.apffcc` file (or launch the Final Fantasy Crystal Chronicles Client from the Archipelago Launcher).
   A `.apffcc` downloaded from the room connects to the server on its own and fills in your slot name.
3. Otherwise, connect with `/connect <address>` and enter your slot name when asked.

## Tracking (optional)

- **Universal Tracker:** install [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker)
  (`tracker.apworld`) next to the FFCC apworld. The FFCC client then gets a Tracker tab listing what is in logic, a Map
  tab with the dungeon maps, and Universal Tracker's commands. The first time, it asks for the FFCC PopTracker pack:
  pick the pack's `.zip` file itself (an unzipped folder won't load), and after that it remembers it. The Map tab
  turns to the dungeon you are in.
- **PopTracker:** load the FFCC pack in PopTracker and connect it to the same room.
