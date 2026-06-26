# The Talos Principle Reawakened - Archipelago Mod

A mod for [The Talos Principle Reawakened](https://store.steampowered.com/app/1938910/The_Talos_Principle_Reawakened/) that integrates with [Archipelago](https://archipelago.gg/) multiworld randomizer.

## Installation

### Prerequisites

- [The Talos Principle Reawakened](https://store.steampowered.com/app/1938910/The_Talos_Principle_Reawakened/)
- [UE4SS experimental-latest](https://github.com/UE4SS-RE/RE-UE4SS/releases/tag/experimental-latest) (required for Unreal Engine 5.4 support)

### Setup

1. **Install UE4SS**:
   - Download [UE4SS experimental-latest](https://github.com/UE4SS-RE/RE-UE4SS/releases/tag/experimental-latest). Ensure it is not the zDEV version
   - Extract the contents of the zip folder to `Talos1/Binaries/Win64`
   - Set the following settings within the UE4SS-settings.ini to 0
      - HookProcessInternal
      - HookProcessLocalScriptFunction
      - HookInitGameState
      - HookLoadMap
      - HookBeginPlay
      - HookEndPlay
   - **Note**: The experimental-latest version is required for Unreal Engine 5.4 support
   - **Note**: You may wish to enable the console output to verify it is working. Modify the UE4SS-settings.ini within UE4SS file
               and set ConsoleEnabled to 1

2. **Install the mod**:
   - Download the latest release
   - Extract to `Talos1/Binaries/Win64/ue4ss/Mods/ArchipelagoMod/`

4. **Configure connection**:
   - Open the `config.json` file
   - Edit with your AP server details:
     ```json
     {
       "server": "archipelago.gg:portNumber",
       "slot_name": "slotName",
       "password": "",
       "game": "The Talos Principle Reawakened"
     }
     ```

5. **Launch the game** and the mod will auto-connect

## Configuration

Edit `config.json`:

- **server**: AP server address and port (e.g. `archipelago.gg:38281`)
- **slot_name**: Your player/slot name in the multiworld
- **password**: Server password (leave empty `""` if none)
- **game**: Game name (should be `"The Talos Principle"`)

## Debug Keybinds

- **F6**: Dump full state (collection, inventory, progress)
