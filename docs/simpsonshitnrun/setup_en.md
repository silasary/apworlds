# Required Software

- Simpsons Hit And Run PC release
- [Lucas' Mod Manager](https://modbakery.donutteam.com/releases/view/6)
- [Archipelago](https://archipelago.gg/) (Latest release [here](https://github.com/ArchipelagoMW/Archipelago/releases/latest).)
- The latest release of the [client/memory manager and the lmlm mod](https://github.com/nmize1/AP-SHARRandomizer/releases/latest)
- The latest release of the [apworld](https://github.com/nmize1/Archipelago/releases/latest).
- [.NET 8 (x86)](https://dotnet.microsoft.com/en-us/download/dotnet/8.0) (**NOT x64**)

# AP Setup 

- Run Setup.Archipelago.version number.exe but don't open the launcher yet
- Double click simpsonshitandrun.apworld, it should pop up something saying APWorld successfully installed (and telling you to restart the AP launcher if you have it open)

# Game Generation 

- Open ArchipelagoLauncher.exe in the Archipelago folder created when you ran the AP setup
- Search for and click Generate Template Yamls which will open a folder full of yamls
- Find The Simpsons Hit and Run.yaml and edit it to your liking.
- Save your edited .yaml in Archipelago/Players which is 1 folder up from the template yaml folder that opened.
- Optionally add more yamls for other players or other games you want to play. The multiworld will have 1 slot per yaml included here.
- In the AP Launcher again, search for and click Generate

# Game Hosting

- Go to [Archipelago](https://archipelago.gg/) and click Get Started (top right) -> Host Game then click Upload File
- Go to the Archipelago/output folder and choose the .zip that was created when you clicked Generate (should be the newest one)
- Click Create Room and wait for it to spin up. This is the room. You're good to go once there's a line that says /connect archipelago.gg:{port}

Note: You can also self host an Archipelago game server, but that's outside the scope of this guide.
  
# Install Lucas' Mod Manager, the lmlm mod, and the client/memory monitor mod.

- Follow [these](https://docs.donutteam.com/docs/lucasmodlauncher/setup) instructions to setup Lucas' Mod Manager.
- Place SHARAP.lmlm in the mods folder.
- Enable Archipelago Randomizer by clicking the checkbox in the Mods List. Currently, no other major mods are supported.
- Check [here](https://docs.donutteam.com/docs/lucasmodlauncher/mods/installing-mods) for more help installing mods.
  
- Under the "Settings" tab of the mod launcher, there are several optional mods. Don't enable anything that changes gameplay, but graphical changes or setting changes are fine.
- Install .NET 8 from the link above. Make sure to install the **x86** version. The site will default to x64 as that's more modern, but SHAR needs x86.

- Finally, extract SHARRandomizer.zip where ever you'd like.

# Connecting and Playing
- Download the Config file by going to the Archipelago Room and clicking "Download Patch File"
- Extract the "SHAR.ini" file from the downloaded .zip and place it in "Documents\My Games\Lucas' Simpsons Hit & Run Mod Launcher\Saved Games\APSHARRandomizer" If that folder doesn't exist, create it. You can also reach the folder by clicking Open in the mod launcher and choosing Saved Games if the mod is enabled.

- Run SHARRandomizer.exe
- First it'll ask for the connection string. If you're hosting on the AP website as described earlier, then you can just enter the port
- Then it'll ask for the slot name, this is what you put as Name in the yaml and also shows in the room on the website
- Then it'll ask for a password. By default this is blank.

- Launch the game via Lucas' Mod Launcher ensuring the above steps have been completed.

- Enjoy!

# Optional Extra Steps
- Use the Text Client in the Archipelago launcher and connect with the same info used to connect in SHARRandomizer.exe. This will give you a better list of all items sent/received, an optional chat with other players in the multiworld, and an interface to use for hints.

OR

- Use Universal Tracker as a Text Client and a tracker to help identify in logic checks.
  - Download tracker.apworld from the pins in this [channel](https://discord.com/channels/731205301247803413/1367270230635839539).
  - Double click it and restart Archipelago Launcher (the same as when you installed simpsonshitnrun.apworld)
  - Use the new Universal Tracker in the launcher and connect the same as in the text client.
  - You now have a text client tab and a tracker tab. Text client behaves exactly like the default text client, tracker gives you a list of available checks based on what items you've received and your game settings.

# I'm having issues!

This is in active development! Check the pinned FAQ and/or ask for help in the [Discord channel](https://discord.com/channels/731205301247803413/1158211913495359548). 

# I'm new to AP, what does this do to the game?

I'll assume you're familiar with randomizers in general. AP randos are separated into items you receive and checks you do to send items. In SHAR, the items are (depending on your yaml settings): Each character's jump and double jump, each characters attack, a "Gagfinder" for each character that enables them to do gags, a "Level X" for each level that unlocks that level's missions, a "Checkered Flag" for each character that unlocks the level's races, all the cars, and then some filler items in the form of an inventory of wrenches and hit and run resets you can use on demand and some various traps.

The checks are: Missions, wasps, cards, gags, talking to the character that would sell you a mission needed car (Barney, Homer, Otto, Willie, etc), and Gil's shops.

Your goal is configurable in the yaml, generally its some combination of mission, wasp, and card completions. The "goal" is for every slot in the multiworld to reach its goal. By default, reaching your goal will send all of your undone checks and make all unsent items for your game be sent to you. This can be configured. 

