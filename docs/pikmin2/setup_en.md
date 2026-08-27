# Pikmin 2 Archipelago Setup Guide

## For Windows
### Required Software
- Dolphin Emulator: https://dolphin-emu.org/download/
- Archipelago: https://github.com/ArchipelagoMW/Archipelago/releases
- Pikmin 2 APWorld: https://github.com/chpas0/Pikmin2Archipelago/releases
- A Pikmin 2 GameCube USA .iso file
### Installing the APWorld
Put the pikmin2.apworld file in the ```custom_worlds``` folder of your Archipelago installation. You can also just double-click the file to automatically install it.
### Configuring the YAML file
#### What is a YAML file and why do I need one?
Your YAML file contains a set of configuration options which provide the generator with information about how it should generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy an experience customized for their taste, and different players in the same multiworld can all have different options.
#### Where do I get a YAML file?
Once you've installed the apworld, you can generate a yaml using the ```Generate Template Options``` button in the ArchipelagoLauncher. It can be found in ```Players/Templates``` after you have done so. The name of the file will be ```Pikmin 2.yaml```.

If the .yaml file is missing in your ```Players/Templates``` folder, then please go through the apworld installation steps again, and double check that everything was done correctly.

**IMPORTANT NOTE: The .yaml file has multiple options under ```Item & Location Options```, these are all untested (except starting_items, which has been confirmed to work) and may not work as intended.**

### Generating a Multiworld Game
#### Step 1
Place all of the players' ```.yaml``` files into the ```Players``` folder of your Archipelago installation (NOT the ```Players/Templates``` folder).
#### Step 2
Open the Archipelago Launcher (```ArchipelagoLauncher.exe```) and click the ```Generate``` button. If the generation succeeds, this should create a ```.zip``` archive in the ```output``` directory of your Archipelago installation.
#### Step 3
Unzip the archive that was just generated. There should be an ```.appik2``` file inside called ```AP_<seed>_P<slot>_<name>.appik2```. This file will be referred to as the Pikmin 2 setup file for the rest of the guide.
#### Step 4
Run the ```patcher.exe``` executable that was included with the Pikmin 2 APWorld release. It will prompt you for the Pikmin 2 setup file (the ```.appik2``` file from Step 3) and the Pikmin 2 USA .iso file. It will output a patched version of the game to the same directory that the executable is in, called ```pikmin2_<seed>.iso```.
#### Step 5
Turn the Memory Override setting on Dolphin settings (Config -> Advanced -> Memory Override). Check the box that says "Enable Emulated Memory Size Override" and move the first slider (**marked MEM1**) to 64 MB.

#### Step 6
Re-open the Archipelago Launcher, and click the ```Pikmin2Client``` button. You will be prompted for the patched Pikmin 2 .iso file and the Pikmin 2 setup file. If this is your first time running the client, you will also be asked for your Dolphin executable file; this path will be saved to your ```host.yaml``` so you don't need to select it each time.
#### Step 7
The client and an instance of Dolphin should launch. You can then connect to the Archipelago server!

## IMPORTANT NOTE: Make sure all other instances of Dolphin are closed before you launch the client.
## IMPORTANT NOTE 2: If either the client or the Dolphin instance are closed, you must close the other one. Only launch Dolphin through launching the client, otherwise the items will not appear in game. Items obtained while the client is closed will be lost!

## For Linux
**NOTE: This is still in beta. Please contact me with any issues you find and I will fix bugs/clarify documentation as needed.**
### Required Software
- Dolphin Emulator: https://dolphin-emu.org/download/
- Archipelago: https://github.com/ArchipelagoMW/Archipelago/releases
- Pikmin 2 APWorld: https://github.com/chpas0/Pikmin2Archipelago/releases
- Wine: https://www.winehq.org/
- A Pikmin 2 GameCube USA .iso file
### Installing the APWorld
Put the pikmin2.apworld file in the ```custom_worlds``` folder of your Archipelago installation. You can also just double-click the file to automatically install it.
### Configuring the YAML file
#### What is a YAML file and why do I need one?
Your YAML file contains a set of configuration options which provide the generator with information about how it should generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy an experience customized for their taste, and different players in the same multiworld can all have different options.
#### Where do I get a YAML file?
Once you've installed the apworld, you can generate a yaml using the ```Generate Template Options``` button in the ArchipelagoLauncher. It can be found in ```Players/Templates``` after you have done so. The name of the file will be ```Pikmin 2.yaml```.

If the .yaml file is missing in your ```Players/Templates``` folder, then please go through the apworld installation steps again, and double check that everything was done correctly.

**IMPORTANT NOTE: The .yaml file has multiple options under ```Item & Location Options```, these are all untested (except starting_items, which has been confirmed to work) and may not work as intended.**

