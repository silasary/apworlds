# Hatsune Miku Project DIVA Mega Mix+ Setup Guide

## Requirements
- [Hatsune Miku Project DIVA Mega Mix+](https://store.steampowered.com/app/1761390/Hatsune_Miku_Project_DIVA_Mega_Mix/) (Steam)
  - [Extra Song Pack](https://store.steampowered.com/app/1887030/Hatsune_Miku_Project_DIVA_Mega_Mix_Extra_Song_Pack/) (optional, recommended, cheaper bundled)
  - The game can be played in Archipelago without the Extra Song Pack DLC.
- [The APWorld](https://github.com/Cynichill/DivaAPworld/releases/latest)
- [[GB]](https://gamebanana.com/mods/514140) [[DMA]](https://divamodarchive.com/post/279) Archipelago Mod

## First Time Setup
1. Download and set up [DivaModManager by Enomoto](https://gamebanana.com/tools/19485)
2. Install **Archipelago Mod** from either the GameBanana or DMA Mods tab then enable it.

Or use [a minimal mod setup.](#minimal-mod-setup).

## Optional Quality of Life Mods 
Please read descriptions before installing. These may not be relevant to you or may require additional files.

| Mod             | Sources                                                                                                                                              |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| ExPatch         | [[GB]](https://gamebanana.com/mods/388083) [[DMA]](https://divamodarchive.com/post/371) [[GH]](https://github.com/nastys/ExPatch/releases/latest)    |
| High Frame Rate | [[GB]](https://gamebanana.com/mods/380955)                                                                                                           |
| IntroPatch      | [[GB]](https://gamebanana.com/mods/449088) [[DMA]](https://divamodarchive.com/post/193) [[GH]](https://github.com/nastys/IntroPatch/releases/latest) |
| Window Thing    | [[GH]](https://github.com/vixen256/window_thing/releases/latest)                                                                                     |

## Mod Songs
**Note: Currently, using mod songs requires the seed to be [generated locally](/tutorial/Archipelago/setup_en#generating-a-multiplayer-game), not on the website. Hosting on the website afterwards is fine.**

1. Open the **Mega Mix JSON Generator** from the Archipelago Launcher.
2. If prompted to select `DivaMegaMix.exe`:
   - **If not prompted, skip this step**
   - Right-click the game entry in Steam, **Manage > Browse local files**
   - `DivaMegaMix.exe` (extension may be hidden) is what you will need to navigate to and select
3. Check song packs you want in your song selection pool.
4. When done checking packs click **Generate Mod String**.
5. In your YAML on the line for `megamix_mod_data` paste and format it as such:
   - `megamix_mod_data: '{"MyFirstSongPack":[["MyFirstSong",144,224]]}'`
   - If the line ends with `: 50` or similar, remove it.

Linux users that experience clipboard issues *may* need to run the Archipelago Launcher and JSON Generator through a command line to get the output there.

It is recommended to regenerate the mod string when adding or updating packs.

Individual songs can be excluded from the song selection pool in the YAML's `exclude_songs` section.

## Troubleshooting

### There are songs outside my specified difficulty settings
Starting (`start_inventory`), Included (`include_songs`), and the Goal Song (`goal_song`) will *always* ignore difficulty settings.

To increase the success of seed generation the difficulty settings are conservatively expanded until a minimally viable song pool is found. If you do not like the results of the difficulty expansion consider less restrictive settings.

### My settings are too long or difficult
**Note: You can play any available difficulty for the same checks.**

Enable **AP Developer Mode** by right-clicking it on the Advanced tab, switch to the Tracker tab, then right-click the song name.

### Newly received songs are not appearing in game
While on the song list press ***F7***/your defined reload key or use `Advanced > Reloading > Reload Game`.

- Switch to the **All** filter in the song list.
- Check each difficulty. Not every song is available on every difficulty.
  - Install [ExPatch](#optional-quality-of-life-mods). Modded songs are commonly Extreme/Extra Extreme only.
- If using New Classics, check the **All** filter for each gameplay style.

### Minimal mod setup
If you cannot or do not want to use a mod manager.

1. [Install DivaModLoader.](https://github.com/blueskythlikesclouds/DivaModLoader?tab=readme-ov-file#installation)
2. Download and extract the Archipelago Mod listed under [Requirements.](#requirements)
3. Place the extracted `ArchipelagoMod` folder into the `mods` folder.

#### Resulting mod file structure
```
Hatsune Miku Project DIVA Mega Mix Plus\
├ DivaMegaMix.exe   <─ game, select if prompted by JSON generator
├ dinput8.dll       <─ mod loader
├ config.toml       <─ mod loader config
└ mods\
  └ ArchipelagoMod\ <─ AP mod folder
    ├ ArchipelagoMod.dll
    ├ config.toml
    └ ...
```