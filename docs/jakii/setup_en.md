# Jak II (ArchipelaGOAL II) Setup Guide

## Required Software

* A **legally purchased** copy of _Jak II_.
* [The OpenGOAL Launcher](https://opengoal.dev/).
## Installation via OpenGOAL Launcher

**You must set up a vanilla installation of Jak II before you can install mods for it.** These instructions will work on
both NTSC and PAL versions of the game.

- Follow the installation process for the OpenGOAL Launcher, found 
[here](https://opengoal.dev/docs/usage/installation/).
- Follow the setup process for adding mods to the OpenGOAL Launcher, found [here](https://jakmods.dev).
- Run the OpenGOAL Launcher. If you have it open already, close and reopen it.
- Click the Jak II logo on the left sidebar.
- Click `Features` in the bottom right corner, and then click `Mods`.
- Under `Available Mods`, click `ArchipelaGOAL II`. The mod should begin installing. When it is done, click `Continue`
in the bottom right corner.
- **DO NOT PLAY AN ARCHIPELAGO GAME THROUGH THE OPENGOAL LAUNCHER.** The Archipelago Client should handle everything
for you.
- Once the mod is installed, in the bottom right corner, click `Advanced`, then `Compile`.

## Updates and New Releases via the OpenGOAL Launcher

If you are in the middle of an async game, and you do not want to update the mod, you do not need to do this step.
The mod will only update when you tell it to.

- Run the OpenGOAL Launcher. If you have it open already, close it and reopen it.
- Click the Jak II logo on the left sidebar.
- Click `Features` in the bottom right corner, then click `Mods`, then under `Installed Mods`, click `ArchipelaGOAL II`.
- Click `Update` to download and install any new versions that have been released.
- You can verify your version by clicking `Versions`. The version you're using will say `(Active)` next to it.
- **Now, you must click `Advanced`, then `Compile`, in order for the update to take effect.**

## Starting a Game

### New Game

- Run the Archipelago Launcher.
- From the list, locate and select `Jak II Client`.
- From there, three windows should appear:
  - The OpenGOAL compiler will compile and launch the game. They should take about 30 seconds to compile.
    - You can **MINIMIZE** the Compiler window, but **DO NOT CLOSE IT!!** It is required for Archipelago and the game
    to communicate with each other.
  - The game window itself will launch, and Jak will be standing in the Prison.
    - Once the compilation is complete, the title sequence will start.
  - Finally, the Archipelago text client will open.
    - If you see **BOTH** `The Compiler is ready!` and `The Memory Reader is ready!`, then that should indicate a 
    successful startup. If you don't, please see the troubleshooting section.
- Once you see the game's title screen, use the text client to connect to the Archipelago server. This will communicate
your current settings and slot data to the game.
- Please give the game a moment to receive your items, if applicable. It can take anywhere from a few seconds to a 
couple of minutes, so please be patient.
- After waiting, you can press Start.
- Choose `New Game`, choose a save file, and play through the opening cutscenes.
- Once you reach the prison in the Baron's Fortress, the game has begun!

### Returning / Async Game
The same steps as starting a New Game apply, with some key exceptions:

- Once you reach the title screen, connect to the Archipelago server **BEFORE** you load your save file.
  - This is to allow AP to give your current settings and all the items you had previously.
  - **THESE SETTINGS AFFECT LOADING AND SAVING OF SAVE FILES, SO IT IS IMPERATIVE THAT YOU DO THIS FIRST.**
- After a given amount of time has passed on the title screen, you can press Start.
- Instead of choosing `New Game` in the title menu, choose `Load Game` and choose the save file for this respective 
game.

## Troubleshooting

### The Text Client says "Unable to locate the OpenGOAL install directory"

Normally, the Archipelago client should be able to find your OpenGOAL installation automatically.

However, if it can't, you may have to tell it yourself. Do the following:

- Run the OpenGOAL Launcher. If you have it open, close it and re-open it.
- Click the Jak II logo on the left sidebar.
- Click `Features` in the bottom right corner, then click `Mods`, then under `Installed Mods`, click `ArchipelaGOAL II`.
- Click `Advanced` in the bottom right corner, then click `Open Game Data Folder`. You should see a new File Explorer
open to that directory.
- In the File Explorer, go to the parent directory called `archipelagoal-2`, and you should see `gk` and `goalc` 
executables. Copy this path.
- Run the Archipelago Launcher, then locate and click on `Open host.yaml`. You should see a new text editor open 
that file.
- Search for `jakii_options`, and you will need to make two changes here.
- First, find the `root_directory` entry. Paste the path you noted earlier (the one with `gk.exe` and `goalc.exe`)
inside the double quotes.
- **MAKE SURE YOU CHANGE ALL BACKSLASHES `\` TO FORWARD SLASHES `/`!!**

```yaml
root_directory: "%programfiles%/OpenGOAL/features/jak2/mods/archipelagoal/archipelagoal"
```

- Second, find the `auto_root_directory` entry. Change this field to `false`. You do not need to use double quotes.

```yaml
auto_root_directory: true
```

- Save the file and close it.

### The Game Fails to Load the Title Screen

You may start the game via the Text Client, but it never loads in the title screen. Check the Compiler window: you may
see red and yellow errors like this.

```
-- Compilation Error! --
```

If this happens, follow these instructions

- Run the OpenGOAL Launcher. If you have it open, close it and re-open it.
- Click the Jak II logo on the left sidebar, then click `Advanced`, then click `Open Game Data Folder`. 
Copy the `iso_data` folder from this directory.
- Back in the OpenGOAL Launcher, click the Jak II logo in the left sidebar.
- Click `Features` in the bottom right corner, then click `Mods`, then under `Installed Mods`, click `ArchipelaGOAL II`.
- In the bottom right corner, click `Advanced`, then click `Open Game Data Folder`.
- Paste the `iso_data` folder you copied earlier.
- Back in the OpenGOAL Launcher, click on the Jak II logo on the left sidebar.
- Click `Features` in the bottom right corner, then click `Mods`, then under `Installed Mods`, click `ArchipelaGOAL II`.
- In the bottom right corner, click `Advanced`, then `Compile`.

### The Text Client Says "Error reading game memory!" or "Error sending data to compiler!"

If at any point the text client says this in big red letters, you will need to restart the **all** of these applications.

- Close all open windows: the client, the compiler, and the game.
- Run the OpenGOAL Launcher, then click `Features`, then click `Mods`, then click `ArchipelaGOAL II`.
- Click `Advanced`, then click `Play in Debug Mode`.
- Click `Advanced`, then click `Open REPL`.
- Then close and reopen the Jak II Client from the Archipelago Launcher.
- Once these are done, you can enter `/repl status` and `/memr status` in the text client to verify.

### The Client Cannot Open A Compiler Connection

If the client cannot open a REPL (compiler) connection to the game, you may need to check the following steps:

- Ensure you are not hosting anything on ports `8181` and `8112`. Those are for the REPL (goalc) and the game (gk) respectively.
- Ensure that Windows Defender and Windows Firewall are not blocking those programs from hosting or listening on those ports.
- You can use Windows Resource Monitor to verify those ports are open when the programs are running.
- Ensure that you only opened those ports for your local network, not the wider internet.

## Known Issues

- Finishing all Sewer Missions results in the airlock doors going non-functional once in the elevator
  - For this, you can simply teleport to the hideout and continue as normal