# Table of contents

- [Encounter Plando guide](#encounter-plando-guide)
- [Custom encounter rates guide](#custom-encounter-rates-guide)
- [Text Plando guide](#text-plando-guide)
- [Modify Levels (advanced mode) guide](#modify-levels-advanced-mode-guide)
- [Dexsanity Plando guide](#dexsanity-plando-guide)
- [Stats Plando guide](#stats-plando-guide)
- [Nested randomness in modifier-based options guide](#nested-randomness-in-modifier-based-options-guide)
- [Combined goals guide](#combined-goals-guide)
- [Move Data Plando guide](#move-data-plando-guide)

# Encounter Plando guide

## How does this work?

The Encounter Plando option in your yaml file lets you force place certain Pokémon species into certain slots.
Every encounter table (one for each map that has wild Pokémon) in the game contains 56 slots, 
grouped into different encounter methods (grass, surfing, etc.), 
with each slot containing the species, a minimum catch level, and a maximum catch level.
Every entry in your Encounter Plando option will place a specific species into one or more slots of an 
encounter method in an encounter table.
Encounter Plando entries take priority over wild Pokémon randomization and works regardless of whether 
you even have wild Pokémon randomized or not.

## Important notes for multiworld hosts

Encounter Plando can lead to generation failures that might not look like coming from this option. 
The Pokémon Black and White host.yaml settings have a toggle to enable or disable this option, 
which is by default set to true. 
If disabled, yamls with Encounter Plando entries will ignore them and just print a warning to the console 
without stopping multiworld generation.

## How do I use it?

Every entry consists of 3 to 5 arguments:
- `map` determines which map (i.e. which encounter table) this entry should be placed into. 
  You can find a list of all map names [here](plando%20lists.md#all-map-names).
  The map names must match the names on that site exactly (except for casing).
- `seasons`/`season` is an optional argument that determines which season(s) this entry should be placed into. 
  However, not all maps support different encounters for different seasons. 
  You can find a list of all maps supporting different seasons 
  [here](plando%20lists.md#maps-that-support-having-different-seasons).
  If the map does not support different seasons, you **have to omit** this argument.
  Else, you can either write a single season or a list of seasons.
- `method` determines which encounter method this entry should be placed into. 
  Allowed method names are `Grass`, `Dark grass`, `Rustling grass`, `Surfing`, `Surfing rippling`, 
  `Fishing`, and `Fishing rippling`.
  Note that the floor of caves/dungeons/etc. count as `Grass` and dust clouds 
  and flying Pokémon's shadows count as `Rustling grass`.
- `slots`/`slot` is an optional argument that determines the exact slot(s) of the entry in the specified method.
  You can either put in a single number, a list of numbers, or omit this argument.
  If omitted, this entry will be placed into all slots of the specified method.
  See [here](plando%20lists.md#encounter-slot-values) for further information on allowed values.
- `species` determines which species should be placed into the specified slot(s).
  You can either put in a single species name or a list of species names.
  `None` can be used (preferably in lists) to make the generator not plando any species into the specified slot(s).
  If multiple species are provided, a random one out of them is chosen.
  Writing the same species multiple times is allowed and can increase its chance of being chosen over 
  the other species in the list.
  See [here](plando%20lists.md#all-species-names) for a list of all species names.
  Note that different forms have different names, e.g. Unown (A)/(B)/...

Specifying a slot that does not exist in the game (e.g. `Grass` slots in Striaton City) will not have any effect
on the game since all encounter tables have space for each encounter method, 
but it will also not be considered in logic and give no warning or error message.

## An example on how using this option could look like

```
Pokemon Black and White:
  ...
  encounter_plando:
    - map: Route 1
      method: Grass
      species: Blastoise
    - map: Route 8
      season: Summer
      method: Surfing
      slot: 4
      species: Liligant
    - map: Twist Mountain (Upper Level)
      seasons:
        - Spring
        - Winter
      method: Grass
      slots:
        - 0
        - 2
        - 4
        - 6
        - 8
        - 10
      species:
        - Snorlax
        - Snorlax
        - Dragonite
        - Bidoof
        - None
        - None
```

# Custom encounter rates guide

## How does this work?

The base encounter rates for all wild encounter slots are (in %) usually [20, 20, 10, 10, 10, 10, 5, 5, 4, 4, 1, 1] 
for (Dark/Rustling) Grass, [60, 30, 5, 4, 1] for Surfing (Rippling), and [40, 40, 15, 4, 1] for Fishing (Rippling).
Using the `Modify Encounter Rates` option, you can change those rates to either a few preset rates, a random 
distribution, or a custom list.

## How do I use it?

Instead of just writing a single option name like `vanilla` or `try_normalized`, you need to provide key-value pairs 
**as a choice**. "As a choice" means that you'll need to pack it into a list, see the examples 
down below for how to do it. To change (Dark/Rustling) Grass rates, use the `Grass` key. Surfing/Fishing (Rippling) 
rates need the `Surfing`/`Fishing` key respectively. Though you are not required to always use all keys; you can leave 
any of them as vanilla if you want. The value has to be a list of positive integers. The `Grass` key needs exactly 12 
numbers, while the others need exactly 5 numbers. All numbers in a list need to add up to exactly 100 and need to be 
greater than 0.

## Examples on how using this option could look like

```
Pokemon Black and White:
  ...
  modify_encounter_rates:
    # The extra "- " is required in order to not break weighting
    # That however makes picking out a random key-value pair possible (if multiple are provided)
    - Grass: [30, 10, 4, 2, 2, 2, 25, 10, 5, 4, 4, 2]
      Surfing: [25, 25, 30, 10, 10]
      Fishing: [96, 1, 1, 1, 1]
    - vanilla
    # Alternative way, notice that leaving out the "Surfing" key is valid
    - {Grass: [30, 10, 4, 2, 2, 2, 25, 10, 5, 4, 4, 2], Fishing: [96, 1, 1, 1, 1]}
```

# Text Plando guide

## How does this work?

All ingame text in stored in text files that are structured like tables. The Text Plando option lets you fill 
these tables however you want. Every entry must follow a certain format that is adopted from the ALttP Text Plando.
This option takes priority over the `Funny Dialog` option.

## Important notes for multiworld hosts

Text Plando is a plando setting that is included in every host.yaml. It needs to be enabled in order for 
this option to work. If it is disabled, yamls with Text Plando entries will show a warning about the setting
being disabled and not check the provided entries for correct formatting.

## How do I use it?

Every entry contains 2 or 3 arguments:
- `text` defines the text you want to insert into the game.
  You will have to set every line break yourself and use the following commands:
  - `[NextLine]` is a simple line break and often used in combination with other commands.
  - `[Scroll]` makes the text box scroll the lines up by one. It is always followed by a `[NextLine]`.
  - `[End]` ends the current chain of lines, waits for any button press, and shows an arrow indicating that. 
    It is never used alone. If followed by a `[NextLine]`, it will clear the text box after any button press 
    and continues on the upper line. If written to the end of a line, it will close the text box after any button press.
    However, in case you haven't noticed, the game **always** waits for any button press before closing 
    almost any text box, but sometimes with an arrow indicating the wait for a button press and sometimes not.
    The arrow only appears when the line ends with an `[End]`. You always need to make sure you only and always use 
    an `[End]` when needed. If it is needed, and you omit it, the text box will close without any player interaction.
    If it's not required, and you add it, the game will wait for two button presses.
    - `[c_xxx_#x_x_...]` and `[d_xxx_#x_x_...]` are various commands used for different purposes, e.g. displaying 
    various names with different formatting, forcing the text to be displayed faster, changing the text color, etc.
    The best way to learn what commands to use for your use case is by looking at already existing text lines, 
    especially the one you are trying to overwrite.
  
  Since text boxes have limited width, it is recommended to make no line longer than 40 characters.
  Certain kinds of texts used in other places than text boxes (e.g. ability descriptions, pokédex entries, etc.)
  might have other additional restrictions.
- `at` defines where to put the given text. It consists of the section (currently only `system` and `story`),
  the file number (0-287 for system, 0-471 for story), the block (always 0, anything else will have no effect),
  and the line (with the first line having the number 0). All parts have to be separated by spaces (" ").
- `percentage` is an optional argument that can give every entry a chance of not being written to the rom.

You can extract the text files of a patched rom by enabling the `extract_text` setting in your host.yaml before
running your patch file. That will produce two text files (one for the system section and one for the story section)
that you can use to find where you have to place your text lines.

## An example on how using this option could look like

```
Pokemon Black and White:
  ...
  text_plando:
    - text: "Huh? Why did you press the[NextLine]B button?[Scroll][NextLine]It will stay weak!"
      at: "system 172 0 1"
      percentage: 100
    - text: "[c_100_#1_0] received [c_101_#1_1]![End][NextLine]Congratulations!"
      at: "story 160 0 7"
      percentage: 50
    - text: "The arch nemesis of every Nuzlocker."
      at: "system 235 0 202"
```

# Modify Levels (advanced mode) guide

## How does this work?

This option usually works like a simple counter. The webhost and any software that lets you edit yamls with a user
interface will show you the option as such. However, you can also provide multiple entries with multiple arguments
like you know it from most Plando options (if edited in a text editor). This "advanced" mode lets you chain multiple
calculations. This allows for more complex and interesting calculations.

## How do I use it?

Every entry contains the following 3 arguments:
- `type` is either `Trainer` or `Wild`.
- `mode` is either `Multiply`, `Add`, or `Power`. You can alternatively use the internal numbers 0-2 (accordingly).
- `value` is the value that should be used in the calculation. 
  The `Multiply` mode interprets it as a percentage and allows for values in range 1 to 10000. 
  The `Add` mode interprets it as whole levels and allows for values in range -99 to 99.
  The `Power` mode interprets it as a percentage and allows for values in range 1 to 700.

Do note that after every calculation, the result is rounded down and capped at 1 and 100

## An example on how using this option could look like

The following example flattens the level curve of earlygame trainers, but makes it steeper for lategame trainers,
while maintaining the minimum level of 5:
```
Pokemon Black and White:
  ...
  modify_levels:
    - type: Trainer
      mode: Add
      value: -4
    - type: Trainer
      mode: Power
      value: 110
    - type: Trainer
      mode: Multiply
      value: 67
    - type: Trainer
      mode: Add
      value: 4
```

Here's another example that sets the levels of all wild and trainer pokémon in the game to exactly 20:
```
Pokemon Black and White:
  ...
  modify_levels:
    - type: Trainer
      mode: Add
      value: -99
    - type: Trainer
      mode: Multiply
      value: 20
    - type: Wild
      mode: Add
      value: -99
    - type: Wild
      mode: Multiply
      value: 20
```

# Dexsanity Plando guide

(This guide also applies to `Seensanity`, `Formsanity`, `Shinysanity`, and `Shinyformsanity`.)

## How does this work?

Instead of writing a single number to determine the amount of random Dexsanity checks you want to have in your world, 
you can provide a fixed list of dex numbers (or form names for `Formsanity` variants) you want to have checks for. 
Randomizing wild encounters will also ensure, that your plando'd Dexsanity checks are actually possible.
However, not randomizing wild encounters and then adding dex numbers that are not catchable in vanilla will only add a 
location if you plando that species somewhere in the game.

## How do I use it?

Instead of writing a single number, you can write a list of multiple dex numbers, pokémon names (without the form 
suffix), dex number ranges, and (weighted or unweighted) lists **as an entry**, i.e. as a list inside a list. 
Using even further nested lists inside that entry will pick a random element out of them.
Writing a simple list (e.g. `dexsanity: [1, 4, 7]`) will be interpreted by AP as a list to pick a random entry from, 
i.e. you will end up with one of the numbers as the amount of random checks.
However, this makes it possible to choose between multiple lists of dex numbers.

In the case of all `Formsanity` variants, you have to write a list of form names (and 
weighted/unweighted lists) instead, which differ slightly from the forms names used in 
other plando options and the spoiler log. 
See [here](plando%20lists.md#Formsanity-names) for a list of all allowed forms.

## An example on how using this option could look like

```
Pokemon Black and White:
  ...
  dexsanity:
    # Out of all lines below, a random one is chosen
  
    # A simple lists of dex numbers
  - [50, 51, 52, 53, 59]
    # A simple lists of names
  - [Omanyte, Omastar, Tirtouga, Carracosta]
    # A single number (which is then the amount of random checks again)
  - 5
    # A list of just a single range (All Unova pokémon btw.)
  - [494-649]
    # A list containing one of every way to define your checks
  - [151, Maractus, 210-220, [411, Genesect], {6: 5, Charmander: 2, "1-3": 1}]
    # A list of lists of lists of names, you can go wild with nesting things
  - [[[Goldeen, Finneon], [Magikarp, Luvdisc]], [[Alomomola, Basculin], [Remoraid, Barboach], Feebas]]
  ...
  formsanity:
  - ["Unown (M)", "Darmanitan (Zen)"]
  - ["Castform (Normal)", ["Castform (Sunny)", "Castform (Rainy)", "Castform (Snowy)"]]
  - [{"Burmy (Plant)": 5, "Burmy (Trash)": 1, "Burmy (Sandy)": 1}, {"Wormadam (Trash)": 5, "Wormadam (Sandy)": 2}]
  - 5
```

# Stats Plando guide

## How does this work?

Stats Plando lets you force set certain stats of a pokémon like base stats or evolutions, regardless of 
whether those stats where randomized or not. 
Every entry applies to a specific pokémon and takes priority over regular randomization, while also influencing that.
This option might be expanded in its functionalities once new randomization options get implemented.

## Important notes for multiworld hosts

Stats Plando can lead to generation failures that might not look like coming from this option. 
The Pokémon Black and White host.yaml settings have a toggle to enable or disable this option, 
which is by default set to true. 
If disabled, Stats Plando entries will be ignored and only print a warning to the console 
without stopping multiworld generation.

## How do I use it?

Every entry belongs to a specific pokémon species and contains multiple keys for editing a certain stat each. 
The specified species can either be the standard pokémon name (i.e. without any form suffix) or the form's name 
found in the [species names list](plando%20lists.md#all-species-names) (note that adding an entry for the standard name **and** base form name, e.g. 
`Deerling`&`Deerling (Spring)`, is not allowed). However, non-base forms that are not at the bottom of that list 
don't have separate data in the game's files and are thereby not allowed in this context. Also, even custom forms 
can't have their own evolutions.

Every entry (currently) consists of the following keys (with all of them being optional):
- `base_hp`, `base_attack`, `base_defense`, `base_sp_attack`, `base_sp_defense`, and `base_speed` set the 
  corresponding base stat. Allowed values are in range 1-255. Setting them to 0 will use the vanilla stat instead.
  Omitting any of these keys will default them to 0. Setting any of them to a non-zero value will exclude 
  that pokémon from having its base stats randomized.
- `types` overrides that pokémon's type(s). It is optional and accepts a single type as a string as well as up to two 
  types as a list of strings. An empty list has no effect.
- `evolutions` will override that pokémon's evolutions (or append to them). It is an optional list of evolution entries 
  with each of those having the following format (putting in an empty list will accordingly remove all evolutions 
  (or append none)):
  - `species` (required) is the pokémon that should be evolved into. Only standard pokémon names are allowed.
  - `method` (optional) is the way the evolution should be triggered. See the 
    [methods list](plando%20lists.md#evolution-methods-list) for allowed values. Omitting this will default it 
    to `Level up`.
  - `level` (optional) is the level at which certain levelup methods should be triggered. Allowed values are
    in range 2-100. Omitting this will default it to 20.
  - `stone` (optional) is the item that triggers the stone-based methods. See the 
    [evolution items](plando%20lists.md#evolution-items-list) list for allowed values. Omitting this will default it 
    to the `Shiny Stone`.
  - `held` (optional) is the item that triggers the held item-based methods. See the 
    [evolution items](plando%20lists.md#evolution-items-list) list for allowed values. Omitting this will default it 
    to the `King's Rock`.
  - `move` (optional) is the name of the move that triggers the `Level up with move` method. Any move in the game 
    is allowed to be used. Omitting this will default it to the `Toxic`.
  - `partner` (optional) is the species that triggers the `Level up with party member` method when present 
    in your party. Only standard pokémon names are allowed. Omitting this will default it to `Remoraid`.
  - `species_2` (optional) is the species that is used by the `_Level up split`, `_Level up PID`, and `_Level up stats` 
    macros. Only standard pokémon names are allowed. Omitting this will default it to `Shedinja`.
  - `species_3` (optional) is the species that is used by the `_Level up stats` macro. Only standard pokémon names are
    allowed. Omitting this will default it to `Hitmontop`.
- `override_evolutions` determines whether the provided list of evolutions should override the existing evolutions 
  (thereby excluding that pokémon from evolution randomization) or append to the existing (potentially randomized) 
  evolutions. It is optional and defaults to `true` if omitted.
- `levelup_moveset` will override that pokémon's levelup moveset (or append to them). It is an optional list of 
  level-move entries. If it's supposed to override the levelup moveset, at least one move learned at level 1 must be 
  added. Each entry has the following format:
  - `level` is the level at which the move should. Allowed values are in range 1-100.
  - `move` is the name of the move that should be learned. Any move in the game is allowed to be used.
- `override_levelup_moveset` determines whether the provided list of levelup moves should override the existing 
  evolutions (thereby excluding that pokémon from levelup moves randomization) or append to the existing (potentially 
  randomized) moves. It is optional and defaults to `true` if omitted.
- `tm_hm_compatibility` adds a list of TMs and HMs to the list of (potentially randomized) already compatible TMs and 
  HMs. Each list entry needs to be written as `TMxx` or `HMxx` with `xx` being the number. It is optional and defaults 
  to an empty list if omitted.
- `catch_rate` sets the catch rate. The higher the catch rate of a pokémon species is, the easier it is to catch.
  Allowed values are in range 3-255. Setting this to 0 or omitting it will not plando the species' catch rate.
- `egg_groups` overrides that pokémon's egg group(s). It is optional and accepts a single group as a string as well as 
  up to two groups as a list of strings. An empty list has no effect. See the 
  [egg group names](plando%20lists.md#egg-group-names) list for allowed names. Note that `Ditto` and `Unknown` cannot 
  be combined with other egg groups and always have to be a mono group.
- `egg_species` overrides the resulting egg of breeding that pokémon either as the female parent or with a Ditto. 
  It is optional and accepts dex names as well as form names. Changing the egg species of certain species with special 
  conditions (e.g. Nidoran) or using certain species as egg species (e.g. baby stages) will result in those conditions 
  being removed.

## An example on how using this option could look like

```
Pokemon Black and White:
  ...
  stats_plando:
    Bulbasaur:
      base_hp: 5
      base_attack: 5
      base_sp_attack: 255
      catch_rate: 120
    Eevee:
      evolutions:
      - species: Giratina
        method: Level up
        level: 95
      - species: Vaporeon
        method: Friendship
      - species: Eevee
        method: Stone
        stone: Shiny Stone
      override_evolutions: true
      egg_species: Giratina
    Shelmet:
      base_defense: 200
      base_sp_defense: 200
      types: Flying
      evolutions:
      - species: Karrablast
        method: _Level up split
        level: 15
        species_2: Shelmet
      override_evolutions: false
      levelup_moveset:
      - move: Pound
        level: 20
      - move: Flamethrower
        level: 99
      override_levelup_moveset: false
      egg_groups: Water 3
    Genesect:
      types: [Psychic, Fighting]
      levelup_moveset:
      - move: Pound
        level: 1
      - move: Flamethrower
        level: 99
      override_levelup_moveset: true
      tm_hm_compatibility:
      - TM01
      - TM06
      - TM71
      - HM02
      egg_groups: [Monster, "Human-Like"]
```

# Nested randomness in modifier-based options guide

## How does this work?

Modifier-based options (e.g. `Randomize Wild Pokémon`) natively support values like `random` or `random-range-0-5` to 
get a random amount of unique modifiers.
The options in this apworld additionally support nested lists to give more control over what modifiers should be rolled.

## How do I use it?

Instead of writing a modifier's name as an entry in the option, you can write a whole list, of which a random value 
should be chosen from.
Weighted lists, a `null` value for not choosing any modifier, and comma-separated modifiers in a single string 
(i.e. inbetween two `"`) for choosing multiple modifiers at once are supported as well.

## An example on how using this option could look like

```
Pokemon Black and White:
  ...
  randomize_wild_pokemon:
    # Always included:
    - Ensure all obtainable
    # Only one of them will be included:
    - [Prevent overpowered pokemon, Prevent bad early pokemon]
    # 50% chance to include "Type themed areas":
    - [Type themed areas, null]
    # Either ONLY Prevent rare encounters or Area 1 to 1 AND Merge Phenomena will be included:
    - [Prevent rare encounters, "Area 1 to 1, Merge Phenomena"]
```

# Combined goals guide

## How does this work?

Usually, you choose one of many goals of an apworld, which is, well, the goal of your adventure. 
This game features a "Pokémon master" goal, which combines all other goal, similar to 
Stardew Valley's "Perfection" goal.
Using combined goals, you can make a Pokémon master goal with a somewhat smaller scope.

## How do I use it?

Instead of writing a single goal, you can write a list of multiple goals **as an entry**, i.e. as a list inside a list. 
Writing a simple list (e.g. `goal: [ghetsis, cobalion]`) will be interpreted by AP as a list to pick a random entry 
from, i.e. you will end up with only one of the provided goals.
However, this makes it possible to choose between multiple combinations, including single goals.
This also supports the nested randomness of modifier-based options.

## An example on how using this option could look like

```
Pokemon Black and White:
  ...
  goal:
    # One of the 3 (combined or single) goals will be chosen at random
    - [tmhm_hunt, legendary_hunt]
    - [seven_sages_hunt, cobalion, [ghetsis, champion]]
    - cynthia
```

# Move Data Plando guide

## How does this work?

Move Data Plando lets you force set certain data of moves in the game like their power and accuracy, and individual 
entries in the type effectiveness chart, regardless of whether that data/effectiveness was randomized or not. 
Every entry applies to a specific move or attacking-type-defending-type combination and takes priority over regular 
randomization, while also influencing that.
This option might be expanded in its functionalities once new randomization options get implemented.

## Important notes for multiworld hosts

Move Data Plando can lead to generation failures that might not look like coming from this option. 
The Pokémon Black and White host.yaml settings have a toggle to enable or disable this option, 
which is by default set to true. 
If disabled, Move Data Plando entries will be ignored and only print a warning to the console 
without stopping multiworld generation.

## How do I use it?

Every entry belongs to a specific move or attacking-type-defending-type combination and contains multiple keys for 
editing a certain aspect each. 
For move data entries, the key must be the name of the move (the exact in-game name, a list of all names can be found 
in the [move names list](plando%20lists.md#all-move-names)) you want to plando.
Every entry (currently) consists of the following keys (with all of them being optional):
- `power` is the power, that's displayed on the move summary screen of (most) physical or special moves. Allowed values 
  are in range 5-250. Setting it to 0 will keep the vanilla power instead. Changing the power of status moves and moves 
  with a unique calculation is not allowed
- `accuracy` is the accuracy, that's displayed on the move summary screen of all moves. Allowed values 
  are in range 5-100. Setting it to 0 will keep the vanilla accuracy instead. Changing the accuracy of moves with a 
  guaranteed hit chance is not allowed
- `pp` is the power points, that determines how many times you can use a move before healing your pokémon. Allowed 
  values are in range 1-250. Setting it to 0 will keep the vanilla power points instead.
- `type` is the type of the move, that has an effect on the damage the move deals, based on the attacker's and 
  defender's types. Allowed values are all 17 types in the game (in uppercase). Setting it to an empty string will keep 
  the vanilla type instead.
- `category` is the category of the move, that determines the base stats that should be used to calculate the damage. 
  Allowed values are only `Physical` an `Special`. Setting it to an empty string will keep the vanilla category 
  instead. Changing the category of status moves is not allowed

For type effectiveness entries, the key must consist of two types that are connected by and underscore (`_`). The frist 
type is the attacking type and the second type is the defending type.
Every entry (currently) consists of only the `effectiveness` key, which is required and can be one of the numbers 
`0`, `2`, `4`, or `8`. `0` is an immunity, `2` is a resistance, `4` is neutral, and `8` is a weakness.

## An example on how using this option could look like

```
Pokemon Black and White:
  ...
  move_data_plando:
    Tackle:
      power: 200
      accuracy: 30
      pp: 250
    Bite:
      type: Normal
      category: Special
      pp: 1
    Normal_Ice:
      effectiveness: 8
    Psychic_Bug:
      effectiveness: 0
    Fire_Dragon:
      effectiveness: 4
```
