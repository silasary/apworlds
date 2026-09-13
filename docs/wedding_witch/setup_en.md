# Wedding Witch Setup Guide

## Required software

- Wedding Witch on Steam
- [BepInEx 6 bleeding edge](https://builds.bepinex.dev/projects/bepinex_be), the
  **Unity.Mono** x64 build
- The Wedding Witch Archipelago mod, from
  [its releases page](https://github.com/chickentuna/WeddingWitchMod/releases/latest) —
  which also carries this world's `.apworld` and a template YAML

## Installing BepInEx

Wedding Witch is a Unity **Mono** build, so it needs the Mono flavour of BepInEx:
`BepInEx-Unity.Mono-win-x64` on Windows, `BepInEx-Unity.Mono-linux-x64` on Linux.
The IL2CPP builds will not load. The mod itself is the same file on both.

Unzip it into the game folder, next to `Wedding Witch.exe` (or
`Wedding Witch.x86_64`), then launch the game once and quit. That first run creates
`BepInEx/plugins`.

On Linux, set the game's Steam launch options to `./run_bepinex.sh %command%`.

## Installing the mod

Unzip the mod into `BepInEx/plugins`, so you end up with
`BepInEx/plugins/WeddingWitchArchipelago/WeddingWitchArchipelago.dll`.

## Connecting

Launch the game. The Archipelago panel opens by itself when there is no session;
press <kbd>F1</kbd> to bring it back. Fill in the server address, port, your slot
name and the room password if there is one, then press Connect.

The details are remembered for next launch, and
`BepInEx/config/com.jpn.weddingwitch.archipelago.cfg` has a `ConnectOnStart` setting
if you would rather skip the panel entirely.

## Playing

The Upgrades shop still opens and still shows your levels, but nothing in it can be
bought — the levels shown are the ones the multiworld has sent you.

Your progress lives with the room, not with your normal save file. Disconnecting and
reconnecting to the same room picks up exactly where you left off; playing
unconnected leaves your ordinary save untouched, though the shop stays closed.