### Generating a Multiworld Game
#### Step 1
Place all of the players' ```.yaml``` files into the ```Players``` folder of your Archipelago installation (NOT the ```Players/Templates``` folder).
#### Step 2
Open the Archipelago Launcher (```ArchipelagoLauncher.exe```) and click the ```Generate``` button. If the generation succeeds, this should create a ```.zip``` archive in the ```output``` directory of your Archipelago installation.
#### Step 3
Unzip the archive that was just generated. There should be an ```.appik2``` file inside called ```AP_<seed>_P<slot>_<name>.appik2```. This file will be referred to as the Pikmin 2 setup file for the rest of the guide.
#### Step 4
Using Wine, run the ```patcher.exe``` executable that was included with the Pikmin 2 APWorld release. It will prompt you for the Pikmin 2 setup file (the ```.appik2``` file from Step 3) and the Pikmin 2 USA .iso file. It will output a patched version of the game to the same directory that the executable is in, called ```pikmin2_<seed>.iso```.
#### Step 5
Turn the Memory Override setting on Dolphin settings (Config -> Advanced -> Memory Override). Check the box that says "Enable Emulated Memory Size Override" and move the first slider (**marked MEM1**) to 64 MB.
#### Step 6
Re-open the Archipelago Launcher, and click the ```Pikmin2Client``` button. You will be prompted for the patched Pikmin 2 .iso file and the Pikmin 2 setup file. The client will assume Dolphin can be executed by running the ```dolphin-emu``` command, as is the default - if this isn't the case you can create a command alias.
#### Step 7
The client and an instance of Dolphin should launch. You can then connect to the Archipelago server!

## IMPORTANT NOTE: Make sure all other instances of Dolphin are closed before you launch the client.
## IMPORTANT NOTE 2: If either the client or the Dolphin instance are closed, you must close the other one. Only launch Dolphin through launching the client, otherwise the items will not appear in game. Items obtained while the client is closed will be lost!

## Hosting a Multiworld Game
You can upload the generated ```.zip``` file [here](https://archipelago.gg/uploads) to launch a server.

## Playing the Game / FAQ
There are a few important quirks that must be observed when playing.
- Items can only be received if the player is in a cave or on the overworld. Items cannot be received on the world map or end of day screens, but CAN be received in cutscenes/the pause menu.
- Items take some time to be received by the game, so if there is a large queue of items it may take a bit for all of them to be processed. This is completely normal!
- Certain off-world items obtained in caves will not bring up the treasure collect screen due to the way they are implemented. 
- Off-world items in caves will respawn after being collected. Collecting them a second time won't do anything.
- Off-world items are all worth 0 Pokos.
- While you are able to collect enemy corpses to repay the debt if you want, the randomizer's logic should ensure that the debt is repayable without collecting any enemy corpses. In fact, if your goal is set to collect a certain number of Pokos, the client will only recognize Pokos obtained from treasure, so it may not automatically release if you hit your goal.
- If a treasure is usually buried/partially buried in vanilla, it will remain buried even if its location changes. Logic should ensure that buried treasures never occur in areas inaccessible to White Pikmin (water, high ledges, etc.).
- The water around the Blue Onion is removed. If onions are shuffled, and the Yellow Onion is in Awakening Wood, the electric gate will be replaced with a normal gate.
- If caves are shuffled, Violet Candypop Buds will appear outside of Emergence Cave, and Ivory Candypop Buds will appear in Awakening Wood by the ship.
- Cave keys open the cave's vanilla location, i.e., if you collect the Emergence Cave Entrance Key, it will open the first cave in Valley of Repose. 
- The water around Submerged Castle has been removed so that the cave can be shuffled. You can get all types to the location by throwing them onto a ledge and whistling them down from the other side. If Submerged Castle is shuffled to a different location, its blues-only requirement will be shuffled with it.
- If non-progressive globes are on, Awakening Wood and Perplexing Pool will open as soon as you visit the world map for the first time; however, you won't be able to land in them until you get the respective globe. When you repay the debt, Wistful Wild will open, but you won't be able to land there until you get both globes.

## Location Abbreviations

| Location | Abbreviation |  
| --- | --- |  
| Valley of Repose | VoR |  
| Awakening Wood | AW |  
| Perplexing Pool | PP |  
| Wistful Wild | WW |  
| Emergence Cave | EC |  
| Subterranean Complex | SC |  
| Frontier Cavern | FC |  
| Hole of Beasts | HoB |  
| White Flower Garden | WFG |  
| Bulblax Kingdom | BK |  
| Snagret Hole | SH |  
| Citadel of Spiders | CoS |  
| Glutton's Kitchen | GK |  
| Shower Room | SR |  
| Submerged Castle | SMGC |  
| Cavern of Chaos | CoC |  
| Hole of Heroes | HoH |  
| Dream Den | DD |  

## Boss and Enemy Randomization
In case the options for boss and enemy randomization are not clear, they will be clarified here:
- Boss Rando: Random bosses are placed at vanilla boss locations
- Enemy Rando: Random enemies are placed at vanilla enemy locations
- Boss and Enemy Rando: Random bosses and enemies can be placed at any boss or enemy location

## Report Bugs
You can report any issues to [the Pikmin 2 Archipelago server thread](https://discord.com/channels/731205301247803413/1062964930174779452) (preferred) or [here](https://github.com/chpas0/Pikmin2Archipelago/issues).
