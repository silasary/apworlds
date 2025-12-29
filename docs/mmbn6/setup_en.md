# Setup Guide for MegaMan Battle Network 6 Archipelago

## Important

As we are using Bizhawk, this guide is only applicable to Windows and Linux systems.

## Required Software

- Bizhawk: [Bizhawk Releases from TASVideos](https://tasvideos.org/BizHawk/ReleaseHistory)
  - Version 2.7.0 and later are supported.
  - Detailed installation instructions for Bizhawk can be found at the above link.
  - Windows users must run the prereq installer first, which can also be found at the above link.
- The built-in Archipelago client, which can be installed [here](https://github.com/ArchipelagoMW/Archipelago/releases).
- A US MegaMan Battle Network 6: Cybeast Gregar ROM. Note that you cannot use the Legacy Collection ROM for this, and 
the Archipelago community cannot provide this.

## Configuring Bizhawk

Once Bizhawk has been installed, open Bizhawk and change the following settings:

- **If you are using a version of BizHawk older than 2.9**, you will need to modify the Lua Core.
  Go to Config > Customize. Switch to the Advanced tab, then switch the Lua Core from "NLua+KopiLua" to
  "Lua+LuaInterface". This is required for the Lua script to function correctly.  
  **NOTE:** Even if "Lua+LuaInterface" is already selected, toggle between the two options and reselect it. Fresh installs 
  of newer versions of Bizhawk have a tendency to show "Lua+LuaInterface" as the default selected option but still load 
  "NLua+KopiLua" until this step is done.
- Under Config > Customize > Advanced, make sure the box for AutoSaveRAM is checked, and click the 5s button.
  This reduces the possibility of losing save data in emulator crashes.
- Under Config > Customize, check the "Run in background" and "Accept background input" boxes. This will allow you to
  continue playing in the background, even if another window is selected, such as the Client.
- Under Config > Hotkeys, many hotkeys are listed, with many bound to common keys on the keyboard. You will likely want
  to disable most of these, which you can do quickly using `Esc`.

It is strongly recommended to associate GBA rom extensions (\*.gba) to the Bizhawk we've just installed.
To do so, we simply have to search any GBA rom we happened to own, right click and select "Open with...", unfold
the list that appears and select the bottom option "Look for another application", then browse to the Bizhawk folder
and select EmuHawk.exe.

## Install the APWorld

How to use an .apworld: Place the .apworld in your Archipelago/custom_worlds folder, or double-click the .apworld to do 
so automatically. Use ArchipelagoLauncher.exe to open the Launcher, and click on Generate Template Options to create 
template yamls for your custom .apworlds. Place the desired player yamls in the Players folder, and customize them as 
you see fit. Use ArchipelagoGenerate.exe to generate the game. Upload the generated game (in the output folder) on the 
website at https://archipelago.gg/uploads and create a new room. Refer to the individual game's setup guide for further 
instruction (usually in the pins for the game's ⁠future-game-design⁠ post or its github). The patch file should be 
present on the Archipelago website, but it will also be available via the generated output zip folder.

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should
generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy
an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

When you install the apworld, you can generate a template YAML to start with. You can also use the default or expert 
YAMLs provided on the releases page.

## Joining a MultiWorld Game

### Obtain your GBA patch file

When you join a multiworld game, you will be asked to provide your YAML file to whoever is hosting. Once that is done,
the host will provide you with either a link to download your data file, or with a zip file containing everyone's data
files. Your data file should have a `.apbn6` extension.

Double-click on your `.apbn6` file to start your client and start the ROM patch process. Once the process is finished
(this can take a while), the client and the emulator will be started automatically (if you associated the extension
to the emulator as recommended).

You can also use the `Open Patch` option on the Archipelago launcher. As long as the apworld is installed correctly, 
the `.apbn6` file should be selectable from the file prompt. This should automatically open the Bizhawk Client,
along with the necessary lua script for the next step.

### Connect to the Multiserver

Once both the client and the emulator are started, you must connect them. Within the emulator click on the "Tools"
menu and select "Lua Console". Click the folder button or press Ctrl+O to open a Lua script.

Navigate to your Archipelago install folder and open `data/lua/connector_bizhawk_generic.lua`. The emulator and client 
will eventually connect to each other. The BizHawk Client window should indicate that it connected and recognized 
Mega Man Battle Network 6.

To connect the client to the multiserver simply put `<address>:<port>` on the textfield on top and press enter (if the
server uses password, type in the bottom textfield `/connect <address>:<port> [password]`)

Don't forget to start manipulating RNG early by shouting during generation:

```
JACK IN!
[Your name]!   
EXECUTE!
```
