# League of Legends Archipelago Setup

## Required Software

- League of Legends
- [Archipelago](https://github.com/kbab13reel/Archipelago/releases)
- A generated Archipelago multiworld, provided by the host

## Install the League World and Connector

1. Download the latest League of Legends release from the [Archipelago releases page](https://github.com/kbab13reel/Archipelago/releases).
2. Download `lol.apworld` and `Connector.exe` from the release.
3. Double-click `lol.apworld` to install it, or place it in your Archipelago `custom_worlds` folder.
4. Keep `Connector.exe` somewhere convenient. You will run it after connecting the Archipelago client.

## Create Your Player Settings

1. Run `ArchipelagoLauncher.exe`.
2. Click **Generate Template Settings**. This opens the templates folder.
3. Copy `League of Legends.yaml` into the `Players` folder in your Archipelago installation. Create the folder if it does not exist.
4. Open the YAML file and change `name: Player{number}` to your desired player name.
5. Adjust any other settings to your liking.
6. Run `ArchipelagoGenerate.exe`.

The generated multiworld archive is written to the `output` folder as an `AP_XXX.zip` file. The host should upload this file to the [Archipelago upload page](https://archipelago.gg/uploads) and provide you with the server address and your slot name.

## Connect and Play

1. Run `ArchipelagoLauncher.exe` again.
2. Search for and launch **LoL Client**.
3. Connect to the Archipelago server and enter your slot name and password, if required.
4. Run `Connector.exe`.
5. Start League of Legends and enter a match.
6. In the Connector window, click **Check for Match**.
7. Play!
