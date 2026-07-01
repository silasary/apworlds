# Spicy Meatball Overdrive (Super Mario Odyssey) Setup Guide

## Required Software

- A modded Nintendo Switch running Super Mario Odyssey 1.0.0 (FW 21.x with Atmosphere CFW), **or** an emulator.
- A Windows PC on the same LAN as the Switch.
- Archipelago + Python 3.12 + devkitPro + devkitA64 + CMake + Ninja + hactool + your Switch's `prod.keys` (XCI cartridge dumps also need `title.keys`).

See [`docs/first-time-setup.md`](https://github.com/mdietz94/smo_archipelago/blob/main/docs/first-time-setup.md) for the full prerequisite table with install links.

## Installation

1. Download `meatballs.apworld` from the project's Releases page.
2. Drop it into your Archipelago install's `custom_worlds/` directory.
3. Open the Archipelago Launcher and click **SMO Client** in the Clients list.
4. Run `/setup` in the SMO Client command bar. The setup wizard walks you through prerequisite checks, SMO dump pick (NSP or XCI), moon/capture extraction, your PC's LAN IP, the Switch-mod compile, and the deploy to SD card (or emulator). You only need to do this once per machine (or again if your PC's LAN IP changes, or after upgrading to a new release).

## Joining a multiworld game

1. Boot SMO. The mod loads on game start and dials your PC every couple seconds until SMO Client is listening.
2. Start a **new save** before opening SMO Client. The mod talks to SMO Client as soon as the client is listening, and any moon/capture/scenario event the game fires from that moment on is a candidate to be reported.
3. Type the host/port and your slot name into the Connect bar in SMO Client and click *Connect*.

## Game troubleshooting

- If Cappy never shows the "Connected to Archipelago" speech bubble after the Cap Kingdom intro, check SMO Client's Tracker tab and the AP-server log — SMO Client isn't reaching the Switch.
- Linear kingdom order is enforced at the world-map forks: 8 Lake Kingdom moons before Wooded; 10 Snow Kingdom moons before Seaside.
- Moons appear in the kingdom they're for: SMO's in-game moon counter only shows the AP-credit balance for the kingdom you're currently in. Moons AP has sent for other kingdoms are waiting silently — fly there.
