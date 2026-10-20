# Super Hexagon Archipelago Setup Guide

## Requirements
- Windows OS (Hard required. Client is using memory reading / writing / allocation through Windows APIs)
- Super Hexagon through Steam specifically (see below for hashes)
- Archipelago 0.6.7+

**Hashes of expected Super Hexagon.exe**

```
Name: SuperHexagon.exe
CRC32: 96995E03
CRC64: 5FB5FF28B4F37E65
SHA256: 72b0c26053c37edd3435def461e9027cd6ffad12032db2fd0b32c256fdbee6b9
SHA1: 52d19762a3596f45dab112e279c2744ca532dab6
BLAKE2sp: 9c2989cdfca5eeccda5651ef1a67ad073662917db0cb6bfd9cc2da7b168b6e6d
```

## Game Setup Instructions
There is no mod or specific patch for Super Hexagon. The client handles all of the patching and modding.

**IMPORTANT**

Once the Archipelago client is connected, hooks and patches will be set up in the game's memory. _**If the client is ever closed, Super Hexagon will NEED to be restarted before connecting another client**_ for everything to function as expected. If you don't restart the game, the previous hooks and patches will remain installed with no way for the new client to detect and use them.

## Joining a Multiworld Game
- Open Super Hexagon and wait at the main menu.
- Open the Archipelago Launcher. Find and click _Super Hexagon Client_
- Using the _Super Hexagon Client_:
  - Enter the room's hostname and port number (e.g. archipelago.gg:54321) in the top box and click Connect
  - Input your player name at the bottom when prompted and press Enter
  - You should now be connected to the Archipelago room
  - After a few seconds, you should see a message in the client that says `Super Hexagon Connected`, and the game should say "Connected to Archipelago" in the main menu.
  - You are now ready to play Super Hexagon with Archipelago. You can use the Tracker tab to see what checks you need to complete. Levels locks are handled fully in game.

## Continuing a Multiworld Game
- Perform the same steps as above

## NOTE
- You may see your best times removed and replaced with 0s. This is purely visual as a way to help track your progress on levels, and your best times remain saved in your game save data as normal (however, if you get a new highest time, this will save to your save file.)