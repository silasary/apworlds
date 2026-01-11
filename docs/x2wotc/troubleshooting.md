# Troubleshooting

> [!IMPORTANT]
> The native Linux/Mac ports of XCOM 2 seemingly do not play nice with my mod. Use the Windows distribution instead (e.g. through Proton on Linux, Crossover or Whisky on MacOS).

## I can't launch the client

It may be that you provided an invalid XCOM 2 installation path to the client. You can change it manually by editing the `host.yaml` in your Archipelago installation folder. If this doesn't seem to be the issue, try reproducing with the debug launcher (`ArchipelagoLauncherDebug.exe`) and consult any occuring error messages.

## Nothing is happening

Check if the mod is actually loaded by looking for the version text in the bottom left corner of the main menu. If it's not there, try restarting the game and consider using [AML](https://github.com/X2CommunityCore/xcom2-launcher) if the problem persists.

## I'm getting networking errors in-game

### Request Timed Out

1. Make sure the XCOM 2 WotC AP Client (which is included in the [APWorld](https://github.com/MaxReinstadler/X2WOTCArchipelago/releases)) is running and connected to your slot in the multiworld server, then restart the game. Refer to the [Setup Guide](https://github.com/MaxReinstadler/X2WOTCArchipelago/blob/main/worlds/x2wotc/docs/setup_en.md) for further instructions.
2. It may be that the default proxy port doesn't work for you. Inspect or change the setting via the `/proxy` client command, then restart your game.

### Client Disconnected

Make sure the XCOM 2 WotC AP Client is connected to your slot in the multiworld server, then restart your game.

## I can't unlock the final mission

To unlock the final set of missions you need to complete the objective to do an avatar autopsy, this requires `[Tech] Avatar Autopsy` and `[Tech] Alien Encryption` (for the shadow chamber) as well as completing any one of the following questlines (unless some or all are required in your options, in which case you have to do those specific ones):
- Complete the Blacksite mission -> Receive `[Tech] Blacksite Vial` -> Complete the ADVENT Forge mission -> Receive `[Tech] Recovered ADVENT Stasis Suit`
- Receive `[Tech] ADVENT Officer Autopsy` -> Skulljack an officer and kill a codex -> Receive `[Tech] Codex Brain` -> Complete the Psi Gate mission -> Receive `[Tech] Psionic Gate`
- Receive `[Tech] ADVENT Officer Autopsy` -> Skulljack an officer and kill a codex -> Receive `[Tech] Codex Brain` -> Receive `[Tech] Encrypted Codex Data` -> Skulljack a codex and kill an avatar

## Reporting issues

If you've encountered an issue that wasn't mentioned here, let me know in the [Discord Thread](https://discord.com/channels/731205301247803413/1037751568700805141)! Make sure to share the versions of the APWorld (as given by the `/version` client command) and mod (as seen in the bottom left corner of the main menu) you are using, as well as the following:
- For client issues, try reproducing with the debug launcher (`ArchipelagoLauncherDebug.exe`) and attach the output. (Also read it first, it might answer your question.)
- For in-game issues, attach the relevant log file (`Documents/My Games/XCOM2 War of the Chosen/XComGame/Logs/Launch.log` by default on Windows).
