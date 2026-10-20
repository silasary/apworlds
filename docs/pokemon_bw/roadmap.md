# Roadmap for Pokémon BW AP

The "barely working" version will still be playable to goal, so it will start with 0.1.0.

Most bigger features will increase the version by +0.1.
<br>However, do not confuse that with semantic version naming: `major.minor.build`
<br>Versions before 1.0.0 though can have small feature additions in +0.0.1 updates.
<br>This can lead to some features not being listed for that version.

Version 1.0.0 will happen when certain important features are implemented.

The content of future updates used to be predetermined, but various circumstances 
resulted in that not really being followed, so it was changed to "whatever I wanna do next".

## What features are **not** planned to be implemented

- Shopsanity (due to technical limitations)

## Road to 1.0.0 (Required for core)

### 0.1.0: First version

- Options
  - Goals: Ghetsis, Alder, Cynthia, Cobalion, TM/HM hunt, Seven sages, Legendary hunt, Pokémon master
  - Version: Black, White
  - Shuffle Badges: No, shuffle between leaders, leaders can have any "badge", anywhere
  - Shuffle TMs/HMs: Shuffle between NPCs, shuffle HMs to gym leader rewards, NPCs can have any "TMxx" or "HMxx", anywhere
  - Dexsanity (only vanilla encounters)
  - Season control
  - Modify item pool: Useless key items, Useful fillers, Ban bad items
  - Modify Logic: Require Dowsing Machine
  - Reusable TMs
- Rom changes
  - Change roadblocks
  - Make evolution items obtainable somewhere
  - Remove trade and time based evolutions
  - Static encounter, gift, and trade resetting
  - Vanilla items don't get added to the bag
  - Gym leaders setting a custom flag instead of checking for the badge
  - Rage Candy Bar and fossils as key items
- QoL
  - Rom updates
  - Optional re-patch skipping
  - UT map tracker

### 0.2.0: Important backwards-compatibility-breaking changes

- See title

### 0.3.0: Actual randomization

- Options
  - Wild pokémon randomization
    - Also enables full dexsanity
  - Trainer pokémon randomization
  - Adjust levels
  - Encounter Plando
  - Master Ball seller (OptionSet), random cost in range if multiple
    - N's Castle
    - Cheren's mom
    - PC
    - Undella Mansion seller, always offering with a random price
    - Cost: Free
    - Cost: 1000
    - Cost: 3000
    - Cost: 10000
  - All pokémon seen (added in patch)
  - Modify Encounter Rates (added in patch)
  - Experience Multiplier (added in patch)
  - Plugin system (added in patch)
- UT auto-tabbing (added in patch)

### 0.4.0: Advanced Dataplandosanity

- Modify Levels option
  - Simple method, shown on Webhost
  - Advanced method, more capabilities
- Funny dialogue
- Text Plando
  - Text extractor setting in patching process
- Dexsanity plando (custom behavior of the Dexsanity option)
- More modifiers
  - Randomize Wild Pokémon
    - Prevent overpowered pokémon
    - Prevent bad early pokemon
    - Dungeon 1 to 1
    - Global 1 to 1
  - Randomize Trainer Pokémon 
    - Prevent overpowered pokémon
    - Evolve when possible
    - Force fully evolved
    - Type themed
    - Themed gym trainers
    - Shuffle gym leader types
    - Rivals keep starter
- Randomization Blacklist
  - Wild pokémon
  - Trainer pokémon
- Stats randomization
  - Base stats
  - Evolutions
  - Types
  - Catch rates
  - Levelup movesets
  - TM/HM compatibility
  - Egg groups
  - Egg species
- Stats plando (with all randomizable stats at that time)
- Replace Evolution Methods option
- Combined goals
- An NPC in Accumula Town telling you some information about the world
- Filler Items Blacklist option
- Move data randomization
  - Move power
  - Move type
  - Move accuracy
  - Move category (only Physical <-> Special)
  - Move pp
  - Type effectiveness chart
