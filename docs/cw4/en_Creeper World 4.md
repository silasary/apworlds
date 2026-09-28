# Creeper World 4

## What does randomization do to this game?

The Farsite Expedition campaign (20 missions) is opened up. Mission access, unit
unlocks (cannon, mortar, terp, and the rest), ERNs, energy and storage upgrades,
and optional traps are shuffled into the multiworld item pool.

Missions are open: any mission whose unlock you hold is playable, in any order
your units can handle. You can also enter a mission you cannot yet finish and
still collect the checks you can reach.

Checks are per INSTANCE, not per objective: every info cache, every totem and
every nullifiable structure is its own location, and optional objectives count
too. That is 236 locations across the campaign - and 309 more if you turn on the
experimental `span_missions` option, though a single seed still holds only 20
missions' worth.

## What is the goal?

Beat **Founders**.

Reaching it is not enough. The finale is unwinnable until you have completed a
number of other missions - 12 of the 19 by default, configurable with the
`missions_for_finale` yaml option, or 0 to turn the requirement off. Until then
its final objective cannot be completed, and the mission says so on screen.

Ever After is a twentieth mission that the campaign normally hides behind a
cutscene. The mod puts it on the map so you can play it like any other; it is not
the goal.

## What items can appear in other players' worlds?

- Mission unlocks
- Unit unlocks, including units the campaign never grants, like the Airship,
  Bertha and Sweeper
- Progressive ERNs
- Energy storage and base generation upgrades for your rift lab
- Boons: one-shot helps like Ammo Resupply, Energy Cache, Field Shield and
  Resource Cache, plus a surge for each ERN port upgrade. These fill whatever
  the traps do not, so most of a seed's filler is boons
- Traps, if the seed enables them - `trap_percentage` defaults to 50, so lower
  it in your yaml if that is more than you want

## What should I know before starting?

Two options are worth a look before you generate:

- `logic_difficulty` - `standard` assumes only what is needed to WIN a mission.
  `casual` also assumes anti-air (a sniper or a missile launcher) from We Were
  Never Alone onward, so those arrive earlier and the mid-campaign is less of a
  grind.
- `starter_missions` - how many missions you begin with unlocked, drawn from the
  ones whose cache can be collected with no weapon. Default 2.
- `span_missions` - **experimental, off by default.** Mixes the game's 26 SPAN
  Experiment maps in with the campaign, so the 19 missions behind the goal are
  drawn from all 45. The level select still holds 20 planets and the goal is
  still Founders.

  Turn it on knowing what is behind it: every campaign requirement in this
  randomizer came from somebody finishing the mission and writing down what they
  needed, and no such notes exist for the SPAN maps. Their requirements were
  derived from the game's own data instead, which cannot see creeper advancing
  over a route, reach problems that are not about terrain, or environmental
  hazards. The logic is therefore deliberately over-cautious: expect a seed that
  is harder than it needs to be rather than one that cannot be finished.

## How do I install the game mod?

See the setup guide.
