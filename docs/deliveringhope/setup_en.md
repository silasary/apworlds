# Delivering Hope Archipelago Setup Guide

## Note About Linux

This mod works only on the Microsoft Windows version of Delivering Hope.
The mod can still be played on Linux, however, using [Wine](https://www.winehq.org/).
When doing this, you may need to set the environment variable `WINEDLLOVERRIDES` to `winhttp=n,b`.

## Required Software

- Delivering Hope (Windows) from: [itch.io](https://david-wu-softdev.itch.io/delivering-hope-hololive-fangame)
- Archipelago mod for Delivering Hope from: [Delivering Hope Archipelago mod releases page](https://github.com/StellatedCUBE/Delivering-Hope-Archipelago/releases)

## Installation Procedure

The following steps need to be completed only once, even when playing multiple Archipelago games.
A single install can handle playing in multiple different Archipelago games at the same time.

- If you already have a local install of Delivering Hope, copy it to create a new one, as to not interfere with your regular game.
- Extract the Archipelago Mod for Delivering Hope into your Delivering Hope install, such that the folder `BepInEx` is in the same folder as the game executable `Delivering Hope.exe`.
- Launch the game. The first time you do this, it may take a while (several minutes) to load.

## Connecting

When the game loads, a popup will open prompting you to enter the connection details for your Archipelago game.
On Linux, this can sometimes take a while.

## Resuming

Connecting to the same game via the connection popup, even if it's at a different address, will load the correct save file.
