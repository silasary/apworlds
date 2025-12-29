# Corn Kidz 64 Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- [This AP world](https://github.com/Cyb3RGER/cornkidz64_apworld/releases/latest)
- [BepInEx 5.4+](https://github.com/BepInEx/BepInEx/releases/latest)
  - Make sure to download the x64 version.
- [This Game Mod](https://github.com/Cyb3RGER/CornKidzAP/releases/latest)

## Installation Procedures

### Installing the apworld

To install the ``cornkidz64.apworld``:

- **Option 1:** Double-click the ``cornkidz64.apworld`` file, or
- **Option 2:** Manually place the ``cornkidz64.apworld`` file in the ``custom_worlds`` folder of your AP installation.

For more information about .apworld files, refer to the [APWorld Specification](https://github.com/ArchipelagoMW/Archipelago/blob/main/docs/apworld%20specification.md).

### Installing the Game Mod

- Navigate to the games installation folder.
    - In Steam, you can right-click the title and select ``Manage -> Browse local files``.
- Extract the content of the BepInEx zip into the game's folder
- Launch the game and exit again.
- Navigate to ``BepInEx\plugins`` in the game's folder.
- Extract the ``CornKidzAP`` folder form game mod zip into the ``plugins`` folder.

**If using Linux,** add ``WINEDLLOVERRIDES="winhttp=n,b" %command%`` to your launch arguments on Steam. To add launch arguments, you can right-click the title and select ``Manage -> Properties`` and add it under ``Launch Options``.

## Create a Config (.yaml) File

### What is a config file and why do I need one?

See the guide on setting up a basic YAML at the Archipelago setup
guide: [Basic Multiworld Setup Guide](https://archipelago.gg/tutorial/Archipelago/setup/en)

### Where do I get a config file?

Open the Archipelago Launcher and click ``Generate Template Options`` with the apworld installed. This will create default options for all installed apworlds. Look for ``Corn Kidz 64.yaml`` — this is your example yaml file.

### Verifying your config file

If you would like to validate your config file to make sure it works, you may do so on the YAML Validator page. YAML
validator page: [YAML Validation page](https://archipelago.gg/mysterycheck)

## Joining a MultiWorld Game

After the game's launch screen, an Archipelago UI will appear in the top left corner. To connect, enter the following:

1. Server's host address and port in the usual format (e.g., ``archipelago.gg:38281``)
2. Your slot name
3. Password (optional)

Then, click ``Connect``.

## Hosting a MultiWorld game

The recommended way to host a game is to use the Archipelago hosting service. The process is relatively simple:

1. Collect config files from your players.
2. Place the config files in the ``Players`` folder in your Archipelago install
3. Run ``ArchipelagoGenerate.exe`` and location the resulting zip in the ``output`` folder
4. Upload that zip file to the Host Game page.
    - Generate page: [WebHost Host Game Page](https://archipelago.gg/uploads)
5. Click "Create New Room". This will take you to the server page. Provide the link to this page to your players, so
   they may download their patch files from there.
6. Note that a link to a MultiWorld Tracker is at the top of the room page. The tracker shows the progress of all
   players in the game. Any observers may also be given the link to this page.
7. Once all players have joined, you may begin playing.

## Troubleshooting

ToDo?
