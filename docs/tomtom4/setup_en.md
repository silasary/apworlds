# TomTom Flaming Special MultiWorld Setup Guide

## Required Software

- TomTom Adventures 4 Archipelago Version.
- Archipelago Launcher.

## Installing an APWorld

1. Install the [latest version of Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases). Remember where 
the installation folder is, because it will be needed.
2. In your Archipelago folder, navigate to the "custom_worlds" folder and add tomtom4.apworld.
3. Navigate back to your Archipelago folder and launch ArchipelagoLauncher.exe. You will know the install was successful if you see the "TomTom 4 Client" in the list.

## Configuring a YAML File

### What is a YAML and why do I need one?

The [basic multiworld setup guide](https://archipelago.gg/tutorial/Archipelago/setup/en) explains the use of a YAML and
the way they are used.

### How do I get a YAML for TomTom Adventures Flaming Special?

1. In Archipelago Launcher, click on "Generate Template Options". It will open a window with a lot of .yaml files.
2. Locate the one that's named "TomTom Adventures Flaming Special.yaml". This is your base template. You can create a 
copy of it.

## Generating a Randomized Playthrough

1. In your Archipelago folder, navigate to the "Players" folder. In this folder, add all the YAMLs that will be used to
generate the MultiWorld randomized seed.
2. Navigate back to your Archipelago folder and launch ArchipelagoGenerate.exe. The program will execute and create a 
new seed with all the YAML files present in the "Players" folder. The generated seed will be in the "output" folder.

Please note that the generation may fail. If it fails because of invalid placement, please try again and it should work.

## Hosting a Game on a Server

The seed must be hosted on a server to be playable. The easiest possibilities are using the website or running a local 
server.

### Using the Archipelago Website to host a seed

Once the seed is generated:
1. On the Archipelago website, go under the [Host Game](https://archipelago.gg/uploads) tab.
2. Click the "Upload File" button and select your seed.
3. Create a new room. This room will give the ip, port (usually archipelago.gg:XXXXX) and slot name to connect to it.

### Running a local server to host a seed
Once the seed is generated:
1. In your Archipelago folder, launch ArchipelagoServer.exe. A command prompt will open.
2. A file prompt will also open. Select your seed.
3. The server is now open. The slot names will be the same as the YAMLs' name and the ip will be your computer ip. By
default, the port should be 38281, but it will be shown in the command prompt window.

Please remember the 2 following things:
1. If you are not on the same network, the port will need to be forwarded by your router.
2. Never share your personal computer ip with a stranger.

## Joining a MultiWorld Game

1. Open the "TomTom 4 Client" from the Launcher.
2. The client should prompt you for a file executable. This file is your game exe, it should be titled "TomTomAdventures4AP.exe". Navigate to it and select it. The client should then open the game for you.
3. Connect to the Archipelago server and enter your slot name.
4. After connecting, start playing!
Note: After selecting the directory for your game executable, the client stores this directory in a file in your Archipelago's install titled ".tomtom4_client_config.json". The client will only prompt you once for the game directory. If you reinstall the game or happen to move it elsewhere, you should delete the config file so the client re-prompts you for the game directory.

