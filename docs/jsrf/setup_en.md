# Jet Set Radio Future Setup Guide

## Required software

- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases/latest) 0.6.8 or newer.
- JSRF Unleashed 0.6.10 on Windows, set up with your own copy of Jet Set Radio Future. Make sure the game runs on its
  own before you go on.
- `jsrf.apworld`, release v1.0a.

The client only works on Windows, because it reads and writes the running game's memory.

## Installing the world

1. Close the Archipelago Launcher if it is open.
2. Copy `jsrf.apworld` into the `custom_worlds` folder of your Archipelago install, for example
   `C:\ProgramData\Archipelago\custom_worlds`. **Install APWorld** in the Launcher does the same.
3. Open the Launcher. **Jet Set Radio Future Client** is now in its list.

## Making your options file

Open **Options Creator** in the Launcher and pick Jet Set Radio Future, or use the player options page. The options are
grouped as on that page:

- **Goal:** Defeat Gouji, or Jet Ranks (with how many Jets you need).
- **Gouji's Tower:** what opens the Tower: Graffiti Soul items, and optionally tag spots and Street Challenges.
- **Starting Out:** your starting area and starting character. Tick **Random?** for a random pick.
- **Checks:** which kinds of checks are in the seed (see the game page for the full list).

Then generate the game the usual Archipelago way, or give the file to whoever hosts.

## Joining a game

1. Start JSRF Unleashed.
2. In the Launcher, open **Jet Set Radio Future Client**. Enter the server address (for example `archipelago.gg:38281`)
   and connect, then enter your slot name.
3. Wait for **Found the game.** in the client window. Keep the client running the whole time you play, and start it
   before you skate into any area.
4. Start a **New Game**. Corn tells you which area is open, then the client takes you to the free-skate Garage. The
   client ties this save to your seed and says **This save is now tied to this seed.**

To keep playing later, start the game and the client again and load the same save.

A save from another seed is left alone: the client sends nothing from it. If you started this seed's New Game while the
client was closed, load that save and type `/usesave`.

## Playing

- The Garage is your hub. Use its doors to reach the areas you have unlocked.
- An area's Street Challenges open when you have its Mystery Tape item. You can still pick up the tape lying in the
  level: that is a check of its own.
- Roboy offers an area's Test Runs once you hold every Graffiti Soul of that area. After a Test Run, the client takes you
  back to the free-skate Garage through the character select.
- When Gouji's Tower is open, talk to Corn in the Garage. Say Yes to go, or No to come back to it later.

## Client commands

| Command | What it shows or does |
| --- | --- |
| `/goal` | Your goal and how far along you are. |
| `/unlocks` | Which areas are open, and how many checks are held for areas still locked. |
| `/tapes` | Which Mystery Tape items you have. |
| `/checks` | Whether the loaded save is tied to this seed, and how many checks of each kind are done. |
| `/usesave` | Ties the loaded save to this seed. |

Archipelago's own commands work too, such as `/received`, `/missing` and `/help`.

## Troubleshooting

- **"jsrf_recomp.exe is not running. Start the game first."** Start JSRF Unleashed. The client finds it by itself.
- **"Found the game, but without write access"**: Windows kept the client from changing the game. Start the game and the
  Launcher the same way: both normally, or both as administrator.
- **"This seed was made with JSRF v…, but this client is v…"**: install the `jsrf.apworld` the seed was made with, or
  generate a new seed.
- **Something else went wrong:** send these two files with your report: the newest `JSRFClient_*.txt` in Archipelago's
  `logs` folder, and `last-run.log` in your JSRF Unleashed folder.
