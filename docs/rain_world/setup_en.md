# Rain World Setup Guide

## 1. Locate relevant directories

There are two directories you may need to access during setup.
- Find the location of your Archipelago (AP) installation by opening the AP launcher and clicking `Browse files`.
This will be referred to as your **AP folder**.
- Find the location of your Rain World (RW) installation.
If installed through Steam, right click on Rain World in the Steam Library,
hover `Manage`, then click `Browse local files`.
This will be referred to as your **RW folder**.

## 2. Add the Rain World APWorld

To generate a multitworld with Rain World, the `.apworld` has to be installed.
Download an `.apworld` from [a release page](https://github.com/alphappy/ArchipelagoRW/releases)
and either place it in the `worlds` or `custom_worlds` folder of your AP folder (without unzipping it!),
or use the `Install APWorld` button from the AP launcher.

## 3. Create a player YAML settings file

Player YAML settings files are used to tweak logic, determine start state and victory condition, and more.
You can see the [basic multiworld setup guide](/tutorial/Archipelago/setup/en)
for a general overview of how Archipelago uses player YAML settings files,
and [the settings subpage](/tutorial/Rain%20World/settings/en)
for more on the specific settings that Rain World uses.
A player YAML settings file is required to generate a world,
even if you choose to leave all settings at their defaults.

You can get a player YAML settings file by doing one of the following:
- Download a template from a release page.
  1. If you downloaded an `.apworld` from [the releases page](https://github.com/alphappy/ArchipelagoRW/releases),
  that page will also contain template YAMLs that can be manually edited.
- Generate the template file.
  1. Open the Archipelago Launcher and select `Generate Template Options`.
  2. Navigate to `Players/Templates` folder in your AP folder (which may open automatically).
  3. Copy and edit `Rain World.yaml` to change settings.
- Run the WebHost.
  1. Run `WebHost.py` in your AP folder to start the WebHost locally.
  If you haven't done this before, several Python packages will need to install first.
  2. Once the WebHost is running (which may take a minute), navigate to `localhost` in a browser.
  3. Select `Supported Games`, then find `Rain World` in the game list.
  4. Go to the game options page (or the weighted options page) and adjust settings as desired.
  5. Click `Export Options` at the bottom to download the file.

Don't forget to set the player name at the top of the player YAML file;
it may default to `Player{number}` which will become something like `Player1` when the multiworld is generated.
You do not have to include the `{number}` in your name.

## 4. Install the Randomizer mod

Install the Randomizer mod by doing one of the following:
- Download [from the Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3323349183).
  - Steam will automatically keep this updated to the version available on the Workshop by default.
  However, this version may not necessarily be the newest available version of the mod.
  The version here could lag behind the most recent release on GitHub
  to avoid disrupting existing running multiworlds.
- Download from GitHub.
  1. Download a release [from GitHub](https://github.com/SaltiestSyrup/RWRandomizer/releases).
     If you downloaded a specific release of the APWorld in step 2,
     that release page should link to the version(s) of the Randomizer mod that it is designed for.
  2. Unzip it and place the `rwrandomizer` folder in your RW folder at
     `Rain World\RainWorld_Data\StreamingAssets\mods`.

If you are subscribed to the mod on the Workshop and have a non-Workshop version in the `mods` folder,
do not activate both versions at the same time.
Note also that each version keeps its own save data.

## 5. Configure mods and game

Configure Rain World and your mods by doing the following:
1. Make sure that your version of Rain World matches your player YAML settings.
   1. You can find the current version you are using on the Options menu in-game,
      or by opening `Rain World\RainWorld_Data\StreamingAssets\GameVersion.txt` in your RW folder.
   2. To change game version on Steam:
      1. Right-click on Rain World in the library and select *Properties...*
      2. Open the *Betas* tab.
      3. Select the desired version in the `Beta Participation` dropdown.
         Select `None` to use the most recent version.
2. If you are running Linux (which includes Steam Deck) and have not used Remix mods before:
   1. Right-click on Rain World in the library and select *Properties...*
   2. Open the *General* tab.
   3. In the `LAUNCH OPTIONS` box, add `WINEDLLOVERRIDES="winhttp=n,b" %command%`.
3. (Re)start Rain World.
4. Go to the Remix menu and enable the following:
   1. Rain World Remix
   2. Check Randomizer
   3. More Slugcats Expansion, if and only if you enabled it in your player YAML settings
   4. The Watcher, if and only if you enabled it in your player YAML settings
   5. For other mods, see [the compatibility subpage](/tutorial/Rain%20World/compatibility/en).
5. Restart Rain World.
6. Go to the Remix menu and verify that the mod has loaded correctly
by clicking on the `Check Randomizer` to open its Remix interface.
You should see an `Archipelago` tab in this interface.

For recommended Rain World Remix settings, see [the Remix subpage](/tutorial/Rain%20World/remix/en).

## 6. Join an Archipelago room

Once the Archipelago room is open,
connect to it by opening the `Archipelago` tab in Check Randomizer's Remix menu.
Enter the host name, port number, room password (if there is one),
and player name (which must exactly match the name specified in your player YAML settings),
then click Connect.
The Remix menu should print a message indicating a successful connection
and including key pieces of information from your player YAML settings.

## 7. Start the game

Once you are connected to a room, the matching Story campaign may be started
as long as your version and enabled content mods match your player YAML settings.
A fresh campaign should be used when connecting to a new room.
It does not necessarily need to be an entirely fresh save file,
though using a seprate save file (or backup) is encoruaged.
A Randomizer campaign should never be loaded without Randomizer enabled and connected - 
doing so may irreversibly break the campaign's save data.

For details on everything that gets randomized,
see the [game description page](/games/Rain%20World/info/en).
