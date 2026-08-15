# Scooby-Doo! Unmasked Archipelago Setup

## Supported game

This world supports the North American PlayStation 2 release:

- Serial: `SLUS-21091`
- Version: `1.01`
- PCSX2 game CRC: `FE0030D6`

## Install

1. Install Archipelago 0.6.7 or newer.
2. Double-click `scooby_doo_unmasked.apworld`, or copy it into Archipelago's `custom_worlds` directory.
3. Use Archipelago Options Creator to make a `Scooby-Doo! Unmasked` player YAML, or start from the YAML supplied with the `.apworld`.
4. Generate and host the multiworld normally.

The `.apworld` contains its client. No separate connector, Lua script, or executable is required.

## PCSX2

1. Use a recent PCSX2 build with PINE enabled.
2. Leave PINE on its normal port (`28011`). The client also scans ports `28012` through `28019`.
3. Start Scooby-Doo! Unmasked.
4. Open **Scooby-Doo! Unmasked Client** from the Archipelago Launcher.
5. Enter the Archipelago server address and slot name in the client.

The client waits for PCSX2, detects `SLUS-21091`, and reconnects automatically after game or emulator restarts.

Do not run another PINE memory tool against the same PCSX2 port while the Archipelago client is active.
