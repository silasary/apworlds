# DOOM Eternal Randomizer Setup Guide

## Required software

- A legally obtained, player-supplied installation of DOOM Eternal. Game files are not distributed by this project.
- The host needs [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest) with the matching
  `doometernal.apworld` installed. Players use the standalone DOOM Eternal launcher instead of Archipelago Launcher.
- The matching DOOM Eternal Archipelago beta bundle.
- On Windows, [EternalModManager](https://github.com/brunoanc/EternalModManager).
- On Linux, [EternalModInjectorShell](https://github.com/leveste/EternalBasher).

The launcher asks before acquiring pinned external tools. Downloads are verified before installation. You may select an
existing local copy instead. Meathook, mod managers, injectors, and third-party scripts are not bundled in this release.

## Host setup and player connection

1. The host installs `doometernal.apworld`, generates the room, and starts an Archipelago server normally.
2. Each DOOM Eternal player extracts the matching beta bundle and opens
   `DoomEternalArchipelagoLauncher.exe` on Windows or `DoomEternalArchipelagoLauncher` on Linux.
3. Confirm the detected game and save directories, then enter the room address, slot name, and password if required.
4. Press **Connect**. Setup starts only after the server sends `Connected`; the authoritative room snapshot selects the
   Dash variant and active locations.
5. Wait for the launcher to build and stage the slot-specific mod and prepare the platform adapter.

The APWorld does not register a game client in Archipelago Launcher. One standalone launcher owns one headless bridge
worker for its profile. The launcher never starts DOOM Eternal and has no game-launch button. Open the game yourself
through Steam when setup is ready. **Disconnect / Stop** or closing the launcher stops its worker.

## Windows installation

1. Select the DOOM Eternal directory containing `DOOMEternalx64vk.exe`.
2. Consent to installing pinned EternalModManager, or select a verified local copy.
3. The launcher places the generated mod ZIP in the game's `Mods` directory and opens EternalModManager.
4. Select the mod and press **Run Injector** in EternalModManager.
5. Return to the launcher and choose **Yes, finish** only after the manager reports success. Then start DOOM Eternal
   through Steam.

EternalModManager 4.2.3 does not expose a stable public command-line injector. The launcher therefore reports
`manual_action_required` and never claims that injection succeeded based only on opening the manager.

## Linux and Steam/Proton installation

1. Select the Steam library containing DOOM Eternal (Steam App ID `782330`) if discovery is ambiguous.
2. Consent to installing pinned EternalModInjectorShell, or select a verified local copy.
3. The launcher runs EternalModInjectorShell automatically, shows its result in **Technical details**, and never
   launches the game itself.
4. Keep DOOM Eternal configured to use its existing Steam compatibility tool. Do not start
   `DOOMEternalx64vk.exe` directly with Wine.

DOOM Eternal needs the launch option shown by the standalone launcher. It includes the packaged `run_bridge.sh`, client
delay, Meathook DLL override, `%command%`, and any existing arguments. Example shape:

```text
WINEDLLOVERRIDES="XINPUT1_3=n,b" AP_CLIENT_DELAY=5 '/path/to/client/run_bridge.sh' %command%
```

The launcher preserves existing arguments, merges an existing `WINEDLLOVERRIDES`, and keeps `%command%` plus arguments
after it. It displays the proposed value but never edits Steam configuration. Use **Copy**, paste the value into
**DOOM Eternal → Properties → Launch Options**, then start the game through Steam so its configured Proton prefix and
version remain in effect.

## Troubleshooting

- **Launcher does not start:** extract the complete matching bundle; do not move only the executable away from its
  `client` files.
- **Dependency verification failed:** do not run the file; retry or select an official local artifact with the expected
  version and SHA-256.
- **Steam option not changed:** expected; the launcher is display-only. Use **Copy** and paste it into Steam manually.
- **Bridge does not connect to the game:** confirm one bridge is running, the mod was injected, and the Steam launch
  option contains the required `XINPUT1_3` override.
