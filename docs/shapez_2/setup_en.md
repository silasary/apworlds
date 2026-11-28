# Setup guide for shapez 2 in Archipelago

## Required Software

- The shapez 2 game ([Steam](https://store.steampowered.com/app/2162800/shapez_2/))
- Archipelago from the [Archipelago Releases Page](https://github.com/ArchipelagoMW/Archipelago/releases)

## Optional Software

- Optional:
  - ~~The 2hapezipelago mod (installable from within the game)~~ Currently incompatible with latest apworld version
  - Universal Tracker (check UT's channel in the discord server for more information and instructions)
  - LiAuO2's [Better Scenario Screen](https://steamcommunity.com/sharedfiles/filedetails/?id=3741448134) mod from the Steam workshop

## If you're new to AP

For detailed instructions, see the [New to AP page](./new_to_ap.md)

## Obtaining your scenario file

Once you have generated the multiworld, a `.spz2scenario` file will be generated for your world. If you generated 
locally, then it will be inside the multiworld's output `.zip` file. If hosted on a website (no matter if generated 
locally or on that website), there will be download link next to the name of your slot on the room page. 
Either double-click that file or use the "Open Patch" function in the AP Launcher to run it. It automatically installs 
the scenario. If another scenario has been installed that way before, it will be overwritten with the new scenario, 
unless that is disabled in the `shapez_2_settings` section in the host.yaml. Disabling that is only recommended with 
LiAuO2's Better Scenario Screen mod installed.

## Playing your slot

As of writing this, the mod is incompatible with the latest apworld version. Use the 
[manual-like client](./manual_client.md) for the time being. Once the mod is updated, you can use the following guide:

If you generated a single shapez 2 world, then you can just start playing the custom scenario without further setup.
If there are multiple worlds in the generated multiworld, you will need to connect to the multiworld using the 
2hapezipelago mod. To do that, create/open the save file, press F1 to open the debug console, and type in 
`2hapezipelago.connect playername@address:port` (if your room has a password, then type in 
`2hapezipelago.connect playername:password@address:port` instead, also if your playername contains spaces, 
then put the connection details into quotes). If you reopen your save file at a later point, 
you can simply type `2hapezipelago.reconnect` into the console, since your connection details are stored 
in the save file. To change the port, type in the full connection details again.