# Grim Dawn AP Installation Instructions (Windows)

1. Install Grim Dawn from Steam.
2. Install the latest Archipelago from https://github.com/ArchipelagoMW/Archipelago/releases
3. Download grim_dawn.apworld https://github.com/routhken/Archipelago/releases and place it in your Archipelago apworld directory "...\Archipelago\custom_worlds".
4. Run the archipelago launcher, click Generate Template Options to create a template yaml for you to edit and adjust settings as you see fit. Put the yaml in "...\Archipelago\Players" and click Generate.
5. In the launcher, open the Grim Dawn Client and connect to your slot through the client
6. Enter the command /patch and it will prompt you to allow the client to download and install the other files needed for the mod to function. If the client fails to download them, see the manual install instructions below.
7. If you live in the US skip to step 8, otherwise go Control Panel -> Change date, time or number formats -> Format drop down menu -> English (United States). You can set it back once patching is done.
8. In the archipelago launcher, open the Grim Dawn Client, and connect to your slot through the client. The first time you try to connect it will ask you to locate your Grim Dawn install directory, probably something like "C:\Steam\steamapps\common\Grim Dawn". 
9. Enter the command /patch and it will prompt you to allow the client to download and install the other files needed for the mod to function. If the client fails to download them, see the manual install instructions below. If all the files are already in the correct place, the client will say installation found, patching game please wait for a confirmation message to appear before loading a character. This usually takes around 30 seconds.
10. Launch the game using the 32-bit launcher. Since July 2026 a hotifx made 64-bit the default, so you must launch through Steam by going to your Steam library and right click Grim Dawn -> Properties -> General -> Launch Option drop down window -> Grim Dawn (x86) Legacy. Now you can launch through Steam. Launching from the Grim Dawn executable in your install folder will NOT work, nor will a desktop shortcut. It has to be launched through Steam.
11. At the main menu, select the button to the right of Start Game. Choose the Custom Game bubble and select "patchedArchipelago ~ world001.map". If you ever want to play the main campaign again you can simply select the main campaign bubble as doing so disables mods, no need to remove any files.
12. Create a character and start. The game should connect to the server as soon as you load into the world.
13. OPTIONAL to use the tracker, you will first need to download poptracker from https://poptracker.github.io and simply extract it somewhere. Get the grim dawn pack from https://github.com/routhken/Grim_Dawn_tracker/releases don't extract it, just put the zip file in poptracker/packs folder. Open poptracker and open the grim dawn pack


# Manual Installation (Windows)

1. Install Grim Dawn from Steam.
2. Install the latest Archipelago from https://github.com/ArchipelagoMW/Archipelago/releases
3. In the Grim Dawn install directory, rename the file "lua51.dll" to "real_lua51.dll"
4. Download the lua51.dll file from Heinermann and place it in the install directory. https://github.com/heinermann/GrimDawnLuaUnlocker/releases/download/1.0/lua51.dll
5. Download the lua51.7z under "lua-apclientpp v0.4.9" from Black Sliver's github https://github.com/black-sliver/lua-apclientpp/releases/tag/v0.4.9 Make sure these files actually download, sometimes they get flagged as dangerous by your browser.
6. Extract "lua51\lua51-clang32-dynamic" from the zip. Place only the "lua-apclientpp.dll" file in the Grim Dawn install directory.
7. Download my mod from https://github.com/routhken/Archipelago/releases/download/mod_3.0/archipelago.zip
8. Create a folder named "mods" in the Grim Dawn install directory if it doesn't already exist. Place the mod archipelago.zip inside and "extract to archipelago" with 7zip/winrar. Make sure the folder named "archipelago" is directly in mods and not nested in another folder within mods.
9. Download arzedit from gitlab: https://gitlab.com/QuasiMod/arzedit/uploads/b48b7ed4f74717d2a8cf6b67b4f9d842/arzedit.exe and place it in your Grim Dawn install directory.
10. Download the grim_dawn.apworld https://github.com/routhken/Archipelago/releases and place it in your Archipelago apworld directory "...\Archipelago\custom_worlds" make sure there is no duplicate apworld in lib/worlds.
11. Open the archipelago launcher, click Generate Template Options to create a template yaml for you to edit settings. Put the yaml in "...\Archipelago\Players" and click Generate.
12. If you live in the US skip to step 13, otherwise go Control Panel -> Change date, time or number formats -> Format drop down menu -> English (United States). You can set it back once patching is done.
13. In the archipelago launcher, open the Grim Dawn Client, and connect to your slot through the client. The first time you try to connect it will ask you to locate your Grim Dawn install directory, probably something like "C:\Steam\steamapps\common\Grim Dawn". Enter the command /patch . If everything is in the correct place, the client will say installation found, patching game please wait for a confirmation message to appear before loading a character. The client might be unresponsive for a while before it patches the game.
14. Launch the game using the 32-bit launcher. Since July 2026 a hotifx made 64-bit the default, so you must launch through Steam by going to your Steam library and right click Grim Dawn -> Properties -> General -> Launch Option drop down window -> Grim Dawn (x86) Legacy. Now you can launch through Steam. Launching from the Grim Dawn executable in your install folder will NOT work, nor will a desktop shortcut. It has to be launched through Steam.
15. At the main menu, select the Custom Game tab -> Custom Game bubble -> "patchedArchipelago ~ world001.map"
16. The game should connect to the server as soon as you load into a world. If not, talk to Jarvis or Bourbon.
17. The patch will remember the last connect credentials given through the client, so if you are connecting to the same slot and port again, then you don't need to run the client again.
18. OPTIONAL to use the tracker, you will first need to download poptracker from https://poptracker.github.io and simply extract it somewhere. Get the grim dawn pack from https://github.com/routhken/Grim_Dawn_tracker/releases don't extract it, just put the zip file in poptracker/packs folder. Open poptracker and open the grim dawn pack

