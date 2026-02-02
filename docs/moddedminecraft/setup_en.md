# Setup Guide for Modded Minecraft

## Required software

- Minecraft Java Edition
- Minecraft Mod Loader
  - Currently only fabric supported
- [Archipelago mod for Minecraft](https://github.com/Stuff691734/Archipelago)

## Joining a Multiworld Game

1. Launch minecraft with the Archipelago mod installed
2. Enter a world and run the command /archipelago connect [PlayerName] [Address]
   - for example `/archipelago connect Player1 localhost:38281`

## Creating a .yaml file

1. Create a minecraft world with the mods/modpack you want to play with and the Archipelago mod.
2. Run `/archipelago generate`
3. A file will have been created in your .minecraft folder named output/archipelago_data.json
4. Copy the json in that file (ctrl+a, ctrl+c) 
5. in the automatically generated Modded Minecraft.yaml replace the curly brackets under checks with the copied json.

## Hosting A Game

1. Generate
2. **RESTART ARCHIPELAGO** (Code modifies the datapackage and that is only generated at archipelago launch)
3. Host

## Issues
- This apworld does not have any available checks at start.
  - Add `{"minecraft:story/root":1}` to starting items.