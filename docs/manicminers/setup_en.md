# Manic Miners Setup Guide

## Overview

- Download and install the required software
- Set up an Archipelago room/server to connect to
- Initialise the Manic Miners Archipelago modifications
- Start the game, connect your client, and have a good time!

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [Manic Miners](https://baraklava.itch.io/manic-miners)
- Either the latest [released copy](https://github.com/fogmike/Archipelago_ManicMiners/releases) of manicminers.apworld or the [current beta](../manicminers.apworld) directly from this repo

## How to setup Manic Miners

Follow the instructions on the game's website. For a fresh download, it is suggested to play a tutorial level to confirm the game runs without issue. 

## How to setup the initial Archipelago room

(These instructions assume a certain familiarity with Archipelago - please see www.archipelago.gg for more specific details, if required.)

Download and install Archipelago. 

Download the .apworld file, and double-click it to install it into your local Archipelago. Open the Archipelago Launcher (or close and reload it, if it was already open).  

Use either Generate Template Options to create a stub YAML file you can edit directly, or use the Options Creator to flesh it out. Edit the YAML through either of these methods to get your desired game options.

Set up an Archipelago server using that YAML (and any others in the multiworld), as per normal Archipelago instructions, either locally or on the webhost. You're now ready to connect your game to this new server. 

## How to initialise the game mod

From the Archipelago Launcher, open the Manic Miners Client, and run `/reset_installation`. **Warning: this will wipe any prior Archipelago save!**

The very first time you do this, you will be prompted to select the folder that contains your Manic Miners custom Levels folder. This will be in your user's Documents, and you should select the '..../Documents/ManicMiners' folder (which will contain 'Levels'). Once selected for the first time, you don't need to do this again. Should you ever need to change this setting, you can find it in your Archipelago `host.yaml`under `manicminers_options`.

## How to connect to a running game

From the Archipelago Launcher, open the Manic Miners Client. Connect using the URL and port of the server, and enter your Slot Name when prompted. **Warning: If you had a previous Archipelago save, and are starting a new game, make sure you have run `/reset_installation` first, else you will send a large number of checks you do not intend to!**

The very first time you do this, you will be prompted to select the foler that contains your Manic Miners installation. This is the top level directory you extracted your download of Manic Miners to - it should be the directory that contains the `ManicMiners.exe` file. This too cna be edited later in your host.yaml if you need. 

Launch Manic Miners. Switch profiles to the 'Archipelago' profile. 

You will find unlocked levels under Play -> Community Levels. They will all start with 'Archipelago/' (you can search for 'Archipelago' in the filter if you're having trouble finding them). 

Provided the Manic Miners Client is running and connected, new levels and unlocks will become available as soon as they're received. If you were already in the Community Levels menu, you may need to exit to Main Menu and re-enter. Building/Item/Vehicle unlocks will not modify a level mid-play, but will take effect the next time the level is loaded. 

The Manic Miners Client will push your checked locations to the server in real-time while the Client is open, including a forced re-sync on initial connection.

You can play offline (i.e. with the Client disconnected or closed) without any issue, and progress you make will be saved, however you won't send or receive unlocks until you next connect. 

## How to uninstall the Archipelago modifications to Manic Miners

Launch Manic Miners. Switch profiles to any profile other than 'Archipelago'. Close Manic Miners. 

From the Archipelago Launcher, open the Manic Miners Client. Run `/clear_installation`. 