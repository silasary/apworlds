# Rift Wizard Setup Guide

## Required Software

- [The most recent Archipelago release](https://github.com/ArchipelagoMW/Archipelago/releases)
- A legal copy of [Rift Wizard](https://store.steampowered.com/app/1271280/Rift_Wizard),
installed through Steam on Windows.
- Rift Wizard Archipelago Mod from
  the [Rift Wizard Archipelago Releases Page](https://github.com/TheBigSalarius/RiftWizardArchipelagoMod/releases/)
- AAA_Loader Mod (Required for mods) (https://github.com/DaedalusGame/AAA_Loader)

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should
generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy
an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

A template yaml can be created by launching the **ArchipelagoLauncher.exe** in the main Archipelago install folder 
(by default `C:\ProgramData\Archipelago`) and selecting **Generate Template Settings**. This will open the templates folder
which will contain a `riftwizard.yaml`

## Initial Setup
### Update host.yaml to include the Rift Wizard root directory

1. Look for your Archipelago install folder. By default, the installer creates them in `C:\ProgramData\Archipelago`.
2. Open the **ArchipelagoLauncher.exe**.
3. Select **Open host.yaml**.
3. Paste the following at the bottom of the file:
```
riftwizard_options:
  # Locate the Rift Wizard root directory on your system.
  # This is used by the Rift Wizard client, so it knows where to send communication files to
  root_directory: "C:/Program Files (x86)/Steam/steamapps/common/Rift Wizard/RiftWizard"
```
*Note: If you have installed Rift Wizard in a different location you'll need to update the path on the last line.*

The Rift Wizard root directory can be found by going to 
`Steam->Library->Right Click Rift Wizard->Manage->Browse Local Files` and clicking on the RiftWizard folder then
copying the path in the address bar. (The slashes will need to be flipped in the path that is copied.)

### Add Archipelago Mod

1. In the Rift Wizard root directory (The path from step 3 above) open the **mods** folder.
2. Unzip the **ArchipelagoMod** folder from the Rift Wizard Archipelago Mod into the mods folder 
(to create and populate mods/ArchipelagoMod) 
3. Create the **AAA_Loader** folder under mods and unzip the AAA_Loader.py into it (to create and populate mods/AAA_Loader) 
   * _Note: To disable the mods the ArchipelagoMod/AAA_Loader folder can be removed or renamed to anything else. 
The folder name in mods and the .py file must have a matching name to work._
   * _The Archipelago mod appears to be compatible with most other well known Rift Wizard mods, 
many of which add balancing and improve the game experience._

## Connecting to a Multiworld game

1. Look for your Archipelago install folder. By default, the installer creates them in `C:\ProgramData\Archipelago`.
2. Open the **ArchipelagoLauncher.exe**.
3. Click RiftWizard Client.
4. Notice the `/connect command` on the server hosting page (It should look like `/connect archipelago.gg:*****`
   where ***** are numbers)
5. Type the connect command into the client OR add the port to the pre-populated address on the top bar (it should
   already say `archipelago.gg`) and click `connect`
6. When prompted to `Enter a slot name:`, enter the name specified in the settings file (.yaml).
   * _It should also display this name on the server hosting page._
7. Launch Rift Wizard from Steam and enjoy!
