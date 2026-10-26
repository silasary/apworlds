# TFT Archipelago Setup Guide

## Required Software

- Teamfight Tactics on Windows, through the Riot client
- [The TFT Archipelago app](https://github.com/Alpaka623/tft-archipelago-releases/releases/latest)
  (`TFT-Archipelago-Setup-<version>.exe`)
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.5 or newer, for whoever generates
  the multiworld

## Installing the App

1. Download and run `TFT-Archipelago-Setup-<version>.exe`. It installs for your Windows user only and needs no
   admin rights.
2. The installer is not signed yet. If Windows SmartScreen says "Windows protected your PC", click **More info**,
   then **Run anyway**.
3. The app updates itself. A downloaded update installs when you quit the app, or right away with **Restart** at
   the bottom of the sidebar. It never restarts while TFT is running.

## Creating Your Player Options (YAML)

The easiest way is the **Setup** page in the app. It walks you through your player name, goal, starting unlocks
and rewards, then saves your YAML and the APWorld.

You can also start from the template: install the APWorld (see below), then use **Generate Template Options** in
the Archipelago Launcher, or download `TFT-Archipelago-template.yaml` from the
[latest release](https://github.com/Alpaka623/tft-archipelago-releases/releases/latest).

## Generating a Multiworld

TFT Archipelago is not an official Archipelago world yet, so the archipelago.gg website cannot generate it.
Generate locally instead:

1. Download `tft_archipelago.apworld` from the latest release, or save it from the app's **Setup** page.
   Double-click it (or use **Install APWorld** in the Archipelago Launcher). It is copied
   into `custom_worlds`.
2. Put every player's YAML into the `Players` folder of your Archipelago installation.
3. Click **Generate** in the Archipelago Launcher. The result is a `.zip` in the `output` folder.
4. Host it: upload the `.zip` at [archipelago.gg/uploads](https://archipelago.gg/uploads), or use **Host** in the
   Archipelago Launcher.

Every player in the multiworld needs the same APWorld version as the person who generated it. Players of other
games only need the APWorld if they generate.

## Connecting

1. Start the app and the Riot client, and log in.
2. On the app's **Overview** page, enter the host (for example `archipelago.gg`), the port of your room and your
   slot name, the `name` from your YAML. Enter the password if the room has one.
3. Click **Connect**. Keep the app open while you play: matches played without it are not tracked. If the
   connection drops, completed checks are sent when you connect again.

## Playing

- Queue a Normal, Ranked or Tocker's Trials match. Other modes complete no checks.
- Click blockers cover locked buttons in the game. Do not work around them with hotkeys: going over a limit
  without a matching one-time item invalidates the current match, and it sends no checks.
- Pin up to three checks on the **Checks** page to show them in the in-game overlay.
- The **FAQ** page in the app answers most questions about checks, items and rule violations.

## Reporting Bugs

Open an issue at [tft-archipelago-releases](https://github.com/Alpaka623/tft-archipelago-releases/issues). For a
rule violation you think is wrong, attach the screenshot the app saved under `Documents/TFTArchipelago/violations`.
