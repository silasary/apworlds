# PlateUp! Archipelago Manual Randomizer Setup Guide

<p align="center">
    <img alt="PlateUp Logo"
     src="https://cdn.akamai.steamstatic.com/steam/apps/1599600/header.jpg"
    >
    <!--<h1 align="center">Base Game + DLC Customizable Edition</h1>-->
    <p align="center">v1.0.0</p>
</p>

Last-Updated 2024-04-23 (yyyy-mm-dd)

***A star/asterisk (\*) next to a line mean recommended.***

## Required Software

- PlateUp! Game ([Steam](https://store.steampowered.com/app/1599600/PlateUp/)
 / [Xbox](https://www.xbox.com/en-CA/games/store/plateup/9P2HHT3VS7MP)
 / [PS4/5](https://store.playstation.com/en-ca/product/UP5634-PPSA14231_00-0599385207460473)
 / [Switch](https://www.nintendo.com/en-ca/store/products/plateup-switch/))

## Optional Software

- [Universal tracker](https://discord.com/channels/731205301247803413/1170094879142051912)*
  - A WIP apworld that shows you what location you can go to in real time

## ↑ Recommended* and Optional mods from Steam Workshop↑

Install those from the Steam Workshop:

### Mods

- [Starting Meal Selector](https://steamcommunity.com/sharedfiles/filedetails/?id=2898176672)*
  - Allow you to choose the starting meal using a menu instead of randomly.
- [Better Table Assignment](https://steamcommunity.com/sharedfiles/filedetails/?id=2910617016)*
  - Make groups prefer to use table the side of the group first
  - (eg. alone customers will go to bar table before 2+ chairs tables)
- [Visible Upgrade Chains](https://steamcommunity.com/sharedfiles/filedetails/?id=2925133454)*
  - Shows while holding a blueprint, what it can be upgraded to.
- [Toggle-able Follow Camera](https://steamcommunity.com/sharedfiles/filedetails/?id=2946027459)*
  - It allows you to toggle an follow camera that follows you or other players.
- [Those Were The Days](https://steamcommunity.com/sharedfiles/filedetails/?id=2989592788)
  - ReAdd limited time kitchen to the available settings
  - Will add probably support for those later
- [CountUp!](https://steamcommunity.com/sharedfiles/filedetails/?id=2927654156)
  - Displays a number over portionable foods, bins, and providers!
  - Adjusts certain types of splittable items.
- [Colorblind+](https://steamcommunity.com/sharedfiles/filedetails/?id=2911150641)
  - Adds colorblind labels to (Almost) everything
  - Highly configurable
- [PlateupPrepGhost](https://steamcommunity.com/sharedfiles/filedetails/?id=2903290561)
  - Upon entering the preparation phase, disable collision between players and any geometry (walls, counters, tables, etc.)

## Installation Procedures

Make sure a copy of the Manual world is in the lib/world directory of your client-side installation.
For more general information on this Apworld check the [Guide (Webhost)](/games/Manual_PlateUp_Nicopopxd/info/en)/ [Guide (Github)](en_Manual_PlateUp_Nicopopxd.md)

### Optional installs

#### Mods install

(Only valid on the Steam Version For now)

1. Open the links above in the [Mod](#mods) Section
2. Make sure you are logged in on Steam
3. Press the green "Subscribe" button
4. If a popup open saying there are dependencies press the blue 'Subscribe to All' button
5. Wait for Steam to download the workshop content or start the game if it didn't.

#### Universal Tracker install

1. Open the link in [Optional Software](#optional-software) or using this [direct link](https://discord.com/channels/731205301247803413/1170094879142051912)
2. Check the pins for the download of the version of archipelago you use, at the time of writing its 0.4.4. (March 17 2024)
3. Place the tracker.apworld in the *worlds* folder of your archipelago install.
    1. ([ArchipelagoFolder]\lib\worlds or \worlds if using dev version of archipelago)
4. Also place the manual_outerwilds_nicopopxd.apworld in the world folder if its not there already.
5. Make sure a copy of your current player.yaml is in the *Players* folder of your archipelago install.

## Joining a MultiWorld Game

With a .apmanual file:

1. Open the .apmanual file with the Archipelago Launcher(Debug).exe
2. Verify the information automatically entered in the window is correct
3. Press the Connect button on the top right.

Without a .apmanual file:

1. Open the Archipelago Launcher
2. In the list on the right click on Manual Client.
3. The Manual Client should start.
4. At the top enter your server's ip with the port provided (by default archipelago.gg:38281).
5. In Manual Game ID put "Manual_OuterWilds_Nicopopxd" then press the Connect button on the top right.
6. In the command field at the bottom enter the name of your slot you chose in your Player.yaml then press enter.

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
- Choose a profile
- Make sure you have at least 1 free spot on the save table
- Either find you starting recipe or use Starting Meal Selector mod
