# Grand Theft Auto Vice City

## Quick Links

- [Setup Guide](/tutorial/Grand%20Theft%20Auto%20Vice%20City/setup/en)
- [Options Page](/games/Grand%20Theft%20Auto%20Vice%20City/player-options)
- [GTA Vice City Archipelago GitHub](https://github.com/Kryen112/GTA-Vice-City-AP)

## What you need before anything else

The original classic PC release of GTA: Vice City, executable 1.0
(`gta-vc.exe`), with its original `data/main.scm`. This is the classic game and
not the Definitive Edition, which is a different game the mod does not run on.

The client checks both before it installs anything, and refuses by name when
either is wrong: it reads which build the executable is, the way the mod's own
hooks do, and it fingerprints `data/main.scm` against the original 1.0 script.
The build check reads which build the executable is rather than hashing it, so a
1.0 that has been patched still passes. An executable it cannot read at all is
installed on anyway, with a line saying so, since a compressed one reads as
nothing on disk and as itself once the game is running.

You also need
[Ultimate ASI Loader](https://github.com/ThirteenAG/Ultimate-ASI-Loader) and
[CLEO](https://github.com/cleolibrary/III.VC.CLEO), two free community tools, in
your game folder. There is also an optional one,
[Windowed Mode](https://github.com/ThirteenAG/III.VC.SA.WindowedMode), which is
worth installing: Vice City's own fullscreen mode can make the game very slow on
modern PCs and can cause crashes, and this plugin avoids both.
The [Setup Guide](/tutorial/Grand%20Theft%20Auto%20Vice%20City/setup/en) says
which download to take from each and covers all the rest.

## What does randomization do in this game?

Vice City's missions no longer unlock each other. Each mission giver's strand
opens one mission at a time, and only when the multiworld sends you the
progressive unlock for that giver, so the order you play the city in is decided
by the seed rather than by the story. Every giver's strand is independent, so
Tommy can be four missions into the Colonel's work and still waiting to be
allowed to phone Mr. Black. The one mission that needs no item is the first
Rosenberg meeting, which is open on a new game and is where every seed starts.

Crossing to the mainland is an item too, and so is Starfish Island. The vanilla
bridges stay shut until the multiworld hands you the way over.

Missions and activities stop paying their vanilla rewards. The check is the
reward, and the money that mission would have paid returns to the item pool as
somebody's filler, yours or another player's.

Options can go further: abilities can be locked away (sprint, jump, crouch,
vehicles, weapons, and the ability to hold money at all), whole content classes
can be held inert until their item arrives, the radar can start hidden, the
radio can start with one station, and the ambient pickups scattered around the
city can be shuffled among themselves.

## What is a check?

Every class below is a YAML toggle except story missions, which are always on. A
disabled class behaves as it does in the vanilla game: its content stays
playable and pays its own rewards, and it holds no checks. Two options reach
past that on purpose. A content lock holds its class inert until its item
arrives whether or not that class is a check class, and shuffling the emergency
rewards takes those payouts into the item pool whether or not the levels are
checks, so with the class off the chains still play and simply stop paying.

| Check class | Checks |
| --- | --- |
| Story missions | 44 |
| Hidden packages | 100 |
| Rampages | 35 |
| Unique stunt jumps | 36 |
| Emergency vehicle milestones | 56 |
| Properties and venue missions | 40 |
| Robbable stores | 15 |
| Side events | 14 |
| Ambient pickups | 116 |
| Shop items | 36 |

With every class enabled that is 492 checks. The emergency milestones are per
level rather than per fare or per kill: paramedic, vigilante and firefighter
levels 1 to 12, taxi every tenth fare, and pizza deliveries 1 to 10. The side
events are the stadium events, the chopper checkpoints, the RC missions, Cone
Crazy, PCJ Playground, Trial by Dirt and Test Track.

## What items can appear in other players' worlds?

- Progressive mission unlocks, one per story giver and one per venue strand, in
  that strand's vanilla order.
- Mainland Access and Starfish Island Access, optionally split into one item per
  bridge and causeway.
- Property Ownership items, one per purchasable property. Buying the property is
  the check; owning the building is the item, and a venue's mission strand needs
  both.
- Ability and content lock items, for whichever locks the seed turned on.
- The hidden package rewards, which vanilla hands out at package thresholds:
  weapons, body armor, and the Sea Sparrow, Rhino and Hunter spawns.
- The emergency vehicle rewards, when the seed shuffles them.
- The safehouse vehicle spawns.
- The radio stations, and the minimap.
- Cash, in the exact denominations the suppressed vanilla rewards would have
  paid, and one-shot consumables.
- Traps, which take a configurable share of the filler.

## What does another world's item look like in this game?

Mostly it does not look like anything: a check is an activity you complete, so
the world is the vanilla city with vanilla scenery. The two exceptions are the
optional classes that put a check on an object. An ambient pickup that still
holds its check spins as a GTA III logo instead of the weapon or the health it
normally is, which is the one sprite the game itself never uses, and a shop
stand holding its check sells "AP Item" in place of its stock.

## When the player receives an item, what happens?

A row slides in down the left edge of the screen naming the item, who it came
from, and where it was found. Items apply as they arrive, including in the
middle of a mission, with one exception: while the player is not in control, in
a cutscene or on a mission-passed screen, a grant waits for control to come
back. A backlog is paced out over a few minutes rather than dropped, so nothing
is lost.

The pause menu carries an ARCHIPELAGO page above Quit Game with the state of the
seed: client connection, checks sent, items received, the game's own completion
percentage, which crossings are open, and whichever locks, stations and radar
setting the seed configured, plus the last messages in full.

## What are the goals?

Three, chosen in the YAML.

- **Final mission.** Complete "Keep Your Friends Close...".
- **Hidden package hunt.** Receive a configurable number of Package Fragments
  from the multiworld. Collecting a package in game is an ordinary check, never
  goal progress. The last fragment plays the story's ending wherever you are
  standing, credits and all.
- **The game's own 100 percent.** The completion percentage Vice City itself
  tracks. Generation refuses this goal unless every check class the stat counts
  is enabled.

## Other things worth knowing

DeathLink is supported and off by default. It sends on Wasted only, so an arrest
is not a death, and the client can turn it on or off for a session without
regenerating.

Universal Tracker is supported, and a PopTracker pack ships with the release.
