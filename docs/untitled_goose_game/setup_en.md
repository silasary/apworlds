# Untitled Goose Game Archipelago Setup Guide

## Required Software

- Untitled Goose Game (Steam)
- BepInEx 5.4.9.0 x 64 for Unity Mono
- .NET 6.0 Runtime (for the proxy server)
- Archipelago client files (from releases)
- Archipelago server 0.5.0 or higher

## Installation

### Step 1: Install BepInEx

1. Download https://github.com/BepInEx/BepInEx/releases/tag/v5.4.9 x64
2. Extract the contents into your Untitled Goose Game folder
   - Steam: `C:\Program Files (x86)\Steam\steamapps\common\Untitled Goose Game\`
3. Run the game once and close it - this creates the BepInEx folder structure

### Step 2: Install .NET 6.0 Runtime

1. Download the [.NET 6.0 Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/6.0) if you don't have it
2. Run the installer

### Step 3: Install the Mod

1. Download the following files from the releases page:
   - `GooseGameAP.dll`
   - `APProxy.exe`
   - `APProxy.dll`
   - `APProxy.runtimeconfig.json`
2. Place `GooseGameAP.dll` in `Untitled Goose Game\BepInEx\plugins\`
3. Place the APProxy files (`APProxy.exe`, `APProxy.dll`, `APProxy.runtimeconfig.json`)  in `Untitled Goose Game\BepInEx\plugins\`

### Step 4: Install the APWorld

1. Download `untitled_goose_game.apworld` from the releases page
2. Place it in your Archipelago installation's `custom_worlds` folder
   - Or double-click the .apworld file if you have Archipelago's file association set up

## Generating a Game

1. Create a YAML config file for your game (see template below)
2. Generate using the Archipelago launcher or website
3. Host or upload to archipelago.gg

### YAML Template

```yaml
game: Untitled Goose Game
name: YourName

Untitled Goose Game:
  starting_area:
    garden: 50
    high_street: 50
```

### Options

| Option | Values | Description |
|--------|--------|-------------|
| starting_area | garden, high_street | Where you begin the game |

## Running the Game

1. Launch Untitled Goose Game
2. The proxy (APProxy.exe) starts automatically
3. The AP connection window appears in the top-left
4. Enter the server address (e.g., `archipelago.gg:12345`)
5. Enter your slot name (must match your YAML)
6. Enter the password if required
7. Click Connect

## Controls

| Key | Action |
|-----|--------|
| F1 | Toggle UI visibility |
| G | Use stored Goose Day |
| C | Cycle goose colour | (Keep in mind this will end up as a black void eventually for now)
| Ctrl+C | Reset goose colour |
| F9 | Resync gates (use if gates get stuck after reconnect) |

## Gameplay Notes

- You start with access to your starting area only
- Other areas unlock when you receive their access items
- Pick up items, complete goals, drag things to locations, and interact with objects to send checks
- Traps and progressive items add chaos and buffs throughout your run

## Troubleshooting

**Game won't start / crashes on launch**
- Make sure you're using BepInEx 5.x, not 6.x
- Check that all DLLs are in the correct folders

**Can't connect to server**
- Check that APProxy.exe started (should appear automatically)
- Verify the address and port are correct
- Check your slot name matches exactly (case-sensitive)
- Make sure the server is running and you have network access

**Proxy won't start**
- Install .NET 6.0 Runtime if you haven't already
- Make sure all three proxy files are in the game folder (same folder as Untitled Goose Game.exe)

**Gates not opening after receiving items**
- Press F9 to force a gate resync
- If that fails, try reconnecting

**Stuck in an area**
- Check the UI to see which access items you have
- You may need to wait for another player to send you the required item

## Credits

APWorld and BepInEx mod by PixelShake92

## Links

- [Archipelago Discord](https://discord.gg/archipelago)
- [GitHub Repository](https://github.com/PixelShake92/Untitled-Goose-Game-Archipelago)
