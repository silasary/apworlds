# SUPERHOT Setup Guide

## Required Software

- SUPERHOT: [Steam Store](https://store.steampowered.com/app/322500)
- Archipelago: [Releases Page](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- The mod: [Thunderstore](https://thunderstore.io/c/superhot/p/Archihot/SuperhotArchipelago/)

## Installation

1. Install the official [Archipelago app](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
   — the real multiworld generator/server/client, and what actually creates and hosts a
   game.
2. In the Archipelago Launcher, click **Install APWorld** and pick `superhot.apworld`
   from [this project's GitHub releases](https://github.com/My-Key-Morris/SUPERHOT_Archipelago/releases/latest).
   SUPERHOT now shows up as a supported game.
3. Install the mod from [Thunderstore](https://thunderstore.io/c/superhot/p/Archihot/SuperhotArchipelago/).
   It declares [MelonLoader](https://melonwiki.xyz) as a required dependency, so a
   Thunderstore-aware mod manager (r2modman, Gale, the Thunderstore Mod Manager) installs
   MelonLoader alongside it automatically and drops the `Mods`/`UserLibs` contents
   straight into your SUPERHOT install. Installing by hand instead? Grab MelonLoader
   yourself first, install it into your SUPERHOT folder (same folder as `SUPERHOT.exe`),
   launch and close SUPERHOT once to finalize it, then unzip the mod's package and copy
   its `Mods` and `UserLibs` folders in the same way.

## Generating and Joining a Game

1. Generate and host a game as usual through the Archipelago Launcher (**Generate**, then
   **Host** on the resulting `.zip`) — or join an already-hosted room.
2. Launch SUPERHOT. MelonLoader prints console output on top of the game — look for
   lines starting with `[SuperhotArchipelago]` confirming it loaded.
3. On the hub's main screen, open the `ARCHIPELAGO` folder and select `CONNECT`, then
   enter your server/slot/password. `Tab`/`Enter` move between fields, `Enter` on the
   last field connects, `Esc` closes the screen. Settings save automatically.
4. Play the first level. A line in the MelonLoader console confirming a check was sent is
   the sign everything's wired up correctly.

## Troubleshooting

Found a bug, or something feel off? Open an
[issue](https://github.com/My-Key-Morris/SUPERHOT_Archipelago/issues) with whatever the
MelonLoader console printed (especially red/error lines) and which step you got to.
