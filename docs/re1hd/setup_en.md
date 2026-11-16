# Resident Evil HD Remaster Setup Guide

## Requirements

- Resident Evil / biohazard HD REMASTER on Steam for Windows (current Steam update). The client
  identifies the game build and refuses builds it does not know.
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.7 or newer.
- No other tools or mods are needed.

## Installation

1. Download `re1hd.apworld` from the releases page and place it in Archipelago's
   `custom_worlds` folder.
2. Copy `Resident Evil HD Remaster.yaml` into Archipelago's `Players` folder, set `name` and
   choose your options. Every option is described in the file.
3. Generate and host the multiworld as usual.

## Playing

1. Start the game. Start a new game as Jill on Normal, or load a save from this seed.
2. Open the Archipelago Launcher, start **Resident Evil HD Remaster Client** and connect to the
   server.
3. Play. Picking up a randomised item sends its location; the game briefly shows the original
   item, which the client then removes.
4. Items received from the multiworld go to the item box (see `received_item_destination`). The
   Lock Pick and the Book of Curses (Sword Key) always go straight to Jill.
5. The goal completes automatically: at the helicopter ending for `complete_game`, or on reaching
   the Garden Shed for `mansion_escape`. `/escaped` completes it manually if needed.

Keep the client running while you play. A pickup made while it is closed still counts when you
reconnect, but you keep the original item.

The client keeps a delivery record in the last item box slot (slot 256); leave that slot empty.
After loading an older save, the client re-sends exactly the items that save is missing.

### Recommended game settings

- For on-screen Archipelago messages, set the game to **windowed** mode and enable
  `borderless_fullscreen`; the game's own fullscreen hides other windows.

## Client window

- **Tracker** tab: the locations you can reach now, and the keys you have.
- **Key Map** tab: every floor of the game. Doors are coloured by the key they need and shown
  red until you can open them; one-way doors are green. Jill's room is highlighted using her
  position in the game. Hover over a room or door for details. With `door_randomisation`, a
  door's tooltip shows where it leads once you have used it. With `key_map_shortcuts`, buttons
  take Jill straight to any typewriter room you have already visited (the screen fades to black,
  then she is there). With `boss_rush`, each boss room shows a skull until that boss is dead.

## Client commands

| Command | Description |
|---|---|
| `/status` | Game connection, delivered items and locations. |
| `/delivered` | Received items and whether each is in the game. |
| `/redeliver N` | Deliver received items again from number N. Normally not needed. |
| `/keys` | Received keys and progression items. |
| `/inlogic`, `/stuck` | Locations you can reach now. |
| `/box` | What has arrived in the item box since you last visited one. |
| `/itembox` | Open the item box (also F7 or the `item_box_button`). `/itembox key F1-F12\|off`, `/itembox mode off\|save_rooms\|anywhere`. |
| `/sortbox` | Sort the item box now. `/sortbox auto on\|off` toggles automatic sorting. |
| `/shortcut <room>` | Go to a typewriter room, e.g. `dining room` or `residence storeroom`. Repeat to cancel. |
| `/autosave` | Save to the autosave slot now (in a save room). |
| `/autoload on\|off` | After a death, load the autosave by itself (needs autosave). No word: show the setting. |
| `/bosses` | Boss Rush: which bosses are dead. |
| `/doorskip on\|off` | Skip door-opening animations. |
| `/borderless on\|off` | Borderless fullscreen. |
| `/overlay on\|off` | On-screen messages over the game. |
| `/tracker on\|off` | Show or hide the Tracker and Key Map tabs. |
| `/testtrap <name>` | Try a trap on yourself; nothing is sent to anyone. |
| `/adopt` | Mark the loaded save as this seed's, if the client does not recognise it. |
| `/escaped` | Complete your goal manually. |
| `/learned`, `/boxdebug` | Research and diagnostics. |

## Troubleshooting

- **The client refuses the game build:** the game was updated or is a version the client does
  not know. Report it with the client log.
- **Nothing is in logic:** run `/inlogic`; if it lists nothing, report it with the client log and
  your seed.
- The client log is in Archipelago's `logs` folder.
