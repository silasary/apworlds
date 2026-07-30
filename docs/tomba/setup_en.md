# Tomba! Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases).

- The APWorld for Tomba!: [T4g1/ArchipelagoTomba](https://github.com/T4g1/ArchipelagoTomba/releases)

- RetroArch from: [RetroArch](https://retroarch.com?page=platforms) 1.10.3 or newer.

- Your legally obtained Tomba! ROM file, probably named `Tomba! (USA).bin`
The Archipelago community cannot supply you with this.

## Installation Procedures

1. Download and install [Archipelago](<https://github.com/ArchipelagoMW/Archipelago/releases/latest>). **The installer file is located in the assets section at the bottom of the version information.**
2. Put the *.apworld in the custom_games of your instalation

## Create a Config (.yaml) File

### What is a config file and why do I need one?

See the guide on setting up a basic YAML at the Archipelago setup
guide: [Basic Multiworld Setup Guide](/tutorial/Archipelago/setup/en)

### Where do I get a config file?

You can start the Archipelago Launcher and select Options Creator in the menu

### Verifying your config file

If you would like to validate your config file to make sure it works, you may do so on the YAML Validator page. YAML
validator page: [YAML Validation page](/mysterycheck)

## Generating a Single-Player Game

1. Navigate to the Player Options page, configure your options, and click the "Generate Game" button.
    - Player Options page: [Final Fantasy Mystic Quest Player Options Page](/games/Final%20Fantasy%20Mystic%20Quest/player-options)
2. You will be presented with a "Seed Info" page.
3. Click the "Create New Room" link.
4. You will be presented with a server page, from which you can download your `.apmq` patch file.
5. Go to the [FFMQR website](https://ap.ffmqrando.net/Archipelago) and select your Final Fantasy Mystic Quest ROM
and the .apmq file you received, choose optional preferences, and click `Generate` to get your patched ROM.
7. Since this is a single-player game, you will no longer need the client, so feel free to close it.

## Joining a MultiWorld Game

### Start the client

When you join a multiworld game, you will be asked to provide your config file to whoever is hosting. Once that is done,
the host will provide you with an URL to connect to the game.

Start the Archipelago Launcher and select the Tomba! client then connect to the URL provided earlier.

### Connect to the client

#### RetroArch 1.10.3 or newer

You only have to do these steps once. Note, RetroArch 1.9.x will not work as it is older than 1.10.3.

1. Enter the RetroArch main menu screen.
2. Go to Settings --> User Interface. Set "Show Advanced Settings" to ON.
3. Go to Settings --> Network. Set "Network Commands" to ON. (It is found below Request Device 16.) Leave the default
   Network Command Port at 55355. \
   ![Screenshot of Network Commands setting](../../generic/docs/retroarch-network-commands-en.png)
4. Go to Main Menu --> Online Updater --> Core Downloader. Scroll down and select "Sony - PlayStation (Beetle PSX HW)".

#### Start the ROM

You can select the core you downloaded earlier and then, start the ROM for Tomba!. You should not start a new game until the client is fully connected in the steps below

### Connect to the Archipelago Server

The archipelago client serves as the interface between your emulator and the server. Since you launched it manually, you need to tell it what server to connect to. 
If the server is hosted on Archipelago.gg, get the port the server hosts your game on at the top of the game room (last line before the worlds are listed).
In the client, either type `/connect address` (where `address` is the address of the server, for example `/connect archipelago.gg:12345`), or type the address and port on the "Server" input field, then press `Connect`.
If the server is hosted locally, simply ask the host for the address of the server, and copy/paste it into the "Server" input field then press `Connect`.

The client will attempt to reconnect to the new server address, and should momentarily show "Server Status: Connected".

### Play the game

When the client shows both emulator and Server as connected, you're ready to begin playing. Congratulations on
successfully joining a multiworld game!

## Hosting a MultiWorld game

The recommended way to host a game is to use our hosting service. The process is relatively simple:

1. Collect config files from your players.
2. Create a zip file containing your players' config files.
3. Upload that zip file to the Generate page above.
    - Generate page: [WebHost Seed Generation Page](/generate)
4. Wait a moment while the seed is generated.
5. When the seed is generated, you will be redirected to a "Seed Info" page.
6. Click "Create New Room". This will take you to the server page. Provide the link to this page to your players, so
   they may download their patch files from there.
7. Note that a link to a MultiWorld Tracker is at the top of the room page. The tracker shows the progress of all
   players in the game. Any observers may also be given the link to this page.
8. Once all players have joined, you may begin playing.
