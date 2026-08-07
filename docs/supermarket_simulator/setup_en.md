# Supermarket Simulator Setup Guide

## Required Software

* **Supermarket Simulator** on [Steam](https://store.steampowered.com/app/2670630/Supermarket_Simulator/). Tested on version **1.5.3**.
* **BepInEx 6 (Unity IL2CPP x64 version)**. Modding framework required to load the client mod into the game. Confirmed working version: **BepInEx 6.0.0-be.785-6abdba4** (Unity IL2CPP for Windows x64).
* **Supermarket Simulator Archipelago Client Mod & APWorld**. Available from the [GitHub Releases page](https://github.com/Lemix028/SupermarketSimulator-Archipelago/releases).

## Installation

### 1. Install BepInEx 6
1. Download **BepInEx 6 (Unity IL2CPP for Windows x64)** from the [official repository](https://github.com/BepInEx/BepInEx). Currently, the **IL2CPP** version is only available through the [Bleeding Edge Releases](https://builds.bepinex.dev/projects/bepinex_be). Not the **Mono** version! 
2. Extract all files from the BepInEx `.zip` archive directly into your main **Supermarket Simulator** game folder (where `Supermarket Simulator.exe` is located).

### 2. Install the Mod and APWorld
1. Download the latest release from the [GitHub Releases page](https://github.com/Lemix028/SupermarketSimulator-Archipelago/releases). Both the client mod (SupermarketArchipelago_Client_vX.X.X.zip ) and the Archipelago world package (.apworld) are available there.
2. Open your game's directory and navigate to `BepInEx/plugins/`. (If the folder doesn't exist, run the game once to let BepInEx generate it, or create it manually).
3. Extract `SupermarketSimArchipelago.dll` and its required dependency `.dll` files into the `plugins/` folder.
4. Place the downloaded `.apworld` file in your Archipelago custom worlds directory: `C:\ProgramData\Archipelago\custom_worlds`

---

## Connection & Setup

You can set up your Archipelago connection credentials directly in-game or via the configuration file.

### 1. Connecting In-Game (Recommended)
1. Launch **Supermarket Simulator**.
2. Click the **AP Server Connect** button in the main menu to open the connection details window.
3. Enter your connection details:
   * **Server Address**: The address of your Archipelago server (e.g., `archipelago.gg:38281`). You can use **Ctrl+V** to paste directly from your clipboard.
   * **Slot Name**: Your player slot name as configured in your YAML.
   * **Password**: The password for the room (leave blank if none).
4. Click **Connect & Save**. The credentials will be saved automatically, and the mod will attempt to connect.
5. Once connected, your status and goal progress will be displayed in the **Connection HUD** in the top-left corner of the screen. You can now load your save game or start a new one!

### 2. Alternative: Editing the Config File
If you prefer, you can pre-configure your credentials before launching the game:
1. Launch the game once so BepInEx can generate the config file, then close the game.
2. Open `<GameDir>/BepInEx/config/com.lemix028.supermarketsimulator.archipelago.cfg` in a text editor.
3. Fill in your server details:
   ```ini
   [Archipelago]
   ServerAddress = archipelago.gg:38281
   SlotName = PlayerName
   Password = 
   ```
4. Save the file and start the game. Click **AP Server Connect** in the Main Menu to open the login UI with these details pre-filled, then click **Connect** to establish the connection.
    
---

## Creating & Configuring Your YAML File

1. Ensure `supermarket_simulator.apworld` is placed in your `custom_worlds/` folder.
2. Open the **Archipelago Launcher** and click **Generate Templates Options** to create the default `Supermarket Simulator.yaml` template in your `Players/templates/` directory (or copy the template included with the release).
3. Open the `.yaml` file in a text editor to configure your desired settings (e.g. victory goal, customer checkout locations/chance, price randomization, DLC options, multipliers).
4. Save your finished `.yaml` file into the Archipelago `Players/` folder.

---

## Generating a Game (Single-Player or MultiWorld)

1. Place `supermarket_simulator.apworld` into your Archipelago `custom_worlds/` directory (located in `C:\ProgramData\Archipelago\custom_worlds` or your local Archipelago installation folder).
2. Place all participating player configuration files (`.yaml`) into the Archipelago `Players/` directory.
3. Open the **Archipelago Launcher** and click **Generate** (or run `ArchipelagoGenerate.exe`).
4. Once generation completes, an output `.zip` file (e.g. `AP_12345.zip`) will be created in your `output/` folder.

---

## Hosting

You can host your generated `.zip` file using either the Archipelago Website or a Local Server:

### Option A: Hosting via Archipelago Website (Recommended)
1. Go to the [Archipelago Seed Upload Page](https://archipelago.gg/uploads) on the website.
2. Upload your generated `.zip` file (e.g. `AP_12345.zip`).
3. Click **Create Room** to generate your online multiworld room.
4. Copy the room's **Server Address** (IP:Port) from the room page.

### Option B: Hosting Locally
1. Open the **Archipelago Launcher** and select **Host Server** and select your `AP_12345.zip`.
2. Use your local/server IP address and Port.


