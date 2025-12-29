# DREDGE Setup Guide

## Install using DREDGE Mod Manager

### Install DREDGE Mod Manager

Head on over to the DREDGE Mod Manager page and follow the installation instructions.

[DREDGE Mod Manager Page](https://dredgemods.com/manager/)

### Install Archipelago Mod and dependencies using DREDGE Mod Manager

In the `DREDGE Mod Manager` interface.    
Search for and install "Winch"  
Search for and install "Archipelago DREDGE" 

## Running the Modded Game

At present checks can only be sent with DREDGE set to the English language
Click on the `Play` button in the bottom left in `DREDGE Mod Manager` to start the game with the Archipelago mod installed.

## Configuring your YAML File
### What is a YAML and why do I need one?
You can see the [basic multiworld setup guide](/tutorial/Archipelago/setup/en) here on the Archipelago website to learn 
about why Archipelago uses YAML files and what they're for.

## Where do I get a YAML?
You can use the [game options page](/games/DREDGE/player-options) here on the Archipelago 
website to generate a YAML using a graphical interface.

## Gameplay

DREDGE players send checks by fishing new fish and unlocking research.  
Game is completed upon turning all the relics into The Collector

## Joining an Archipelago Session
### Connecting to server
Once your save is loaded in DREDGE, you can join your Archipelago multiworld using **any of the following methods**:

### Terminal Command

The in-game terminal lets you type commands directly.

**To open the terminal:**
- On most English (US/UK) keyboards, press **`~`** or **<kbd>`</kbd>** (the key above **Tab**).
- On some non-English layouts, that key may differ:
  - 🇩🇪 **German**: try **`ö`**
  - 🇫🇷 **French (AZERTY)**: try **`ù`** or **`²`**
  - 🇪🇸 **Spanish**: try **`ñ`**
  - 🇸🇪 **Swedish/Nordic**: try **`§`** or **`½`**
  - If none of these work, look for the key **just above the Tab key** or **to the left of the number 1 key** — it usually opens the terminal regardless of the printed symbol.

Once the terminal is open, type: `ap connect <hostname> <port> <slot name> [-p <password>]`

- Example: `ap connect archipelago.gg 38281 boatguy`
- You can include spaces in your slot name (e.g. `ap connect archipelago.gg 38281 boat guy`).
- The `-p` (or `password=<value>`) part is **optional** — only needed if the server requires a password.

### Mod Config Menu
1. Open the in-game **DREDGE Menu**.
2. Click the **Mods** tab.
3. Enter your server details (host, port, slot name, and optional password).
4. Close the DREDGE menu.
5. Connect or disconnect at any time:
- Press **F8** to connect using the current settings.
- Press **F10** to disconnect.

_(You can also open the terminal and simply type `ap connect` to connect using your current mod settings.)_

### Pop-up UI
1. Press **F7** to open the in-game connection window.
2. Enter or confirm your connection details.
3. Click **Connect** to join the server.
- Press **Disconnect** to leave.

### Notes
- All three methods use the **same saved configuration**, so updates made in one place will appear in the others.
- If connection fails, check your **host, port, and slot name** carefully.
- You can safely disconnect and reconnect at any time without restarting DREDGE.

## Chat/Commands
TBD

## In-Game Commands
Connect to multiworld: `ap connect <hostname> <port> <slotname> <password(is optional)>`  
Disconnect from multiworld: `ap disconnect`
