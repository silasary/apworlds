# Setup Guide for Disney's Magical Mirror Archipelago

## Required Software

- Dolphin Emulator: [Dolphin Emulator Releases](https://dolphin-emu.org/download/)
- Archipelago 0.6.7 or later: [Archipelago Releases](https://github.com/ArchipelagoMW/Archipelago/releases)
- The Mickey APWorld file, `mickey.apworld`.
- Your own US revision 0 copy of Disney's Magical Mirror Starring Mickey Mouse
  (game ID **GDME01**) in `.iso` or `.gcm` format. Other regions and revisions
  are not supported. Convert an RVZ to ISO in Dolphin before patching.

## Installing the APWorld

Install `mickey.apworld` through Archipelago Launcher, or place it in the
`custom_worlds` folder of your Archipelago installation. Keep only one copy
in that folder, then restart the launcher.

## Dolphin Configuration

In Dolphin's main window, open **Graphics**, then select the **Hacks** tab.
For correct character shadows, configure the following:

1. Under **Embedded Frame Buffer (EFB)**, uncheck **Store EFB Copies to Texture Only**.
2. In the same section, uncheck **Defer EFB Copies to RAM**.
3. Under **Other**, uncheck **Disable Bounding Box** to keep bounding box emulation enabled.

Close the Graphics window when finished. These are Dolphin's global graphics
settings and may affect performance in other games.

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file tells Archipelago how to generate your game. It contains your
player name, game selection, and randomizer options. Each player in a multiworld
provides their own YAML file and can choose different settings.

### Where do I get a YAML file?

After installing the APWorld, select **Generate Template Options** in
Archipelago Launcher. Find the Disney's Magical Mirror template in
`Players/Templates`, then edit your player name and desired options.

If the template is missing, check that `mickey.apworld` is installed in
`custom_worlds`, restart the launcher, and generate the templates again.

See the [game overview](/games/Disney%27s%20Magical%20Mirror/info/en) for an explanation of
what can be randomized and how the game changes.

## Joining a MultiWorld Game

### Obtain your GC patch file

If someone else generates the multiworld, send them your YAML and obtain your
player's `.apmickey` file from the generated output or room page.

### Generating a game

For local generation, place your customized YAML in Archipelago's `Players`
folder, outside `Templates`. For a multiworld, put all participating players'
YAML files in that folder. Run **Generate** from Archipelago Launcher.

A successful generation creates a ZIP in the `output` folder. Extract your
`.apmickey` file, then select **Open Patch** in the launcher and open it.

The first time you patch, select your clean base ISO when prompted. Patching
creates a matching `.iso` beside the `.apmickey` file. If automatic startup is
enabled, select your Dolphin executable when prompted. The client opens with
your player name, and Dolphin launches the patched game.

Archipelago saves these choices under `mickey_options` in `host.yaml`:

- `rom_file`: your clean base game.
- `dolphin_path`: your Dolphin executable.
- `rom_start`: whether to launch Dolphin after patching; defaults to `true`.

Start a new in-game save for a new seed. When reopening or repatching the same
seed, load its in-game save rather than a Dolphin savestate.

### Hosting a game

Upload the generated ZIP to [Archipelago's hosting page](https://archipelago.gg/uploads)
to create a room, or host it with Archipelago Server. The room or local server
provides the address and port needed to connect.

### Connect to the Multiserver

Enter `<address>:<port>` in the connection field at the top of Mickey Client and
press Enter. For a password-protected server, enter
`/connect <address>:<port> [password]` in the command field at the bottom.
Use the player name from your YAML when prompted.

To resume later without patching again, select **Mickey Client** in the launcher
and open the patched ISO in Dolphin. The game, save, and connected player must
belong to the same seed. Items are delivered when Mickey has normal control;
wait for a trick, cutscene, or menu to finish if delivery is delayed.
