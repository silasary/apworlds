# Shape of Dreams Setup Guide

## Required software

- Shape of Dreams on Steam. Steam is the only supported version of the game.
- The [Archipelago Randomizer](https://steamcommunity.com/sharedfiles/filedetails/?id=3809735647) mod from the Steam Workshop
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.4 or newer, to generate and host games,
  with `shape_of_dreams.apworld` installed (double-click it, or copy it into Archipelago's `custom_worlds` folder).
  Download `shape_of_dreams.apworld` from the [release matching your mod version](https://github.com/FruityShuffles/SoDArchipelago/releases).

## Your YAML

Read the [game info page](https://github.com/FruityShuffles/SoDArchipelago/blob/main/apworld/shape_of_dreams/docs/en_Shape%20of%20Dreams.md#options)
to understand the gameplay choices and how the options work together. The YAML is the configuration reference:
it gives the exact setting names, accepted values and defaults.

New to Archipelago? The [Archipelago setup guide](https://archipelago.gg/tutorial/Archipelago/setup/en) explains what
a YAML is and how to generate and host a game. Shape of Dreams has no options page on archipelago.gg, so get your YAML
one of these ways:

- Start from the [example YAML](https://github.com/FruityShuffles/SoDArchipelago/blob/main/examples/Shape%20of%20Dreams.yaml),
  which lists the exact settings, accepted values, defaults and syntax examples.
- With the apworld installed, click **Generate Template Options** in the Archipelago Launcher. The template is written
  to `Players/Templates`.

Edit the values inside the `Shape of Dreams` section, keeping the indentation. The example's values are the defaults;
its commented presets show alternative combinations for in-run items and traps. Copy the chosen settings over the
corresponding defaults, then put the YAML in Archipelago's `Players` folder before generating your seed.

Generate the game on your own computer. You can then upload it to archipelago.gg to host it.

## Installing the mod

1. Subscribe to [Archipelago Randomizer](https://steamcommunity.com/sharedfiles/filedetails/?id=3809735647) on the
   Steam Workshop.
2. Start the game and enable **Archipelago Randomizer** in the in-game mod manager.

## One profile per seed

Every Archipelago seed (and slot) is played on its own game profile. The mod never reads or changes a profile that
isn't bound to the slot you're connected to, so your normal save profile will be untouched.

1. On the title screen, open the profile selection and **create a new profile** for this seed. Don't play a run on it
   yet.
2. Set your connection details. Open up the mod's config in the mod manager (click the gear icon after selecting the mod).
   Fill out the following fields there:
   - Server: archipelago.gg:38281 (use the address and port of your room, this is for example)
   - Slot: YourSlotName (the name of your Archipelago slot, not the name of your in-game profile)
   - Password: roompassword (only if the Archipelago room has one)
3. Enable Developer Mode in the in-game Gameplay settings. This will allow you to use the F1 key to open up the console.
   The first time you press F1, you may need to click the square icon that appears on the right side of the screen to open the console.
4. On the title screen (not the lobby), type `ap_connect` in the console. The first time, the mod asks you to bind your selected game profile:
   type `ap_bind`. The profile is then bound to that seed and slot for good, and your 2 random starting Travelers are
   unlocked.
5. Play. If you restart the game, load the same profile and type `ap_connect` to reconnect to the archipelago server.
   If the connection drops while you play, the mod reconnects on its own.

Steam achievements aren't updated while you are playing on an Archipelago bound profile.

Don't turn on Cross-Save sync for a bound profile. Syncing can apply Mastery and Stardust items a second time.

## Commands

| Command | What it does |
|---|---|
| `ap_connect` | Connect to the server, slot and password you set |
| `ap_bind` | Bind the loaded (new) profile to the seed and slot you just connected to |
| `ap_bind_force` | Same, but skip the "fresh profile" check (recovery only) |
| `ap_disconnect` | Disconnect |
| `ap_status` | Show the connection and profile status |
| `ap_server <address>`, `ap_slot <name>`, `ap_password <password>` | Change the connection settings (best to do this in the mod config instead) |

## Hints and chat

The game has no chat box or hint command. To chat or use commands such as `!hint`, connect the Archipelago Text Client
to the same room with your slot name (open it from the Archipelago Launcher). See the
[commands guide](https://archipelago.gg/tutorial/Archipelago/commands/en). Messages from other players still show up in
the on-screen feed.

## Tracker

Optional: [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases) lists which checks are in logic
with what you've received. Install `tracker.apworld` like the Shape of Dreams apworld, open **Universal Tracker** from
the Archipelago Launcher and connect with your slot name. It doesn't need your YAML.

## Playing offline

A bound profile keeps working when you're not connected: you keep what you've already received, completed achievements,
world clears and souvenirs are saved in the profile, and everything is sent the next time you connect. An
"OFFLINE — checks will send on reconnect" notice stays on screen while you're disconnected.

If the connection drops, the mod keeps retrying the same server, and the notice counts down to the next try. If your
room moved to a new port, set the new server and type `ap_connect`.

## Co-op
You can play co-op with other players whether or not they are also playing Archipelago. While the mod is on, only PC
players can join your lobby.
Be aware that a player who joins someone else's lobby can't receive DeathLinks. Two archipelago players playing together won't
be able to receive DeathLinks for the joining player.

Archipelago wares and in-run effects require solo play or hosting. Set `jonas_wares: 0` if you mostly join other
people's games, and disable in-run items, traps and DeathLink. The
[game info page](https://github.com/FruityShuffles/SoDArchipelago/blob/main/apworld/shape_of_dreams/docs/en_Shape%20of%20Dreams.md#co-op)
explains co-op behavior.

## Updating

Updating the mod or the apworld in the middle of an Archipelago seed may or may not be ok. If you get an error saying that the mod is incompatible with your seed, your mod probably auto-updated; revert the Steam Workshop mod to the previous version until you finish your seed.

## Troubleshooting

The mod logs everything with an `[AP]` prefix to
`%USERPROFILE%\AppData\LocalLow\Lizard Smoothie\Shape of Dreams\Player.log`. Report bugs on
[GitHub Issues](https://github.com/FruityShuffles/SoDArchipelago/issues) and attach that file.
