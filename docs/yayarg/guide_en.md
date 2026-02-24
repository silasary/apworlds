# YARG Archipelago Randomizer Setup Guide

## Required Software

- **[Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)**
    - Only required if you are hosting the seed or playing solo.
- **[YARG](https://yarg.in/)**
    - Available via the **[YARC Launcher](https://github.com/YARC-Official/YARC-Launcher/releases/latest)**.
- **[BepInEx 5](https://github.com/BepInEx/BepInEx/releases)**
    - Use the latest version of `BepInEx 5.x.x`, **not** `BepInEx 6.x.x`.
- **[The YARG Archipelago Plugin](https://github.com/Thedrummonger/YargArchipelagoPluginV2/releases/latest)**
- **[The YARG AP YAML Creator](https://github.com/Thedrummonger/YargArchipelagoPluginV2/releases/latest)**
- **[The YARG APWorld](https://github.com/Thedrummonger/YargArchipelagoPluginV2/releases/latest)**

## Installation

### Setup

1. **Install [Archipelago](https://archipelago.gg/tutorial/Archipelago/setup_en) and the YARG APWorld**
    - Unless you are generating the seed, this is not required. The Archipelago program itself is not required to connect YARG to an AP server.

2. **Install YARG**
    - Download and install the **[YARC Launcher](https://github.com/YARC-Official/YARC-Launcher/releases/latest)** and use it to install **YARG**. You can also download a portable build directly from the [YARG releases](https://github.com/YARC-Official/YARG/releases/latest).
    - Both **nightly** and **stable** versions are supported; just be sure to use the corresponding plugin.
        - **Note:** Nightly updates frequently and requires reinstalling BepInEx and the AP plugin after each update.
    - It is recommended to create a separate installation of **YARG** specifically for **Archipelago**. This can be done through the YARC Launcher or by using a portable YARG build.

3. **Install BepInEx 5**
    - Download the latest version of `BepInEx 5` for your OS and follow the [installation instructions](https://docs.bepinex.dev/articles/user_guide/installation/index.html).
    - Run the game with BepInEx installed at least once so the required folders are generated.

4. **Install the YARG Archipelago Plugin**
    - Go to your YARG installation folder.
    - Open the `YargAPPlugin.zip` file downloaded from GitHub.
    - Move `YargArchipelagoPlugin.dll` and `Archipelago.MultiClient.Net.dll` into the `BepInEx\plugins` directory.

5. **Launch YARG & Import Songs**
    - Open YARG and import the songs you want included in your seed.
        - It is recommended to create a separate folder containing only the songs you want in your seed and set it as your only active song folder in YARG.
    - Navigate to **Settings → Songs** and select **Scan Songs** at least once after updating your song directory.
    - Make sure you have scanned your songs at least once *before* opening the YAML Creator.

6. **Generate Your YAML File**
    - See **Create a Config (.yaml) File** below. This is **not** the normal Archipelago setup process.

7. **Launch YARG and Connect**
    - Once YARG is running with the plugin loaded, a connection window will be available.
    - This window can be opened or closed at any time using **F10**.

## Create a Config (.yaml) File

> **Important:** READ THIS!!! This is **not** the usual Archipelago setup process!

### What is a config file and why do I need one?

See the Archipelago guide on setting up a basic YAML file:  
[Basic Multiworld Setup Guide](/tutorial/Archipelago/setup/en)

### Where do I get a config file?

Unlike most Archipelago games, you **do not manually create** a YAML file for YARG.

Instead, you must use the **included YAML Creator application** to generate your config file.

This is required because the YARG APWorld generates a **unique hash** based on the songs you currently have installed in YARG. That hash is used to build a **custom location list** for your seed. Without it, the generator has no way to know which songs exist in your library.

### Manually Creating a YAML File

It is possible to manually create or edit a YARG Archipelago YAML file if you are comfortable doing so. However, the **song list hash** required by the YARG APWorld **must still be generated using the YAML Creator**. There is no other supported way to create this hash.

To generate the song list hash manually:
1. Open the **YARG AP YAML Creator**.
2. Click **Export** and select **“Export Song List Hash to Text File”**.
3. Open the generated text file, copy the hash string, and paste it into your YAML file.

As long as the song list hash is valid, the rest of the YAML may be edited by hand. Without this hash, the seed cannot be generated.

Additionally, any YAML option that references a specific song directly must use that song’s **individual song hash**, not its name. These hashes can also be obtained using the YAML Creator. In the **Active Songs** tab, select a song from the list and click **“Copy Hash to Clipboard”**, then paste that value into your YAML file.


## What is a Song Pool?

Song pools are the system this YARG Archipelago implementation uses to decide **which songs are included in your seed**.

Each song pool defines a set of restrictions (instrument, difficulty range, clear requirements, etc.) and then adds a **specific number of songs** that match those rules to the seed. Your final song list is created by combining the results of *all* enabled song pools.

For example, you could create:
- A **Guitar** song pool that adds **20 songs** with difficulties between **3–5**
- A **Drums** song pool that adds **20 songs** with difficulties between **1–4**

Each song pool operates independently, allowing you to freely mix and match instruments and difficulty ranges.

You can also create **multiple song pools for the same instrument**. For example:
- A Guitar pool with difficulties **1–4** that requires a **Full Combo** to complete the check
- Another Guitar pool with difficulties **4–6** that only requires **4 stars** for the main check and **3 stars** for the extra check

This makes it possible to design very specific progression rules. Easier songs can demand high accuracy, while harder songs can allow more room for mistakes.

### Adding a Song Pool
1. **Instrument** – Select the required instrument for this pool.
2. **Name** – Choose a unique name (displayed alongside each song in the list).

### Configuring a Song Pool
- **Amount in Pool** – The total number of songs in this pool.
- **Random Variance** – Randomizes the pool size by selecting a value between `amount in pool − variance` and `amount in pool + variance`
- **Song Selection**
    - **Min Difficulty** – Only songs **at or above** this difficulty for the selected instrument are included.
    - **Max Difficulty** – Only songs **at or below** this difficulty for the selected instrument are included.
- **Song Requirements**
    - **Min Score** – The minimum score (stars) required to pass the check.
    - **Min Difficulty** – The minimum difficulty you must play the song at to complete the check.
    - **Reward 1 / Reward 2** – Reward 1 specifies the difficulty for the first location check attached to the song. Reward 2 specifies the second location check, if applicable.

## Joining a MultiWorld Game

### Connecting to the AP Server

1. Open YARG with the BepInEx plugins installed and connect to the Archipelago server using the **F10** menu.
2. Your available songs will be displayed in a custom header in the music library.

## Linux Support

While I do not currently have a non-`.exe` version of the YARG AP YAML Creator, it is fully usable on **Linux** and works **out of the box through Wine**. The application was designed with Wine compatibility in mind. Since I use **Linux** as my main operating system, I run the YAML Creator through a Wine prefix manager called **Bottles** during regular development and testing.

When run on Linux, the YAML Creator will automatically detect your **native Linux YARG AP configuration directory** (`~/.config/yarchipelago`) instead of defaulting to the Windows-style configuration path used under Wine (`%APPDATA%/YARChipelago`).

YARG itself is of course fully compatible with Linux, being a Unity application, and the Archipelago plugin runs without issue on the Linux version of BepinEX.


