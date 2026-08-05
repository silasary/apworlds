# Nicktoons: Battle for Volcano Island Setup

## Important

This world uses BizHawk's GBA support and is intended for Windows and Linux systems. Use one matching Archipelago installation for the APWorld, Generator, Server, BizHawk Client, and Lua connector.

## Required software

- [Archipelago 0.6.7](https://github.com/ArchipelagoMW/Archipelago/releases)
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) with GBA support
- A legally obtained, unmodified USA ROM of *Nicktoons: Battle for Volcano Island*

Optional: [PopTracker](https://github.com/black-sliver/PopTracker/releases) and the `nicktoons_bfvi_poptracker.zip` release artifact.

The supported ROM has internal title `NICKTOONSBVI` and MD5 `07f3b7415eb3779ff11e51a38d0ad3f8`. The ROM is not included.

## Install the APWorld

Download `nicktoons_bfvi.apworld` from the project Release page. In the Archipelago Launcher, click **Install APWorld** and select the file. Dragging it onto the Launcher or double-clicking it on Windows also works. Restart the Launcher if necessary.

## Configure a YAML

Use the Archipelago Launcher **Options Creator** to select **Nicktoons: Battle for Volcano Island** and export a player YAML. A full-randomizer example is:

```yaml
name: Player
game: "Nicktoons: Battle for Volcano Island"

"Nicktoons: Battle for Volcano Island":
  progression_balancing: normal
  accessibility: full
  trap_chance: 0
  shuffle_characters: true
  shuffle_abilities: true
  goal: final_boss
```

The `goal` option may be `final_boss` or `all_rip_zippers`. Secret Levels use the vanilla 40/60/80 Golden Heart thresholds. See the project setup guide for the full option descriptions.

## Join a game

The host must generate the seed locally after installing this custom APWorld. Ask the host for the room address, port, password if any, and your exact slot name.

1. Open BizHawk and load the verified, unmodified USA ROM.
2. Open **Tools > Lua Console**.
3. Load `connector_bizhawk_generic.lua` from the matching Archipelago installation's `data/lua` folder.
4. Start **BizHawk Client** from the Archipelago Launcher.
5. Enter the room address, port, slot name, and password.

The client and Lua connector must run with the ROM in the same BizHawk instance. Start each seed with a fresh in-game save. The server's received-item list is authoritative.

## Hosting locally

Place all player YAML files in the Archipelago `Players` folder, run **Archipelago Generator**, and start **Archipelago Server** with the generated `AP_<seed>.zip` from `output`.

## PopTracker

Install the optional PopTracker pack, select **Nicktoons BFVI PopTracker**, choose the standard Archipelago variant, and connect it to the same room. The pack has Beach, Jungle, Cave, Desert, Forest, and Secrets / Goal tabs with map nodes for every check.

## Troubleshooting

If the game does not appear in the Generator, reinstall it through **Install APWorld** and restart the Launcher. If the ROM is rejected, verify its title and MD5. If checks do not send, finish the stage normally and wait on the completion screen. If PopTracker does not update, connect it separately with the exact room slot name.
