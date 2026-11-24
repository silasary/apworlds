# Setup Guide
## Requirements
- [Rift of the Necrodancer](https://store.steampowered.com/app/2073250/Rift_of_the_NecroDancer/) from Steam
- [BepInEx](https://github.com/BepInEx/BepInEx/releases/) 
- [Rift of the NecroManager](https://github.com/96-LB/RiftOfTheNecroManager/releases)
- [Riftipelago](https://github.com/studkid/RiftArchipelago/releases)

## Installation
1. Download `BepInEx_win_x64_5.4.[minor_version].zip` from the BepInEx releases and extract the contents into the Rift of the Necrodancer installation folder.  This folder can be found by right clicking on Rift of the Necrodancer on steam and navigating Manage -> Browse Local files.
2. Download the latest `RiftOfTheNecroManager.dll` from the releases page and place it inside the `/RiftOfTheNecroDancerOSTVolume1/BepInEx/plugins/` folder.  If the plugins folder doesn't exist yet create it (BepInEx should generate this on first launch if installed correctly).
3. Download and extract the RiftArchipelago.zip file into the plugins folder.  Make sure to not extract into a new folder!
4. **Linux Only**: Right click Rift of the Necrodancer on steam and open up properties.  In the Launch Options, add `WINEDLLOVERRIDES="winhttp.dll=n,b" %command%`.
5. On the title screen there should now be a connection window on the top corner to input your server info.

Make sure to configure the Riftipelago options in the in game mod options if you want to enable things like deathlink or traplink.

## How to play with Custom Songs
1. Open the Custom Song menu with the mod loaded.  Favorite the songs you wish to have included and click "Dump Favorited Songs"
2. Navigate to your Rift of the Necrodancer installation folder, there should be a new folder called `Output` with a `CustomSongs.json` file inside.
3. Copy and paste the contents of the json into the `rotn_mod_data` option in your yaml.  Make sure you have '' around the string and remove the option weight (the `:50`) if working off of a template yaml.

Notes:
- Currently this will include every custom song you have installed, so you'll want to manually exclude songs you don't want to roll.
- Include/Exclude is expecting the song's item name, for custom songs it'll be formated `<song_name> [<song_id>]`.  Generating and hosting a local game and running /items in a text client would be the easiest way to find the exact name
- Adding more than 500 local songs may cause issues if running a game with other RotN players.  It's highly recommended to use workshop songs instead.