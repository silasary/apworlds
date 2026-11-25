# Dark Souls: Remastered Archipelago Randomizer Setup Guide

## Required Software

- [Dark Souls: Remastered](https://store.steampowered.com/app/570940/DARK_SOULS_REMASTERED/)
- [dsr.apworld - Dark Souls: Remastered Apworld](https://github.com/tathxo/DSAP/releases/latest)
- [DSAP.Desktop.exe - Dark Souls: Remastered AP client](https://github.com/tathxo/DSAP/releases/latest)
- [Archipelago Launcher (v0.6.7 or above REQUIRED)](https://github.com/ArchipelagoMW/Archipelago/releases/latest)

## Optional Software
- [PopTracker](https://poptracker.github.io/)
- [DSR PopTracker Pack with maps](https://github.com/routhken/Dark_Souls_Remastered_tracker/releases)
- [Matt's DS1 Enemy Randomizer](https://www.nexusmods.com/darksoulsremastered/mods/922)
- [APIconPatch.apdsr - optional ap icon patch for DSR](https://github.com/tathxo/DSAP/releases/latest)


## Setting Up

1. Download the latest APWorld (`dsr.apworld`) and DSAP Desktop Client zip (`dsr-Windows-x64.zip`) from the pages linked above.
2. Double click on the APWorld to install it to your Archipelago installation.
3. Extract the DSAP Desktop Client zip. It is recommended to not extract it to Program Files / your game install directory, due to potential read/write issues.

### Creating your Options File (yaml)
1. Install the latest Archipelago Launcher version from the page linked above.
2. Run the Archipelago Launcher and open "Options Creator" (Archipelago v0.6.5+ only). In Options Creator:
    * Select "Dark Souls Remastered", type in a player name for your slot, and edit the options to your liking.
    * Export to your Archipelago "Players/" folder (not the Templates subfolder!). This will put a yaml with your player name in that folder.

### Generating a World
1. Install the latest Archipelago Launcher version from the page linked above.
2. Place all the .yaml files you wish to generate with in the Players/ folder of your Archipelago Launcher installation.
3. Either run Generate.py or press the Generate button on the launcher to generate a seed/multiworld.
4. When this has completed, you will have a zip file in your Archipelago/Output folder.
5. Host the output zip either using the Host option on the launcher or by uploading it to Archipelago.gg

### Patching your Game for the AP Icon (optional)
To show an AP-style icon in game for AP-specific items, you can apply an optional patch. 
1. Download the latest patch file (`APIconPatch.apdsr`).
2. After you've installed the apworld, re-open the Archipelago Launcher and drag the patch file onto it. 
3. If prompted for the game executable location, find it and select `DarkSoulsRemastered.exe`.
4. It should now be patched. When you next connect with the `DSAP.Desktop.exe` client, ap items will show with the new icon.
5. If at any time you wish to _unpatch_ it, either use the "verify integrity of game files" option through steam, or open the Archipelago Launcher, and run the "Revert DSR Patch" component.
* This patch process will only work if the `menu_0.tpf.dcx` file in your install is not modified. If it _is_ modified (such as by icon-, texture-, or UI-changing mods), but you still want the icon, you can manually replace the prism stone icon with the `dsr_ap_logo.png` file from the repository (using existing DS1 modding tools).

### Running and Connecting the Game

Optional: Backup or move your existing DSR saves into another folder and label that folder appropriately.
On Windows, DSR saves can typically be found at `C:\Users\<user>\Documents\nbgi\DARK SOULS REMASTERED\88627662\DRAKS0005.sl2`

To connect _Dark Souls: Remastered_ to Archipelago:

1. Start Steam.

2. To prevent you from getting penalized, **make sure to set _Dark Souls: Remastered_ to offline mode in the in-game options.** 
  It is recommended to configure settings in System->Network Settings->Launch Setting="Start Offline", to avoid
  accidentally starting online in future sessions.  
  **WARNING: You should never connect to the FromSoft network while using this mod or its saves.
  If you are connected to the online Servers while using this mod, or with a save in which this mod was used,
  you will likely face account restrictions (bans) by FromSoft!!**

3. Connect the Client:
   Run `DSAP.Desktop.exe` that you extracted earlier from the DSAP Desktop Client zip.
   You can do this while in the main menu, while in the New Game/character creation menu, or while loaded into a (AP-specific) save.  
   
   3a. Click the top-left three-horizontal-line ("hamburger menu") icon, and fill in your connection details: host, slot, and password (if required).  
   `Host` should look like `archipelago.gg:12345`.  
   `Slot` should match the Name column (e.g. `Player1`) of your slot, as shown on the room page (which is taken from your yaml info).  
   `Password` is optional, only required if your host specified one.

   3b. With _Dark Souls: Remastered_ running, press the "Connect" button in the DSAP client. You should see the client log start to populate, and if you have the overlay option on, messages appear over your game window.  
      You can click in the DSAP client window outside of the left-hand-side menu to show the Log.  
      If you were loaded into a save, this will cause a reload of the game, as if you had used a homeward bone. This is necessary to update the items that are in the game.
      
   3c. Right-click with your mouse into your _Dark Souls: Remastered window_. 
      Avoid left-clicking, because the game may interpret that as an "accept" on whatever option is currently selected.
      This could load into a previous save, if you have the "Connect" option, or an existing save on the Load menu, selected.

   Replacing steps 3a-3c above, you could also instead copy the `/connect <hostname>:<portnumber>` text from the room and paste it into the text input field of DSAP. Then, follow the prompts to input slot name and password.  

4. Start playing as normal. You must keep the DSAP client running while you play the game for items and location to be sent and received correctly. Note that the Keys and Estus Flask in the starting Undead Asylum area are not randomized, in order to prevent early BK mode.

### Resuming Play in your 2nd session and beyond
1. The Archipelago Server will pause a Room after 2 hours of inactivity, but you can and should continue play in that same Room by refreshing the webpage, as described in the text at the top of it.  
**Your host (or you) should not create an entirely new room for a new session**, as the list of items in other games can get out of sync, causing issues.
2. The port on your room may change; if so, update your connection information when you connect with DSAP.
3. You can connect, as in step 3 above, with the updated information. Make sure you are on the correct save file, to avoid sending checks from other saves. You can connect while loaded into your save or while on the main menu.


### Before you go back online for standard non-AP play
* You must close this program, and then restart Dark Souls Remastered. 
* You should move your AP DSR saves elsewhere, and restore your original backed up saves.  
On Windows, DSR saves can typically be found at `C:\Users\<user>\Documents\nbgi\DARK SOULS REMASTERED\88627662\DRAKS0005.sl2`
* If you do not do the above, you risk loading into a save with this program's modifications still in effect, and **risk facing negative consequences by FromSoft as mentioned above.**

## Frequently Asked Questions

### What gets randomized?

See [the Game Page](./en_Dark%20Souls%20Remastered.md).

### Does this work on Linux?

Linux has preliminary support via Proton on Steam native as of release v0.1.0 of the Client.

There are two primary ways of running under Linux. 
1. First method: Add `PROTON_REMOTE_DEBUG_CMD="/full/path/to/DSAP.Desktop.exe" %command%` to your steam Launch Options to run both DSAP and DS:R in the same environment.
  * The path may require `\` (backslash) escape character before any spaces.  
  **Yes, even though it is wrapped in quotation marks.** It seems to be distro-specific on whether it is required or not.
2. Second method: Download the `launch_dsr.sh` batch file from the main directory of the repo. Put it and `DSAP.Desktop.exe` into the same folder as the `DarkSoulsRemastered.exe`. Then, add it to steam as a non-steam game, using `Proton GE Latest`, and run it.  

**Whichever method you use, please test before running this in a public or group multiworld!**  
* Steam Flatpak does not work.
* For unknown reasons, for some players the first method does not work, but the second does.
* If still unable to get it working, try closing Steam and launching it with `env -u DOTNET_BUNDLE_EXTRACT_BASE_DIR steam`
* The overlay probably will not work, and instead show a solid black box. It is recommended to toggle it off before connecting.
* Because the support has not been thoroughly tested, you should 1) consider it unstable, 2) let us know how it plays/runs (whether well or badly), and 3) Please report any issues.

### Does this work with _Prepare to Die Edition_?
No, The current release only works with Dark Souls Remastered. There may be potential to make it compatible with PTDE but not until we are feature-complete on _Remastered_, as there isn't a way to legally obtain a new copy of PTDE anymore.

### Can I use this with mods?
It depends completely on what mod it is and how it changes the game.    
Two mods we aim to keep support for are Matt's DS1 Enemy Randomizer, which is known to work, and Seamless Co-op, which works to an extent - see below for details.  
Mods that only change textures may work fine.
Overhaul mods and content changing mods will not be compatible.
Fog Gate Randomizer is known to not be compatible (logic will not work correctly).
Any other dll mods and mods that change "params" and script files, are especially likely to break.
Besides that, there is no promise or guarantee of compatibility, and you should assume they will not be, until you thoroughly test to find out otherwise.

### Can I use this to randomize enemies?
This mod will **not** randomize enemies.  
However, many players have had success with external enemy and boss randomizers. That said, we cannot guarantee they will continue to work, and that future updates won't break compatibility, though we do want to support it.  
Instructions for using Matt's DS1 Enemy Randomizer (linked above in Optional Software):
1. Follow Matt's DS1 Enemy Randomizer's instructions (in its README.txt file) for randomizing and launching the game.
2. Follow DSAP's ["Running and Connecting the Game" instructions above](#Running-and-Connecting-the-Game). This mod does not modify the game files, so it does not need to be run before Matt's DS1 Enemy Randomizer.

### Can I use this with seamless co-op?
Toleration has been added for multiple players, but not thoroughly tested. There are some known issues (see [the README](../../../README.md#Current-Known-Issues)).

As of v0.0.22.0, using the Seamless Co-op mod may work with DSAP. It has not been very thoroughly tested, and if there are any crashes or instability caused by the Seamless Co-op mod itself, we cannot do much about it. Please read the information below.
* Q: How to set it up?
  * A: **Both players should always connect with the DSAP client to the same slot** once they load into the game after creating their characters.
        This must be done before doing any checks, so it is recommended to do so **before hosting or joining** the host's session.
        On first connect, you will need to head to the Undead Asylum bonfire and get your co-op items before joining the other's session.
* Q: What items are shared?
  * A: Any items sent by other slots will be sent to both players. Any items found in your own world should also be immediately sent to both players. Any items found in your world for other worlds will be sent to the server as a check only once (even if it appears to send multiple times).
* Q: What items aren't shared?
  * A: Unrandomized items (mostly enemy drops), and the "fake" randomized item locations in DSR. The latter means that when 1 player picks up such an item, the 2nd player will still see an "item pickup" in the world, but it will be empty if they go to pick it up. This is because the server will have already sent the actual item to both players, and this is what triggers the item receive notification. Because the server will not re-send the item, there will be no notification on picking up such items on the 2nd+ time.
* Q: How does Auto-tracking Poptracker or UT work?
  * A: Autotracking "location" is sent from each player connected on the slot to the server. To make it follow one player specifically, open the "Custom Controls" panel _in DSAP_, and make sure they have "Tracker Map Tab Switching" turned _on_ (this is the default). For other players, who you do not want it to follow, turn that setting _off_.

## Troubleshooting

### Game crashes on connect
1. Check your DS:R version on the title menu. It should show the text "App ver. 1.03.1" & "Regulation ver. 1.04".
If it does not, update your game; you can force Steam to do so by Verifying Game files:
Right click game in library -> Properties -> Installed Files -> Verify integrity of game files.
2. Make sure you don't have conflicting mods installed. If you do, you may need to uninstall your game, completely remove all files from the game install folder, and reinstall the game, as Steam "verify" and uninstall/reinstall itself will not remove all mod files, so residual files can cause problems.

### DSAP client crashes on connect
1. Check your DS:R version on the title menu. It should show the text "App ver. 1.03.1" & "Regulation ver. 1.04".
If it does not, update your game; you can force Steam to do so by Verifying Game files:
Right click game in library -> Properties -> Installed Files -> Verify integrity of game files.
2. Try running DSAP.Desktop.exe as Administrator.
3. If it still crashes, try disabling your antivirus.  
If disabling antivirus fixes it, you can reduce security risk by adding an exception for DSAP specifically, instead.
4. Make sure you don't have conflicting mods installed. If you do, you may need to uninstall your game, completely remove all files from the game install folder, and reinstall the game, as Steam "verify" and uninstall/reinstall itself will not remove all mod files, so residual files can cause problems.

### "Error: Incorrect item lots detected" red error message (and more) on connect.
This is a sign that the  `[...]\DARK SOULS REMASTERED\param\GameParam\GameParam.parambnd.dcx` file was modified in a way that DSAP cannot safely manage, or that the effective game params being used for the item lots in game have been modified (e.g. if run through a mod engine).  
It is possible that you ran HPR's item randomizer in the past, and are connecting DSAP to a game instance of DSR that it randomized, or you may be running other incompatible mods.  
Steps to restore the original version of the file:
1. In your game files, delete your `param\GameParam` folder.
2. Verify Integrity of Game Files for _Dark Souls: Remastered_ via Steam.
3. _If you are using Matt's DS1 Enemy Randomizer_, you must _also_ re-run the randomization (click `Run with set Seed`); otherwise, it will use the cached Game Params based on the Item Rando params!
4. Relaunch DS:R and the client (`DSAP.Desktop.exe`), and reconnect.

### Items don't send upon picking up item locations, or show the wrong location in DSAP Log, Text Client, or Server Log upon pickup. 
Additionally, there may be more error messages and warnings on startup.
Steps to fix: 
Ensure your client is connected, and check the log for error messages.  
This shouldn't happen anymore as of v0.3.2, so if it happens anyway (for checks that are valid in your settings), please report it in the `dark-souls-remastered` channel in the AP discord.

### Not receiving items, or receiving double items.
Try running DSAP.Desktop.exe as Administrator.

### Save Corrupted (usually upon quitting to menu), and progress lost
Because DSAP modifies DS:R memory and code directly, some antivirus software may see it or DS:R as malware when running in this mode. As a result, they restrict the ability of DS:R to make its save.
Adding DSAP, DS:R, or the .sl2 save file extension type to the antivirus' exceptions list resolved the issue for at least one user who saw this issue. If this works for you, please let us know in the `dark-souls-remastered` channel in the AP discord.

### I can't walk through Fog Wall at the start of the Undead Burg!
See the [Game Page topic on Fogwall Sanity](https://github.com/tathxo/DSAP/blob/main/apworld/dsr/docs/en_Dark%20Souls%20Remastered.md#isnt-the-game-extremely-open-from-the-start-what-is-fogwall-sanity). Likely, the game expects you to go into New Londo, through which there are multiple ways to the Valley of Drakes, which itself connects to multiple other regions.

### Placing Lord Souls at Firelink Altar does not open the door
This seems to be due to not having received some number of the Lord Souls or Lordvessel. If you see this, please run the /lordvessel command, which will both provide diagnostic information & the missing items. To help us debug this issue, please provide a screenshot of the output with any additional context you can provide about the missing items to the dark-souls-1 channel in the AP discord. Additional context that would be useful includes: did the items come in while you were offline, was it with other items, etc.

### Issue not listed here
Please let us know in the dark-souls-remastered channel in the AP discord. Include any screenshots, including the output of the `/diag` command in the client.
