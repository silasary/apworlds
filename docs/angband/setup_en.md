# Angband Multiworld Setup Guide

## Required Software

- A copy of the Archipelago-enabled Angband build (the patched `angband.exe` and
  its DLLs, from this repository).
- An Archipelago install (for generating/hosting), version 0.6.4 or newer.
- The `angband.apworld` installed into your Archipelago `custom_worlds` (or
  `worlds`) folder.

## Installing the apworld

1. Build/zip the `apworld/` folder into `angband.apworld` (a zip whose single top
   level folder matches the package name).
2. Drop `angband.apworld` into your Archipelago `custom_worlds` directory, or run
   it through the Archipelago Launcher's "Install APWorld" option.

## Creating a Config (.yaml)

Generate a template from the Archipelago Launcher ("Generate Template Options")
or the WebHost. Key options:

- **Artifacts As Checks** (default on): artifacts become Archipelago location
  checks and the multiworld hands out the real artifacts as items. Descending the
  dungeon then requires the "Progressive ... Artifact" items you receive. Turn
  this off for a pure unique-monster hunt with normal artifact drops.
- **Death Link**: when on, dying takes down everyone else who has Death Link on,
  and their deaths take you down too.

## Joining a Multiworld Game

1. Launch the patched Angband.
2. When prompted, enter the server address (`host:port`) and your slot name.
3. Play. Killing a unique monster sends that location's check; with Artifacts As
   Checks on, picking up an artifact does too. Received items are delivered to
   your home.

## What are the checks?

- **Unique monster kills** — every named unique you slay is a check.
- **Artifact pickups** (when Artifacts As Checks is enabled) — picking up each
  artifact is a check.

## Goal

Reach the bottom of the dungeon and slay Morgoth, Lord of Darkness.
