# Setup Guide for The Wind Waker Archipelago

Welcome to The Wind Waker HD Archipelago! This guide will help you set up the randomizer and play your first multiworld.
If you're playing The Wind Waker HD, you must follow a few simple steps to get started.

## Requirements

**If you're updating from an old version:**
* Make sure you remove any old WWHD apworlds from your `custom_worlds` folder (which you can usually find at `C:\ProgramData\Archipelago` or wherever you installed AP)

You'll need the following components to be able to play The Wind Waker HD:
* The latest APWorld for TWWHD and the latest patcher for TWWHD. Those can be found in the 
 [releases tab](https://github.com/Teotia444/twwhd-apworld/releases/latest) of this project. The releases contains both the latest APWorld, 
 and the latest generator (the exe file that also contains the tracker), as well as a `.wuhb` file and a `.wps` file for real hardware. To avoid any conflicts, if 
 this is not your first time installing this APWorld, do clear any old WWHD apworlds from your `custom_worlds` folder (which you can usually find at 
 `C:\ProgramData\Archipelago` or wherever you installed AP).

**If you plan on playing on an emulator:** 
* Install [Cemu Emulator](https://github.com/cemu-project/Cemu/releases/). **We recommend using the latest release. Older** 
  **releases will have a harder time connecting properly**
* You'll need a The Wind Waker HD decrypted folder (North American version). The typical folder that comes from dumping the game 
  from a Wii U with [dumpling](https://cemu.cfw.guide/using-dumpling.html#preparations) for instance. It should contain 3 folders 
  inside: `"code", "content", "meta"`.
* Download whichever patcher suits your system. The APWorld and the patcher is all you need for Cemu.

**If you plan on playing on a real Wii U:** 
* Download the latest AP Helper Plugin from the [releases tab](https://github.com/Teotia444/twwhd-apworld/releases/latest).
  Make sure your Wii U has [Aroma](https://wiiu.hacks.guide/aroma/getting-started.html) installed and on the latest version (you can
  check this using the Aroma Updater app on your Wii U, **this step is important** otherwise your wii u may freeze on boot with the
  plugin installed). Then, put the downloaded `.wps` file into your sd card at `sd:\wiiu\environments\aroma\plugins`.
* You'll need the game (duh!) in either physical or digital form. The generator supports both disks and installs from the E-Shop. Note
  that only the North American version is supported at the time, and the European or Japanese version will not work.
* For the Wii U version the patcher comes in the `.wuhb` format. This file goes into your sd card at `sd:\wiiu\apps\`. Note that you 
  can rename the wuhb file so that you have both the normal randomizer app and the AP randomizer app on your Wii U. They have a different 
  name and icon so you will be able to distinguish them.
* You might also want to download the PC patcher as it contains the tracker for this. Download whichever patcher suits your system.


## Setting Up a YAML

All players playing The Wind Waker must provide the room host with a YAML file containing the settings for their world.
To generate the base YAML, in the AP launcher, go into the "Misc" tab and click on Generate Template Options. Then, 
in the newly opened window, search for the TWWHD yaml and edit the settings as you wish.
Once you're happy with the settings, pass the YAML file to the person generating the seed. Make sure they have the TWWHD
APWorld installed, too.

## Connecting to a Room

The multiworld host will provide you a link to download your APTWWHD file or a zip file containing everyone's files. The
APTWWHD file should be named `P#_<name>_XXXXX.aptwwhd`, where `#` is your player ID, `<name>` is your player name, and
`XXXXX` is the room ID. The host should also provide you with the room's server name and port number.

Once you're ready, follow these steps to connect to the room:

**If you're playing on an emulator (Cemu):**
1. Run the TWWHD AP Randomizer Build. If this is the first time you've opened the randomizer, you'll need to specify the
path to your The Wind Waker HD folder and the output folder for the randomized game. These will be saved for the next time 
you open the program.
2. Modify any cosmetic convenience tweaks and player customization options as desired.
3. For the APTWWHD file, browse and locate the path to your APTWWHD file.
4. Click `Randomize` at the bottom right. This randomizes the game and puts it in the output folder you specified. 
5. Open Cemu and use it to open the randomized game.
6. Start your archipelago launcher and find `The Wind Waker HD Client`, which will open the text client.
7. Connect to the room by entering the server name and port number at the top and pressing `Connect`. For rooms hosted
    on the website, this will be `archipelago.gg:<port>`, where `<port>` is the port number. If a game is hosted from the
    `ArchipelagoServer.exe` (without `.exe` on Linux), the port number will default to `38281` but may be changed in the
    `host.yaml`.
8. **Use the `/cemu` command in the client once you've connected**. The client should notify that Cemu connected successfully. 
> If you're using an outdated version of Cemu OR if your `log.txt` file exists next to the Cemu executable, then the client will probably fail to fetch the base address, in which case it will ask for a base address. To fix this, simply update Cemu to 2.6 and delete any `log.txt` file that might still be next to the Cemu executable. If you want to keep using an older Cemu version for whatever reason, you can also manually fetch your base address. Open Cemu and Click on `File > Open Cemu folder`, there you will find a `log.txt`, open it and look for a line that looks something like this: `Init Wii U memory space (base: 0xXXXXXXXXXXXXXXXX)` (with the X being numbers/letters). It should be somewhere near the top. Copy the hex code (the part that looks like `0xXXXXXXXXXXXXXXXX`) and paste it into your client, when it asks for `Enter base address:`. If done correctly it should show `Cemu connected successfully`.
9. Once you start a save, you should see the server greeting message in your text client. If it asks you to input your slot instead, do so. Then, you'll be all set to play.
10. Optionally, connect the integrated tracker. In the TWWHD AP Randomizer Build program, go into the Tracker tab and
    input your room informations, then connect. This will track the locations checked and items received. If connecting to a
    locally hosted room, make sure to specify the port (default is `38281`)

**If you're playing on a real Wii U**
1. If this is your first time playing on a real Wii U, start by launching the AP Randomizer app on your Wii U 
   (the one with the Nayru's pearl icon and a small AP logo). Close it off once it has fully loaded (it will tell
   you that it could not find the APTWWHD file). We're doing this to generate files on your SD card.
2. Put your APTWWHD file into your sd card at `sd:\wiiu\apps\save\XXXXXX (TWWHD AP Randomizer)\` and rename it
   to `world.aptwwhd`. Do not do this process over FTP, as this can occasionnaly cause issues during randomization
   (or if you do it through FTP, make sure to restart your wii u BEFORE generating).
3. Launch the Randomizer app again and change any cosmetic convenience tweaks and player customization options as desired.
4. Press the Start button to generate. Don't mind the random seed or hash. Install the channel to either NAND or USB 
   (we recommand USB) if this is your first time generating the rando on console (you don't need to do this if you've 
   already installed the base randomizer in the past). Sit back and watch the funny debug messages I left in. This might take
   some time, especially on the first randomization.  
5. The game will appear on your menu once it's done generating, you can launch it. If instead you see a channel with no icon 
   labled '???', this is a bug. No panic, you can delete it from the system settings, but it is a bug, so please report it! 
6. Make sure the helper plugin is enabled in the plugins config menu (open it with L + Dpad Down + Select, check it's there).
   Note down the IP Address you find in the plugin's config entry. It should look like this: `192.168.XXX.XXX` with the XXX being 
   numbers. On your computer, start your archipelago launcher and find `The Wind Waker HD Client`, which will open the text client.
7. Connect to the room by entering the server name and port number at the top and pressing `Connect`. For rooms hosted
   on the website, this will be `archipelago.gg:<port>`, where `<port>` is the port number. If a game is hosted from the
   `ArchipelagoServer.exe` (without `.exe` on Linux), the port number will default to `38281` but may be changed in the
   `host.yaml`.
8. **Use the `/wiiu ip_addr` command once you're connected.** Replace `ip_addr` with the IP Address you fetched on 6.
    The client should notify that the Wii U connected successfully
9. Once you start a save, you should see the server greeting message in your text client. If it asks you to input your slot instead, do so. Then, you'll be all set to play.
10. Optionally, connect the integrated tracker. On your computer, in the TWWHD AP Randomizer Build program, go into the 
    Tracker tab and input your room informations, then connect. This will track the locations checked and items received. 
    If connecting to a locally hosted room, make sure to specify the port (default is `38281`)

## Troubleshooting

* When reporting an issue or asking for help, it is very appreciated if you can log as much version hashes as possible. 
  You can find the APWorld version hash in the client window's title, the patcher version hash either in game on the title screen,
  at the bottom right corner or in the patcher itself, in the title of the app, and you can also find the APWorld Helper 
  version hash in the plugins menu settings. This is all helpful to debug.
* Ensure you are running the same version of Archipelago on which the multiworld was generated.
* Ensure you restart the client if you happen to crash or close Cemu.
* Do not run the Archipelago Launcher or Cemu as an administrator on Windows.
* If you encounter issues with authenticating, ensure that the randomized folder is open in Cemu and corresponds to the
  multiworld to which you are connecting.
* Ask for help in [the WWHD thread](https://discord.com/channels/731205301247803413/1353503360938151979) if you can't figure it out.
