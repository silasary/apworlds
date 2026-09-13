# Half-Life Archipelago Setup Guide

## What you need

- **Half-Life** on Steam, current build. Not the `steam_legacy` beta branch.
- **Archipelago** 0.6.7 or newer.
- The **Half-Life apworld**, in `<Archipelago>/custom_worlds/`.

The mod installs as its own game folder, `hlap`, alongside `valve`. Your own
Half-Life is never modified: the mod folder inherits every map, model and sound
from it through `fallback_dir "valve"`. Removing the mod is deleting one folder,
and the client's `/uninstall` does exactly that.

> **Early days.** This is playable but has not had a full run-through. Expect
> rough edges past the first few missions, and see `docs/PORT_PLAN.md` in the
> repository for what has been confirmed working and what has not.

## Installing

1. Put the apworld in `<Archipelago>/custom_worlds/`.
2. Start the **Half-Life Client** from the Archipelago Launcher.
3. It looks for your Half-Life folder and asks for it if it cannot find one. Pick
   the folder that contains `valve`. It is remembered in `host.yaml`, so you are
   only asked once.
4. Type `/install` in the client. It creates `<Half-Life>/hlap/` and fills it in.
5. Start Half-Life with `-game hlap` (right-click the game in Steam →
   Properties → Launch Options), or pick **Half-Life Archipelago** from the game
   list under Custom Game.

## Playing

**Connect the client first, then start the game.** Nothing is unlocked until the
client has told the game what the seed contains, and warps are refused while it
is not connected -- otherwise closing the client would be a way past every lock
in the game.

Start a New Game and you arrive in the hub rather than on the tram. Every mission
is reached from there.

Commands work in two places: **chat** (`Y`), with a `!` in front, or the
**console** (`~`, which needs `-console`) without it. Chat is usually the one you
want -- one key, no pause, no `ap_` prefix to type.

| Chat | Console | What it does |
| --- | --- | --- |
| `!ap` | `ap` | every mission and its unlock status |
| `!warp <number or name>` | `ap_warp …` | travel to an unlocked mission |
| `!warp <mission> <part>` | `ap_warp …` | to a part you have already reached |
| `!warp <name>` | `ap_warp …` | to a warp point of your own |
| `!setwarp [name]` | `ap_setwarp …` | make a warp point where you stand |
| `!warps` | `ap_warps` | the warp points you have made |
| `!hub` | `ap_hub` | return to the hub |
| `!tracker [map]` | `ap_tracker …` | locations found and still out there |
| `!find [text]` | `ap_find …` | point at the nearest unfound check |
| `!help` | `ap_help` | these, in game |

A `/` works in chat too, if that is what your fingers do.

### Keys

The mod installs binds for the commands that need no argument, in
`hlap/apbinds.cfg`:

| Key | Command |
| --- | --- |
| `P` | the mission list |
| `O` | the tracker |
| `I` | the command list |
| `L` | back to the hub |
| `[` | your warp points |
| `]` | point at the nearest check on this map |
| `;` | `setwarp` for the part you are in |

They are there because of what the console does to single-player: opening it
pauses the game, and while the game is paused the mod runs no frames, so a
command typed into the console does nothing until the console is closed again.
Chat does not pause, and neither does a key. `K` is left alone on purpose --
Half-Life uses it for voice chat.

The binds are loaded by the mod itself when the map starts, not only by
`autoexec.cfg`, because whether the engine runs a mod's autoexec has varied
between builds. They load once per session, so a key you rebind mid-session stays
rebound.

Rebind them freely -- the file is yours once it is written, and reinstalling the
mod leaves it alone. Uninstalling removes it.

A reply of a few lines is printed in the message area as well as the console, so
most commands can be read without opening either. Long listings -- `!tracker` on
a full seed -- go to the console alone, which is the only place they fit, but the
message area still says so: `ap_tracker: 214 lines in the console (~).` A key
press always answers with something.

`ap_warp` takes a mission number, a name, or a map name, and does not care about
case or punctuation: `ap_warp 15`, `ap_warp Gonarch's Lair`, `ap_warp gonarch`
and `ap_warp c4a2` are the same request.

Add a part number to land partway into a mission -- `ap_warp unforeseen 6` -- but
only for a part you have already reached. It is a way back after a death or an
errand in the hub, not a way past the half of a mission you have not played: the
checks in a part you skipped to would be free, and warping straight to a
mission's last part would be the fastest way through it.

### Warp points

A warp takes you back to the state you were in, not to the top of the map. The
first time you walk through a transition into a part of a mission, the game
quietly saves that moment, and `!warp <mission> <part>` restores it: the same
inventory, the same open doors, the same boss mid-fight. Only that first arrival
is kept, so walking back and forth through a seam does not move it.

