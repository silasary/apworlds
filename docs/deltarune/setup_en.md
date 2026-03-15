# DELTARUNE Randomizer Setup Guide (setup is the same as Undertale)

### Required Software

- DELTARUNE from the [Steam page](https://store.steampowered.com/app/1671210/)
- Archipelago from the [Archipelago Releases Page](https://github.com/ArchipelagoMW/Archipelago/releases)

### PLEASE READ!

Please read this page in its entirety before asking questions!

### My host is asking for/To generate a Multiworld I need a "YAML" file. Where do I get a YAML file?

Run the apworld file as a program. It should automatically install to your Archipelago folder (you will get a pop-up saying it worked). Afterwards, go to the Archipelago folder, and select the folder called "Players". Inside is another folder called "Templates". If the installation worked, there should be a .YAML file called "DELTARUNE". Open the file and follow the instructions.

### First time setup

Start the DELTARUNE client from your Archipelago folder or the Archipelago app and input `/auto_patch <Your DELTARUNE Install Directory>` at the bottom. 

This directory is usually located at `C:\Program Files\Steam\steamapps\DELTARUNE`, but it can be different depending on 
your installation. You can easily find the directory by opening the DELTARUNE directory through Steam by right-clicking 
DELTARUNE in your library and selecting `Manage -> Browse local files`. Then, on Windows you can see the directory that 
you need at the top of the window that opens.

After using the `/auto_patch` command, **Archipelago will make a DELTARUNE folder within the Archipelago install 
location.** That folder contains the version of DELTARUNE you will use for Archipelago. (If you update Archipelago, 
you will need to redo this set-up.)

**Linux Users**: The Linux installation is mostly similar, however, DELTARUNE will be installed on Steam as the Linux 
variant. Since this randomizer only supports the Windows version, we must fix this, by right-click the game in Steam, 
going to `Properties -> Compatibility`, and checking `Force the use of a specific Steam Play compatibility tool`. This
downloads the Windows version of DELTARUNE to use instead of the Linux version. If the play button is greyed out in 
Steam, be sure to go to `Settings -> Compatibility` and toggle `Enable Steam Play for all other titles`.

### Connect to the MultiServer

Make sure both DELTARUNE **from the Archipelago folder** and its client are running. (You will know you have modded the game properly as the version will say "DELTARUNE Archipelago". Archipelago DELTARUNE does not overwrite vanilla saves, but you may want to back up your save as a precaution.)

In the top text box of the client, type the `IP Address` (or `Hostname`) and `Port` separated with a `:` symbol. 
(Ex. `archipelago.gg:38281`)

The client will then ask for the slot name, input your slot name chosen during YAML creation in the text box at the 
bottom of the client.

**Linux Users**: When you start the client, it is likely that the save data path is incorrect, and how the game
is played depends on where the save data folder is located.

**On Steam (via Proton)**: This assumes the game is in a Steam Library folder.  Right-click DELTARUNE, go to `Manage -> 
Browse Local Files`. Go up the directories to the `steamapps` folder, open `compatdata/1671210` (1671210 is the "magic number" for
DELTARUNE in Steam).  Save data from here is at `/pfx/drive_c/users/steamuser/AppData/Local/DELTARUNE`.

**Through WINE directly**: This depends on the prefix used.  If it is default, then the save data is located at
`/home/USERNAME/.wine/drive_c/users/USERNAME/AppData/Local/DELTARUNE`.

Once the save data folder is located, run the `/savepath` command to redirect the client to the correct save data folder
before connecting.

### Play the game

When the console tells you that you have joined the room, you're all set. Congratulations on successfully joining a
multi-world game!