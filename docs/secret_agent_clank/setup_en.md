# Secret Agent Clank Archipelago Setup Guide

## Requirements

The following are required in order to play Secret Agent Clank in Archipelago

- Installed the latest version of [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- The latest version of the Secret Agent Clank apworld
- [PCSX2 emulator](https://pcsx2.net/downloads/) (2.x or later recommended for the required PINE support)
- A copy of **Secret Agent Clank** US (`SCUS-97623`)
---

## Enabling PINE in PCSX2

PINE is the memory interface the client uses to communicate with the emulator.

1. Open PCSX2.
2. Go to **Settings → General Settings** (or **Tools → Settings** depending on your version).
3. Find the **PINE** section and enable it. Leave the slot/port at the default value unless you have a specific reason to change it.
4. Restart PCSX2 if prompted.

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should
generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy
an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?


You can use the "Options Creator" (a GUI tool in the Archipelago Launcher) to customize your options and export your YAML file. You can also use the "Generate Template Options" feature if you prefer editing your YAML in a text editor. Both tools are available in the Archipelago Launcher.

---
## Setting up your Multiworld
### Hosting your MultiWorld

This section is for players who want to host a solo or multiplayer game.

1. Collect YAML files from all participating players.
    - In the Archipelago Launcher, select "Browse Files" and open the `Players` folder.
    - Place each player's YAML file into the `Players` folder.

2. In the Archipelago Launcher, select "Generate" to create your multiworld.
    - The generated zip file will appear in the `output` folder.

3. To host online, upload the zip file from the `output` folder to the [Archipelago Website](https://archipelago.gg/uploads).
    - To host locally, select "Host" in the Archipelago Launcher and choose the zip file from the `output` folder.

### Starting a Game

1. Launch the **Secret Agent Clank Client** from the Archipelago launcher.
2. Connect to your Archipelago server with your slot name.
3. In PCSX2, load the game and wait at the **main menu** for the client to connect. The same client automatically selects the address map from the disc serial.
4. Wait for the client's **Ready to start a new game** message before selecting **New Game**. The frontend patch starts the new save directly on the selected planet, without first loading Boltaire Museum.

> **Important:** Always start from a New Game at the beginning of a seed. Loading a save from a previous run will cause inventory and location state to be out of sync. To continue an ongoing session, simply reconnect to the same Archipelago connection address and load the save file you used for that session.

---

## Troubleshooting

**Client says "Wrong game in PCSX2"**
Make sure you are running a recognized serial: `SCUS-97623` (US). Restart the client after updating so it loads the regional detection code.

**Weapons/Gadgets are not appearing after receiving items**
Use `/reconnect` in the client console to re-apply everything received so far.

**Vendor purchases are not registering**
Make sure you are standing at a vendor on a planet that has vendor locations. Purchases are detected when you buy from the vendor menu - the client needs to be connected before you open the menu.

**If you need further help**, join the [Archipelago Discord](https://discord.gg/archipelago) and visit the `[PS2] Secret Agent Clank` thread in the `future-game-design` forum channel.
