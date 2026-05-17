# Funi Raccoon Game Randomizer Setup Guide

## Required Software

- [Funi Raccoon Game on Steam](https://store.steampowered.com/app/3599690/Funi_Raccoon_Game/)

### Setup

0. Create a yaml and generate a game with the Funi Raccoon Game APWorld. **You must be on Archipelago v0.6.7 to do this.**
1. Download the latest release of Funi Raccoon AP on Github:
    - [Funi Raccoon AP](https://github.com/Jeffdev-Archipelago-Implementations/FuniRaccoonAP/releases/latest)
2. Open your Funi Raccoon Game installation directory. On Steam, you can find it easily by right-clicking the game and clicking `Manage` > `Browse local files`.
3. Extract the contents of the Funi Raccoon AP mod into the main directory, so that **mod_boot.gd**, **mods.pck**, and **override.cfg** are added in the root.
4. Open the properties for Funi Raccoon Game. On Steam, right click the game and click `properties`.
5. In the launch options, paste `--override-cfg "%STEAMAPPS%\common\Funi Raccoon Game\override.cfg"` into it. Do not remove any characters, it should be this character for character.
6. Launch and play!

## Joining a new MultiWorld Game

1. After opening the game, select a new Raccoon on a **new save file, before any connections.**
2. When on the computer monitor screen where you set your settings, press **F5** to open the connection window, and put in your connection info.
3. Click connect, and if the connection windows disappears, you are connected! You can now play the game as normal.
4. You can skip the "3 item requirement" in the tutorial as well.
5. If you want to rejoin a game, open the same slot **before connecting** and then while in game, press F5, type in info, and connect. If done properly, you should be sent to the dumpster (or canyon, if you are in Act 4)
 
## Troubleshooting

- Please report bugs in the [Archipelago Discord Server](https://discord.gg/8Z65BR2), by going to [the Funi Raccoon Game thread](https://discord.com/channels/731205301247803413/1482650071987130379) and pinging Jeffdev.
