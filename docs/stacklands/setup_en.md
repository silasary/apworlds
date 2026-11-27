# Stacklands Randomizer Setup

## Required Software
- [Stacklands (e.g. Steam version)](https://store.steampowered.com/app/1948280/Stacklands/)
- [Stacklands Randomizer Mod](https://github.com/JammyGeeza/Stacklands-Randomizer/releases)

## Optional Software
- [Archipelago Text Client](https://github.com/ArchipelagoMW/Archipelago/releases)

## Installing the Stacklands Randomizer Mod (Windows)
1. Navigate to the [Stacklands Randomizer Mod Releases](https://github.com/JammyGeeza/Stacklands-Randomizer/releases) and select a release version. _(Sticking with the latest release is generally the recommended option)_
2. Download the `StacklandsRandomizer-v0.X.X.zip` file included in the **Assets** section at the bottom of the chosen release page.
3. Once downloaded, in your file explorer navigate to `%LocalAppData%low\sokpop\Stacklands\Mods`. _(You can copy this file path directly into the file explorer)_
   - _This path will typically direct you to: `C:\Users\[your user]\AppData\LocalLow\sokpop\Stacklands\Mods`_
4. Extract the contents of the `StacklandsRandomizer-vX.X.X.zip` file to this directory.
   - _Your file and directory structure should look like: `..\sokpop\Stacklands\Mods\StacklandsRandomizer\[all .dll, .json etc. files here]`_
     <img width="1352" height="495" alt="image" src="https://github.com/user-attachments/assets/8c9f0a4b-05c6-4fd7-af27-491e7520465f" />
     _NOTE: The `config.json` file in the sc will be generated when you start the game with the mod enabled._
5. Start the game and you should notice that the **Start new run** and **Continue run** options have been greyed out.
6. In the main menu, click **Mods** and you should now see **Stacklands Randomizer** in the list

### NOTE
Mods in Stacklands can be enabled/disabled by navigating to the **Mods** menu, clicking **Toggle Mods** and then clicking **Stacklands Archipelago** from the list. This means you do not need to uninstall this mod to be able to play Stacklands normally.

## Installing Stacklands Randomizer Mod (Linux)
_Guide coming soon..._

## How to Use the Mod
1. From the Main Menu, go to `Mods -> Stacklands Randomizer`.
2. Enter the server **Name and Port** _(e.g. archipelago.gg:38281)_, your **Slot Name** and the **Password** _(if required)_.
3. Click **Connect** and the game will quickly restart. Clicking the **Auto-Connect** toggle first will automatically attempt to connect with these details the next time you boot the game.
4. After the restart, if successful, the main menu box should now display `"Archipelago: Connected"`. If unsuccessful it should display `"Archipelago: Disconnected"` and display a reason.
5. Click **Start new run**. _(A new game save dedicated to the MultiWorld seed is created to keep your existing game saves safe)_.

## Archipelago Text Client
It is recommended to use the [Archipelago Text Client](https://github.com/ArchipelagoMW/Archipelago/releases) to keep track of items you have sent and received. There is currently no way in Stacklands to review the history of sent/received items. Additionally, there is currently no in-game console to use hints, so you will need to do these via the Archipelago Text Client.

### Hinting
- **Booster Pack** items will always be suffixed with " Booster Pack". E.g. `!hint Humble Beginnings Booster Pack` or `!hint On the Shore Booster Pack`
- **Idea** items will always be prefixed with "Idea: ". E.g. `!hint Idea: House` or `!hint Idea: Blunderbuss`

## Tracking
The Stacklands in-game Quest Log has been modified to show all Vanilla and Custom Quests and their completion statuses so you can track which Quests _(Locations)_ have been completed. You can remove