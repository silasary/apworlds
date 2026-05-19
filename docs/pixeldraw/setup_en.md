# PixelDraw Randomizer Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [PixelDraw apworld](https://interestedsc2.itch.io/pixel-draw)
- [PixelDraw client](https://interestedsc2.itch.io/pixel-draw)

## How to play

Download "pixeldraw.apworld" (if you want the stable one, download "stable.zip" and get it from there instead) and the archipelago launcher \
Either open the downloaded "pixeldraw.apworld" or the "Install APWorld" option in the launcher. \
You can then open the "Options Creator" and select "PixelDraw" from the list to generate an options file (yaml). \
Once you fill out the file, click "Export Options" and save it to the "Players" folder in the archipelago directory (C:\ProgramData\Archipelago\Players on windows). \
After this, open the "Generate" option and wait for it to complete. \
Click the "Host" option, wait for it to complete (do not close the terminal), or upload the generated world to [Archipelago](https://archipelago.gg). \
Open your game file according to the instructions on the itch page (however, it is recommended to open the ".console.exe" instead so you can see server messages). \
Once you open the game, open the menu and choose the "Archipelago" tab. \
Enter the appropriate ip in the "IP" box:

- If playing on the archipelago website, leave it as "archipelago.gg"
- If playing on the same device that is hosting, enter "localhost"
- If playing on the same wifi as the host, enter their computer's local ip address
- Otherwise, enter the ip shown in the host's terminal shown after "Hosting game at", but nothing after the ":" (this is just their online ip address, so don't share it without caution).

Enter the port in the "Port" box, found as the last numbers in the "server listening on" or after the ip at "Hosting game at". \
Enter your slot name (name of the options (yaml) file you generated earlier) into the "Slot" box. \
If there is a password for your slot, enter it in the "Password" box and click the checkbox. \
After this is ready, click "Connect" and wait for the information box to retract as conformation. The host should see your join info in the terminal.
