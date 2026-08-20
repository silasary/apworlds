# Empire Earth Setup Guide

## Required Software

- Empire Earth: The Art of Conquest — the **GOG** or **Steam** release. Both
  ship the same binary and work identically. NeoEE is not supported and will
  not be; please buy the game instead.
- The Archipelago client component, installed with this apworld.

No patching is required. Nothing is copied into the game folder, and no game
files are modified — the client reads and writes the running game's memory, and
shows Archipelago messages on the game's own message line.

## ⚠️ On Steam: run Archipelago as administrator

The Steam release always launches Empire Earth **elevated**. Windows does not
let an ordinary program read an elevated one, so a normal Archipelago client
cannot see the game at all — it will sit on *"Waiting for Empire Earth to
start"* no matter how long you wait.

**Right-click the Archipelago Launcher and choose *Run as administrator*,
before you start the game.**

Elevating after a match has begun makes Windows prompt again, which minimises
Empire Earth and can be awkward to recover from in full screen.

The GOG release does not elevate, so this does not apply there.

## Installing

1. Put `empire_earth.apworld` in your Archipelago `custom_worlds` folder.
2. Restart the Archipelago Launcher so it picks the world up.

## Configuring your YAML

```yaml
Empire Earth:
  # reach_epoch or wonder_victory.
  goal: reach_epoch

  # Epoch your skirmish starts in, and the one you must reach to win.
  starting_epoch: prehistoric_age
  goal_epoch: space_age

  # The skirmish setup, chosen here rather than in game.
  map_size: medium
  resources: standard_low
  game_variant: standard
  difficulty: medium
  game_speed: standard
  unit_limit: 300
  wonders_for_victory: 0
  reveal_map: false
  use_custom_civs: false
  lock_teams: false
  lock_speed: false
  prevent_match_end: true
  opponents: hostile
  ingame_messages: true

  # How much of a resource one bundle grants.
  bundle_size: 500
```

`yaml/EmpireEarth.yaml` in the repository lists the accepted value for every
setting.

## Playing

1. Start the Archipelago Launcher and run **Empire Earth Client**, then connect
   it to the room.
2. Start Empire Earth and create a skirmish. Pick a map type and a
   civilisation — the rest of the setup screen is filled in from your YAML.

The client attaches to the game automatically once a match is running, and
reconnects on its own if you quit to the menu and start another match.

## The skirmish setup is not yours to choose

While the client is connected it holds the setup screen at the settings your
YAML asked for, and puts them back if you change them, so everyone playing a
seed plays the same match. **Cheat codes are always disabled.** `/settings` in
the client shows what is being held in place.

**Map choice is yours** and always will be — the client never touches it, so
custom maps work exactly as they normally would.

## How the randomizer plays

You begin unable to advance beyond your starting epoch. Advancing normally
requires two recruitment or technology buildings; that requirement is removed
and replaced by an Archipelago item.

- **`Epoch: <name>`** items unlock the ability to advance to that epoch. You
  still have to pay the resource cost in the Capitol, and epochs are still
  strictly sequential — receiving a late epoch early simply sits dormant until
  you have worked up to it.
- **Resource bundle** items grant food, wood, stone, gold or iron immediately.
- **Reaching each epoch** sends a check, as does constructing each building
  type and recruiting each unit for the first time. Units never retire while
  the client is running, so no unit check can be missed.
- **Researching a technology** sends a check. The technology itself does
  nothing when researched — its benefit arrives separately as a `Tech:` item.
- **Building a wonder** sends nothing. The `Wonder:` item is the reward, and
  raising the wonder is what you do with it. Wonders count towards a wonder
  goal when they are finished, not when the foundation goes down.

Your `goal` decides what finishes the seed: reaching `goal_epoch`, or
completing a wonder victory.

Because Empire Earth ends the match as soon as a wonder victory happens, the two
options must agree — generation refuses `reach_epoch` with wonders enabled, and
a wonder goal with `wonders_for_victory: 0`. Otherwise the match could end in a
victory that leaves the seed unfinishable.

## Client commands

Type these in the client window:

| Command | Effect |
|---|---|
| `/ee` | Attachment status and your current resource stockpile |
| `/roster` | What you own and which checks it satisfies |
| `/wonders` | Which wonders you have built, and wonder-goal progress |
| `/settings` | The match settings being held in place |
| `/diplomacy` | Who is at peace with whom |
| `/grant <resource> <amount>` | Debug: add resources directly |

## Troubleshooting

**The client says it is waiting for Empire Earth.** It looks for `EE-AOC.exe`
or `Empire Earth.exe`. Make sure the game is actually running, and start the
client from the same Windows account.

**"No memory profile matches this build."** Your executable differs from the
one the addresses were taken from. Only the GOG Art of Conquest build is
currently mapped.

**Nothing happens when items arrive.** Resources are only credited while you
are in a match; items received in a menu are applied as soon as one starts.
