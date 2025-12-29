# Grim Dawn AP Installation Instructions

1. Install Grim Dawn from steam.
2. In the Grim Dawn install directory, rename the file "lua51.dll" to "real_lua51.dll"
3. Download the lua51.dll file from Heinermann (download is in the Archipelago discord Grim Dawn thread pins) and place it in the install directory.
4. Download the lua51.7z under "lua-apclientpp v0.4.9" from Black Sliver's github https://github.com/black-sliver/lua-apclientpp/releases/tag/v0.4.9 Make sure these files actually download, sometimes they get flagged as dangerous by your browser.
5. Extract "lua51\lua51-clang32-dynamic" from the zip. Place only the "lua-apclientpp.dll" file in the Grim Dawn install directory.
6. Download my mod from Nexus Mods https://www.nexusmods.com/grimdawn/mods/167/ and make sure you manually download it, don't use Vortex or another mod manager.
7. Create a folder named "mods" in the Grim Dawn install directory if it doesn't already exist. Place the mod archipelago.zip inside and "extract here" with 7zip/winrar. Make sure the folder named "archipelago" is directly in mods and not nested in another folder within mods.
8. Download arzedit from gitlab: https://gitlab.com/QuasiMod/arzedit/uploads/b48b7ed4f74717d2a8cf6b67b4f9d842/arzedit.exe and place it in your Grim Dawn install directory.
9. Download the grim_dawn.apworld https://github.com/routhken/Archipelago/releases and place it in your Archipelago apworld directory "...\Archipelago\custom_worlds" make sure there is no duplicate apworld in lib/worlds.
10. Open the archipelago launcher, click Generate Template Options to create a template yaml for you to edit settings. Put the yaml in "...\Archipelago\Players"
11. If you live in the US skip to step 12, otherwise go Control Panel -> Change date, time or number formats -> Format drop down menu -> English (United States). You can set it back once patching is done.
12. In the archipelago launcher, open the Grim Dawn Client, and connect to your slot through the client. If everything is in the correct place, the client will say installation found, patching game please wait 30 seconds before loading a character. If you have a lot of apworlds in your custom_worlds folder, the client might be unresponsive for a while before it patches the game.
13. Launch the game using the 32-bit launcher, either by using the 32-bit launcher in Steam, or launching from the Grim Dawn executable in the main Grim Dawn install directory (not in the x64 folder). At the main menu, select the Custom Game tab -> Custom Game bubble -> "patchedArchipelago ~ world001.map"
14. The game should connect to the server as soon as you load into a world. If not, talk to Jarvis or Bourbon.
15. The patch will remember the last connect credentials given through the client, so if you are connecting to the same slot and port again, then you don't need to run the client again.
16. OPTIONAL to use the tracker, you will first need to download poptracker from https://github.com/black-sliver/PopTracker/releases and simply extract it somewhere. Get the grim dawn pack from https://github.com/routhken/Grim_Dawn_tracker/releases don't extract it, just put the zip file in poptracker/packs folder.

# FAQ / Troubleshooting

If you are using Linux, the patcher will not work due to needing Windows-only commands. You can still use the non-patched version but it will not have any enemy/skill/devotion rando. You will also need to create a connect.txt file in your Grim Dawn install directory and put in the following four lines: 

host = ws://webhost:portNumber (probably something like localhost:38281 or archipelago.gg:38281)

slot = YourSlotName (the name you set for "name" setting in the yaml)

password = 

ssp = false



Q. Patched mod freezes after a second of loading, but non-patched mod loads fine.

A. Patcher needs en-US region due to a bug in the extractor tool, refer to step 11.

Q. While generating the world, an error says invalid yaml and no apworld installed.

A. Check if you have multiple copies of the grim dawn apworld (possibly one in lib/worlds and one in custom_worlds) and delete the extra copies.

Q. Does this work with multiplayer?

A. Yes. All players must be using the same patched mod.
