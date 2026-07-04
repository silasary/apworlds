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

## Playing Co-op (2 players, shared slot)

Two players can share a single AP slot by playing on the same RWR campaign.

1. Both players install the mod (same version).
2. The host goes through the normal setup (connect the AP client, launch RWR with the mod).
3. The guest joins the host's RWR server via **Multiplayer → LAN Browser** or **by IP** (host must
   port-forward UDP `4001–4002`, or invite via Steam Friends).
4. Only the host runs the AP Python client — the guest just plays.

Checks from either player count. Items (rank, weapons, radio calls) apply to both. Death Link
affects both. When the guest joins mid-campaign, their character is forced to the current AP rank.

If the host disconnects, the RWR server ends (no host migration). Just relaunch to resume — the AP
progress is saved.

## Troubleshooting

- **Client can't connect**: Make sure the server address and port are correct. Check firewall settings.
- **Items not appearing in-game**: Ensure the mod is loaded (check the package selector). Verify the
  client is running and connected.
- **Game crashes on map load**: Verify mod files are not corrupted. Try redownloading.
- **"RWR Client" not in Launcher**: Make sure the `.apworld` file is in `custom_worlds/` and restart Archipelago.

## Further Help

Join the Archipelago Discord and ask in `#tech-support` or `#ap-world-dev`.
