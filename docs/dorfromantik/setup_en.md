# Dorfromantik Setup Guide

## Required Software

- Dorfromantik on Steam
- [BepInEx 5.4.23.x (x64)](https://github.com/BepInEx/BepInEx/releases)
- The Dorfromantik Archipelago mod
- An `unstripped_corlib` folder (bundled with the mod)

## Installing BepInEx

Dorfromantik ships a **stripped** `mscorlib.dll`, and BepInEx will crash the game at
startup without a full one — with no log file, which makes it look like BepInEx simply
never installed. The mod download includes an `unstripped_corlib` folder to fix this.

1. Extract BepInEx into the Dorfromantik install folder, next to `Dorfromantik.exe`.
2. Copy the `unstripped_corlib` folder into that same folder.
3. Open `doorstop_config.ini` and, under `[UnityMono]`, set:

   ```
   dll_search_path_override = unstripped_corlib
   ```

4. Run the game once. `BepInEx/config` should appear. If it does not, BepInEx did not
   load — check step 3.

## Installing the mod

Place the mod DLL in `BepInEx/plugins/DorfromantikAP/`, then launch the game once to
generate `BepInEx/config/io.github.dorfromantik.archipelago.cfg`.

## Connecting

Set `ApModeEnabled = true` in that config file, along with your slot name and the server
address.

Archipelago runs use their own save folder (`Archipelago/<slot>/` inside the game's save
directory), so your vanilla saves, rewards and challenge progress are never touched.

## Playing

Start runs from **Your Games → New Game**, in Classic mode. Your stack will contain exactly
the tiles Archipelago has given you. When it runs out, the run ends — start another. Flags
you complete are sent as checks, and your totals carry across runs.

The **Resume** button is disabled in AP mode. The main menu runs a live game behind itself
as its backdrop, and that one is dealt before Archipelago answers, so resuming it would
give you a stand-in deck instead of your real inventory.
