# DOOM Eternal

## Where is the options page?

The [player options page](../player-options) contains settings for a DOOM Eternal slot.

## What does randomization do to this game?

DOOM Eternal Archipelago replaces supported campaign pickups, upgrades, challenges, masteries, mission completions,
and selected scripted rewards with Archipelago checks. Weapons, equipment, runes, suit perks, upgrades, currencies,
resources, and traps can arrive from any connected slot.

## What is the goal?

Complete the supported campaign route and finish Final Sin.

## What is a check?

A check is a supported pickup, challenge, mastery, mission completion, or scripted campaign event. Activating one sends
its location to the Archipelago server; its original reward is replaced or suppressed where required.

## What items can be received?

Progression includes weapons, equipment, abilities, runes, upgrades, and Sentinel Battery currency. Filler restores
health, armor, ammo, or lives. Traps can spawn enemies or drain resources.

## Main options

`randomize_dash` moves Exultia's Dash into the item pool. When disabled, Dash remains a vanilla pickup. Other options
control Chainsaw, first Sentinel Battery, and DeathLink behavior.

## DeathLink

With DeathLink enabled, deaths can be shared with other enabled slots. Each accepted external event causes one local
death; reconnecting does not replay an acknowledged event.

## Beta limitations

Version 0.4.0-beta.1 requires a player-supplied DOOM Eternal installation and external modding tools. Automatic Windows
injection is unavailable because EternalModManager has no stable public CLI; its final injector action is manual. Linux
uses EternalModInjectorShell through Steam/Proton. Back up saves and expect unsupported game updates to require a new
compatible build.

Players connect through the matching standalone DOOM Eternal launcher. The APWorld is used for generation and does not
register a client button in Archipelago Launcher.
