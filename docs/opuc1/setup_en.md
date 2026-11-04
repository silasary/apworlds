# One Piece Unlimited Cruise 1 - Setup

## Requirements

- Archipelago 0.6.0 or newer
- Dolphin
- One Piece Unlimited Cruise Part 1, **European (PAL) version, game ID `ROUPAF`**, unmodified. Any disc format
  works (ISO, WBFS, RVZ, ...). The US and Japanese versions are not supported.
- The `dolphin-memory-engine` Python package (see below)
- Optional: Universal Tracker. The client uses it automatically when it is installed.

## Installing

1. Double-click `opuc1.apworld`, or put it in Archipelago's `custom_worlds` folder.
2. If the client says dolphin-memory-engine is missing, install it into the Python that runs Archipelago:
   `pip install dolphin-memory-engine`.

## Playing

1. Generate a game with a YAML for "One Piece Unlimited Cruise 1" (template: `OPUC1.yaml`).
2. In Dolphin, turn **cheats off** (Config > General > Enable Cheats). The client needs that memory.
3. Start the game and stay **at the title screen**.
4. Open "One Piece Unlimited Cruise 1 Client" from the Archipelago Launcher and connect to the server.
   Several game patches only work when they go in before the game first uses that code, so connect before
   loading a save. If a save was already loaded when the client connected, the client sends no checks and gives
   no items for it: reset to the title screen and load the save again.
5. Start a new game (or load a save from this seed). Keep the client open while playing. A save from another
   seed, or one never played with the client, is ignored (no checks sent, no items given).

The client's "Armed Items" tab lists received items it is still holding back, and why (for example the Pickaxe
until you reach the Thousand Sunny, or items waiting for room in your bag).
