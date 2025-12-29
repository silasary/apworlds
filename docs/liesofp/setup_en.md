# Lies of P Randomizer Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- Lies of P: [Available on Steam](https://store.steampowered.com/app/1627720/Lies_of_P/)
  - \[Optional\] [Overture] DLC: [Also Available on Steam](https://store.steampowered.com/app/2848330/Lies_of_P_Overture/)
- Lies of P Archipelago Mod: [GitHub](https://github.com/Xtruh/LiesOfAP/releases)

## Installing the Archipelago mod to Lies of P

1. Go to the Releases page and download the latest version of LiesOfAP.zip
2. Locate rour lies of P install if on steam should look somthing like (/Steam/Steamapps/Common/Lies of P)
3. Extract the contents of LiesofP.zip directly into Steam/Steamapps/Common/Lies of P

If you've successfully installed everything a console should appear on screen when pressing **Enter** or **/** once in game.

## Generating a MultiWorld Game

1. Place liesofp.apworld into Archipelago/lib/worlds.
2. Place all yamls for the seed into Archipelago/Players.
3. Run ArchipelagoGenerate.exe.
4. A zip file will be added to Archipelago/output, which can [hosted on the website](https://archipelago.gg/uploads) or hosted locally with ArchipelagoServer.exe.
## Joining a MultiWorld Game

1. Launch Lies of P and create a new save file.
2. Once in game press **Enter** or **/** to open the text client and connect by typing (/connect Server:Port Slotname password).
3. If entered correctly, a message should appear in the text client saying you are connected.

## Playing Lies of P without the randomizer

1. Move all .pak files located in LiesofP/Content/Paks/~mods and LogicMods folders
2. Set "LiesOfAP: 1" to 0 located in LiesofP\Content\Binaries\Win64\ue4ss\Mod\mods.txt

- **Alternatively** you can create copy of the game before installing the mod (not recommended due to the size of the game)

  1. In Steam/steamapps/common, make a copy of your LiesofP folder and rename it "LiesofP_AP" (or somthing similar).
  2. You can add the new LiesofP.exe as a "Non-Steam Game" in Steam to access it easily from Steam and to maintain Steam Input compatibility (which may be required for some controllers)
  3. Extract the contents of LiesOfAP.zip directly into Steam\Steamapps\Common\LiesofP_AP (or whatever you named it)

## Updating Lies of P Randomizer

1. Download the main.dll from the [releases page](https://github.com/Xtruh/LiesOfAP/releases) (this will work on every update where .pak files are unchanged)
2. Put this file inside (Steam\steamapps\common\Lies of P\LiesofP\Binaries\Win64\ue4ss\Mods\LiesOfAP\dlls)