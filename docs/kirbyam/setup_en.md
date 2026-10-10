# Kirby & The Amazing Mirror Setup Guide

## Required Software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases)
- A USA Kirby & The Amazing Mirror ROM. The Archipelago community cannot provide this.
- [BizHawk](https://tasvideos.org/BizHawk/ReleaseHistory) 2.7 or later
- Alternatively, the **draft mGBA integration** below, with current runtime acceptance still outstanding.

### Configuring BizHawk

Once you have installed BizHawk, open `EmuHawk.exe` and change the following settings:

- If you're using BizHawk 2.7 or 2.8, go to `Config > Customize`. On the Advanced tab, switch the Lua Core from
`NLua+KopiLua` to `Lua+LuaInterface`, then restart EmuHawk. (If you're using BizHawk 2.9+, you can skip this step.)
- Under `Config > Customize`, check the "Run in background" option to prevent disconnecting from the client while you're
tabbed out of EmuHawk.
- Open a `.gba` file in EmuHawk and go to `Config > Controllers…` to configure your inputs. If you can't click
`Controllers…`, load any `.gba` ROM first.
- Consider clearing keybinds in `Config > Hotkeys…` if you don't intend to use them. Select the keybind and press Esc to
clear it.
- Kirby & The Amazing Mirror uses Bizhawks Message system to indicate items sent & received in addition to the Archipelago Bizhawk client. As a result of this we recommend increasing the amount of time these messages stay on screen for you to read to your preferred duration. This can be updated by going to Config > Messages within Bizhawk and changing the setting for "Messages fade after X seconds."

## Generating and Patching a Game

1. Create your options file (YAML).
2. Open `ArchipelagoLauncher.exe`. If someone else is generating the multiworld, continue to step 6.
3. As this is a custom world, you will need to generate the multiworld locally. To do this, place your YAML files in the `Players` folder.
4. Once this is done select open next to the `Generate` option within the Archipelago Launcher. This will open a terminal and take a few moments to generate the multiworld. 
5. If there are no issues you'll see a new `.zip` file within the `output` folder of your Archipelago directory. You can take that file and upload it to [Archipelago](https://archipelago.gg/uploads) to host your world.
6. Your host, will send you a link to your room, find your name and click the `Download Patch File` text in the same row. After the download is complete you should see your patch file will have the `.apkirbyam` file extension.
6. In the Archipelago Launcher, select the "Open Patch" option and select your patch file.
7. If this is your first time patching, you will be prompted to locate your vanilla ROM.
8. A patched `.gba` file will be created in the same place as the patch file.
9. On your first time opening a patch with BizHawk Client, you will also be asked to locate `EmuHawk.exe` in your BizHawk install.

If you're playing a single-player seed and you don't care about autotracking or hints, you can stop here, close the
client, and load the patched ROM in any emulator. However, for multiworlds and other Archipelago features, continue
below using your selected emulator and its connector.

## Connecting to a Server

By default, opening a patch file will do steps 1-5 below for you automatically. Even so, keep them in your memory just
in case you have to close and reopen a window mid-game for some reason.

1. Kirby & The Amazing Mirror uses Archipelago's BizHawk Client. If the client isn't still open from when you patched your game,
you can re-open it from the launcher.
2. Ensure EmuHawk is running the patched ROM.
3. In EmuHawk, go to `Tools > Lua Console`. This window must stay open while playing.
4. In the Lua Console window, go to `Script > Open Script…`.
5. Navigate to your Archipelago install folder and open `data/lua/connector_bizhawk_generic.lua`.
6. The emulator and client will eventually connect to each other. The BizHawk Client window should indicate that it
connected and recognized Kirby & The Amazing Mirror.
7. To connect the client to the server, enter your room's address and port (e.g. `archipelago.gg:38281`) into the
top text field of the client and click Connect.

Healthy startup indicators:
- Lua Console prints `Client Connected`
- BizHawk Client recognizes Kirby & The Amazing Mirror without repeated disconnect spam.

First troubleshooting checks:
- Confirm BizHawk is running a Kirby & The Amazing Mirror USA GBA ROM before launching the connector.
- If the BizHawk Client says no handler was found, make sure you opened the patched KirbyAM ROM rather than the clean base ROM.
- If the Lua Console reports the wrong ROM/system, reload the correct ROM and rerun `connector_bizhawk_generic.lua`
- If the connector starts but the BizHawk Client does not attach, verify the Lua Console window remains open.

You should now be able to receive and send items. You'll need to do these steps every time you want to reconnect. Saved physical chest checks can recover when you reconnect. Save in-game before closing;
progress or asynchronous items not yet saved may require replay. Keep each seed/team/slot
on a fresh, isolated native save; do not share saves or savestates between seeds.


## Standalone mGBA (draft v0.4.0 integration)

This candidate uses the same **Archipelago BizHawk Client** application. Current
mGBA connection, gameplay, save/reload and goal acceptance is still outstanding;
no current version/platform combination is certified yet. A ROM boot alone does
not prove AP integration works. BizHawk setup above remains available.

1. Use mGBA 0.10.0 or newer **with Tools > Scripting**, Lua and built-in sockets.
2. Install the KirbyAM APWorld containing this integration and restart the
   Archipelago Launcher. Select **KirbyAM mGBA Client**. This is an opt-in Launcher
   component; opening `.apkirbyam` through the existing Open Patch association
   still uses the unchanged BizHawk workflow.
3. In the patch picker, select your `.apkirbyam`, or cancel to connect without
   patching. From a source checkout you can instead run
   `python -m worlds.kirbyam.mgba_launcher path/to/seed.apkirbyam`.
   From the Launcher CLI use
   `ArchipelagoLauncher "KirbyAM mGBA Client" -- path/to/seed.apkirbyam`.
   The Kirby-specific launcher validates and patches the ROM, then prints its path.
   It does not launch an emulator or change global emulator settings.
4. The launcher exports its bundled Lua adapter and MIT notices alongside AP's
   existing `base64.lua` and `json.lua`, and prints the exported script path.
   The default directory is `kirbyam/mgba-connector` under Archipelago's user-data
   location (which can be its writable installation directory). To choose a
   directory, pass `--connector-dir path/to/connector` to the world launcher.
   Different existing files are never replaced: use a fresh directory when
   upgrading. The adapter is bundled inside the APWorld, so no shared AP source
   edits or global `rom_start` changes are needed. See
   [provenance and limitations](https://github.com/hasherwi/Archipelago-kirbyam/blob/codex/v040-mgba-support/worlds/kirbyam/mgba/README.md).
5. Put the patched ROM in a fresh directory unique to this seed/team/slot. Configure
   mGBA's save/state directory there; do not reuse player saves or states from another
   seed. Verify the save destination before playing.
6. Open the patched `.gba` in mGBA. In **Tools > Scripting**, use
   **File > Load script** to load the exported `connector_bizhawkclient_mgba.lua`
   at the path printed by the launcher.
7. Keep the scripting window and game running. Look for the connector's loopback
   listening message and `Connected (mGBA protocol 1)`, followed by Kirby ROM
   validation in the client. Connect the client to the AP room normally.

Only run one mGBA connector at a time; close competing BizHawk connectors too.
The world launcher announces mGBA mode. Shared transport messages still use the
name BizHawk; protocol 1 cannot independently identify the emulator.

### Known limitation: mGBA notification display

The current v0.4.0 mGBA adapter displays item notices as plain text in the
**Archipelago Connector** panel in **Tools > Scripting**, not over the game image.
Keep that scripting panel visible to see these notices while playing. This path
has no item colors, icons, configurable screen position or timed fade, and does
not provide the same in-game OSD behavior as the BizHawk connector.

Normal AP server messages still appear separately in the Archipelago client/log.
That log is not a guaranteed replay of a missing item-delivery notice. This is a
limitation of this integration, not a claim about every mGBA version or its possible
overlay capabilities. The approved mocked harness verified the text-print call;
notification appearance in the real mGBA GUI remains untested.

### mGBA troubleshooting

If `base64`/`json` cannot be found, check the three Lua files are together. A missing
Scripting menu means the build lacks the required interface. A version mismatch
means the wrong connector was loaded. Wrong ROM/patch metadata errors require the
correct freshly patched USA ROM. If disconnected, unpause emulation, close the old
script/client connection, then reload the script and reconnect. Do not open router
ports: the emulator interface is local only, on 127.0.0.1 ports 43055–43059.

For bug reports include emulator/build version, OS, APWorld/client revision,
connector revision and relevant logs, without ROM bytes, saves or auth tokens.
The developer acceptance checklist covers item receipt, physical checks, reconnects,
all native save slots, isolation and Dark Mind/credits goal reporting.
