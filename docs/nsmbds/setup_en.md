# New Super Mario Bros. DS Archipelago Setup Guide

## Requirements

- Archipelago Client (Tested with 0.6.7 and newer)
- BizHawk Emulator **2.11.1 or newer** (Older version don't work)
- A unmodified USA copy of New Super Mario Bros. DS
- The NSMBDS `.apworld` [latest release](https://github.com/Lemix028/Archipelago-NewSuperMarioBrosDS/releases/latest) 

The APWorld contains the NSMBDS client, ROM procedure patch, and Lua runtime.
BizHawk and the original game ROM are not distributed with this project.

## Installation and seed generation

1. **Install the APWorld.** Open `nsmbds.apworld` with Archipelago and approve
   the installation. Alternatively, place it in the `custom_worlds` directory
   of your Archipelago installation. Restart Archipelago after replacing an
   older build.

2. **Generate a player template.** In `ArchipelagoLauncher.exe`, run
   **Generate Template Options**. Archipelago creates a current NSMBDS YAML
   template from the installed APWorld.

3. **Configure the YAML.** Open the generated NSMBDS YAML, set the player
   `name`, and choose the desired game options. Put the finished file in the
   Archipelago `Players` directory.

4. **Generate the seed.** Run **Generate** from the Archipelago Launcher or
   start `ArchipelagoGenerate.exe`. The generated seed output contains the
   `.archipelago` multidata and an `.apnsmbds` ROM patch for this player.

## Patch the ROM

5. In the Archipelago Launcher, open **Open Patch**. Select the generated
   `.apnsmbds` file and, when requested, select the clean original USA ROM.
   Archipelago validates the ROM and applies the seed-specific patch.

6. After patching, a same-named `.nds` seed ROM is created next to the
   `.apnsmbds` file. Always play this patched `.nds`; do not launch the clean
   source ROM.

## Launch and connect

7. Open **NSMBDS Client** from the Archipelago Launcher and switch to the
   **Launch Game** tab. Select:

   - `EmuHawk.exe` from the BizHawk installation;
   - the patched `.nds` seed ROM created in step 6.

   The bundled Lua bootstrap is installed and selected automatically. Its
   status and resolved path are shown in the same tab. The normal Windows path
   is:

   ```text
   C:\ProgramData\Archipelago\nsmbds\lua\nsmbds_bizhawk_bootstrap.lua
   ```

8. Click **Launch NSMBDS**. BizHawk starts with the patched ROM and Lua
   bootstrap. After one successful setup, you may enable
   **Automatically launch when the NSMBDS Client starts** at the bottom of the
   tab.

   **Important:** Keep the BizHawk Lua Console open while playing. You may 
   minimize it, but closing it will stop the Lua script.

9. In the NSMBDS Client, switch to the **Archipelago** tab. Enter the server
   address, then click **Connect**, enter slot name, and optional password.

10. Wait until both the Archipelago connection and the BizHawk connection are active. 
   The Emulator Feed in the bottom-right corner of BizHawk should show both connection messages:

   ```text
   NSMBDS Client connected to BizHawk.
   NSMBDS Client connected to the Archipelago server.
   ```
   Then load or create an in-game save.
   
   **Have fun playing!**


## Manual BizHawk launch

The **Launch Game** tab is recommended, but the same components can be started
manually:

1. Start `EmuHawk.exe`.
2. Load the patched `.nds` seed ROM.
3. Open **Tools > Lua Console** in BizHawk.
4. Load Lua Script **Script > Open Script**:

   ```text
   ...\Archipelago\nsmbds\lua\nsmbds_bizhawk_bootstrap.lua
   ```

5. Keep the Lua script running, open NSMBDS Client, and connect to the correct
   Archipelago slot.

Opening the **Launch Game** tab once materializes the bundled Lua files and displays the
exact path.

## Verify the original ROM

Before patching, you can check the ROM's MD5 hash in PowerShell with this simple
command:

```powershell
Get-FileHash -LiteralPath "New Super Mario Bros. (USA).nds" -Algorithm MD5
```

The compatible USA ROM must report the MD5 hash `A2DDBA012E5C3C2096D0BE57CC273BE5`.
The patcher performs the same validation when you select the ROM.
