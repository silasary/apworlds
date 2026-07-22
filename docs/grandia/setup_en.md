# Grandia HD Remaster — Archipelago Setup

Live multiworld uses a **native 32-bit DLL** injected into `grandia.exe`, driven by the
**Grandia Client** from the Archipelago Launcher (same pattern as other game clients).

This is **not** a Unity game — **BepInEx will not work**.

## Requirements

- Grandia HD Remaster (Steam) on Windows
- 32-bit build of `Grandiarchipelago.dll` (see `client/README.md`)
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago) with this APWorld installed
  (`grandia.apworld` or `worlds/grandia` in a source checkout)

## Build the native DLL + .apworld

```powershell
cd client
cmake -S . -B build -A Win32
cmake --build build --config Release

# From repo root — packages worlds/grandia + the DLL into dist/grandia.apworld
python tools/build_grandia_apworld.py
# or: python tools/build_grandia_apworld.py --build-dll
```

Install `dist/grandia.apworld` into Archipelago’s worlds folder. The **Grandia Client**
loads `native/Grandiarchipelago.dll` from inside the apworld (extracting to the user
cache when needed) and injects it into `grandia.exe`.

Override with env `GRANDIA_AP_DLL` only if you need a different DLL.

## Play (recommended)

1. Open the **Archipelago Launcher** → **Grandia Client**
2. Connect with host / port / slot (or use a room link)
3. Start Grandia HD Remaster and go past the Steam menu so `grandia.exe` is running  
   — the client injects the DLL and attaches automatically
4. Load a save; after SYNC + a short delay, AP items are delivered to the stash

Client commands:

| Command | Meaning |
|---------|---------|
| `/attach` | Force re-inject / re-attach |
| `/sync` | Show SYNC / applied item index |

## Verify game bitness

In Task Manager → Details, `grandia.exe` should show **32-bit**.

## Development status

| Component | Status |
|-----------|--------|
| APWorld | Working |
| Launcher Grandia Client (`CommonClient`) | Working |
| Win32 injectable DLL | Working |
| Save SYNC / item redelivery gate | Working |
