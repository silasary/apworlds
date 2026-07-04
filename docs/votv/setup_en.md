# Voices of the Void

## Required Software

- [Voices of the Void](https://mrdrnose.itch.io/votv), version 0.9n.
- UE4SS, the mod framework used for the client. The mod requires the [experimental version](https://github.com/UE4SS-RE/RE-UE4SS/releases/tag/experimental-latest) to work correctly. Instructions on installation are [here](https://docs.ue4ss.com/dev/installation-guide.html#method-1---basic-install).
    - If you are on Linux using Wine or Proton, you might also need to use the following launch command for UE4SS to be injected correctly: `WINEDLLOVERRIDES="dwmapi.dll=n,b" %command%`.
- The [client mod](https://github.com/Nathan-R-Og/Archipelago/releases/tag/votv-v0.3.0). Download it and extract it into your UE4SS Mods folder.
    - Your final setup should look like `WindowsNoEditor/VotV/Binaries/Win64/ue4ss/Mods/votv_ap-main`, which contains a folder named Scripts and a file named enabled.txt
- The built-in Archipelago client, which can be installed [here](https://github.com/ArchipelagoMW/Archipelago/releases).

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains a set of configuration options which provide the generator with information about how it should
generate your game. Each player of a multiworld will provide their own YAML file. This setup allows each player to enjoy
an experience customized for their taste, and different players in the same multiworld can all have different options.

### Where do I get a YAML file?

You can customize your options by visiting the [Voice of the Void Options Page](/games/Voices%20of%20the%20Void/player-options).

### Connect to the MultiServer

0. When generating the multiworld, make sure your slot name does not contain any spaces.

1. Start a brand new save in Story Mode.
    - If the YAML has the funny setting enabled, make sure to enable it in your save too (the mod will warn you if you forget).
    - If you want to get more events, you can start the save on a later day. Do note that if you have enabled Day As Items, you'll be stuck on that day until you get enough of those items.

2. Once in-game, pause it and press F10. This should show a typing interface at the bottom of the screen. Type "connect &lt;address of the Multiserver&gt;:&lt;port&gt; &lt;name of the slot&gt;" and then press Enter.
    - If everything goes well, you should see hints informing you the connexion has been made and the slot data has been received.
