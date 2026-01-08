# Setup Guide

## Quick Links

- [Game Page](../../games/Paquerette%20Down%20The%20Bunburrows/info/en)
- [Setup Guide]()
- [Options Page](../../games/Paquerette%20Down%20The%20Bunburrows/player-options)
- [APWorld Repository](https://github.com/SergeAzel/Archipelago_PDTB/releases)
- [Client Mod - Thunderstore](https://thunderstore.io/c/paquerette-down-the-bunburrows/p/BNYSmod/Bunject_Archipelago/)
- [Client Repository](https://github.com/SergeAzel/Bunject/releases/)


## Instructions


The recommended method for playing this Archipelago client is through Thunderstore.
[Download the Thunderstore Mod](https://thunderstore.io/c/paquerette-down-the-bunburrows/p/BNYSmod/Bunject_Archipelago/)

If you are unfamiliar with Thunderstore, it is a modding archive and client for a large number of games.
There are many guides online for using Thunderstore and its various clients, this is not the place for that.

Alternatively, you may install the mod manually from [The Bunject Github Repository](https://github.com/SergeAzel/Bunject/releases/)

Installation instructions:


1. Locate your Paquerette Down The Bunburrows installation directory.  It should look like:

    C:\Program Files (x86)\Steam\steamapps\common\Paquerette Down the Bunburrows\

2. Download the latest version of [BepInEx 5](https://github.com/BepInEx/BepInEx)
3. Install it (use the BepInEx installation guides) to the Paquerette Down The Bunburrows folder in your Steam directories.

    The directories should look something like:  
    ..\Paquerette Down the Bunburrows\BepInEx\core  
    ..\Paquerette Down the Bunburrows\BepInEx\config  
    ..\Paquerette Down the Bunburrows\BepInEx\plugins  

4. Download the latest release from [The Bunject Github Repository](https://github.com/SergeAzel/Bunject/releases/), it should be a zip file.
5. Extract the contents into the BepInEx\plugins directory.  

You need at minimum the following setup:

\plugins\Bunject.dll  
\plugins\Bunject.Archipelago.dll  
\plugins\Archipelago.Multiclient.Net.dll  

The other files within the release (\BNYS\, \Bunject.Computer.dll, \Bunject.NewYardSystem.dll) may be safely discarded.


## Logging In

On the main menu for Paquerette Down The Bunburrows, you should be given the option to enter an Archipelago URL, player name, and password.
Doing so successfully will start your save file for this Archipelago instance.
