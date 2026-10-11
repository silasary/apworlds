# Troubleshooting

> [!IMPORTANT]
> The native Linux/Mac ports of XCOM 2 seemingly do not play nice with my mod. Use the Windows distribution instead (e.g. through Proton on Linux, Crossover or Whisky on MacOS).

## I can't launch the client

This can happen due to a breaking version mismatch between Archipelago and Universal Tracker. Remove `tracker.apworld` from your `custom_worlds` folder, restart the Archipelago Launcher and try launching the XCOM 2 WotC AP Client again. If this works, the problem can most likely be fixed by updating either [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) or [UT](https://github.com/FarisTheAncient/Archipelago/releases?q=tracker).

## Nothing is happening

Check if the mod is actually loaded by looking for the version text in the bottom left corner of the main menu. If it's not there, try restarting the game and consider using [AML](https://github.com/X2CommunityCore/xcom2-launcher) if the problem persists.

## I'm getting networking errors in-game

Make sure the XCOM 2 WotC AP Client (which is included in the [APWorld](https://github.com/Snyax/Archipelago/releases)) is running and connected to your slot in the multiworld server, then restart the game. Refer to the [Setup Guide](https://github.com/Snyax/Archipelago/blob/main/worlds/x2wotc/docs/setup_en.md) for further instructions.

## I can't unlock the final mission

To unlock the final set of missions, you need to complete the objective to do an Avatar autopsy. This requires `[Tech] Avatar Autopsy` and `[Tech] Alien Encryption` (for the shadow chamber) as well as completing any one of the following questlines (unless some or all are required in your options, in which case you have to do those specific ones):
- Complete the Blacksite mission -> Find `[Tech] Blacksite Vial` -> Complete the ADVENT Forge mission -> Find `[Tech] Recovered ADVENT Stasis Suit`
- Find `[Tech] ADVENT Officer Autopsy` -> Skulljack an officer and kill a codex -> Find `[Tech] Codex Brain` -> Complete the Psi Gate mission -> Find `[Tech] Psionic Gate`
- Find `[Tech] ADVENT Officer Autopsy` -> Skulljack an officer and kill a codex -> Find `[Tech] Codex Brain` -> Find `[Tech] Encrypted Codex Data` -> Skulljack a codex and kill an avatar

## Reporting issues

If you've encountered an issue that wasn't mentioned here, let me know in the [Discord thread](https://discord.com/channels/731205301247803413/1037751568700805141)! Make sure to share the versions of the APWorld (as given by the `/version` client command) and mod (as seen in the bottom left corner of the main menu) you are using, as well as the following:
- For client issues, try reproducing with the debug launcher (`ArchipelagoLauncherDebug.exe`) and attach the output. (Also read it first, it might answer your question.)
- For in-game issues, attach the relevant log file (`Documents/My Games/XCOM2 War of the Chosen/XComGame/Logs/Launch.log` by default on Windows).
