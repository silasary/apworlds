# Half-Life 2 Archipelago Setup Guide

## What you need

- **Half-Life 2** on Steam, current build (the 20th anniversary update).
- **Archipelago** 0.6.7 or newer.
- The **Half-Life 2 apworld**, `half_life_2.apworld`, in
  `<Archipelago>/custom_worlds/`.
- On Linux, **Proton** for the mod's Steam entry (see below).

The mod installs as a Steam sourcemod, `hl2ap`. Your own Half-Life 2 is never
modified: the mod reads every map, model and sound from it. Removing the mod is
one command, the client's `/uninstall`.

## Installing

1. Put the apworld in `<Archipelago>/custom_worlds/`.
2. Start the **Half-Life 2 Client** from the Archipelago Launcher.
3. Type `/install` in the client. It finds Steam's `sourcemods` folder and your
   Half-Life 2 install by itself, and installs the `hl2ap` mod.
4. Restart Steam. **Half-Life 2 Archipelago** appears in your library.
5. On Linux only: in that entry's Properties > Compatibility, force a Proton
   version. Steam does not carry Half-Life 2's setting over to a sourcemod, and
   without it the launch fails with `Cannot read properties of null (reading
   'display_name')`. If the entry is ever removed and reinstalled, set it again.

Run `/install` again after updating the apworld: the mod and the apworld have to
come from the same build.

## Playing

**Connect the client first, then start the game.** Nothing is unlocked until the
client has told the game what the seed contains, and the client has to keep
running while you play: it carries items in and checks out.

Start a New Game and you arrive in the hub rather than on the train. Every
chapter is reached from there with `!warp` or the menu, and finishing a chapter
brings you back. A chapter that is still locked says why instead.

Commands work in two places: **chat** (`Y`), with a `!` in front, or the
**console** (`~`) as `ap <command>`. Chat is usually the one you want: one key,
and the game keeps running.

| Chat | Console | What it does |
| --- | --- | --- |
| `!ap` | `ap chapters` | every chapter and its unlock status |
| `!warp <number or name>` | `ap warp …` | travel to an unlocked chapter; any word of its name will do (`kanal`), or a map name for that part |
| `!warp <chapter> <part>` | `ap warp …` | to a part you have already reached; the part as `3` or `p3` |
| `!warp <name>` | `ap warp …` | to a warp point of your own |
| `!setwarp [name]` | `ap setwarp …` | make a warp point where you stand |
| `!warps` | `ap warps` | the warp points you have made |
| `!hub` | `ap hub` | return to the hub |
| `!tracker [filter]` | `ap tracker …` | every location in the seed, found and not; the filter is a chapter, a map or a check name |
| `!find [text]` | `ap find …` | point at the nearest unfound check |
| `!trace [text]` | `ap trace …` | as `!find`, and draw a path to it; again to stop |
| `!menu` | `ap menu` | warps, the tracker, find and trace as a menu, picked with the number keys |
| `!status` | `ap status` | where the client and this map stand |
| `!help` | `ap help` | these, in game |

A `/` works in chat too, if that is what your fingers do.

### Keys

The mod binds two keys when the game starts:

| Key | Command |
| --- | --- |
| `-` | opens and closes the menu |
| `0` | closes the menu (`slot10`) |