`!setwarp` moves the current part's warp point to wherever you are standing.
`!setwarp lab` instead makes a warp point of your own called `lab`, which
`!warp lab` goes back to; `!warps` lists them. Your own quicksave is never
touched, and neither is any save you made by hand.

These saves live on this machine, in `hlap/SAVE`, keyed by the seed and the slot.
That means:

* A second machine, or a fresh install, has none of them. Warping still works
  there; it just starts the map cold, the way it did before.
* Whether you *may* warp somewhere is still the multiworld's answer and never the
  save's. A mission this run has not opened stays shut even with an old save of
  it sitting on the disk, so replaying a reset seed cannot skip ahead.
* They go when the slot goals, and `/uninstall` removes every one of them. A full
  run is a few hundred megabytes of savegames.

Anything worth knowing -- a check found, an item received, a mission unlocked, a
pickup refused -- appears in the message area at the bottom left as well as in
the console, so you do not need the console open to play.

Client-side commands, typed in the client rather than the game:

| Command | What it does |
| --- | --- |
| `/install`, `/uninstall` | add or remove the `hlap` folder |
| `/gamedir [path]` | change the Half-Life folder, or open a picker |
| `/where` | show the folder, the bridge path and whether the mod is installed |
| `/missions` | mission unlock status |
| `/deathlink`, `/amnesty <n>` | toggle DeathLink, set the forgiven-deaths allowance |
| `/chat` | toggle relaying chat between the game and the multiworld |

## How a run goes

You start with one mission open, the crowbar, and nothing else. Missions are
unlocked by items from the multiworld. Weapons are refused until the multiworld
has sent them: walking over a shotgun you have not been sent leaves it where it
is, and the check for it still fires.

Nihilanth is not unlocked by an item. It opens once you have finished
`missions_required` other missions, and clearing it wins your slot.

Warping into a mission loads the map fresh, so you always arrive with exactly
what the seed says you should have and can replay a mission freely. Transitions
*inside* a mission are Half-Life's own, so the level-to-level flow is unchanged.

Quicksave and quickload work normally. The game holds nothing across a load: the
client's snapshot is reapplied, and a check you make twice is a no-op on the
server.

## Options worth knowing

| Option | Default | What it does |
| --- | --- | --- |
| `missions_required` | all of them | how many missions open Nihilanth |
| `chargesanity` | on | every health and HEV wall unit, and every Xen healing pool, is a check (123 of them) |
| `exclude_intro_missions` | on | drop Black Mesa Inbound, the tram ride |
| `logic_difficulty` | strict | whether logic expects a suitable weapon per mission |
| `shuffle_hev_suit` | off | armour stays at zero until the item arrives |
| `shuffle_longjump` | off | on: the module is an item. Off: Half-Life hands it out as it always did |
| `ammo_relief` | off | **experimental:** a gun the level stocks no ammo for is refilled five minutes after it runs dry |
| `trap_percentage` | 15 | share of your filler replaced by traps |
| `death_link_amnesty` | 4 | deaths forgiven before one goes out to the multiworld |

The HEV suit is never taken away from you, whatever `shuffle_hev_suit` says: in
GoldSrc the suit draws the weapon HUD and owns weapon switching, so a player
without one cannot use what they are holding. What the item controls is armour.

`ammo_relief` sits under **Experimental Features** in the YAML and is exactly
that: it works, and its timing is still rough in ways listed in the template's
own description. Nothing it does can take anything away from you -- it only ever
adds ammo -- so the worst case is a refill arriving when you did not need one.

It is for the seed that hands you the crossbow in a map with no bolts
in it. With it on, a gun that runs dry on ammo the level does not stock anywhere
says so, and the suit synthesises more five minutes later; if it is empty again
within ten seconds of a refill you get one more for free, which covers dying and
reloading a save from before it. The wait follows you through a mission's own
transitions -- the next map has no bolts either -- but going to the hub or
loading a save starts it again, since either can put ammo back in your hands. Off by default, because with it on a patient
player is never really out of ammo.

DeathLink counts the deaths Half-Life does not treat as deaths, too: falling into
the void on Xen and losing a scientist you were supposed to protect both end in a
fade to black and a reloaded save rather than in a corpse, and both are sent.

## Troubleshooting

**The client says the mod folder is not installed.** Run `/install`. If it says
there is no server dll, this build of the apworld does not ship one yet.

**The game starts on the wrong content.** Check the launch option is `-game
hlap`, and that `<Half-Life>/hlap/liblist.gam` exists.

**Checks are not being sent.** `/where` shows the bridge path; both `ap_in.txt`
and `ap_out.txt` should be there and recently modified. If the client logs a data
version mismatch, the apworld that generated the seed and the one installed are
different builds -- reinstall the mod with `/install`.
