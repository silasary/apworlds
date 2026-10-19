# A Little to the Left Setup Guide

## Required Software

- [A Little to the Left](https://store.steampowered.com/app/1629520/) on PC.
  The base game is enough. Both DLCs are supported and both are **off by
  default** - see DLC below.
- For easy setup (recommended):
  [r2modman](https://thunderstore.io/package/ebkr/r2modman/) OR
  [Thunderstore Mod Manager](https://www.overwolf.com/app/Thunderstore-Thunderstore_Mod_Manager).
- For manual setup:
  - The A Little to the Left Archipelago mod, from the
    [releases page](https://github.com/drohack/alttl-archipelago/releases).
  - [BepInEx 6 for Unity IL2CPP, x64, build be.755](https://builds.bepinex.dev/projects/bepinex_be/755/BepInEx-Unity.IL2CPP-win-x64-6.0.0-be.755%2B3fab71a.zip),
    the build the mod is tested with (be.697 also works).
    **This is a separate download - the mod release does not include it.** It
    must be BepInEx 6, not BepInEx 5: the game is Unity 2020.3.26f1 / IL2CPP
    and BepInEx 5 will not load it.

## Installing

### Easy setup (mod manager)

1. Download [r2modman](https://thunderstore.io/package/ebkr/r2modman/) with its
   **Manual Download** button and run the installer inside the zip (or install
   [Thunderstore Mod Manager](https://www.overwolf.com/app/Thunderstore-Thunderstore_Mod_Manager),
   which works the same).
2. Open the mod manager and select **A Little to the Left** in the game
   selection screen.
3. Select the default profile or create a new one.
4. Open the **Online** tab on the left, then search for
   **A Little to the Left Archipelago**.
5. Expand it and press **Download** to install the latest version and its
   dependency, BepInEx.
6. Press **Start modded**. The first launch takes noticeably longer than usual
   while BepInEx generates its files. The main menu gains an **Archipelago**
   entry.

The mod is also on
[Thunderstore's A Little to the Left page](https://thunderstore.io/c/a-little-to-the-left/),
whose **Install with Mod Manager** button does steps 2 to 5.

### Manual setup

1. Close the game.
2. Extract **BepInEx** into the game's install folder - the one containing
   `A Little To The Left.exe`. On Steam, right-click the game, then Manage,
   then Browse local files.
3. **Start the game once, wait for the main menu, and quit.** This is not
   optional: BepInEx generates its interop assemblies on that first run and the
   mod cannot load without them. This launch takes noticeably longer than
   usual, and only happens once. You should now have a `BepInEx` folder
   containing `config`, `core`, `interop` and `plugins`.
4. Extract the **mod** release zip into the same game folder, so that the files
   land in `BepInEx/plugins/ALTTLArchipelago/`.
5. Start the game again. The main menu gains an **Archipelago** entry.

**Launch the game with no extra command-line arguments.** Custom launch options
make Steam show a confirmation dialog before the game starts.

## Configuring your YAML file

### What is a YAML file and why do I need one?

Your YAML file contains the settings for your copy of the game. See the
[basic multiworld setup guide](/tutorial/Archipelago/setup/en) for more.

### Where do I get a YAML file?

From the [player options page](/games/A%20Little%20to%20the%20Left/player-options),
or from the copy shipped beside the mod in the same release.

### Generating the multiworld

Only whoever generates the seed needs this. Put `alttl.apworld`, from the same
release as the mod, into the Archipelago installation's `custom_worlds/`
folder. Archipelago 0.6.7 or newer is required. A mod manager shows the version
of the mod it installed; take the apworld and yaml from the release with that
version.

The mod and the apworld carry the same version number and are meant to be used
together, because a version change can move location ids. The mod checks this
when it connects and refuses a seed built by a different version rather than
playing a subtly wrong run.

### Settings worth knowing about

- **Puzzle Count** is how long the run is, 10 to 130 (the game's own campaign
  is 79). The default is 70, so the level select's overview strip fits on
  screen at full size; longer runs shrink it to fit.
- **Puzzles Per Pack** is how many puzzles each Puzzle Pack opens. Every block
  is the same size, including the free opening; only the last is short, because
  a run rarely divides evenly. It is 5 to 20, and a floor rather than a
  promise: a run carries at most 14 packs, so packs of your size that would
  need more than that all grow together.
- **Mechanic Coverage** is the main variety lever. Some mechanics have no
  procedural generator, so hand-made puzzles are the only way to see them -
  without DLC those are stacking, containers, drawers and jigsaws. This setting
  is how many puzzles are guaranteed for each. It is a floor, not the only
  door: campaign puzzles are also drawn by their own weight, so setting this to
  0 makes those mechanics merely unguaranteed rather than absent.

  Which mechanics are scarce depends on what you enabled, and it works itself
  out: Seeing Stars adds Distributing, a mechanic only one of its puzzles
  uses, so that joins the scarce list. Neither DLC brings a generator for a
  scarce mechanic - their randomizable puzzles keep the same layout whatever
  the seed.
- **Ability Locks** off makes every mechanic work from the start, leaving the
  packs as the only gate. Puzzles can no longer be partly solved.
- **Event Packs** chooses which seasonal Archive packs may appear. Without DLC,
  jigsaws only exist in event packs, so turning enough of them off drops
  jigsaws from the run and the ability with them.

### DLC

Both DLCs are supported and both are **off by default**. Turn one on only if
you own it.

| Setting | Adds | Solutions |
|---|---|---|
| **Cupboards and Drawers DLC** | 25 puzzles | 32 |
| **Seeing Stars DLC** | 37 puzzles | 100 |

Each has its own weight, on the same relative scale as the generator, event and
campaign weights, deciding how much of the run it fills. The weight covers all
of that DLC's puzzles, including the ones it marks randomizable.

Seeing Stars carries more alternate solutions than the entire base campaign, so
it is the one that changes a **Star Levels** goal most. Five of its puzzles are
locked by the game itself behind a running total of stars; the mod opens those,
so they play like any other slot.

**Only the player needs the DLC.** Whoever generates the multiworld does not,
and other players in the room are unaffected. If you ask for a DLC you do not
have installed, the mod says so when you connect and refuses the seed rather
than handing you a puzzle that will not open.

## Joining a MultiWorld Game

1. Start the game and choose **Archipelago** from the main menu.
2. Fill in the three fields: **Server** (the host and port together, as
   `host:port`), **Slot name**, and **Password** if the room has one.
3. Connect. Your run appears on the level select in place of the campaign.

Your randomized progress is kept separately from your normal save, so playing a
multiworld will not disturb a campaign already in progress.

## Troubleshooting

**The Archipelago option is not on the main menu.** The mod did not load. With
a mod manager, check you pressed **Start modded** rather than starting the game
from Steam. With the manual setup, check that
`BepInEx/plugins/ALTTLArchipelago/` exists inside the game folder. Either way,
look at `BepInEx/LogOutput.log` (in r2modman: Settings, Data and profile
folders, Browse beside Profile folder) for lines from `ALTTLArchipelago`.

**The game hangs on a Steam dialog at startup.** Custom launch options are set.
Clear them and start the game normally.

**Connecting is refused over a version mismatch.** The seed was generated by a
different version of `alttl.apworld` than the mod you have installed. Install
the matching pair - both ship in the same release.
