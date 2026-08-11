# Setup Guide for The Wind Waker Archipelago

Welcome to The Wind Waker HD Archipelago! This guide will help you set up the randomizer and play your first multiworld.
If you're playing The Wind Waker HD, you must follow a few simple steps to get started.

## Requirements

You'll need the following components to be able to play The Wind Waker HD:
* Install [Cemu Emulator](https://github.com/cemu-project/Cemu/releases/). **We recommend using the latest release.**
* The latest version of the [TWWHD AP Randomizer Build](https://nightly.link/Teotia444/TWWHD-Randomizer-expbuilds/workflows/build_latest/archipelago?preview).
    * For now do not try to use the wuhb image! Wii U support is not finished. You can also download them from the Actions page if you prefer, 
    both the nightly link and the actions are equivalent. 
* A The Wind Waker HD decrypted folder (North American version). The typical folder that comes from dumping the game from a
  Wii U with dumpling for instance. It should contain 3 folders inside: `"code", "content", "meta"`.
* The latest APWorld for TWWHD. In order to install it, download [the repo you're on right now](https://github.com/teotia444/twwhd-apworld) (on the initial page, click the Code button, then 
  download zip), and rename the downloaded zip file into a .apworld file. Then in the AP launcher, install the new APWorld 
  as usual. Make sure to restart the launcher if TWWHD doesn't show up immediately.


## Setting Up a YAML

All players playing The Wind Waker must provide the room host with a YAML file containing the settings for their world.
To generate the base YAML, in the AP launcher, go into the "Misc" tab and click on Generate Template Options. Then, 
in the newly opened window, search for the TWWHD yaml and edit the settings as you wish. NOTE: all entrance randomizers
are currently unimplemented, do not enable them or you may softlock!
Once you're happy with the settings, pass the YAML file to the person generating the seed. Make sure they have the TWWHD
APWorld installed, too.

## Connecting to a Room

The multiworld host will provide you a link to download your APTWWHD file or a zip file containing everyone's files. The
APTWWHD file should be named `P#_<name>_XXXXX.aptwwhd`, where `#` is your player ID, `<name>` is your player name, and
`XXXXX` is the room ID. The host should also provide you with the room's server name and port number.

Once you're ready, follow these steps to connect to the room:
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
10. The client should notify that Cemu connected succesfully. You can start playing.
11. Optionnaly, connect the integrated tracker. In the TWWHD AP Randomizer Build program, go into the Tracker tab and
input your room informations, then connect. This will track the locations checked and items recieved. If connecting to 
locally hosted room, make sure to specify the port (default is `38281`)

## Troubleshooting

* Ensure you are running the same version of Archipelago on which the multiworld was generated.
* Ensure you are using the correct randomizer build for the version of Archipelago you are using.
* Ensure you restart the client if you happen to crash or close Cemu.
* Do not run the Archipelago Launcher or Cemu as an administrator on Windows.
* If you encounter issues with authenticating, ensure that the randomized folder is open in Cemu and corresponds to the
  multiworld to which you are connecting.
* Ask for help in [the WWHD thread](https://discord.com/channels/731205301247803413/1353503360938151979) if you can't figure it out.