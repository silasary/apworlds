# Xenoblade X MultiWorld Setup Guide

## Required Software

- Xenoblade Chronicles X (Wii U)
- [Cemu](https://github.com/cemu-project/Cemu/releases)
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- [Xenoblade X APWorld](https://github.com/MaragonMH/Archipelago/releases)

## Installation

1. [Install Cemu](https://cemu.cfw.guide/) to whereever you like
2. Open Cemu 
3. In Cemu install the base game and all update. DLC is not required
4. Download the community graphic packs
5. Start Xenobalde X once to make sure it works
6. Install Archipelago
7. Open the Archipelago Launcher
8. Select `Install APWorld` and add the `xenobladex.apworld`

## Joining a MultiWorld Game

1. Start the `Archipelago Launcher`
2. Select `Xenoblade X Client`
3. Enter your `{SERVER_IP}:{SERVER_PORT}` and select `Connect`
4. Enter your username
5. If this is the first time: Select the `Cemu` executeable in the opening prompt
6. Start Xenoblade X through the new Cemu instance

## Create a config file

The [Player Options](/games/Xenoblade%20X/player-options) page on the website allows you to
configure your personal options and export them into a config file.

You can also use the provided Templates of `Xenoblade X.yaml`.
Select `Generate Template Options` within the `Archipelago Launcher`.
You can edit the file to suit your preferences and create your own options.

## Generation and Hosting
For detailed instructions regarding Generation and Hosting read
[this](tutorial/Archipelago/setup/en).

## Installation Troubleshooting

This is a very early versions so expect issues.

### Supported Versions
Currently only the PAL and latest US version of Xenoblade X is supported.

- Cemu
  - Latest at least 2.4+
- Xenoblade X
  - 1.0.1E/1.0.0E (PAL)
  - 1.0.2U

### My Client is unable to find the Cemu Settings.xml

If you migrated from an older version of Cemu you might need to freshly reinstall Cemu.

### Xenoblade X is not receiving/sending any items

Make sure that you are one one of the supported versions of Cemu and Xenoblade X.
Make sure you reached the first day cutscene overlooking Primordia and time is progressing.

### Xenoblade X crashed what should i do?
If your client is still active just press `Disconnect` and then `Connect` and your game should reopen.

### What happens if I lose connection?

If a disconnection occurs, wait a moment to see if the game automatically reconnects itself.
The game is independent from the client so if the client disconnects you should just reconnect it,
you dont have to restart the game when its still running.

### Can i use Cemu graphic packs?
Some of these are included in the settings to allow for more flexibility.
Apart from those you should be fine to use whatever graphical graphic pack you like.
Other packs might interfere, but that is very unlikely. Feel free to use them.

### How do i manage my saves?
Usually you should start each MultiWorld with a fresh savefile. The best way to do that is to create a new account.
Otherwise you can start a new game from the title screen.