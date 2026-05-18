# Voices of the Void

## Required Software

- [Voices of the Void](https://mrdrnose.itch.io/votv) version 0.9j.
- [UE4SS](https://ue4ss.org/), the mod framework used for the client. Releases are [here](https://github.com/UE4SS-RE/RE-UE4SS/releases).
- The [client mod](https://github.com/Nathan-R-Og/votv_ap). Download it as a ZIP (under the green Code button), and extract it into your UE4SS Mods folder.
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

2. Once in-game, pause it and press F10. This should show a typing interface at the bottom of the screen. Type "connect &lt;address of the Multiserver&gt;:&lt;port&gt; &lt;name of the slot&gt;" and then press Enter.
    - If everything goes well, you should see hints informing you the connexion has been made and the slot data has been received.
