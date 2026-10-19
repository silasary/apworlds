# Carnival Games MiniGolf Setup Guide

## Required Software

- [Archipelago 0.6.7](https://github.com/ArchipelagoMW/Archipelago/releases/latest) or newer
- [Dolphin Emulator](https://dolphin-emu.org/download/)
- A PAL Wii copy of Carnival Games MiniGolf, game ID `RG9P54`
- [The Carnival Games MiniGolf `.apworld` file](https://github.com/mariokirby1703/Lumas-Archipelago/releases)
- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago) (optional, but recommended)

This world is made for the PAL Wii version of the game. Other regions and revisions are not supported.
The client verifies the game before reading or writing memory.

Universal Tracker does not need a separate Carnival Games MiniGolf integration for basic Archipelago tracking.
Your player YAML normally belongs in `C:\ProgramData\Archipelago\Players`.

## Installing the APWorld

1. Download and install Archipelago.
2. Download [`carnival_games_minigolf.apworld`](https://github.com/mariokirby1703/Lumas-Archipelago/releases).
3. Double-click the `.apworld` file to install it into Archipelago's `custom_worlds` folder.
4. If the Archipelago Launcher was already open, close it and reopen it.
5. Open the Archipelago Launcher and check that `Carnival Games MiniGolf Client` appears.

If Archipelago asks to install missing Python requirements, allow it. The client needs Dolphin Memory Engine to
connect to Dolphin.

## Creating a YAML

Create your player YAML with either:

- `Carnival Games MiniGolf Template Options` in the Archipelago Launcher
- The `Options Creator` in the Archipelago Launcher

Make sure the player name in the YAML is the name you want to use when connecting to the Archipelago server.

## Generating a Game

Generate the seed through the Archipelago Launcher or with Archipelago's normal generation tools. The output ZIP
contains a player-specific `.apcgm` file. Keep this file; opening it launches the client with the correct player and
seed information.

## How to Play

1. Open Dolphin.
2. Start the PAL Wii version of Carnival Games MiniGolf.
3. Create or select a fresh game profile dedicated to this Archipelago seed.
4. Open your `.apcgm` file, or open `Carnival Games MiniGolf Client` from the Archipelago Launcher.
5. Connect to the Archipelago server using the address and port given by the host.
6. Enter the same player name that you used in your YAML if the `.apcgm` file did not supply it.
7. Wait until the client reports that Dolphin is connected, the supported game is verified, and synchronization is active.
8. Play normally. The client sends locations, unlocks received worlds, applies currency items, and reports victory.

Use only local golfer 1. Local multiplayer is not supported. Use one MiniGolf client per Dolphin instance.

Keep the same dedicated game profile for the entire seed. Save normally before closing Dolphin. Do not load an old
emulator save state after items have been received, because it can restore an older in-game balance or progression state.

## Client Commands

- `/connect host:port` connects to the Archipelago server.
- `/disconnect` disconnects from the server.
- `/dolphin` shows the Dolphin and game verification status.
- `/minigolf` shows unlocked worlds, received Barker Coins, and check progress.
- `/minigolfdebug` prints live game state for troubleshooting.
- `/missing` lists missing Archipelago locations.
- `/currency_recover skip` keeps an ambiguous current currency balance and marks the pending item delivered.
- `/currency_recover apply` retries an ambiguous pending currency item.

## Client Notes

The client connects to Dolphin through Dolphin Memory Engine and supports the PAL game ID `RG9P54`. It refuses to
write memory when the game or executable revision does not match.

`/minigolfdebug` reports the Dolphin Memory Engine version, separate MEM1 and MEM2 probes, every failed address and
its backend exception, the live session/controller/result addresses, and Pro Shop projection state. A dictionary-backed
test cannot validate Dolphin's real MEM2 mapping. Live validation must show readable values for `session+0x2EC`,
`session+0x2F0`, `session+0xFC`, the controller VTable, the object-array entry, and result flags. On Windows, the client
automatically locates and reads the matching Dolphin MEM2 mapping if the Python backend selected an unusable mapping.
Once validated, that process mapping remains active when a gameplay session disappears, allowing late minigame result
popups to be read. It is discarded and discovered again only after an actual process-memory read failure.

Every world item is named `[World Name] Access` and opens that world. For example, Rah's Revenge is opened by
`Rah's Revenge Access`, including when it is selected as the Goal World. When Barker Coins are selected for Goal
World access, meeting the configured requirement awards that same item. Barker Coins Required ranges from 1 to 40;
the maximum still fits when every optional check family is disabled.

Hole Complete, Par Club Piece, Hole-in-One, minigame, Barker Coin, secret, and shop locations are sent automatically.
The nine Adventure minigames support Win and Perfect checks. Devil's Brew - Spiders has a Win check only.

The first two Pro Shop purchases can be reached with either access to their associated world or the first 500 Coin
Bundle for that world. Purchases three and four use the same alternative with the second bundle and still require
the first Par Club Piece. Later purchases and the Par Club reward require World Access as well as their existing
Par Club Piece thresholds.

Coin Bundles, spendable Barker Coins, and enabled Coin Traps apply immediately while the supported game is running.
For non-counter goals, every world has two progression 500 Coin Bundles; five 100 and five 200 Coin Bundles are
useful items distributed across different worlds. Smaller bundles remain filler. Barker counter modes reserve their
limited item-pool capacity for the required Barker Coins.
Coin Traps default to a 10% filler weight and can be adjusted or disabled in the player YAML.
The running client tracks currency deliveries in memory so reconnecting within that process does not apply a
confirmed item twice. It creates no MiniGolf-specific log, journal, or lock files. If an interrupted delivery leaves
an ambiguous balance, synchronization pauses and the `/currency_recover` commands resolve it.

If you run into any issues, please get in contact on the official Archipelago Discord's Carnival Games MiniGolf
thread in Future Game Design. Including `/minigolfdebug` output makes live-state problems much easier to diagnose.
