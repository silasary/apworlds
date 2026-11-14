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

1. Open your `.apsac` file (from the room page or the generated zip) with the
   Archipelago Launcher, or drag it onto **Secret Agent Clank Client**.
2. The first time you use a given patch build, a **Secret Agent Clank Patcher**
   window asks for your clean USA ISO and shows its progress while it writes
   `Secret Agent Clank AP <build>.iso` to your Archipelago folder. The original
   ISO is never modified. Later seeds on the same build skip this step.
3. The client then opens and connects as the slot in the `.apsac` (and to the
   room's server, if the file came from a room page).
4. Boot the **patched ISO** in PCSX2. Set `secret_agent_clank_options.iso_start`
   in `host.yaml` to `true` (default program) or to the path of `pcsx2-qt.exe`
   to have it booted for you. The client verifies the build before writing game
   data, and loading pauses until the client has initialized the current level.
5. Start a **New Game** after the client connects. The permanent frontend hooks
   use your seed's starting case.

Run settings and received items are synchronized as data, so one patched ISO
serves every seed of a patch build. If a world update changes the build, the
next `.apsac` you open patches a new ISO automatically.

> **Important:** Always start from a New Game at the beginning of a seed. Loading a save from a previous run will cause inventory and location state to be out of sync. To continue an ongoing session, simply reconnect to the same Archipelago connection address and load the save file you used for that session.

---

## Troubleshooting

**Client says "Wrong game in PCSX2"**
Use the patched USA `SCUS-97623` ISO generated for the installed world release.
If the client reports mismatched code or an incompatible savestate, cold boot
that ISO instead of loading a state created with the clean game or another build.

**Loading waits for the client**
Without a client the patched game loads normally. Once the client is connected,
each level load waits briefly while the client sets up that level's items,
settings and checks. If loading stays stuck, the client has likely lost its
connection: reconnect it, or close it to let the game carry on alone.

**Weapons/Gadgets are not appearing after receiving items**
Use `/reconnect` in the client console to re-apply everything received so far.

**Vendor purchases are not registering**
Make sure you are standing at a vendor on a planet that has vendor locations. Purchases are detected when you buy from the vendor menu - the client needs to be connected before you open the menu.

**If you need further help**, join the [Archipelago Discord](https://discord.gg/archipelago) and visit the `[PS2] Secret Agent Clank` thread in the `future-game-design` forum channel.
