# Metroid: Samus Returns setup

## Requirements

The following are required to play *Metroid: Samus Returns* in Archipelago:

* [Archipelago](https://github.com/ArchipelagoMW/Archipelago)
* [Azahar Emulator](https://azahar-emu.org/) or a
[modified 3DS with Luma3DS](https://3ds.hacks.guide/).
* A North American or European *Metroid: Samus Returns* ROM file.
  * You can use [GodMode9](https://3ds.hacks.guide/dumping-titles-and-game-cartridges.html) to dump
  your copy of the game.
  * Only decrypted formats are supported.

## APWorld installation

1. Download the [latest release](https://github.com/lilDavid/AP-SamusReturns/releases/latest) of the
world.
2. In the Archipelago Launcher, select "Install APWorld", and then select the `msr.apworld` file
you downloaded.

## Setting up an options file

All players must provide the room host with a YAML file containing the options for their game. A
sample YAML file for *Metroid: Samus Returns* is supplied with the APWorld download, but you can
also generate one by selecting "Generate Template Options" in the Archipelago Launcher. You may
instead create an options file visually using the Options Creator tool in the Archipelago Launcher.
The Options Creator as well as the comments in the sample YAML file provide details about what each
option does.

Once complete, provide the person generating with your YAML file.

## Generating a multiworld

As usual, randomized games involving custom worlds must be generated locally. See the
[Archipelago setup guide](https://archipelago.gg/tutorial/Archipelago/setup_en#generating-a-game)
for details.

## Hosting a room

If you're generating the multiworld, follow the instructions in the previous section. Once you have
the zip file for your multiworld, follow the
[Hosting section](https://archipelago.gg/tutorial/Archipelago/setup_en#hosting-an-archipelago-server)
of the Archipelago setup guide to host a room.

## Starting the game and connecting to a room

You should have the `.apmsr` patch file provided by the multiworld generator. You should also have
the room's server name and port number from the multiworld's host.

Once you do, follow these steps to connect to the room:

1. In the Archipelago Launcher, select "Open Patch File," then select the `.apmsr` patch file.
2. If this is your first time, you will be prompted for an input `.3ds/.cci` file. Select your
*Metroid: Samus Returns* ROM file.
3. The client will open and show a black screen for a little while.
4. When the patching process finishes, a folder with the same name as your patch will appear, and
in it will be a folder called `00040000001BB200` or `00040000001BFB00`. Copy this to the mods
folder for your emulator or 3DS, replacing the folder that's already there if one exists.
   * If you're playing on Azahar, you can open the location to copy to by right clicking the ROM in
  the menu, then hovering "Open" and selecting "Mods Location."
   * If you're playing on a 3DS, copy this to your SD card > `luma` > `titles`.
6. Launch the game.
   * On Azahar, this will just work. It will run the patched game out of the box.
   * On a 3DS, you have to enable game patching:
     1. Turn the console on while holding Select to open the Luma configuration menu.
     2. Use the A button and D-pad to select `Enable game patching`. If turned on, the option will
     start with `(x)` instead of `( )`.
     3. Press Start to save and reboot.
     4. The client will need your 3DS's local IP address to connect to it. You can find it by
     opening the Homebrew Launcher and pressing the Y button.
     5. Once you know your 3DS's IP address, you can launch *Metroid: Samus Returns* from the Home
     menu.
     6. Then type `/console_ip <ip>` into the Samus Returns Client to set your 3DS's IP address
7. Once the game is running, connect the Samus Returns Client to the room by entering the server
name and port number at the top and pressing "Connect." For rooms hosted on the website, this will
be `archipelago.gg:<port>` where `<port>` is the port number. If a game is hosted from the
ArchipelagoServer program or the "Host" option in the Launcher, the port will default to 38281 but
may be changed in the `host.yaml` file.

> [!TIP]
> **Optional**
>
> If you're playing on Azahar and want double-clicking the `.apmsr` patch file to automatically
> install the patch and open your game for you:
>
> 1. Navigate to your Archipelago installation (or select "Browse Files" in the Launcher) and edit
> the `host.yaml` file.
> 2. Scroll down to the `msr_options` header.
> 3. Set the `user_path` setting under the `emulator_settings` header to the location of your Azahar
> folder. You can open Azahar and select "Open User Folder" in the File menu, then copy the path
> from your file browser.
> 4. Set `rom_start` to true to automatically start the emulator if Azahar is already
> associated with `.cci` files. Otherwise, you can set it to the path to your Azahar program.
>
> If you're playing on a 3DS and want double-clicking the `.apmsr` patch file to automatically
> connect to your system and/or install the patch for you:
>
> 1. Navigate to your Archipelago installation (or select "Browse Files" in the Launcher) and edit
> the `host.yaml` file.
> 2. Scroll down to the `msr_options` header.
> 3. Set the `ip_address` setting under the `console_settings` header to your 3DS's IP address.
> 4. If you want to automatically install the randomizer files, you can set the `sd_path` setting
> to the root of your SD card. Your mileage may vary, as the SD card may be mounted to a different
> location on subsequent runs. You will be prompted for a new path if the one written here doesn't
> exist, however.
> 5. Change the `target_system` setting from `"emulator"` to `"console"`.

## Troubleshooting

### General troubleshooting tips

* Use the latest version of Archipelago, the APWorld, and Azahar/Luma3DS.
  * [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/tag/0.6.6)
  * [Samus Returns APWorld](https://github.com/lilDavid/AP-SamusReturns/releases/)
  * [Azahar](https://azahar-emu.org/pages/download/)
  * [Luma3DS](https://github.com/LumaTeam/Luma3DS/releases)

### Connection troubleshooting

* I have the game open, but the Samus Returns client says it can't connect to it!
  * Make sure the game is randomized
    * The randomized game adds a "RANDOMIZER" subtitle to the title screen
    * On Azahar, right click your Samus Returns game and select "Mods Location" under the "Open"
    hover menu. Verify there's a folder called `00040000001BB200` or a folder called `romfs` and
    files called `code.bin` and `exheader.bin`.
    * On 3DS, open your SD card and navigate to `luma`, then `titles`. Verify there's a folder
    called `00040000001BB200`.
  * Make sure the client is trying to connect to the right IP address.
    * On Azahar, type `/console_ip` into the Samus Returns Client and verify that the result is
    `localhost`.
    * On 3DS:
      * Verify you're connected to the same network as your computer.
      * Open the Homebrew Launcher and press Y, and type `/console_ip` into the Samus Returns
      client. Ensure they match.

### In-game troubleshooting

* The game froze!
  * This is a known problem and appears to happen at random. I'm currently investigating why this
  happens and how to avoid it. It seems to happen most often when the game is loading something.
  * Save often to minimize the effect when it happens.
  * It should be enough to restart Azahar if you're playing on it, or to close and reopen the game
  from the Home menu if you're playing on a 3DS.
* I connected to the game and started a file, but the game is just showing a black screen!
  * This is a downstream effect from the problem above. Try disconnecting from the multiworld
  server, restarting the game as above, then reconecting once you're in game.
