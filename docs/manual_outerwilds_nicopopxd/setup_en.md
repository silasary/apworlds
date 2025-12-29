# Outer Wilds Archipelago Manual Randomizer Setup Guide

<p align="center">
    <img alt="OuterWilds Logo"
     src="https://upload.wikimedia.org/wikipedia/fr/thumb/d/dc/Outer_Wilds_Logo.png/800px-Outer_Wilds_Logo.png?20190112131250"
    >
    <h1 align="center">Base Game + DLC Customizable Edition</h1>
    <p align="center">v6.2.0</p>
</p>

Last-Updated 2024-04-23 (yyyy-mm-dd)

***A star/asterisk (\*) next to a line mean recommended.***

## Required Software

- OuterWilds Game ([Steam](https://store.steampowered.com/app/753640/Outer_Wilds/)
 / [Epic Games](https://launcher.store.epicgames.com/en-US/p/outerwilds)
 / [Xbox](https://www.xbox.com/en-CA/games/store/outer-wilds/C596FKDKMQN7)
 / [PS4/5](https://store.playstation.com/en-us/product/UP2470-PPSA08101_00-OUTERWILDSSIEA00)
 / [Switch](https://www.nintendo.com/en-ca/store/products/outer-wilds-switch/))

- The latest stable [Archipelago Launcher](https://archipelago.gg/)

## Optional Software

- Echoes of the Eye DLC* ([Steam](https://store.steampowered.com/app/1622100/Outer_Wilds__Echoes_of_the_Eye/)
 / [Epic Games](https://store.epicgames.com/en-US/p/outerwilds--echoes-of-the-eye)
 / [Xbox](https://www.xbox.com/en-CA/games/store/outer-wilds-echoes-of-the-eye/9N9MB73Q36FQ/0010)
 / [PS4/5](https://store.playstation.com/en-us/product/UP2470-PPSA08101_00-OWEOTESIEA000000)
 / [Switch](https://www.nintendo.com/en-ca/store/products/outer-wilds-echoes-of-the-eye-70050000045020-switch/))

- [OuterWilds Mod Manager](https://outerwildsmods.com/mod-manager/)*
  - PC versions only (Steam or Epic Games)
- [Universal Tracker](https://discord.com/channels/731205301247803413/1170094879142051912)*
  - An WIP apworld that shows you what location you can go to in real time

## ↑ Recommended* and Optional mods from manager↑

Install those from the Mod Manager:

### Base Game mods

- [Clock](https://outerwildsmods.com/mods/clock/)*
  - Shows a timer with the main event at the bottom right of the screen.
- [Hiker's Mod](https://outerwildsmods.com/mods/hikersmod/)*
  - By default only add sprint but can also add walljumps(not in logic)
- [Achievements+](https://outerwildsmods.com/mods/achievements/)*
  - Add popup when you would get an achievement on new save even if you already have that steam achievement.
- [Enable Meditation](https://outerwildsmods.com/mods/enablemeditation/)*
  - Like the name might suggest you always have the "meditate until next loop button" in the pause menu.
- [Suit Log](https://outerwildsmods.com/mods/suitlog/)
  - Allows you to open your ship log from anywhere.
- [Trajectory Prediction](https://outerwildsmods.com/mods/trajectoryprediction/)
  - Shows where your shipscout/player is going vs selected planet.
  - Require you enabling "Use Incremental GC" in the modmanager settings.
- [Resource Management](https://outerwildsmods.com/mods/resourcemanagement/)
  - A mod that makes the oxygen and fuel in your ship matter.
  - Oxygen regen when in area with oxygen and fuel regenerate while the ship is landed.

#### DLC Mods

- [EotE Brighter Dreams](https://outerwildsmods.com/mods/eotebrighterdreams/)*
  - Highly configurable night vision for the dreamworld.
  - By default allows you to see in a small radius around you to help you know where you are.
- [Peaceful Ghost](https://outerwildsmods.com/mods/peacefulghosts/)
  - If you're afraid of the OwlPeoples this mod make them ignore you.

## Installation Procedures

Make sure a copy of the Manual world is in the lib/world directory of your client-side installation.
For more general information on this Apworld check the [Guide (Webhost)](/games/Manual_OuterWilds_Nicopopxd/info/en)/ [Guide (Github)](en_Manual_OuterWilds_Nicopopxd.md)

### Optional installs

#### Mod Manager install

1. Open the link in [Optional Software](#optional-software) or using this [direct link](https://outerwildsmods.com/mod-manager/)
2. Press the 'Big Green Download Button' or the portable version link under it.
3. Save the downloaded installer somewhere.
    - If you downloaded the portable version save it somewhere easy to access and that you wont forget.
4. Run the installer, the Mod Manager should start automatically.
    - If you downloaded the portable version launch the OuterWilds Mod Manager.
5. First you have to install the OWML mod (should be the first in the list)  
by pressing the download icon (third button from the right)
6. To install the mods you either find them in the list and press download icon  
or you can search for them by name at the top of the Mod tab
7. Once you have all the mods you want press the Start Game button at the top, it will enable all the mods  
you installed and after that you'll only need to start from the Mod Manager when you add/remove/update mods

#### Universal Tracker install

1. Open the link in [Optional Software](#optional-software) or using this [direct link](https://discord.com/channels/731205301247803413/1170094879142051912)
2. Check the pins for the download of the version of archipelago you use, at the time of writing its 0.4.3. (nov 18)
3. Place the tracker.apworld in the *worlds* folder of your archipelago install.
    - ([ArchipellagoFolder]\lib\worlds or \worlds if using dev version of archipelago)
4. Also place the manual_outerwilds_nicopopxd.apworld in the world folder if its not there already.
5. Make sure a copy of your current player.yaml is in the *Players* folder of your archipelago install.

## Joining a MultiWorld Game

1. Launch the launcher.
2. Click on Manual client on the right.
3. At the top enter your server's ip with the port provided (by default archipelago.gg:38281).
4. In Manual Game ID put "Manual_OuterWilds_Nicopopxd" then press the Connect button on the top right.
5. In the command field at the bottom enter the name of your slot you chose in your Player.yaml then press enter.

### Universal Tracker

1. Open the Archipelago Launcher
2. Click on the Universal Tracker button
3. At the top enter your server's ip with the port provided (by default archipelago.gg:38281).
4. In the command field at the bottom enter the name of your slot you chose in your Player.yaml then press enter.

## Manual Client

In the "Tracker and Locations" tab you'll find buttons corresponding with all the available locations in the Randomizer.  
Since this is a manual game its built on trust™ you press the locations when you get to them,  
hopefully in the future only what you can access will be visible but at the moment  
you could press victory and it would accept it.

## Main Game

- Launch the game
- Either make a new Profile (maybe call it randomizer) or start a expedition(will wipe the save on the current profile)
- Press new expedition
  - (or continue expedition if you are loading a save from the randomizer)
