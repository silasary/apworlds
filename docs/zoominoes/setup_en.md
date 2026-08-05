# Zoominoes Setup Guide

## Required Software

- [Zoominoes](https://store.steampowered.com/app/3282420/) on Steam
- [BepInEx 6 (bleeding edge), Unity.Mono, win-x64](https://builds.bepinex.dev/projects/bepinex_be)
- The Zoominoes Archipelago mod

Zoominoes is a Unity 6 Mono game. BepInEx 5 is not a safe choice here; use a
BepInEx 6 bleeding-edge build.

## Installation

1. Unzip BepInEx into the game folder, alongside `Zoominoes.exe`.
2. Run the game once so BepInEx generates its folders, then close it.
3. Drop `ZoominoesArchipelago.dll` into `BepInEx/plugins/`.
4. Start the game and enter your connection details.

The game is a Windows build, so on Linux it runs under Proton with the same files.
Add `WINEDLLOVERRIDES="winhttp=n,b" %command%` to the Steam launch options, or
doorstop will not inject.

## Joining a game

Connect with your server address, port, slot name and password if the room has one.
Options come from the seed, so your local config does not need to match anything.

## Notes

Only normal runs participate. Daily challenges, seeded runs and challenge runs are
left completely alone and send no checks.

Items received mid-run apply from your **next** run. The game builds its content
pool once when a run starts and never revisits it.
