# Splasher Setup Guide

## Required Software

- A legally obtained copy of Splasher
- `BepInEx` installed in Splasher. Installation is explained bellow
- Archipelago Client (0.6.7 or later)
- [Splasher Archipelago](https://github.com/Frisk202020/SplasherArchipelago/releases/)

*The game is currently only tested on Windows (though you should not have any issue since `BepInEx` is cross-platform). Furthermore, as the game was only released on Steam (and consoles), we'll assume the game is installed in default Steam folders*.

## Installation procedures

### Setting up BepInEx

- First, download `BepInEx` [latest release (v.5.4.23)](https://github.com/BepInEx/BepInEx/releases/tag/v5.4.23.5) (winx64 for windows). It is a mod loader that will allow to load *Archipelago* in the game.
- Extract the obtained archive into Splasher's root folder (which should be located at `C:\Program Files (x86)\Steam\steamapps\common\Splasher`)
- Launch the game a first time : it will initialize BepInEx, mainly, it should initialize a `plugins` folder inside \BepInEx.

### Setting up the mod

- Download the latest release of the [Splasher Archipelago](https://github.com/Frisk202020/SplasherArchipelago/releases/). Extract and drag all its content from /plugins into BepInEx's /plugins folder. 
- Drag `connection.yaml` and `Proxy.exe` files inside `Splasher Archipelago` to Splasher's root folder. Then edit `connection.yaml` with your connexion info. The proxy is useful when playing online, [it is explained bellow](#playing-on-archipelagogg).
- Launch the game and ring the assistant's bell : it should initiate a connection to the server, and if successful, initiate the mod !
*You can ensure it worked if you now can't fire water/paint (except if unlocked in Archipelago)*

## Managing the Archipelago session

- Even though the base game does not have multiple save files, Archipelago will use new files as soon as it is enabled. Your vanilla save is safe, though Archipelago will trigger Steam achievements. It should be prevented in a future version.
- If the Archipelago session successfully started, connection to the server is automatically managed. You don't have to worry about reconnections.

## Playing a game

### Playing on archipelago.gg

In order to play on *archipelago.gg* (or most other servers on the internet), you'll need to enable the `proxy` option in your `connection.yaml`. This will enable the client to connect archipelago using (automatically) `Proxy.exe` (provided with your client from v0.0.3). Not activating it will make the game unable to provide a secure connexion to Archipelago, which will result in a `connexion timeout`. More (advanced) information about what this tool does can be found [here](https://github.com/Frisk202020/SplasherArchipelago/blob/tls-compatibility/Proxy/README.md).

> The proxy implementation should be cross-platform. If encountering an issue, please [report](./feedback_en.md) it !

### Hosting locally

For hosting this Archipelago, you need to install the [apworld](https://github.com/Frisk202020/Archipelago/releases/) (simply double click on it, or install it with the launcher).

## Feedback

Since this world is in early development, feedback about your playthrough would be very appreciated (especially if encountering issues) ! You can contact me :
- on Discord (preferred) : @frisk2892
- by mail : clementhemesecond@gmail.com

If you need to report an encountered issue, please follow [report guidelines](./feedback_en.md).