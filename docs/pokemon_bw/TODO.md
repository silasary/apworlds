# Important stuff

apworld
- specialized unittests for rando modifiers
- correlate mods in move data rando not working? => Special unit test cases
- Keep levels and amount still broken, see unittests
- too many pokemon for a trainer written into patch file

rom
- trainer flags setzen lassen wo es in den scripts fehlt und dann besiegte trainer IDs ins datastorage
- give national dex at start, will be turned into an item later on like running shoes

both
- fill more funny dialog
- add funny text "your free trial has ended" to old man in Striaton
- loot sack grunts broken? apparently not moving even after beating lenora

# Not urgent

- gym leader scripts control traded obedience level?
- wingull grams overworld item not disappearing
- extended location hint for challenge rock
- a way to check whether map or fly menu is opened, used for switching to ow map in UT
- Running shoes as an item, making mom cutscene on route 2 a check
- regional and national pokedex as items
- reload_key_items sometimes has index out of range error
- items receiving in client has rare cases of recursion errors
- make client use static game data pointers
- turn plugin options into actual options (can you even add more options after initial class creation?)
- import plugin packages and classes while the main apworld itself is getting imported
- any options with custom code should bundle error messages instead of raising immediately
- add nested randomness to plando values
- rom script changes, some to comply with regions rework:
  - inject item receiver into code that executes AP menu script
  - Go Home button (only after all rom changes listed below are implemented)
  - ############################
  - various events force-teleporting you should be removed
  - cheren+bianca after ghetsis in nuvema town are set to in front of the lab if not triggered immediately
  - accumula guards send you both ways
  - move striaton gym guide a bit south
  - striaton parcel man send both ways
  - route 3 line of pokemon, cleared after wellspring cave events
  - make n in nacrene trigger independently of nacrene stuff, but together with cheren
  - pinwheel shadow triad member send both ways
  - move rumination field rocks a bit
  - make liberty garden grunts not disappearing
  - remove victini shiny lock
  - waking up the desert resort statues says "It was a Darmanitan" -> Change to actual pokemon name
  - relic castle 1f worker send both ways
  - relic castle worker that sends you back down to sand filled room once you reached that at least once
  - relic castle chased grunt running towards all entrances
  - driftveil cheren and clay scene talking as alternate trigger
  - add more clerks to driftveil gym entrance
  - cold storage container blocking line of new grunts until triggering cheren in building near container
  - add traffic cones to mistralton gym entrance
  - both icirrus city scenes by trigger
  - dragonspiral rocks inside, cleared after bryce fight
  - make dragonspiral grunt trainers not disappear
  - remove reshiram/zekrom shiny lock
  - remove time requirement of tubeline bridge bikers
  - fix route 9 infielder script
  - add rocks to challengers cave entrance
  - remove giant chasm warps to snow
  - opelucid juniper by trigger
  - triggers in badge gates that push you down
  - remove closing doors in league
  - add rock on landing stage that is cleared exactly when champion room is messed up
  - some way to still get back to landing stage from champion room after champion room is repaired
  - remove once-per-day access to the riches

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
- liberty garden blackscreen
- one case of goal not triggering reported in sync
- master ball seller not showing up again?

# Spreadsheet and sync bugs list because I don't know where else to put them

- https://docs.google.com/spreadsheets/d/1nTE-zLKvLuS_o0_4VnhBtydn03_-O1f130813sLqzuY/edit?gid=0#gid=0
- https://docs.google.com/spreadsheets/d/1N6PfSe9zIasQOXFInW-dh5KCmem-PrmYzQROAqqA0SA/edit?gid=0#gid=0
