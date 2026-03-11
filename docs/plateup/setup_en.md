# PlateUp Multiworld Setup Guide

## Required Software

- [Latest Archipelago Version](https://github.com/ArchipelagoMW/Archipelago/releases/latest)
- [PlateUp!](https://store.steampowered.com/app/1599600/PlateUp/) on Steam
- [PlateUp Archipelago Mod](https://steamcommunity.com/sharedfiles/filedetails/?id=3484431423) — install via Steam Workshop (recommended) or manually from the GitHub releases page

For more information about yaml options and mod mechanics, refer to the full guide:
[PlateUp! Archipelago Mod Options & Features Guide](https://docs.google.com/document/d/1H_T82UsZbHI4CbvfHWnud8xZqhXH5XWc_sZkax1I8YY/edit?tab=t.0)

## Installation

### Steam Workshop (Recommended)

1. Subscribe to the mod on the [Steam Workshop page](https://steamcommunity.com/sharedfiles/filedetails/?id=3484431423).
2. Subscribe to all required dependencies listed below — the Workshop page links to them.
3. Launch PlateUp and go to the HQ (lobby). The config file will be generated automatically on first launch.
4. Fill in your Archipelago server details in the config file located at:
   `%appdata%\..\LocalLow\It's Happening\PlateUp\PlateUpAPConfig`
5. No restart needed — connect and start a run.

### Manual Installation

1. Download the latest release from the [mod repository](https://github.com/CazIsABoi/PlateUpAPMod/releases).
2. Extract the files into:
   `Program Files (x86)\Steam\steamapps\common\PlateUp\PlateUp\Mods`
3. Launch PlateUp and go to the HQ (lobby). The config file will be generated automatically on first launch.
4. Fill in your Archipelago server details in the config file located at:
   `%appdata%\..\LocalLow\It's Happening\PlateUp\PlateUpAPConfig`
5. No restart needed — connect and start a run.

### Required Dependencies

The following mods must be installed alongside the Archipelago mod. If using the Steam Workshop, these are linked from the mod page. If installing manually, download each from the Workshop or their respective sources.

- PreferenceSystem
- PlatePatch
- KitchenLib
- HarmonyX

## Create a Config (.yaml) File

### What is a config file and why do I need one?

Your config file contains a set of options that tell the Archipelago generator how to set up your game. Each player in a multiworld provides their own config file, so everyone can have a different experience in the same seed.

### Where do I get a config file?

The [player settings page](../player-settings) on the Archipelago website lets you configure your options and export a config file. You can also use the default template yaml from the PlateUp apworld as a starting point and edit it manually.

### Verifying Your Config File

You can validate your config file on the [YAML Validator page](https://archipelago.gg/check) before using it in a multiworld to make sure there are no errors.

## Generating and Hosting the Multiworld

Generating a game and hosting an Archipelago server is explained in the [Archipelago Setup Guide](https://archipelago.gg/tutorial/Archipelago/setup/en). Once your world is generated you can host it on the Archipelago website or locally.

## Connecting to a MultiWorld

1. Open PlateUp with the Archipelago mod installed.
2. Go to the HQ (lobby) — **do not try to connect from the main menu**.
3. Open the config file at `%appdata%\..\LocalLow\It's Happening\PlateUp\PlateUpAPConfig` and fill in:
   - **Server**: Your Archipelago server address and port, for example `archipelago.gg:12345`
   - **SlotName**: The player name you used when creating your config file
   - **Password**: Your room password, or leave blank if there isn't one
4. Save the config file. No restart is needed.
5. Connect from the HQ and start a new run — checks will begin sending automatically.

## Multiplayer

PlateUp Archipelago supports a limited form of multiplayer based on community findings. Only one player needs to have the mod installed:

- The player with the mod installed connects to the Archipelago server and acts as the host.
- Additional players join through PlateUp's standard multiplayer without the mod installed.

This is not fully verified and may vary between setups. If you find a more reliable method, please share it in the community.

## Options

Configure your PlateUp randomizer experience on your [player settings page](../player-settings). Key options include:

- **Goal**: Choose between franchising X times, completing X days, or reaching a target day with a minimum number of dishes active.
- **Dish Count**: How many dishes get dedicated checks and unlock items.
- **Free Starter Dishes**: How many dishes start already unlocked at the beginning of a run.
- **Day Leases**: Toggle day lease progression gates on or off, and set the interval between each required lease.
- **Money Cap**: Set a gold cap that only increases as you find Money Cap Increase items.
- **Starting Group Size**: Start your run with a larger customer group size for added difficulty.
- **Global Patience**: Add patience upgrade progression gates spread across the run.
- **Achievement Checks**: Enable in-game achievements as location checks.
- **Trap Cards**: Enable negative trap items such as patience decreases and extra customers.
- **Speed Upgrades**: Configure how many player and appliance speed upgrades are included.
- **Starting Cards**: Start your run with a set number of difficult customer cards already active.

For a full breakdown of every option, see the [Options & Features Guide](https://docs.google.com/document/d/1H_T82UsZbHI4CbvfHWnud8xZqhXH5XWc_sZkax1I8YY/edit?tab=t.0).

## Troubleshooting

**Config file not generating**
The config file is only created from the HQ (lobby), not the main menu. Make sure you are fully in the lobby before expecting the file to appear.

**Cannot connect from the main menu**
This is a known limitation. Connect from the HQ (lobby) instead. Dish locking will not activate until after your first run is completed.

**No dish unlock checks generated**
Unknown bug. Re-enter the game, reconnect as usual, and make sure to select a new dish on your first run.

**Checks not sending / goal instantly completing**
Your yaml is likely out of date. A sign of an outdated yaml is if the goal option still shows `franchise_once`, `franchise_twice`, or `franchise_thrice`. Download the latest yaml template and update your options.

**Both Workshop and manual versions installed**
Only one version of the mod should be active at a time. Having both installed will cause conflicts. Use the Workshop version unless you have a specific reason to install manually.

**PlateUp update prompt blocking progression**
Press O, P, K, or L to bypass the prompt.
