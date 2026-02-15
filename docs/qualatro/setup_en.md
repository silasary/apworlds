# Qualatro AP Mod

This is a Mod for [Balatro](https://store.steampowered.com/app/2379780/Balatro/) that provides Integration for [Archipelago Multi World](https://archipelago.gg) as well as the mod [Qualatro](https://github.com/SiIvaGunner/qualatro/).

# Gameplay

After generating a seed, every joker, voucher, booster pack, consumable (spectral, tarot, planet) is locked. You can unlock them by finding them in the world as Archipelago items. 

Checks are beating a boss blind at a specific ante with a specific deck at a specific stake. This makes around 900 locations, but it is recommended to limit the amount of stakes that are considered locations (which is possible in the yaml). There are also buyable checks in the shop. 

There are bonus items, for example permanent bonus hand, permanent bonus starting money and more.
There are a few traps, for example lose one hand (for the current run), lose all money, make a random joker perishable and more. 

There are a few more options, just check out the yaml that is bundled with the newest [release](https://github.com/600billionlazer/QualatroAP/releases).

# Requirements

Here's a [video tutorial](https://youtu.be/XnEvgEOswpk) I made sometime if any step of the installation is unclear.

Needs [Steamodded (Alpha)](https://github.com/Steamopollys/Steamodded?tab=readme-ov-file#how-to-install-the-alpha) which is the 1.0 version there. **MAKE SURE TO DOWNLOAD THE ALPHA**. You will have to install [Lovely](https://github.com/ethangreen-dev/lovely-injector/releases/) as described in the Steamodded installation guide and then install the Steamodded Alpha itself. 

After installing those, you will also have to download `lua51.7z` from [lua apclient](https://github.com/black-sliver/lua-apclientpp/releases). 

From the `lua51.7z` extract the file `lua51-clang64-dynamic > lua-apclientpp.dll` and put it into your Qualatro installation folder (the same folder you put the lovely `version.dll`). 

Your Qualatro Folder should look something like this (highlighted files should be there):
![Your Qualatro Folder should look something like this (highlighted files should be there)](https://i.imgur.com/Pe5uTX4.png).

# Installation

To install this mod create a new folder in `%AppData%/Roaming/Balatro/Mods/` called `QualatroAP` and put the files from this repository in there. You can get those from `QualatroAP.zip` in the latest release. 

Your Mods folder should look something like this: 

![Mod Folder](https://i.imgur.com/EI6MGeC.png)

And the inside of the QualatroAP folder should look something like this:

![Your AppData Folder should look something like this](https://i.imgur.com/3JzrdlV.png).

Additionally, you should also have the latest version of Qualatro installed alongside this mod, linked [here](https://github.com/SiIvaGunner/qualatro/releases/).


You should be good to go then! You can start the game normally over Steam and it should load the mod. If there are any issues message me on Discord @pixelsword_. I should be in most of the Archipelago related Discord servers, anyway. 

# Connecting

In Qualatro you can simply connect by selecting the profile "Archipelago" in the profile selector. 
If you have a save file from a different AP session (so an entirely different multiworld) you **have to** delete the old save. 
It is adviced that you backup your existing save files, even though they should not be modified or deleted by this mod. 