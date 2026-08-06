# Grunn Multiworld Setup Guide

## Required Software

- **Grunn** (Sokpop Collective) on Steam.
- **BepInEx 5** (x64) — <https://github.com/BepInEx/BepInEx/releases>.
  Take a `BepInEx_x64_5.4.x` build, **not** BepInEx 6.
- The **Grunnchipelago client mod** (`Grunnchipelago.Client.dll` and its dependencies).
- The **Grunn apworld** (`grunn.apworld`), only needed by whoever generates the seed.

## Installing BepInEx

1. Find your game folder: in Steam, right-click **Grunn** → *Manage* → *Browse local files*.
   You should land on a folder containing `Grunn.exe`.
2. Unzip the BepInEx archive **into that folder**, so that `BepInEx/` sits next to
   `Grunn.exe`.
3. Launch the game once, then close it. BepInEx generates its folders on that first run —
   `BepInEx/plugins/` must now exist.

If `BepInEx/plugins/` was not created, BepInEx did not load: check that you unzipped into
the folder holding `Grunn.exe` and that you took the **x64** build.

## Installing the mod

1. Create the folder `BepInEx/plugins/Grunnchipelago/`.
2. Drop `Grunnchipelago.Client.dll` and the DLLs shipped alongside it into that folder.
3. Launch the game once, then close it. The mod writes its configuration file to
   `BepInEx/config/grunnchipelago.client.cfg`.

## Connecting to a multiworld

Launch the game. On the **title screen**, a small **ARCHIPELAGO** panel sits on the right,
just above the version credit. The mouse cursor is released there — on the title screen only
— so the panel can be clicked; in game Grunn stays entirely on the keyboard, untouched.

| Key | Effect |
|---|---|
| **Tab** | next field (**Shift+Tab**: previous) |
| **Up / Down** | move between fields |
| **Enter** | next field, and **connect** from the last one |
| **Esc** | drop the keyboard focus |

The fields:

- **Host** — `archipelago.gg`, or `localhost` for a local server
- **Port** — the port given by the room
- **Slot Name** — must match the `name:` field of your YAML, exactly
- **Password** — leave empty if the room has none

While a field holds the keyboard the menu's own controls are muted, so you can type a slot
name containing an "E" without confirming the menu behind it.

There is one button, **Connect**. Pressing it while already connected simply leaves the
current room and joins the new one, so switching multiworlds is a matter of editing the
fields and clicking again. If the connection fails, the panel says so — with the server's own
reason when it gives one, otherwise after about ten seconds.

The panel remembers what you type, so the next launch reconnects on its own. The main menu
title reads **GRUNNCHIPELAGO** when the mod is active. Checks are sent as you play, and
received items arrive in your inventory.

Connect **from the title screen, before loading a save** — that is when the mod picks the
save profile matching the multiworld you are joining (see *Saves* below).

If you prefer, the same settings live in `BepInEx/config/grunnchipelago.client.cfg` under
`[Connection]`; the panel simply reads and writes that file.

`Enabled = false` turns everything off and gives you the vanilla game back — no patch is
applied at all in that state.

## The in-game console

Press **F1** in game to focus the Archipelago console, in the bottom-right corner. It shows
everything the server says — items found, hints, chat, command results — and it stays faint
while unfocused so it never gets in the way.

| Key | Effect |
|---|---|
| **F1** | focus / unfocus |
| **Enter** | send the line |
| **Page Up / Page Down** | scroll the history |
| **Home / End** | jump to the top / bottom |
| **Mouse wheel** | scroll the history |

Focused, it takes the keyboard and the mouse wheel: type a server command (`!hint`,
`!missing`, …) or plain chat. Your character does not move and your tools do not cycle while
you type. Escape is left to the game, which opens its pause menu with it.

The view follows the newest line only while you are already at the bottom, so an arriving
message never yanks the history out from under you mid-read.

## Options worth knowing

- **QoL**: `SkipEndingDialogues` (on by default) lets Escape end the post-death orb
  dialogue at once. Nothing else is skipped.
  `StatsShowAllLines` always displays every stat line in the Tab/Pause panel.
- **Logging**: `VerboseLogs` logs every check, grant and trap. The mod also keeps a
  persistent, timestamped log at
  `BepInEx/plugins/Grunnchipelago/grunnchipelago_session.log` — that is the file to attach
  when reporting a problem.

## Saves

The mod keeps a **dedicated save profile per multiworld**, named after the seed and your
slot:

- **Not connected** — you play on your normal, vanilla save. Untouched, always.
- **Connected** — the game switches to the profile of that seed and slot. Two different
  multiworlds never share progress, and joining the same room again picks its profile back up.

The switch only ever happens **on the title screen, before a world is loaded** — which is why
you should connect there rather than mid-game. Connecting while already playing leaves the
current save alone until you return to the menu.

You can move between multiworlds without restarting the game: go back to the title screen,
point the panel at the other room and connect. The world is rebuilt for the save you are
joining, so nothing carries over from the previous one.

Once switched, the session stays on that profile even if you disconnect. Going back to your
vanilla save means restarting the game without connecting.

## Generating a seed

Only the person generating needs the apworld.

1. Drop `grunn.apworld` into the `custom_worlds/` folder of your Archipelago installation.
2. Grab the template YAML (`Players/Templates/Grunn.yaml`, or generate the templates from
   the Archipelago Launcher) and edit it to taste.
3. Put your YAML in `Players/` and run **Generate**, or upload it to
   <https://archipelago.gg/uploads>.

## Troubleshooting

**The game starts but nothing connects.** Check `Slot` against the `name:` field of your
YAML — they must match exactly, capitals included. Then read the session log: connection
errors are written there in full.

**A pickup gives nothing.** That is normal for a check you already sent: the object
respawns but stays inert. The log says `Silencieux : … (deja envoye)`.

**An item never showed up in the world.** Three items are deliberately never injected into
your inventory — the Bone, the Compass and the Strange Key. Owning them would kill an
ending (Dog, Hedge Maze and Long Hallway respectively). Instead they appear as a pickup
next to the rose sign at the start, and you take them only when you actually want them.
