# Pokémon Battle Revolution Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest) (Note that if you're on Linux, you may need to use the tarball)
- [Pokémon Battle Revolution APWorld & disc-riider-py](https://github.com/Axcel-Snowpix/PokemonRevoAP/releases/latest)
- [Dolphin Emulator](https://dolphin-emu.org/download)
- Pokémon Battle Revolution USA ISO ROM

### Configuring Dolphin

In Dolphin, go to `Options > Graphics Settings > Hacks` and turn off `Store EFB Copies to Texture Only`.  
This will fix an issue where a trainer's photo won't be displayed on their Battle Pass correctly.

## Optional Software

- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases)

## Installing the APWorld

There's a few ways to install the APWorld

1- Open the Archipelago Launcher and search for the `Install APWorld` option.  
2- Double click the APWorld file and set it to open with the Archipelago Launcher.  
3- Put the APWorld file in the `custom_worlds` folder of your Archipelago installation. You can find it by opening the Archipelago Launcher and searching for the `Browse Files` option.

## Installing disc-riider-py

Open the Archipelago Launcher and search for the `Browse Files` option. Click it, and it'll open the folder containing your Archipelago installation.  
Then, take the `disc-riider-py.zip` file you downloaded, put it in your Archipelago installation's `lib` folder and extract its contents.  
Make sure there's only one `disc-riider-py` folder, with no copies inside it.

## Options and Generating

### Configuring your YAML File

After installing the Pokémon Battle Revolution APWorld, open the Archipelago Launcher (if you already had it open while installing the APWorld, restart it) and then search for the `Options Creator`. There, you can find and select Pokémon Battle Revolution on the games list to the left, and starting choosing your options.  
Alternatively, you can search for `Generate Template Options` in the launcher and click it. Once you do, it'll open a folder with template YAMLs for all of your installed worlds. In there, search for `Pokémon Battle Revolution.yaml`, make a copy of it, and then edit it in any text editor of your choice (i.e. Notepad).

### Generating the Multiworld

To generate a Multiworld, follow the Archipelago instructions for [generating a game](https://archipelago.gg/tutorial/Archipelago/setup_en#generating-a-multiplayer-game), specifically the instructions for generating on your local installation.  
Once the Multiworld has been generated, follow the instructions for [hosting an Archipelago server](https://archipelago.gg/tutorial/Archipelago/setup_en#hosting-an-archipelago-server).  
If you're not the one generating the Multiworld, then simply send the host your YAML file.

## Patching and Playing your Game

### Acquiring your Patch File

After the Multiworld has been generated, you need to get your `.appbr` patch file. There's a few ways to do this.  
1- If the Multiworld is being hosted in the offical [Archipelago website](https://archipelago.gg/), open the room's page in your browser and search for your slot; next to it there should be text saying `Download Patch File`; click it, and the patch will begin installing.  
2- If you are the one who generated the Multiworld, unzip the output file and look for a `.appbr` file with your slot name on it.  
3- If neither of the above apply, ask the host of your Multiworld to send the patch to you.

### Patching and Playing the Game

To patch your game, open the Archipelago Launcher and drag-and-drop your patch file onto it.  
Alternatively, you can double click your patch and set it to open with the Archipelago Launcher.  
Once you do either of the above, wait a bit for it to finish patching. Once it does, the `Pokémon Battle Revolution Client` will automatically open, and you will find a patched `.iso` ROM in the same folder as the patch file.  

Now that you have patched the game, open Dolphin and start the patched game.  
Once you've started the game, go to the client and insert the server's information to connect to it.  
Afterwards, you can freely go ahead and play the game.

### Continuing from a Previous Session

To continue your playthrough, open the previously patched ROM in Dolphin and load your save file.  
Afterwards, open the Archipelago Launcher, search for the `Pokémon Battle Revolution Client` and run it.  
From there, simply connect to the server as you did before.  