`-` is only bound if neither it nor the menu is bound already, so a key you
choose yourself is kept. `0` is always set back to `slot10`; if it ran
`vr_toggle`, that moves to `\`.

A reply of a few lines is printed in chat as well as the console, so most
commands can be read without opening either. Long listings, such as `!tracker`
on a full seed, go to the console alone, but chat still says so:
`!tracker: 214 lines in the console (~).`

`!warp` takes a chapter number, a name, or the start of a name, and does not
care about case or punctuation: `!warp 7`, `!warp Highway 17` and
`!warp highway` are the same request.

Add a part number to land partway into a chapter, `!warp route 4`, but only for
a part you have already reached. It is a way back after a death or an errand in
the hub, not a way past the half of a chapter you have not played.

### Warp points

A warp takes you back to the state you were in, not to the top of the map. The
first time you walk into a part of a chapter, the game saves that moment, and
`!warp <chapter> <part>` restores it. Only that first arrival is kept.

`!setwarp` moves the current part's warp point to wherever you are standing.
`!setwarp lab` instead makes a warp point of your own called `lab`, which
`!warp lab` goes back to; `!warps` lists them. Your own saves are never touched.

These saves live on this machine, keyed by the slot. That means:

* A second machine, or a fresh install, has none of them. Warping still works
  there; it starts the part cold.
* Whether you *may* warp somewhere is still the multiworld's answer and never
  the save's. A chapter this run has not opened stays shut even with an old
  save of it on the disk.
* `/uninstall` removes every one of them.

Anything worth knowing (a check found, an item received, a pickup refused)
appears in chat as well as in the console, so you do not need the console open
to play.

Client-side commands, typed in the client rather than the game:

| Command | What it does |
| --- | --- |
| `/install`, `/uninstall` | add or remove the `hl2ap` mod |
| `/moddir [path]` | show or set the installed mod folder |
| `/chapters` | chapter unlock status |
| `/commands` | the in-game commands |
| `/deathlink` | toggle DeathLink |
| `/chat` | toggle relaying chat between the game and the multiworld |

## How a run goes

You start with one chapter open, the crowbar, and nothing else. Chapters are
unlocked by items from the multiworld. Weapons are refused until the multiworld
has sent them: walking over a shotgun you have not been sent leaves it where it
is, and the check for it still fires. A weapon a character hands you, such as
Odessa's RPG, is taken so the scene goes on, and left on the floor for when the
item arrives.

The airboat needs Airboat Keys and the buggy Buggy Keys before you can drive
them (with `vehicle_keys_per_level`, that chapter's own keys), and their
mounted guns need the Airboat Gun and the Buggy Gun.

With `weapons_per_level`, a weapon is held only in chapters whose own item for
it has arrived: Highway 17 SMG gives you the SMG in Highway 17 and nowhere
else. A chapter has an item for a weapon where the weapon can be found in it,
or where the chapter cannot be finished without it. The crowbar and the
gravity gun stay one item.

The gravity gun comes as four Progressive Gravity Guns: hold and drop, then
punts, then the Citadel's supercharge (organics refused), then the full super
gravity gun.

Dark Energy is not unlocked by an item. It opens once you have finished
`missions_required` other chapters, and the credits at its end win your slot.

Warping into a chapter starts it fresh, so you always arrive with exactly what
the seed says you should have and can replay a chapter freely. Transitions
*inside* a chapter are Half-Life 2's own.

Quicksave and quickload work normally. The game holds nothing across a load:
the client's snapshot is reapplied, and a check made twice is a no-op on the
server.

## Options worth knowing

| Option | Default | What it does |
| --- | --- | --- |
| `missions_required` | all of them | how many chapters open Dark Energy |
| `logic_difficulty` | strict | strict: a chapter is only expected once you own what makes it reasonable. Loose: only what a chapter cannot be crossed without |
| `chargesanity` | on | every health charger and suit charger is a check |
| `vehicle_keys_per_level` | off | each chapter that drives the airboat or the buggy has its own keys, instead of one Airboat Keys and one Buggy Keys |
| `weapons_per_level` | off | each weapon has an item per chapter, held only in that chapter, instead of one item for everywhere |
| `shuffle_hev_suit` | off | no armour and no aux power until the HEV Suit arrives |
| `shuffle_flashlight` | off | the flashlight key does nothing until the Flashlight arrives |
| `randomize_aux_power` | off | four Progressive Aux Power items; each lets the aux meter fill another quarter |
| `starting_aux_power` | 0 | how many of those you start with |
| `melee_throw` | off | adds Melee Throw: secondary fire throws the crowbar. Walk over it to pick it back up |
| `trap_percentage` | 15 | share of your filler replaced by traps |
| `butterfingers_reissue` | on | the suit hands back a weapon the Butterfingers Trap knocked away after half a minute |
| `death_link_amnesty` | 4 | deaths forgiven before one goes out to the multiworld |
| `mega_bot_swarm_trap_weight` | 0 | experimental: how often the Mega Bot Swarm Trap (about 73 bots at once) is rolled, against 25 for each other trap. Heavy on performance |

The HEV suit is never taken away from you, whatever `shuffle_hev_suit` says.
What the item controls is armour and aux power.

DeathLink counts the deaths Half-Life 2 does not treat as deaths, too: losing an
escort or failing an objective ends in a fade to black and a reloaded save, and
is sent.

## Troubleshooting

**Half-Life 2 Archipelago is not in the Steam library.** Restart Steam after
`/install`. Steam only reads sourcemods when it starts.

**On Linux, the game will not launch from Steam.** Set the entry's
Properties > Compatibility to a Proton version (see Installing).

**The game says its checkdata.txt does not match the client's apworld.** The
apworld that generated the seed and the installed mod are different builds.
Checks are paused until you reinstall the mod with `/install`.

**Checks are not being sent.** Make sure the client is connected. `/moddir`
shows the mod folder; its `archipelago/ap_in.txt` and `ap_out.txt` should be
there and recently modified.
