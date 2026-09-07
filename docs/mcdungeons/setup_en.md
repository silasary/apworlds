# Minecraft Dungeons Setup Guide

## Required Software

- Minecraft Dungeons (Microsoft store/Minecraft launcher or the Steam version), DLC are optionnal.

- Python 3.11 or newer, if you don't already have it:
    [Python.org](https://www.python.org/downloads/).

- The Archipelago launcher (minimum version 0.6.4).

- The following Python packages: `pymem`, `websocket-client`, `pywin32`. These aren't part of the base Archipelago.
 [Some other world may use memory-reading or named pipes.] Install them by running:

  ```
  pip install pymem websocket-client pywin32
  ```

## Setting Up the Client

Put the `mcdungeons.apworld` into your Archipelago `custom_worlds/` folder. Or, run it, it should appear in the `custom_worlds/` folder. There's is no mods needed. There is a client and it's inside the `.apworld` and the Launcher picks it up automatically.

## Connecting to a Game

1. Launch Minecraft Dungeons and create a new character.
2. Open the Archipelago Launcher. You should see **"Minecraft Dungeons Client"** appears open it.
3. This opens a client window type your server address and slot name in there.

After that, the client injects `dungeons_bridge.dll` into the  game on its own to detect chests, boss kills,
and mission completion. If Windows Defender or another
antivirus flags this, add an exclusion for the client's folder. This uses injection to work so it gets flagged falsly rather than for an actual problem.

If Minecraft Dungeons isn't running yet when you start the client, it will keep retrying in the background.

If you restart Minecraft Dungeons, just reconnect the client it will re-injects automatically (injecting twice is safe).

## Notes

- This client does not support linux, since it reads the running game's memory directly.
- Progress for each seed is stored separately, so switching between multiple seeds/rooms on the same machine won't
  lose or mix up progress between them.
