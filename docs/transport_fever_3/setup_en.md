# Transport Fever 3 Setup Guide

## Required software

- Transport Fever 3 (Steam), on Windows.
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.x, with this world installed (**Install
  APWorld** in the Launcher).
- The mod `archipelago_tf3_1`, installed as a new folder in `...\3493540\local\mods\` (never in the game folder, and
  never over a save). It is the `archipelago_tf3_1.zip` file of the Releases page of the project, which also hosts the
  world and the installation guide that describes everything step by step.

## Configuring your YAML file

A config file tells the generator how your game is built. The options page of the game creates one; the options are
described in the [official settings documentation](https://archipelago.gg/tutorial/Archipelago/advanced_settings/en).
Set `climate` to the climate of the map you will play, and keep at least one goal above zero.

## Joining a multiworld game

1. Create a **new free-play game** (never an existing save) with the mod "Archipelago for Transport Fever 3" enabled.
   Any start year works: an early one gives the game's early prices.
2. In the Archipelago Launcher open **Transport Fever 3 Client**, erase the default text of the address field, type the
   address of the server and connect with your slot name.
3. The client says "Game connected" as soon as the mod answers. The open contracts are in the game's own contract
   interface, and `/contracts` lists them in the client. You do not need to accept them: a check is reached on its own.

## Troubleshooting

- "Waiting for the game mod": the mod is not enabled in the game, or the game is not running.
- "user data not found": type `/folder <path of ...\3493540\local\towns_industries>` in the client.
- No subsidy appears in the game (and the "N missions completed" checks cannot be reached): you probably have five
  Archipelago contracts accepted, and the game stops offering its own subsidies while five are active. **Do not accept
  the Archipelago contracts**: a check is reached without it. Finish or abandon some, or set `mission_checks: 0` in
  your YAML to remove the checks that depend on the game's subsidies.
