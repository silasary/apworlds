# Install and connect

## Before you start

- Install DOOM Eternal through Steam. Install The Ancient Gods if your room uses
  DLC missions, equipment or enemies.
- Download the DOOM Eternal Archipelago release that matches the room's APWorld.
  Extract the whole archive into its own folder. Keep `client/` beside the launcher.
- Have the room's server address, player name and password, if required.
- Close DOOM Eternal during mod installation, updates and repairs.

The launcher installs Sentinel Core and downloads the mod installer after asking
for your consent. It checks downloaded files before using them. A local development
package can include a separate Core folder: select its `distribution.json` with
**HELP → LOCAL CORE…** before setup. Keep that folder intact.

If you have Meathook's `XINPUT1_3.dll` in the game folder, keep a backup and move
that known Meathook file out before setup. For a file from another mod, follow that
mod's uninstall instructions. The launcher preserves files it cannot identify.

## Get an AP room

If someone has already generated and hosted your room, go to [Join the room](#join-the-room).

To create one:

1. Open `doometernal.apworld` with Archipelago Launcher and restart Archipelago Launcher.
2. Open `DoomEternalArchipelagoLauncher.exe` on Windows, or
   `DoomEternalArchipelagoLauncher` on Linux. Choose **CREATE PLAYER**.
3. Enter your player name, choose options and save the player YAML.
4. Generate and host a room using that YAML in Archipelago, or give it to your host.

Use the APWorld bundled with this release. The room fixes your campaign options
during generation; editing your YAML afterward does not change a running room.

## Join the room

1. Open the DOOM launcher and choose **JOIN ROOM**.
2. Confirm the detected game and save folders. Use **CHOOSE GAME FOLDER** and
   **BROWSE** if detection fails. Select the installation containing `DOOMEternalx64vk.exe`.
3. Enter the server address, player name and optional password, then connect.
4. Wait for **SESSION** to show your player and room. If it requests setup,
   choose **INSTALL ROOM PACKAGE** or **UPDATE ROOM PACKAGE**.

The launcher prepares a mod for this room and your player. Do not copy a mod from
another room, even if its options look the same.

## Windows installation

1. Approve the EternalModInjector download, or select a verified local copy when prompted.
2. Wait for the injector command window. Complete its prompts and close it after
   it reports a successful installation.
3. Return to the launcher and confirm that installation succeeded.
4. Wait for **SETUP READY**. Start DOOM Eternal through Steam and keep the launcher open.
   Choose the normal game launch, not Steam's **Play DOOM Eternal with mods** option.

The launcher places the room mod in the game's `Mods/` folder and installs the
matching `sentinel_core.dll` and `msimg32.dll`. You do not need to copy DLLs by hand.
If automatic installation fails, use the manual steps below.

### Windows manual installation

1. Open the [Windows EternalModInjector page](https://gamebanana.com/tools/7475).
   Download the installer version requested by the launcher.
2. Extract its contents into the DOOM Eternal installation folder.
   `EternalModInjector.bat` and `EternalModManager.exe` belong beside the game executable;
   its supporting files belong in `base/`. Do not put the installer ZIP in `Mods/`.
3. Let the launcher prepare and stage your room mod in `Mods/`.
4. Set `:AUTO_LAUNCH_GAME=0` in `EternalModInjector Settings.txt` so installation
   finishes before the game starts.
5. Run `EternalModInjector.bat`, complete its prompts and wait for success.
6. Return to the launcher. Choose **I COMPLETED MANUAL INSTALLATION** and confirm.
7. Wait for **SETUP READY**, then start the game through Steam.

## Linux / Steam / Proton installation

Run the Linux launcher outside Proton. Steam runs the Windows game inside Proton.

1. In Steam, choose the Proton version under **DOOM Eternal → Properties → Compatibility**.
2. If detection fails, use **JOIN ROOM → PROTON EXECUTABLE → BROWSE** and select
   that version's file named `proton`.
3. Approve the EternalModInjectorShell download or supply a verified local copy.
   Complete the installer prompts and confirm success.
4. In **SESSION**, copy the Steam launch option into
   **DOOM Eternal → Properties → Launch Options**. It has this form:

   ```text
   WINEDLLOVERRIDES="msimg32=n,b" "/absolute/path/to/client/run_bridge.sh" %command%
   ```

5. Check that the path points to the extracted release's `client/run_bridge.sh`.
   Wait for **SETUP READY** and start DOOM Eternal through Steam.

Proton Experimental often stores `proton` under
`~/.local/share/Steam/steamapps/common/Proton - Experimental/`.
GE-Proton installations often use `~/.local/share/Steam/compatibilitytools.d/`.
Use the version selected in Steam. This candidate still needs testing on a real
Linux/Proton installation.

## Start, stop and resume

Wait for the launcher to finish preparing the AP save before starting the game.
Disable tutorials in the game settings and use the campaign prepared for your connected player. Check **SESSION** for the
game connection and item activity after loading a level.

Exit DOOM Eternal normally before disconnecting. On your next session, choose
**RESUME**, enter the room password if asked, and wait for setup checks before
starting the game. Use one launcher/bridge for each game profile.

Use **AP SAVE…** to inspect or back up the room's AP campaign. Do not replace it
with a save from another room. See [Gameplay and options](https://github.com/snowzzrra/DoomEternal-AP-Mod/blob/main/docs/GAMEPLAY.md) for inventory recovery.

**Details / Copy details** shows the room's metadata and native save paths, including
missing or inaccessible files. **Back up local files** copies available files for
this room with DOOM closed and verifies the archive. **Create backup** requires an
active AP game session. **Restore compatible backup** accepts a matching backup.
**New DOOM save in this room** requires confirmation and a verified local backup;
server progress stays intact. A local file copy does not verify that DOOM can load it.

## Fix a problem

| Problem | What to do |
|---|---|
| Cannot connect | Check the server address, player name and password with the host. Use the player name from generation. |
| Game or saves not found | Browse to the Steam game installation and its Windows save directory, or the save directory inside the selected Proton prefix. |
| Setup requests an update | Close DOOM and choose **UPDATE ROOM PACKAGE**. Check that the host generated with the matching APWorld. |
| Core missing or mismatched | Close DOOM. Open **HELP → REPAIR CORE**. For a local candidate, choose its `distribution.json` with **LOCAL CORE…** first. |
| Installer failed | Read the installer window's error, close DOOM and retry. On Windows, follow the manual installation steps if download or automation fails. |
| Game starts but does not connect | Keep the launcher open and connected. On Proton, check the copied Steam launch option. Run **HELP → CHECK SETUP**. |
| AP save needs attention | Close DOOM. Open **AP SAVE…** and inspect the reported problem or restore a matching backup before retrying. |
| An item seems missing | Load a level, choose **RESYNC INVENTORY**, return to DOOM and unpause. See the gameplay guide. |

If the problem continues, use **HELP → SAVE SUPPORT REPORT** or **Report a Problem**.
Reports exclude save contents and redact secrets; review the report before sharing it.
**FIX SETUP** previews the repairs it can apply. **UNINSTALL MOD** removes the room mod;
keep backups before changing a working installation.
