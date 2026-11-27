# Installing the mod

## Requirements
- Tetris Effect: Connected with previously completed story mode on any of the 3 difficulties. The mod will not unlock stages that you haven't reached yet.
- The UE4SS mod framework for Unreal Engine games. The mod requires the experimental version to work correctly [that can be found here](https://github.com/UE4SS-RE/RE-UE4SS/releases/tag/experimental-latest). Follow it's installation guide [here](https://docs.ue4ss.com/dev/installation-guide.html) or go to the [Detailed UE4SS installation guide section down below](#detailed-ue4ss-installation-guide).
- The client mod. Find it in the [releases page](https://github.com/ZatchyBeeps/Archipelago-TEC/releases)
- If you're gonna generate a world or would like to use the archipelago options creator GUI, install the [archipelago launcher](https://github.com/ArchipelagoMW/Archipelago/releases) and download and install the apworld (find it in the [releases](https://github.com/ZatchyBeeps/Archipelago-TEC/releases) page as well).

## Installing
Once you have successfully installed UE4SS (you can check this by opening the game and verifying that the UE4SS.log file gets created on `Tetris Effect Connected\TetrisEffect\Binaries\Win64\ue4ss`) now do the following to install the mod: 
- Extract the mod folder from the zip file you downloaded in the releases page and copy it.
- Open the game folder (the same folder that is opened when you hit "Browse local files" on Steam, this could be `YourSteamLibrary\steamapps\common\Tetris Effect Connected\`)
- Paste the folder here.
If everything was done correctly you should see a prompt to replace the file "mods.txt", click yes. The mod is now installed.

## Configuring your YAML file and generating a world
As with every other archipelago world, you will need a YAML file that dictate your game options and your player name. You can use the YAML file provided on the latest release and edit it on notepad to set your own options, or you can use the options creator from the archipelago launcher.

Once you have your YAML file, the host of the multiworld will require said YAML file and the apworld file. Provide them with these so that they can generate the multiworld.

### Generating
If you are the one to generate the multiworld or are planning to do a single player game, follow the instructions on [how to generate a multiworld](https://archipelago.gg/tutorial/Archipelago/setup_en#generating-a-multiplayer-game), specifically the "On your local installation" as custom worlds are only local; and then click the Host button on the archipelago launcher and selecting the generated multiworld zip file or [host the multiworld on the website](https://archipelago.gg/uploads) by uploading said multiworld file for others to connect to it. Check the [hosting an archipelago server](https://archipelago.gg/tutorial/Archipelago/setup_en#hosting-an-archipelago-server) section, specifically the "From a locally generated game" and "Hosting on a local machine" subsections, for more information.

## Connecting
This is as straightforward as launching the game, getting to the main menu and inputting the connection details, then pressing connect! Enjoy your randomized game!

## Returning back to the normal game
You have 3 options to remove the mod from the game
### Disabling UE4SS via a command argument
On your game launcher, open the game's properties and look for a launch options section. Then add `--disable-ue4ss` into it.
This will launch the game unmodded without uninstalling UE4SS or the client mod, allowing you to play the mod again by removing the launch options whenever you want.
### Disabling the mod
Go to `<Game Location>\Tetris Effect Connected\TetrisEffect\Binaries\Win64\ue4ss\Mods` and open `mods.txt`. Then change `TetrisEffectArchipelago` and `BPModLoaderMod` to 0. Have in mind that this does not disable UE4SS itself.
### Uninstall UE4SS
Go to `<Game Location>\Tetris Effect Connected\TetrisEffect\Binaries\Win64\` and delete `dwmapi.dll`. You may also delete the ue4ss folder in the same location if wanted. If you wanna play the mod again, you'll need to install everything again.

# Detailed UE4SS installation guide
Having issues installing the mod loader, you don't quite understand the UE4SS installation guide or it seems like it doesn't load it? Follow along this guide to see if you installed it correctly:
## - The files
As previously mentioned, the **experimental version** is required for the mod to work properly. If you downloaded the V3.0.1 release please go back and download the latest experimental version instead. [Click here to go to the release.](https://github.com/UE4SS-RE/RE-UE4SS/releases/tag/experimental-latest) If you're questioning what file to download, download the file that goes by `UE4SS_v3.0.1-XXXX-XXXXXXXXX.zip`
## - The game location
Let's now locate the game executable. You can open your game launcher and look for an option to browse the game files, or you can find them manually. For example, in Steam you might end up in `C:\Program Files (x86)\Steam\steamapps\common\Tetris Effect Connected\`
The executable here **is not** the game executable, this is where you'll place the mod folder but in order to install UE4SS we need to go a bit deeper.
## - Installing 
Now that you are in the Tetris Effect Connected folder you now want to go in the following folders:
TetrisEffect > Binaries > Win64
Your current path should now be `\Tetris Effect Connected\TetrisEffect\Binaries\Win64`
In this folder you will see 2 files and a folder: `TetrisEffect-Win64-Shipping.exe`, `turbojpeg.dll` and `RedpointEOS`. If you see these files you are in the correct folder!
Now extract the UE4SS files from it's zip file, these should be a .dll file and a folder named ue4ss, and place them into this folder. Now instead of the 3 files previously mentioned there should be 5. **If `dwmapi.dll` is not in the same folder as `TetrisEffect-Win64-Shipping.exe` then you maybe copied something wrong or pasted the UE4SS files together in a separate folder**
## - Verifying
After doing all of this, go into the ue4ss folder then open your game. If everything is correct, the file UE4SS.log should have appeared in this folder. You can now proceed with installing the mod.
If you want to report errors or bugs you find, the mentioned UE4SS.log file contains information to trace down what happened and fix it, so keep it's location in mind.