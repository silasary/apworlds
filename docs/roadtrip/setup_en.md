# Road Trip Adventure Archipelago Setup Guide

## Requirements
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- [PCSX2](https://pcsx2.net/downloads/) v2.0 or higher
- Road Trip NTSC disc image
    - MD5 checksum: e1598a1a2b1a296dbeae90927172d52a

## Program Setup
1. Install Archipelago and PCSX2.
2. Download the [most recent release of the AP world](https://github.com/Phenra/RoadTripAdventure-AP/releases).
3. Copy roadtrip.apworld to Archipelago's 'custom_worlds' subfolder.
    - This can be done for you by launching Archipelago, choosing "Install APWorld", and selecting roadtrip.apworld from the file browser.
    - If using specifically the AppImage on Linux, the *worlds* subfolder is used instead.
4. Open PCSX2, and enable "**Show Advanced Settings**" under Tools. Go to System > Settings, and in the Advanced tab, **enable PINE**. Leave the slot as the default, 28011.
    - If PINE is not in your advanced settings, you will likely need to update PCSX2.

## How to Play
First, fill out your YAML settings file, and send it to whoever is generating the multiworld and hosting it.

Once the [multiworld has been generated](https://archipelago.gg/tutorial/Archipelago/setup_en#generating-a-game) and the [server has been started](https://archipelago.gg/tutorial/Archipelago/setup_en#hosting-an-archipelago-server):

1. Boot Road Trip.
2. Launch Archipelago, and run the Road Trip client.
    - If the Road Trip client is missing from the list, you likely do not have the .apworld file in the custom_worlds folder.
3. You should see the message "**RTA is in the main menu. Connect to the server before creating/loading a save!**" in the client.
4. **While still on the main menu**, click the 'Connect' button in the top-right of the client to connect to the server. 
5. Once connected, you should see the messages "**Road Trip AP memory patch successful!**" and "**Patches requiring slot data successful!**" in the client.
6. Start a new game (or load the save you already started for this Archipelago seed).
7. When you load into Q's Factory, you should see the message "**AP save loaded, you are ready to play!**" in the client.
    - If you instead see a message about the loaded save being vanilla, or for the wrong AP seed, you have likely loaded the wrong save, and will need to return to the main menu.
    - If you see a message about the game not being patched, you likely did not connect to the server while on the main menu.


## Frequently Asked Questions
- Does this game have a patch file?
    - Nope! The game is patched entirely in memory by the client, and does not modify your ROM at all.
- I saw that the game can only be patched by the client while on the main menu. Will I have to return to the main menu if I disconnect from the server mid-game, and then reconnect?
    - Nope! The client should correctly see that the game is already patched, and let you pick up from where you left off.
- What if my *initial* connection to the server happens while I'm not on the main menu?
    - The game will ask you to return to the main menu, and AP will not send or receive checks until you do.
- If I complete a location check while disconnected from the server, is it gone forever?
    - Nope! Once you reconnect, the server will see the locations you cleared while disconnected and respond accordingly.
    - This is true even if you restart PCSX2 while disconnected, so long as you saved your game before closing the emulator.
- What about if I receive an item while disconnected?
    - Nope! Same deal as locations: In RTA AP, your save file will contain a count of how many items you've received from the server. If that count doesn't match your 'items received' count on the server, then the server will send you all of the items you're missing.
- Why is [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases?q=Tracker) giving me the error "Internal generation failed, something has gone wrong"?
    - In order to use UT with RTA, the YAML you used for generation will need to be in your Players subfolder within your Archipelago install folder.
