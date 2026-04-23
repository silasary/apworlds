# Setup guide for shapez 2 in Archipelago

## Required Software

- The shapez 2 game ([Steam](https://store.steampowered.com/app/2162800/shapez_2/))
- The 2hapezipelago mod (installable from within the game)

## Optional Software

- Optional:
  - Archipelago from the [Archipelago Releases Page](https://github.com/ArchipelagoMW/Archipelago/releases)
  - Universal Tracker (check UT's channel in the discord server for more information and instructions)

## Obtaining your scenario file

Once you have generated the multiworld, a `.zip` file will be generated for your world. If you generated locally, 
then it will be inside the multiworld's output `.zip` file. If hosted on the website (no matter if generated locally 
or on the website), there will be download link next to the name of your slot on the room page. Your world's `.zip` 
file will contain a `scenario_[...].json` file and a `preset_[...].json` file. Put those files into the
`scenarios` and `scenario-presets` subfolders (respectively) in the mod's folder. 
If you don't know where that is, then open the game, click `Mods`, and click the folder icon next to the mod's name.

## Playing your slot

If you generated a single shapez 2 world, then you can just start playing the custom scenario without further setup.
If there are multiple worlds in the generated multiworld, you will need to connect to the multiworld using the 
2hapezipelago mod. To do that, create/open the save file, press F1 to open the debug console, and type in 
`2hapezipelago.connect playername@address:port` (if your room has a password, then type in 
`2hapezipelago.connect playername:password@address:port` instead). If you reopen your save file at a later point, 
you can simply type `2hapezipelago.reconnect` into the console, since your connection details are stored 
in the save file. To change the port, type in the full connection details again.
