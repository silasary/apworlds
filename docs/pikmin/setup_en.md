# Pikmin 1 Archipelago Setup Guide

## For Windows
### Required Software
- Dolphin Emulator: https://dolphin-emu.org/download/
- Archipelago: https://github.com/ArchipelagoMW/Archipelago/releases
- Pikmin 1 APWorld: https://github.com/TheLynk/Archipelago/releases
- A Pikmin 1 GameCube (USA) (Rev 1) .iso file | ID : GPIE01 | SHA-1 : 23a153cb225fef488f57073e76df0de26789c218
- Or A Pikmin 1 GameCube (PAL) .iso file | ID : GPIP01 | SHA-1 : 40c46bd6921e55558e9838930a9ffd2179802b4f
### Installing the APWorld
Put the pikmin.apworld file in the ```custom_worlds``` folder of your Archipelago installation. You can also just double-click the file to automatically install it.
### Configuring the YAML file
#### What is a YAML file and why do I need one?
Your YAML file contains a set of configuration options which provide the generator with information about how it should generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy an experience customized for their taste, and different players in the same multiworld can all have different options.
#### Where do I get a YAML file?
Once you've installed the apworld, you can generate a yaml using the ```Generate Template Options``` button in the ArchipelagoLauncher. It can be found in ```Players/Templates``` after you have done so. The name of the file will be ```Pikmin.yaml```.

If the .yaml file is missing in your ```Players/Templates``` folder, then please go through the apworld installation steps again, and double check that everything was done correctly.

**IMPORTANT NOTE: The .yaml file has multiple options under ```Item & Location Options```, these are all untested and may not work as intended.**

### Generating a Multiworld Game and Connecting Multiworld Game
#### Step 1
Place all of the players' ```.yaml``` files into the ```Players``` folder of your Archipelago installation (NOT the ```Players/Templates``` folder).
#### Step 2
Open the Archipelago Launcher (```ArchipelagoLauncher.exe```) and click the "Generate Button". If the generation succeeds, this should create a ```.zip``` archive in the ```output``` directory of your Archipelago installation.
#### Step 3
Unzip the archive that has just been generated Or Download this file to the Archipelago Room that you are going to play. There should be an ```.appik1``` file inside called ```AP_<seed>_P<slot>_<name>.appik1```. This file will be referred to as the Pikmin 1 setup file for the rest of the guide.
#### Step 4
Open the Archipelago Launcher (```ArchipelagoLauncher.exe```) and click the "Open Patch". It will prompt you for the Pikmin 1 setup file (the ```.appik1``` file from Step 3).

####  Step 5 
a dialog box will open and ask you which version of Pikmin you are going to use. There are currently 2 choices available which are: "PAL" and "NTSC".

<img width="339" height="123" alt="image" src="https://github.com/user-attachments/assets/2216a2bd-70c7-48b6-8843-b2db3225b69d" />

#### Step 6 (PAL)
Choose your PAL ISO (which must be obtained legally) and then you will have to wait until you have the archipelago window which indicates that the patch is finished and normally the pikmin client is already opened automatically.
It will output a patched version of the game to the same directory that the patch file is in, called ```AP_<seed>_P<slot>_<name>.iso```.

IF you accidentally select a bad ISO or a bad file you will have to go to your ```host.yaml``` and modify the "iso_file:" line in "pikmin_options"

#### Step 6 (NTSC)
Choose your NTSC ISO (which must be obtained legally) and then you will have to wait until you have the archipelago window which indicates that the patch is finished and normally the pikmin client is already opened automatically.
It will output a patched version of the game to the same directory that the patch file is in, called ```AP_<seed>_P<slot>_<name>.iso```.

IF you accidentally select a bad ISO or a bad file you will have to go to your ```host.yaml``` and modify the "iso_file_ntsc:" line in "pikmin_options"

#### Step 7
Open your dolphin and launch the patch version of pikmin 1 which will be called ```AP_<seed>_P<slot>_<name>.iso``` and connect to the server archipelago

#### Step 8
Normally everything will be good and the reception of the objects will be fine as long as you have loaded a party or started a new one.

## IMPORTANT NOTE: Be careful to have only one open dolphin AND if the pikmin client does not connect to your dolphin or does not detect it, go to the section at the bottom of this page "Troubleshooting"

## Hosting a Multiworld Game
You can upload the generated ```.zip``` file [here](https://archipelago.gg/uploads) to launch a server.

## Playing the Game / FAQ
There are a few important quirks that must be observed when playing.
- Little information when you take over a party of archipelago on pikmin 1 do not hesitate to start a day and finish it straight away to update the list of accessible areas or any other object of progression

## Location Abbreviations

| Location | Abbreviation |  
| --- | --- |  
| The Impact Site | TIS |  
| The Forest of Hope | TFoH |  
| The Forest Navel | TFN |  
| The Distant Spring | TDS |  
| The Final Trial | TFT |  

## Troubleshooting

- Do not run the Archipelago Launcher or Dolphin as an administrator on Windows.
- Ensure that you do not have any Dolphin cheats or codes enabled. Some cheats or codes can unexpectedly interfere with emulation and make troubleshooting errors difficult.
- Ensure that Enable Emulated Memory Size Override in Dolphin (under Options > Configuration > Advanced) is disabled. This option is not supported: when it is enabled, the Dolphin status shows `Disconnected - Hook Failed - Disable "Enable Emulated Memory Size Override"`. Disable it, then restart the game.
- If the client cannot connect to Dolphin, ensure Dolphin is on the same drive as Archipelago. Having Dolphin on an external drive has reportedly caused connection issues.

### Known issues

- **Error message during the final cutscene** (`GFX FIFO: Unknown Opcode` or `stream_size_temp < 16`, with the planet missing while Olimar flies through space): this is a vanilla bug that also happens on a clean ISO without Archipelago. It mostly occurs when the ship takes off from **The Forest of Hope** at the end of the final day. To avoid it, end the final day in another area (for example The Impact Site).

## Report Bugs
You can report any issues [here](https://github.com/TheLynk/Archipelago/issues) or to [the Pikmin 1 Archipelago server thread](https://discord.com/channels/731205301247803413/1397286080184844390).
