# Black Market of Bulletphilia ~ 100th Black Market Randomizer Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- The .apworld for 100th Black Market, if not bundled with Archiepelago.
- Touhou 18.5: 100th Black Market, the game. Available on [Steam](https://store.steampowered.com/app/2097720/Black_Market_of_Bulletphilia___100th_Black_Market/), but its Comiket CD release also works.

## Starting Conditions

- You will begin the game with one stage unlocked, no cards unlocked, no Funds, only 1 loadout card, and 100% equipment cost limit.
- Which stage would be unlocked at start can be changed in the Options.
- For beginners, it is recommended to choose "**Tutorial - First Black Market Deal**" as the Starting Market.
- The client will **automatically** save your progress and restore it according to server data. You will receive your unlocked stages, cards, Funds, card slots, and equipment cost upon a successful connection. **_Local save data/Steam save data is not needed for this reason._**

## Setup Before Playing

For Steam releases, disable Steam's Cloud saving feature for the game. This can be done in Settings -> Properties... -> General -> Steam Cloud.

Before opening the game and playing, ensure that your local save data has been wiped, including its backups. It is recommended that you make a copy of your old save data for the game and keep it somewhere safe.

The game's save data is typically located in `%appdata%\ShanghaiAlice\th185`, where you might find two files called `scoreth185.dat` and `scoreth185bak.dat`. You may make a copy of these two files and paste them somewhere where you can find them.

If 100th Black Market's .apworld has not yet been installed,  do so before playing. Before opening the game, open the client in the Archipelago Launcher and run one simple setup command to clear the game's save data. The command will also paste in fresh save data tailored specifically to the randomizer. It is recommended that this be done every time before opening the game to ensure that there is no inconvenience that arises during launch.

## Randomizer Setup

In order to play this implementation, a multiworld room is required. For this, you or someone you know has to generate a game. This will not be explained here, but you can check the [Archipelago Setup Guide](/tutorial/Archipelago/setup_en#generating-a-game).

At the top of the client, you may see a text box. This is where the `IP Address`/`Hostname` and `Port` will go so that the client can connect to a room. Simply type in the address and port number separated by a `:` symbol. (e.g. `archipelago.gg:69420`)

If the client successfully connects, you will be asked for your slot name. Enter the name you used during the `.yaml` generation.

Before opening the game itself, it is advised to run the `/replace_save` command to prepare the game's save data for Archipelago. This will delete any old save data in `%appdata%\ShanghaiAlice\th185` and paste in save data tailored to the randomizer.

Once this is done, you may open the game. The client will attempt to connect to the game. If successful, you will be informed that the client has found the game. You may then play the game as usual.

## Modding Compatibility

- Mods which _**directly**_ modify the game executable will break compatibility. As the client relies on consistent memory addresses to operate, directly editing the executable will derail the entire thing.
- Mods run via the [Touhou Community Reliant Automatic Patcher (thcrap)](https://github.com/thpatch/thcrap) _may_ work, at least for language patches. This patcher is not bundled in with this AP implementation.

## Troubleshooting

If any issues arise that **cannot be solved by going over this guide**, feel free to ask in the [thread](https://discord.com/channels/731205301247803413/1346288808512983040/1470840910500724736) for Touhou 18.5: 100th Black Market in #future-game-design in the official Archipelago Discord server.
