# Keep Talking and Nobody Explodes MultiWorld Setup Guide

## Warning

This game currently doesn't work with macOS and Linux. Only windows is fully supported as of now.

## Required Software

 - Keep Talking and Nobody Explodes from [Steam](https://store.steampowered.com/app/341800/Keep_Talking_and_Nobody_Explodes/)
 - Expert Manuals Clients from [GitHub](https://github.com/GreenPower713/KTaNE-Archipelago-Expert-Manuals/releases)

## Required Mods

Please note that to download mods, you may need to complete the mission "1.3 - The First Bomb".
 - [Mod Selector](https://steamcommunity.com/sharedfiles/filedetails/?id=801400247) by Bashly
 - [Archipelago](https://steamcommunity.com/sharedfiles/filedetails/?id=3247225189) by GreenPower713

If you want to modify the puzzle solutions, you will need the following mod:
 - [Rule Seed Modifier](https://steamcommunity.com/sharedfiles/filedetails/?id=2037350348) by samfundev

## Recommended Mods

 - [Camera Zoom](https://steamcommunity.com/sharedfiles/filedetails/?id=838110334) by Hex
 - [Tweaks](https://steamcommunity.com/sharedfiles/filedetails/?id=1366808675) by samfundev

## Configuring a YAML File

### What is a YAML and why do I need one?

The [basic multiworld setup guide](https://archipelago.gg/tutorial/Archipelago/setup/en) explains the use of a YAML and
the way they are used.

### How do I get a YAML for Keep Talking and Nobody Explodes?

Since this game isn't fully released yet, the only way to get a YAML template is to generate it from the Archipelago
Software.

1. Install the [latest version of Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases). Remember where 
the installation folder is, because it will be needed.
2. In your Archipelago folder, navigate to the "custom_worlds" folder and add ktane.apworld. If you have a previous 
version of ktane.apworld installed in the "lib/worlds" directory, you will need to remove it.
3. Navigate back to your Archipelago folder and launch ArchipelagoLauncher.exe. A window should appear. In this window,
on the left, click on "Generate Template Options". It will open a window with a lot of .yaml files.
4. Locate the one that's named "Keep Talking and Nobody Explodes.yaml". This is your base template. You can create a 
copy of it.

## Generating a Randomized Playthrough

Since Keep Talking and Nobody Explodes isn't fully released yet, the only way to generate a seed containing the game
must be locally.

1. Follow steps 1 and 2 from the previous section to add the .apworld to the generation list.
2. In your Archipelago folder, navigate to the "Players" folder. In this folder, add all the YAMLs that will be used to
generate the MultiWorld randomized seed.
3. Navigate back to your Archipelago folder and launch ArchipelagoGenerate.exe. The program will execute and create a 
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

Since this game is based for a defuser and an expert, they have two different ways of joining a game.

### Defuser
1. Open the Game. It will show a "Mods and External Content Warning". Select "Enable Mods".
2. The game will then be "Fetching mod information from Steam Workshop...". It may take some time and may fail. Do not
worry about that.
3. After a bit, the window "Mod Manager" will be shown. Select "Close Mod Manager". All the mods will then be loaded.
4. A message will say that "Mod modules are now active!". Select "Continue". This will bring you in the office.
5. On the Mod Selector tablet, select the Archipelago icon. A window will appear. Enter the needed information to
connect and press the "Connect" button. Connecting may take a bit of time.

### Expert
1. Open the Expert Manuals Client. It will open a command line and a webpage. If the webpage doesn't load, you can 
connect to it at the following address: localhost:21713
2. The page will show the fields to complete to connect to the Archipelago server. Enter the needed information to 
connect and press the "Connect" button. Connecting may take a bit of time, as the client also have to load all the 
correct manuals.
3. Keep the command line open during the playthrough, as it controls the webserver that is used to unlock the needed 
manuals.

## Playing offline

Playing offline is not an option for Keep Talking and Nobody Explodes. If you do not have Internet connection, you can
create a local server and play from there, but the Expert Manual Client will not be working as it needs Internet 
connection to access the correct manuals.
