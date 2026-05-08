# Running with Rifles — Archipelago Setup Guide

## Required Software

- Running with Rifles (Steam version)
- Archipelago (v0.6.4 or later)

## Installation

### 1. Install the APWorld

1. Download `rwr.apworld` from the releases page.
2. Place it in your Archipelago `custom_worlds/` directory
   (usually `%APPDATA%/Archipelago/custom_worlds/`).
3. Restart Archipelago — "RWR Client" should appear in the Launcher.

### 2. Install the RWR Mod

1. Download `rwr_archipelago_mod.zip` from the releases page.
2. Extract it into your RWR installation:
   `Steam/steamapps/common/RunningWithRifles/media/packages/`
   You should have a `rwr_archipelago/` folder with `package_config.xml` and `scripts/` inside.
3. Launch RWR and select the "RWR Archipelago" mod from the package selector.

### 3. Configure your YAML

1. Generate a template YAML from the Archipelago website or launcher.
2. Edit the options to your preference (goal, side missions, trap chance, etc.).
3. Submit your YAML to the host for seed generation.

### 4. Connect to the Multiworld

1. Generate the seed with the host.
2. In the Archipelago Launcher, click **"RWR Client"**.
3. In the client window, connect to the server:
   ```
   /connect <host:port>
   ```
   Then authenticate with your slot name when prompted.
4. Launch RWR with the Archipelago mod selected.
5. The client will synchronize items and locations between the game and the server.

## Troubleshooting

- **Client can't connect**: Make sure the server address and port are correct. Check firewall settings.
- **Items not appearing in-game**: Ensure the mod is loaded (check the package selector). Verify the
  client is running and connected.
- **Game crashes on map load**: Verify mod files are not corrupted. Try redownloading.
- **"RWR Client" not in Launcher**: Make sure the `.apworld` file is in `custom_worlds/` and restart Archipelago.

## Further Help

Join the Archipelago Discord and ask in `#tech-support` or `#ap-world-dev`.
