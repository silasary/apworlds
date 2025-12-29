# Development Guide

Hello. This contains technical details about how the special .csv syntax for generating the logic. This is likely incomplete, as the original writer knows very little about how Archipelago actually works or any of its terminology. Here be demons.

# Logic CSV

## Terminology

To clarify things, here are some terms used for this section.

- `Game`: This refers specifically to Rusted Moss.
- `Room`: This is a Gamemaker (Rusted Moss's game engine) term, and signifies a single "screen" in the game. In general, whenever the screen fades to black, the current Room has changed.
- `Room Transition`: Another Gamemaker term, for when the player moves from one Room to another by touching one of the exits on a side of a Room.
- `Item`: A generic Rusted Moss term for any "thing" in the Game that can be collected or otherwise interact with. This includes upgrades (ie grappling hook or shotgun), switches (Game shortcuts), and other progression requirements (ie boss kills). These are used by the `requires` column in the CSV to generate the final Archipelago logic.
- `Location`, `Node` and `Edge`: Refers to the Archipelago logic location used by the `from` and `to` columns of the CSV. These are Nodes in a graph, and the connections between them are Edges.

## CSV Format

All logic is stored as a CSV file with 4 columns.

| from               | to                 | requires                               | notes   |
| ------------------ | ------------------ | -------------------------------------- | ------- |
| starting location  | ending location    | requirement to pass through            | comment |
| `rm_sea_3[100513]` | `rm_sea_3[100519]` | `Shotgun \| Rocket_Launcher \| Sniper` |         |

## `from` / `to` Locations

These are a uniquely-identifying Location in the Game or an Item. Most are a combination of a Game Room name (ie `rm_sea_3`) and an id (ie `100513`). A single Room can have multiple ids for different areas inside the same Room.

Originally, these ids were the internal Instance ids used by Gamemaker, however later versions break this consistency and will no longer fully match.

## `requires`

This is an optional string interpreted as a set of Items to progress from `from` to `to`. The string is interpreted as boolean logic, with `|` as logical OR and `+` as logical AND. All Items are defined in the `Items.py` file.

# Gimmick CSV

Gimmick is a mod made by Harlem512 that replaces most of the game's standard progression upgrades (grapple, grapple retraction, shotgun, and rocket launcher) with additional mid-air jumps. Here are all of the upgrades, in order of logic usefulness.

1. Grapple / grapple retract / shotgun / rocket launcher (1-4 jumps)
2. Charge jump (higher initial jump on moss)
3. Heavy ammo (higher jumps and bolt dispenser flying)
4. Grenade (for grenade doors and damage boosting)
5. Ruby Slippers (precise jumps)
6. Infinite grapple (infinite jumps)

To make this logic easier to read, the internal `Jumps{N}` Item is added. This is converted to a "standard" Item when the CSV is read.

## Infinite Grapple

Because infinite jumps breaks much more of the game than infinite grapple does, obtaining infinite jumps is gated behind all 4 standard jump upgrades and obtaining infinite grapple. Obtaining infinite grapple without all 4 jump upgrades does nothing.

## Precise Movement

Any logic that abuses "coyote time" requires this tag. This does not include "smuggling" charge jump charges past the edges of moss.

## Bunny Hopping

Gimmick's hidden mechanic is Bolt Dispenser flying, using Heavy Ammo. Any that require building momentum using ground jumps are gated behind the `BunnyHopping` logic requirement, using the logic shorthand `Flying`.

If the Location doesn't require building momentum first (such as `Jumps{2} + Heavy Ammo` for rm_forest_to_rain) then it doesn't require this tag.
