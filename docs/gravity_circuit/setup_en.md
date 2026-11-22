# Gravity Circuit Archipelago Setup

## Requirements
- Gravity Circuit on Steam, v1.2.2 (Windows, or Linux / Steam Deck through Proton)
- The Gravity Circuit Archipelago mod download (`install.ps1`, `install.sh`, `mod\`)

## Installing
1. Run `install.ps1`. It copies the mod into `%APPDATA%\Gravity Circuit\`, the game's save folder.
   On Linux / Steam Deck, start the game once, then run `sh install.sh`; it installs into the game's Proton prefix.
2. Launch the game normally from Steam.

## Connecting
1. Press **F9** in game.
2. Enter the server address (for example `archipelago.gg:38281`), your slot name and the password, then press Enter.
3. Start a **new game in an empty save slot**. That save is linked to your slot from then on.

The connection details are remembered. Next time the game reconnects on its own.

## Troubleshooting
See `%APPDATA%\Gravity Circuit\archipelago\ap_log.txt`.