- Move data plando (with all randomizable data at that time)
- Dexcountsanity
- Seensanity
- Seencountsanity
- Formsanity
- Formcountsanity
- Shinysanity
- Shinycountsanity
- Shinyformsanity
- Shinyformcountsanity
- arm7 expansion (required for advanced assembly)
- Shiny rate ingame option
- Forget HMs without Move Deleter
- Scripting system (required for many other features)
- Dynamic choice in Game Version option
- Trainer rebattling
- Statics randomization
  - Starter
  - Gifts
  - Legendaries
  - Other statics

### Required for 1.0.0

- Expand plugins to client
- Options:
  - Goals: Regional Pokédex, National Pokédex, Custom Pokédex
  - Decrease trainer eyesight
  - Trade pokémon randomization
  - Disable certain location groups
    - Hidden items
    - Field items (will also disable min_once items)
    - Abyssal Ruins
    - Excluded locations (always enabled)
  - Customize roadblocks
    - Enabling/Disabling all roadblocks
    - Extra cuttable trees
    - Sudowodo trees
    - Rock Smash rocks
    - Something with the badge gates
    - Something needed to cross quicksand in relic castle
    - Massive ocean that connects

### Stuff that would be nice to have in 1.0.0

- Options:
  - More trainer pokémon randomization modifiers
    - Prevent bad early pokemon
    - Rivals take from box
    - N uses pokemon from nearby
    - More or less per trainer
  - Trainersanity
  - Gendersanity
  - Gendercountsanity
  - Shinygendersanity
  - Shinygendercountsanity
  - Trainer pokémon plando
  - Static pokémon plando
  - Seen count checks modifier, e.g. Prof Juniper TM rewards
  - Fan club chairman levels checks modifier
  - Adjust encounters (like Adjust levels, but with species, based on base stats, mostly just devolve)
  - Synced encounter tables
  - More encounter tables using behavior+flags editing
  - Ingame options (things changeable in PC, moving Experience modifier here)
    - Season control (only when vanilla or changeable, not randomized)
- Dowsing Machine as a hard requirement for hidden items (with option)
- Reducing encounter slots in Modify Encounter Rates
- Xtransceiver being required to see certain story sequences (with some of them giving items)
  - Also, dynamic Xtransceiver item that automatically adds the correctly gendered version to the game
- Castelia badge info NPC giving hints to in which game the badges are
- Use portable AP menu code to make on-screen item receiving possible

## Post-1.0.0 stuff

- Options
  - Stats randomization
    - Abilities
    - Gender Ratio (+ limit)
    - Move tutor compatibility
    - Held items
    - Pokémon names
  - Move data randomization
    - Move names
    - TM/HM content
  - Trashsanity
  - MetLocationsanity
  - Visitsanity
  - TMHMCountsanity
  - TVsanity
  - Fairy type
  - Levelup curve modifier
  - Door shuffle
  - Connections Plando
  - Shuffle roadblock requirements
  - Original content
    - Story scenes
    - Community-made trainers + teams
    - Types
    - Berry fields
    - Spinning puzzles
  - BW2 maps backport
    - More encounter maps+slots
    - More Visitsanity locations
    - More connections for Door Shuffle
    - More static encounters
    - Altered logic in some places
    - Requires BW2 ROM while patching
  - Free fly destination
  - Trainer randomization (i.e. what trainer you're actually battling against)
    - With plando capabilities
  - Boss Fight Plando (gym leaders, elite four (first+second run), Alder, N (N's Castle), Ghetsis, Cheren/Bianca (postgame))
    - Sounds kinda unnecessary, but is intended as a concept for the core PlandoBosses option
  - Story fight Plando (Cheren, Bianca, N, ...)
    - Maybe make it a part of Boss Fight Plando
  - DeathLink
  - Wonder trade
  - Multiworld gift Pokémon
  - Phenomena activation (vanilla, any badge, Striaton Gym, always)
  - BGM randomization
  - Cutscenes shortening
  - Dust cloud hunt (dust clouds have a chance to give a check)
  - Sprite shuffle
    - Overworld NPCs
    - In-battle trainers
    - Animated pokémon
  - Higher chance of encountering uncaught species
  - Multiple encounter rates tables
- Offline singleplayer
  - i.e. generating a single world will produce a romhack playable without connecting to a server
  - Some features won't be compatible with, e.g. Dexsanity
- Display other players and item names ingame
- Universal language support
- Traps
- Collected field items removal setting
