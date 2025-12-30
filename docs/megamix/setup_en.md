# Hatsune Miku Project DIVA Mega Mix+ Setup Guide

## Requirements
- [Hatsune Miku Project DIVA Mega Mix+](https://store.steampowered.com/app/1761390/Hatsune_Miku_Project_DIVA_Mega_Mix/) (Steam)
  - [Extra Song Pack](https://store.steampowered.com/app/1887030/Hatsune_Miku_Project_DIVA_Mega_Mix_Extra_Song_Pack/) (optional, recommended, cheaper bundled)
  - The game can be played in Archipelago without the Extra Song Pack DLC.
- [DivaModLoader](https://github.com/blueskythlikesclouds/DivaModLoader?tab=readme-ov-file#installation)
- [[GB]](https://gamebanana.com/mods/514140) [[DMA]](https://divamodarchive.com/post/279) Archipelago Mod

## First Time Setup
This is a minimal setup to get started. Mod managers exist that may make certain steps easier, but you use them at your discretion.

1. If not already installed, [follow DivaModLoader's installation steps.](https://github.com/blueskythlikesclouds/DivaModLoader?tab=readme-ov-file#installation)
   - See below for locating `DivaMegaMix.exe`
2. Install the Archipelago Mod listed under [Requirements.](#requirements)
3. Start the **Mega Mix Client** from the Archipelago Launcher
4. You may be prompted to select `DivaMegaMix.exe`:
   - If you are not prompted, skip these steps
   - Right-click the game entry in Steam, **Manage > Browse local files**
   - `DivaMegaMix.exe` (extension may be hidden) is what you will need to navigate to and select
   - You may be able to ***Ctrl+C*** the game EXE and paste its path into the original prompt's text input
5. Play! (requires a [YAML and generation](/tutorial/Archipelago/setup_en))

### Resulting basic file structure
```
Hatsune Miku Project DIVA Mega Mix Plus\
├ DivaMegaMix.exe   <─ game, select if prompted by Client/JSON generator
├ dinput8.dll       <─ mod loader
├ config.toml       <─ mod loader config (no need to edit)
└ mods\
  └ ArchipelagoMod\ <─ AP mod, currently required to be this name
    └ config.toml   <─ AP mod config
```

## Optional Quality of Life Mods 
Please read descriptions before installing. These may not be relevant to you or may require additional files.

| Mod                  | Sources                                                                                                                                           |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| ExPatch              | [[GB]](https://gamebanana.com/mods/388083) [[DMA]](https://divamodarchive.com/post/371) [[GH]](https://github.com/nastys/ExPatch/releases/latest) |
| High Frame Rate      | [[GB]](https://gamebanana.com/mods/380955)                                                                                                        |
| IntroPatch           | [[GB]](https://gamebanana.com/mods/449088) [[DMA]](https://divamodarchive.com/post/193)                                                           |
| KeepFocus            | [[GB]](https://gamebanana.com/mods/427425)                                                                                                        |
| Reach LV39 Instantly | [[GB]](https://gamebanana.com/mods/397158)                                                                                                        |
| ThumbnailSplitter    | [[GB]](https://gamebanana.com/mods/625557)                                                                                                        |

## Mod Songs
**Note: Currently, using mod songs requires the seed to be [generated locally](/tutorial/Archipelago/setup_en#generating-a-multiplayer-game), not on the website. Hosting on the website afterwards is fine.**

1. Open the **Mega Mix JSON Generator** from the Archipelago Launcher.
2. Check song packs you would like to appear in your song selection pool. Unchecked packs will remain visible in game unless manually disabled.
3. When done checking packs click **Generate Mod String**.
4. In your YAML on the line for `megamix_mod_data` paste and format it as such:
   - `megamix_mod_data: '{"MyFirstSongPack":[["MyFirstSong",144,224]]}'`

Linux users that experience clipboard issues *may* need to run the Archipelago Launcher and JSON Generator through a command line to get the output there.

It is recommended to regenerate the mod string when adding or updating packs.

Individual songs can be excluded from the pool in the YAML's `exclude_songs` section.

## Troubleshooting

### Checks are not sending
Make sure the **Mega Mix Client** is open and connected to a room.

Play `-Archipelago Randomizer Enabled-`. If a success message does not appear in the **Client** on completion try restarting the **Client**.

### There are songs outside my specified difficulty settings
Starting (`start_inventory`), Included (`include_songs`), and the Goal Song (`goal_song`) will *always* ignore difficulty settings.

To increase the success of seed generation the difficulty settings are conservatively expanded *until* a minimally viable song pool is found. If you do not like the results of the difficulty expansion consider less restrictive settings.

### My settings are too long or difficult
**Note: You can play any available difficulty for the same checks.**

In the [AP mod folder](#resulting-basic-file-structure) open `results.json` with a text editor. If it does not exist play a song first.

Given `Song I Want To Beat [5678]`:
- Change the number after `pvId` to `5678` 
- Change the number after `scoreGrade` to `5` (Perfect).

Save the file while the **Mega Mix Client** is open and connected.

### Newly received songs are not appearing in game
While on the song list press ***F7*** or the defined `reload` key in the [mod's config](#resulting-basic-file-structure) to reload the game.

Switch to the **All** filter in the song list and check each difficulty. Not every song is available on every difficulty.

### Modded songs are not appearing in game

Install [ExPatch](#optional-quality-of-life-mods). Modded songs are commonly Extreme/Extra Extreme only.

Similar to the [mod's config](#resulting-basic-file-structure), ensure `enabled = true` in a pack's `config.toml`.

### Songs still aren't appearing
Run `/restore_songs` in the **Mega Mix Client**, reload, and play manually (honor system).
