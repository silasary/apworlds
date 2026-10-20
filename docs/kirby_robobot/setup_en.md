# Kirby: Planet Robobot Setup Guide

This plays like the A Link Between Worlds integration: install the apworld, get
a patch from your host, open it, and the client builds your playable game from
**your own ROM** automatically.

## What you need

- Archipelago 0.5.0+  (https://github.com/ArchipelagoMW/Archipelago/releases)
- `kirby_robobot.apworld` (this integration)
- The **.NET 8 runtime** (https://dotnet.microsoft.com/download) — only needed
  to run the bundled patch tool. A maintainer can instead ship a native
  `kpr_patch.exe` so this isn't required (see "Windows notes").
- `ctrtool` on your PATH or set in host.yaml (extracts your ROM).
  https://github.com/3DSGuy/Project_CTR/releases
- Your own **decrypted, North American** Kirby: Planet Robobot ROM as `.cci` or
  `.3ds` (identical; you can rename one to the other). Dump it yourself with the
  "decrypt" option.
- **Azahar** (emulator) or a **modded 3DS** (Luma3DS).

> No game data is ever shipped. Everything is built from your own ROM.

## One-time setup

1. Launcher -> **Browse Files**, drop `kirby_robobot.apworld` into
   `custom_worlds/` (or double-click it).
2. Emulator only — Azahar: **File > Open Azahar Folder**, create `load/mods/`;
   **Emulation > Configure > Debug** -> enable **RPC Server**.
3. (Optional) If you want the patcher to install the mod for you automatically,
   Launcher -> **Open host.yaml**, and under `kirby_robobot_options` set
   `mod_path` to your `"<Azahar folder>/load/mods"` (emulator) or
   `"<SD card>/luma/titles"` (3DS). You can also set `ctrtool_path` here if
   ctrtool isn't on your PATH.

You do **not** need to set the ROM path here — the client asks for it the first
time you open a patch and saves it to host.yaml for you (see below).

## Creating a game (host)

1. Launcher -> **Generate Template Options**, edit `Kirby Planet Robobot.yaml`
   (player name, goal, which sub-games), put it in `Players/`.
2. **Generate**. A `.zip` with your `.apkr` appears in `output/`.

## Playing (the one-click part)

1. Get the `.apkr` from your host.
2. **Drag the `.apkr` onto the Archipelago Launcher** (or **Open Patch**).
3. **The first time only**, you're prompted for your `.cci`/`.3ds` ROM; the path
   is saved in host.yaml so you're never asked again. The client then extracts
   romfs, patches it, injects the AP bridge, and writes a `00040000001BB800`
   LayeredFS folder plus a `.zip` next to your patch (~20s). If you set
   `mod_path` during setup, the folder is installed for you and you can skip
   step 4.
4. Install the folder:
   - Azahar: put `00040000001BB800` in `load/mods/`.
   - 3DS: put `00040000001BB800` in `/luma/titles/` on your SD card.
5. Launch the game, then in the client enter the server + slot name and
   **Connect**. If it can't find the game: `/emu 127.0.0.1:45987`.

## How it plays

- Collecting a Code Cube, Sticker, or Rare Sticker sends a check; boss/stage
  clears and enabled sub-game rounds do too.
- Received items are applied in-game (abilities, armor, level access, EX keys,
  cubes, stickers, and 1-Up/Food/Maxim Tomato filler). **Items you receive
  never count as your own checks.**
- Play with the language set to **English**.

## Windows notes

The bundled `kpr_patch.dll` is platform-agnostic and runs on Windows via the
.NET 8 runtime — no extra steps beyond installing that runtime. To avoid
installing .NET at all, build a standalone `kpr_patch.exe` from the
`kpr_patch_tool.zip` in the release with one command:

    build_kpr_patch_windows.bat      (needs the .NET 8 SDK once)

Then drop the resulting `kpr_patch.exe` into the apworld `tools/` folder.
