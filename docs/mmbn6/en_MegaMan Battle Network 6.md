# MegaMan Battle Network 6

## Where is the options page?

This is currently a custom world so there is no options page yet. In order to create your options you'll need to 
download one of the starter YAMLs on the GitHub releases page. Alternatively you can create the default yaml by 
following the Archipelago &template guide:

How to generate a template yaml: For Core-Verified apworlds, your \Players\Templates folder will already have template 
yamls by default. For Custom apworlds, install the apworld first by double clicking on it, then open 
ArchipelagoLauncher.exe to start the Launcher, and click on Generate Template Options to create template yamls for all 
of the apworlds in your \custom_worlds folder as well as your \lib\worlds folder. After you click on this button, a File 
Explorer window will open (on Windows) pointing directly to your \Players\Templates folder, with all of the new template 
files. Use these to create player options for any of the apworlds you have installed, Core-Verified or Custom.

## What does randomization do to this game?

Items which the player would normally acquire throughout the game have been moved around. Logic remains, so the game is
always able to be completed, but because of the item shuffle, the player may need to access certain areas before they
would in the vanilla game.

The game begins in "Open Mode", in a story state just before fighting Gregar. All story progress leading up to
that point has been auto completed. 

Tab's Lotto Machine has been replaced with a shop interface where you can pay 500z to access the next item in the
trader sequence.

The LevBus allows players to access all areas, but requires players to have specific key items first. It will specify 
which key item is required if you try to go somewhere and can't, but these key items are also listed below.
- `Fish` unlocks Seaside Town
- `AuthData` unlocks Green Town
- `Umbrella` unlocks Sky Town
- `ACDCKyDt` unlocks ACDC

The Graveyard Area is unlocked from the start, since the Library is filled automatically, though it is blocked by the 
BatKey.

## What is the goal of MegaMan Battle Network 6 when randomized?

Defeat Gregar in the Central Pavilion of the Expo Site. You will not be able to access the final room until you've 
acquired the `StmpCard` (which provides access to the Expo), along with the 4 Win Cards (`WinCardA`, `WinCardB`, 
`WinCardC`, `WindCardD`).

## What items and locations get shuffled?

Locations in which items can be found:
- All Blue and Purple Mystery Data.
- The rewards from all available Requests.
- All overworld item pick ups, including Trades and Quizzes with NPCs.
- All Link Navi classes, except for HeatMan (for now).
- 58 Items from Tab's Lottery Machine (which have been changed to require Zenny instead of lotto numbers).
- Defeating the EX and SP versions of WWW Navis provide location checks as well.

Items that are shuffled:
- All of the original rewards from above (Note: Certain common chips and low amounts of Zenny have been classified
as "filler" and might be replaced with progression items).
- 4 Win Cards.
- All Crosses and BeastOut.
- All key items that provide access to LevBus transportation.
- All key items that unblock obstacles in Central 3, as well as `KeyData` to open the door to Central 3.
  - This includes `CybBrdAx`, `VacData`, and `AreaPass`, as well as the added `ToolPrgm` that normally only works in a 
  cutscene.
- Several chips required for specific Jobs or Trades that would normally be unobtainable without RNG.
- Tab's `OrderSys`, which will enable access to the Chip Order System.

## What items are _not_ randomized?
Certain Key Items are kept in their original locations:
- The Banners for HP Shortcuts are still provided by the default progs for now.

## Which items can be in another player's world?

Any shuffled item can be in other players' worlds.

## What does another world's item look like in Mega Man Battle Network 6?

Item pickups all retain their original appearance. Text Boxes for accessing an item or given in dialog will either give 
you an item directly, or give an `AP Item` to indicate an item for another player. You can see what item was sent via 
client.

## When the player receives an item, what happens?

Whenever you have an item pending, the next time you are not in a battle or menu, you will receive a message on screen 
notifying you of the item, and the item will be added directly to your inventory.

