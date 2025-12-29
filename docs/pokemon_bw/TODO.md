# Important stuff

- fix ut_compatibility key error
- fix optiondicts not checking whether all keys are defined

# 0.4.0

- somehow fix problem with patch backwards compatibility for patch file altering versions that actually can support older versions (e.g. 0.3.99 not accepting 0.3.0)
- somehow account for excluded locations in shuffle badges/tms
- reduce different forms weight in randomization
- remove arceus types
- Merge PR adding "Randomize" to trainer/wild if other modifiers present
- add now-possible locations
- fix bianca being spelled "Bianka" on some location names
- add "for seeing 25 species" to location in Castelia City
- Fix Guidance Chamber items being called "Mistralton Cave 3F..."
- add missing hidden item in chargestone cave b2f and change the other hidden item's name
- More modifiers
  - Randomize Wild Pokémon
    - Prevent overpowered pokémon 
      - Gets overwritten by "Ensure all obtainable"
      - Base stat total threshold adjustable
  - Randomize Trainer Pokémon 
    - Prevent overpowered pokémon
      - Base stat total threshold adjustable
    - Force fully evolved 
      - Level threshold adjustable
- Randomization Blacklist
  - Wild pokémon 
    - This will throw an OptionError if "Ensure all obtainable" is selected and any blacklisted is base stage
  - Trainer pokémon
- after everything else: check docs for up-to-date information, update tests, update location names in ut                             

# Not urgent

- dig with seasons patch crashes the game, not fixable?
- look through scripts and remove space checking for specific items
- fill evo method ids
- more inclusion rules
- complete levelup movesets
- advertise on ds romhacking servers
- post MonochromeScriptAssembler to ds romhacking servers
- make simple script compiler, use for starting season, season npc vanish, tmhm hunt npc vanish, and other future stuff
- change rules dict to being filled on the way
- organize imports for type hints behind TYPE_CHECKING
- pitch webhost and template yaml notes, both individual, but template copying from webhost by default
- Fix locations in pokédex if something written to encounter tables
- route 18 reappearing and undella bay reappearing items get still detected after pickup
- make reusable tms option add funny dialog
- BizHawk 2.11 having issues with modded gen 5 roms
- Chargestone cave make north to south shortcut open after traversing it for the first time (maybe when battled N)

# Single reports, cannot recreate, need to wait for more reports

- not receiving key items?
- scientist nathan no text after battle?
- ranger claude talking french after battle?
- Some hidden items are not checkable immediately?
- grunt in pinwheel forest with vanilla dragon skull not talking anymore after obtaining the dragon skull
- stone grunts not disappearing?
- sequence break problem with npcs not moving, see channel
- incredibly low catch chances? idk how that could be related to the apworld in any way
- plando items having issues? plandoing basic badge into abyssal ruins sometimes raises fillerrors about this item not being placeable
- route 8 bianca items logic, apparently said to be in logic without light/dark stone, but blocked by grunts wanting the stone
