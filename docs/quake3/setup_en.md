# Quake III Arena Multiworld Setup Guide

## Required software

- Windows x64 and the matching Quake III Arena AP client and `quake3.apworld`
  from the same release. Vulkan is the default; OpenGL is also included.
- Your own Quake III Arena installation, including `baseq3/pak0.pk3` and the
  1.32 point-release `pak1.pk3` through `pak8.pk3`.
- Archipelago 0.6.8 or later for installing the world and generating/hosting a
  seed. This release is tested with 0.6.8. The game connects directly to the
  server; a separate Text Client is optional.
- For `cpma: true`: CPMA **1.53**, including `cpma/z-cpma-pak153.pk3`, and map
  packs for any selected CPMA maps. Other versions are not supported by the
  version-specific integration.
- Microsoft Visual C++ v14 x64 Redistributable for the MSVC client/runtime DLLs.

Retail data and CPMA are not included. This integration is for one local human
playing against bots, not multiple human players on one Quake server. Each
Archipelago slot runs its own game.

## Install the client

1. Extract `Quake3-AP-*-windows-x64.zip` into a new, writable folder.
2. Create `baseq3` beside `quake3e.x64.exe`, and copy your own retail PK3 files
   into it, not into `q3ap`.
3. For CPMA, copy the mod into `cpma` beside `baseq3`. Put map PK3s in `baseq3`.
   Leave the supplied `cpma-ap` directory separate; it contains the AP UI and
   marker assets, not a replacement CPMA game QVM.

```text
Quake3-AP/
  quake3e.x64.exe
  quake3e_vulkan_x86_64.dll
  quake3e_opengl_x86_64.dll
  ... runtime DLLs supplied in the ZIP ...
  launch-client.ps1
  launch-cpma-ap.ps1
  q3ap-launch.cmd
  cpma-ap-launch.cmd
  baseq3/                 Your retail PK3s and optional CPMA map PK3s
  q3ap/                   Supplied AP game/UI and marker assets
  cpma/                   Your CPMA 1.53 installation (optional)
  cpma-ap/                Supplied AP UI and marker assets for CPMA
```

If Quake III requests a CD key, enter the key from 
your physical/digital copy in the in-game CD Key screen.

## Install the APWorld and generate a seed

1. Install `quake3.apworld` through Archipelago's **Install APWorld** launcher
   component, or place it in `custom_worlds`.
2. Run **Generate Template Options** in the archipelago launcher. 
3. Configure the template YAML and submit it to the multiworld host, or put it in
   Archipelago's `Players` directory for local generation. 
   The generator also needs this APWorld installed.
4. Host the file from the output folder. Obtain its
   hostname, port, slot name, and optional room password.


To play those stock maps with CPMA movement and bots, change only `cpma` to
`true` and use the CPMA launcher. To select CPMA maps, enable keys in
`cpma_maps`. Use `q3_maps: {}` for a CPMA-map-only seed. `map_pool_size` is
clamped to the number of enabled maps; `0` uses every enabled map. For example,
requesting 60 with all 26 baseq3 maps enabled selects all 26.

See the game information page for pickup percentages, logic, and goals.

## Connect and play

1. Run `q3ap-launch.cmd` for `cpma: false`, or `cpma-ap-launch.cmd` for `cpma: true`.
   Both start windowed with Vulkan. The corresponding PowerShell scripts `launch-client.ps1` 
   and `launch-cpma-ap.ps1` accept `-Renderer opengl` for the fallback renderer.
2. Select **Singleplayer** in the main menu to open the Archipelago menu.
3. Enter the hostname **without the port** in Host, the port in Port, and the
   exact YAML slot name. Use `127.0.0.1` or `localhost `for a server on this PC.
4. Enter the room password if needed and select **Connect**. Wait for
   authentication and complete slot data.
   The stage menu opens automatically when ready.
5. Select an unlocked stage. The menu displays access, logic status, and check progress.
   The in-game `AP: X/Y` HUD counts checks in the current stage.

Use Disconnect before changing connection details. 
Reconnecting restores the server's acknowledged checks and received items.
Checks queued during a temporary disconnect live in the running client:
reconnect before closing if any checks are still pending.

Host, port, and slot are saved as `ui_apHost`, `ui_apPort`, and `ui_apSlot`.
Passwords are kept in menu memory, not in a config. Optional defaults can go
in `q3ap/autoexec.cfg` or `cpma-ap/autoexec.cfg`:

```text
seta ui_apHost "127.0.0.1"
seta ui_apPort "38282"
seta ui_apSlot "Ranger"
```

## Useful console settings

Open the console with the console-toggle key (usually `~`). Console input may
use a leading `/`; omit it in config files.

| Setting / command | Default | Effect |
| --- | --- | --- |
| `automap` | On | Toggle AP box markers; also available in the keybind menu. |
| `ap_show_respawntimer` | `1` | Show respawn countdowns while automap is on. |
| `ap_show_all_respawns` | `0` | `1` shows respawn timers for all pickups. |
| `ap_minrespawntimer` | `20` | Minimum respawn timer for it to show; `0` shows all respawns. |
| `ap_timer_throughwalls` | `1` | `0` hides timer text when out of view. |
| `ap_chat_messages` | `0` | `1` routes AP notifications through the in-game chat area. |
| `ap_progression_sound` | `1` | Plays a chat sound when receiving progression items. |
| `ap_minnotify` | `0` | `0`: filters what items get shown in console/chat. 
`0`: all, `1`: hide filler; `2`: hide filler and useful-only items. |
| `ap_say <message>` | — | Send AP chat or a `!hint` request. |
| `ap_status` | — | Print connection and seed status. |

Progression and trap notifications remain visible at every filter setting.
Checked-location markers disappear. Timers use the scheduled respawn, not the
time since you looked at the item; `<=` denotes an estimate. 
The client README contains the full custom-cvar table.

### Bot difficulty

Difficulty is local, not a YAML option. `g_spSkill` sets the base skill for
AP-launched bots. Stock Q3 uses skills 1–5, CPMA extended skills use 6–100.
For example, use `g_spSkill 80` for CPMA. `cg_skillspread` (default `10`)
varies each AP-spawned bot around g_spSkill skill: 
`0` disables variation, `10` changes it by +/- a random value from 0 to 10. 
`cg_maxskill` (default `100`) caps the skill + skillspread. 
Changes affect the next stage's bots, not bots already active.

## Troubleshooting

- **Catalogue hash mismatch / incomplete slot data:** match the client and
  APWorld releases and generate a new seed after catalogue/schema changes.
  Rehosting an old seed does not update its slot data.
- **Disconnected:** check the running server, port, slot, and password.
  The Quake server port is not the Archipelago port.
- **Missing map/assets:** check the retail files and required CPMA/map PK3s.
- **CPMA mismatch:** enable `cpma` in the seed, use its launcher and CPMA 1.53.
  Do not replace the CPMA QVM with a native baseq3 game DLL.
- **No pickup check:** it must be selected, unchecked, unlocked, and actually
  spawned. A box can remain while the item waits to respawn. Dropped weapons
  are not locations. Full health/armor does not prevent checking an otherwise
  eligible spawned pickup.
- **A shared powerup spot stays checked when its powerup changes:** it is one
  AP location, not a different check for every possible powerup.
