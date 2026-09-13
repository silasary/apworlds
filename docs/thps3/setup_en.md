# Tony Hawk's Pro Skater 3 AP Setup Guide

## Required software

- Tony Hawk's Pro Skater 3 v1.01.
- PartyMod v1.1.6
- The combined PartyMod/Archipelago `partymod.dll`.

The supported PartyMod-patched `THPS3.exe` has SHA-256
`1b67409414fc37a406d288098232b9947b21cdc16c80e014e580aa386bd57fef`.
The original PartyMod 1.1.6 `partymod.dll` has SHA-256
`846f2d5abe82c9781e6c2d5cd6cbe12b930286ee0912dd01b25ad5f017848f5a`.

PartyMod v1.1.6 can be downloaded here: `https://github.com/PARTYMANX/partymod-thps3/releases/tag/v1.1.6`

## Installation

1. Install THPS3 1.01 and PartyMod 1.1.6.
2. Copy the AP `partymod.ini` into the THPS3 directory
3. Copy the AP DLL into the THPS3 directory as `partymod.dll`.
4. Put `THPS3.apworld` in Archipelago's `custom_worlds` directory.
5. Configure `partymod.ini` beside the installed DLL:

   ```ini
   [Archipelago]
   Server=archipelago.gg:3333
   Slot=Player1
   Password=
   ```

### Windows download warning

The release DLL is unsigned, so Windows may show a download or reputation
warning. Verify the release's published SHA-256 hash first. If Windows shows an
**Unblock** checkbox in the downloaded ZIP or DLL's Properties dialog, use it
only after verifying the source.

It is likely that you will have to disable Windows Smart App Control because the
DLL connects to the Archipelago Server and reads process memory, which is seen as malicious.

Here is a short guide:
1. Open the Settings App.
2. Go to Privacy and Security - Windows Security - App and Browser Control.
3. Open 'Smart App Control Settings' and you can disable that form in there.

## Options

`skater_pool` contains the regular and secret pro skaters eligible for
selection, plus Custom Skater.
A single skater will be chosen from this list.

`level_pool` is a dictionary of level names. Set a level to `1` to include it;
set it to `0` or omit it to remove its regions, locations, and items.
`level_pool_size` randomly selects that many eligible levels. Leave it at `0`
to use the entire pool. Archipelago range values are supported, for example
`random-range-3-6` chooses 3 to 6 random stages from the level_pool.

`gap_checks_percentage` selects a percentage of all gaps for every enabled level.

`completion_goal`s:

- `objectives` requires `required_objectives` checked career goals or
  competition medals.
- `levels` requires `required_levels` fully completed levels. A normal level
  requires `max_objectives_per_level` career objectives, 
  competition requires all three medal locations.
- `cruise_ship` requires `max_objectives_per_level` Cruise Ship objectives.
- `gold_medals` requires `required_gold_medals` competition Gold Medals.
- `goal_type` requires every normal-level objective selected by
  `completion_goal_type`.
- `gap_hunt` requires `required_gap_percentage` percent of the gaps selected
  by `gap_checks_percentage`, rounded up.
- `collectibles` requires `required_collectibles` enabled stat-point or hidden
  deck checks.
- `total_checks` requires `required_checks` enabled checks of any type.
- `level_tour` requires up to `required_objectives_per_level` career objectives
  in every active level. Competition levels are capped at their three available medals.

`max_objectives_per_level` limits how many objective locations are randomly
selected in each level. Its default of `9` keeps every normal-level objective;
competition levels still have at most their three medals.
