# Ratchet & Clank: Size Matters Archipelago Setup Guide

## Requirements

The following are required in order to play Ratchet & Clank: Size Matters in Archipelago

- Installed the latest version of [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- The latest version of the Ratchet & Clank: Size Matters apworld
- [PCSX2 emulator](https://pcsx2.net/downloads/) (2.x or later recommended for the required PINE support)
- A copy of **Ratchet & Clank: Size Matters** — NTSC-U disc or ISO (`SCUS-97615`)
---

## Enabling PINE in PCSX2

PINE is the memory interface the client uses to communicate with the emulator.

1. Open PCSX2.
2. Go to **Settings → General Settings** (or **Tools → Settings** depending on your version).
3. Find the **PINE** section and enable it. Leave the slot/port at the default value unless you have a specific reason to change it.
4. Restart PCSX2 if prompted.

---
## Configuring your YAML file

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

1. Launch the **R&C: Size Matters Client** from the Archipelago launcher.
2. Connect to your Archipelago server with your slot name.
3. In PCSX2, load `SCUS-97615` and start a **New Game**.
4. Play through the opening until you reach **Pokitaru** and have control of Ratchet.
5. The client will automatically connect to PCSX2 once the correct game ID is detected.


> **Important:** Always start from a New Game at the beginning of a seed. Loading a save from a previous run will cause inventory and location state to be out of sync. To continue an ongoing session, simply reconnect to the same Archipelago connection address and load the save file you used for that session.

---

## Weapons and Gadgets

When the client first connects it will scan PCSX2 memory for the weapon array. This scan can take a moment. You will see a message like:

```
[RAC] Weapon array at 0x20F12345.
```

If weapons or gadgets are not being applied correctly, use the following commands in the client console:

| Command | Description |
|---------|-------------|
| `/scan` | Force a fresh weapon array scan. Use this if weapons are not showing up after connecting or after a game reload. |
| `/reconnect` | Disconnect and reconnect to PCSX2, then re-apply all received items. Use this if the client loses sync with the emulator. |
| `/disconnect_game` | Disconnect from PCSX2 without closing the client. |

---

## Troubleshooting

**Client says "Wrong game in PCSX2"**
Make sure you are running `SCUS-97615` (NTSC-U). PAL and other regional versions are not supported.

**Weapons are not appearing after receiving items**
Use `/scan` in the client console. If that does not help, use `/reconnect`.

**Vendor purchases are not registering**
Make sure you are standing at a vendor on a planet that has vendor locations. Purchases are detected when you buy from the vendor menu — the client needs to be connected before you open the menu.

**If you need further help**, join the [Archipelago Discord](https://discord.gg/archipelago) and visit the `[PSP/PS2] Ratchet & Clank Size Matters` thread in the `future-game-design` forum channel (located at the bottom).
