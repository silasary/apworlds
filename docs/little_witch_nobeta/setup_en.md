# Little Witch Nobeta Multiworld Setup Guide

## Required Software

- [Little Witch Nobeta](https://store.steampowered.com/app/1049890/Little_Witch_Nobeta/) Steam version of Little Witch Nobeta at the current version.
- [MelonLoader](https://melonloader.co/download) Download the MelonLoader installer for your distribution.
- [RandomizedWitchNobetaAP MelonLoader mod](https://github.com/danielgruethling/LittleWitchNobetaAP/releases) Download the LWNAP.zip from the github releases.

## Installation Procedures

This plugin modifies the game using [MelonLoader](https://melonloader.co/download), so it is needed to install MelonLoader to load this plugin, here are the steps to achieve this:
- Find the installation directory of the game *(Usually in `steamapps/common`, you can find this from the game properties in Steam -> local files -> browse...)*
- Run the MelonLoader installer and install the newest stable version to your installation directory. As of writing this this should be v0.7.1.
- Download the client mod: [**`LWNAP.zip`**](https://github.com/danielgruethling/LittleWitchNobetaAP/releases)
- Copy the Mods folder from the archive inside the game directory *(Where there is `LittleWitchNobeta.exe`)*
- Run the game through Steam and enjoy!

Note: When upgrading from BepInEx, if it was installed to your Steam directory delete the BepInEx folder and follow the instructions above to switch to MelonLoader.

## How to uninstall

Delete the contents of the Mods directory from your installation directory.

## Create a Config (.yaml) File

### What is a config file and why do I need one?

Your config file contains a set of configuration options which provide the generator with information about how it
should generate your game. Each player of a multiworld will provide their own config file. This setup allows each player
to enjoy an experience customized for their taste, and different players in the same multiworld can all have different
options.

### Where do I get a config file?

The [Player Options](/games/Little%20Witch%20Nobeta/player-options) page on the website allows you to configure
your personal options and export a config file from them.

### Verifying your config file

If you would like to validate your config file to make sure it works, you may do so on the
[YAML Validator](/check) page.

### Joining a MultiWorld Game

When you join a multiworld game, you will be asked to provide your config file to whoever is hosting. Once that is done,
the host will provide you with a link to obtain the server information used to connect your game.

This can be split up into the following steps:

1. Navigate to the [Player Options](/games/Little%20Witch%20Nobeta/player-options) page, configure your options,
   and click the "Generate Game" button
2. You will be presented with a "Seed Info" page
3. Click the "Create New Room" link
4. You will be presented with a server page, from which you can obtain the server information
5. Start the game through Steam
6. Start a new game. Your movement will be limited until you connect to Archipelago
7. An overlay will be shown, insert the server information (hostname, port, slotname and password) in the fields
8. Press the "Connect" button

### Rejoining a MultiWorld Game

When you want to reconnect to your slot follow these steps:

1. Start the game through Steam
2. Load your game. Your movement will be limited until you connect to Archipelago
3. An overlay will be shown, insert the server information (hostname, port, slotname and password) in the fields
4. Press the "Connect" button


### Play the game

When the game is connected, you're ready to begin playing. Congratulations on
successfully joining a multiworld game!
