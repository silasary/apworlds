# Supermarket Simulator Setup Guide

## Required Software

*   **Supermarket Simulator** on [Steam](https://store.steampowered.com/app/2670630/Supermarket_Simulator/). The Archipelago mod has been tested on version **1.4.2** and newer.
*   **BepInEx 6 (Unity IL2CPP version)**. This is the modding framework required to load the Archipelago client mod into the game.
*   The **Supermarket Simulator Archipelago Client Mod**. You can download the latest release from the [GitHub Releases page](https://github.com/Lemix028/SupermarketSimulator-Archipelago/releases).

## Installation Procedures

### Setup

1.  Download the [**BepInEx 6 (Unity IL2CPP x64)**](https://github.com/BepInEx/BepInEx) (Currently Bleeding Edge Build) release.
2.  Extract the contents of the `.zip` archive directly into your main **Supermarket Simulator** installation folder (the directory containing `Supermarket Simulator.exe`).
3.  Launch the game once to allow BepInEx to generate its folder structure, then close the game.
4.  Download the latest release of the **Supermarket Simulator Archipelago Mod** from the [GitHub Releases page](https://github.com/Lemix028/SupermarketSimulator-Archipelago/releases).
5.  Copy `SupermarketSimArchipelago.dll` and the other two required dependency `.dll` files (`Archipelago.MultiClient.Net.dll` and `Newtonsoft.Json.dll`) directly into the `<GameDir>/BepInEx/plugins/` folder.
6.  You can configure your credentials by editing `<GameDir>/BepInEx/config/com.lemix028.supermarketsimulator.archipelago.cfg` in a text editor.


### Where do I get a config file?

The Player Options page on the website allows you to configure your personal options and export a config file from them. Player options page: [Supermarket Simulator Player Options Page](../player-options)

## Generating a Single-Player Game

1.  Navigate to the Player Options page, configure your options, and click the "Generate Game" button.
    *   Player Options page: [Supermarket Simulator Player Options Page](../player-settings)
2.  You will be presented with a "Seed Info" page.
3.  Click the "Create New Room" link.
4.  You will be presented with a server page, which contains the **Server Address** (IP:Port) for your room.
5.  Launch **Supermarket Simulator**.
6.  Click the **AP Server Connect** button in the main menu to open the **Archipelago Connection Details** login menu.
7.  Fill in your connection details:
    *   **Server Address**: The room's server address (e.g. `archipelago.gg:38281`). You can use **Ctrl+V** to paste this directly from your clipboard.
    *   **Slot Name**: Your exact player slot name (case-sensitive). Press **Tab** to switch focus between fields.
    *   **Password**: Room password (leave blank if none).
8.  Click **Connect & Save**. The mod will save these details to your config file and attempt connection.
    *   *Alternative*: You can still pre-configure your credentials by editing `<GameDir>/BepInEx/config/com.lemix028.supermarketsimulator.archipelago.cfg` directly in a text editor before launching the game, then click the connect button to connect immediately.
9.  Once connected, you can start playing your game immediately.

## Joining a MultiWorld Game

### Obtain your connection details

When you join a multiworld game, you will be asked to provide your config file to whoever is hosting. Once the game has been generated, the host will provide you with the **Server Address** (IP:Port), your **Slot Name**, and a **Password** (if configured).

### Connect to the server

1.  Launch **Supermarket Simulator**.
2.  Click the **AP Server Connect** button in the main menu to open the **Archipelago Connection Details** login menu.
3.  Enter the connection details provided by the host:
    *   **Server Address**: The host's server address (e.g. `archipelago.gg:38281`). (Ctrl+V paste supported!)
    *   **Slot Name**: Your exact player slot name (case-sensitive). (Tab to navigate fields!)
    *   **Password**: Room password (leave blank if none).
4.  Click **Connect & Save**. 
    *   *Alternative*: You can also fill in these details in `<GameDir>/BepInEx/config/com.lemix028.supermarketsimulator.archipelago.cfg` directly in a text editor, save, launch the game, and connect.
5.  The connection HUD in the top-left corner of the screen will confirm your status.

### Play the game

When the HUD shows you as connected, you are ready to begin playing. Congratulations on successfully joining a multiworld game!

## Hosting a MultiWorld game

The process to host a game is relatively simple:

1.  Collect config files from your players.
2.  Create a zip file containing your players' config files.
3.  Upload that zip file to the Generate page.
    *   Generate page: [WebHost Seed Generation Page](/generate)
4.  Wait a moment while the seed is generated.
5.  When the seed is generated, you will be redirected to a "Seed Info" page.
6.  Click "Create New Room". This will take you to the server page. Provide the link to this page or the connection credentials (IP:Port) to your players.
7.  Note that a link to a MultiWorld Tracker is at the top of the room page. The tracker shows the progress of all players in the game. Any observers may also be given the link to this page.
8.  Once all players have joined, they may begin playing.