The Grim Dawn thread in the Archipelago discord server is the best place to ask questions, get help, and provide feedback. Go to https://archipelago.gg and click the discord link.

# Linux Instructions

Instructions provided by Altener:

To compile a set of instructions for Enemy Rando and Skill rando in linux (based on Steam install and tested only in Steam deck)
· Have protontricks installed
· Install the Archipelago  Launcher through protontricks into the Grim Dawn prefix
· Follow the normal instructions for this implementation applied to the version we just installed as per the windows instructions above
(in principle, archipelago will have installed under steam/steamapps/compatdata/219990/pfx/drive_C/ProgramData/, fairly sure appids dont change)
· Make the connect.txt in the Grim Dawn install folder  with the format:
host = archipelago.gg:yourroomcode
slot = YourSlotName
password = 
ssp = false
· Add and swap to US layout in your linux keyboard layouts (this will depend on distro, not sure if it affects linux but just in case)
· Start archipelago, grim dawn client, connect, and a window asking for the Grim Dawn install folder will pop up: normally steam is installed under .local, a hidden folder, so the easiest way to point the location is to copy your system's one and convert it into the Windows one: change the /, and start with "Leter:" (ususlly wine/proton makes your system Z, while C is the prefix)

If you put the right location then it should freeze for a bit before saying its connected and to wait 30 seconds before starting a new file

Now if everything is correct, and this is a portable solution, you should find a patchedArchipelago mod in Custom Games and your mods folder (given ive done this in Steam Deck, if anyone gets it working like this elsewhere would love a confirmation :P)

# FAQ / Troubleshooting

Q. Patched mod freezes after a second of loading, but non-patched mod loads fine.
A. Patcher needs en-US region due to a bug in the extractor tool, refer to step 11.

Q. While generating the world, an error says invalid yaml and no apworld installed.
A. Check if you have multiple copies of the grim dawn apworld (possibly one in lib/worlds and one in custom_worlds) and delete the extra copies.

Q. Does this work with multiplayer?
A. Yes. All players must be using the same patched mod.

Q. The current Grim Dawn install directory doesn't point to the correct folder, how do I fix it?
A. Go to your archipelago install directory and open your host.yaml there should be a line that is "grimDawnInstallPath" you can fix it to be the correct folder.

Q. When I hint for an item, the client tells me it doesn't exist in the multiworld
A. You likely have progressive progression enabled, which converts major progression items to a generic item instead. Hint for Progressive Main Campaign, Progressive Ashes of Malmouth, or Progressive Forgotten Gods.
