# Well Dweller Setup Guide

## Requirements
- Well Dweller (Windows; Steam or GOG).
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.4 or newer.
- [Aurie](https://github.com/AurieFramework/Aurie) and [YYToolkit](https://github.com/AurieFramework/YYToolkit),
  installed with the [Aurie Installer](https://github.com/AurieFramework/Aurie/releases).
- From this project's release page: `well_dweller.apworld`, `WellDwellerAP.dll` (the game mod) and
  `Well Dweller.yaml` (options template).

## Installation
1. Download and run the [Aurie Installer](https://github.com/AurieFramework/Aurie/releases) and install
   Aurie/YYToolkit for `Well Dweller.exe`.
2. Copy `WellDwellerAP.dll` to `<Well Dweller>\mods\aurie\`.
3. Install [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases), then double-click
   `well_dweller.apworld` (or copy it to `custom_worlds` in your Archipelago folder).
4. Edit `Well Dweller.yaml` (or generate one in the Archipelago Launcher with **Generate Template Options** /
   **Options Creator**) and put it in Archipelago's `Players` folder. See the
   [Archipelago setup guide](https://archipelago.gg/tutorial/Archipelago/setup/en) for generating and hosting.

## Playing
1. Open the Archipelago Launcher and start **Well Dweller Client**. Connect to the server with your slot name.
2. The client looks for the game in the usual Steam and GOG folders. If it cannot find it, use
   `/game_dir <path to the Well Dweller folder>`, e.g. `/game_dir C:\GOG Games\Well Dweller` (spaces are fine).
3. Start the game and begin a **new game** in an empty save slot. The mod binds that save to your slot;
   other saves are left alone and send nothing. Use a new save slot for every new seed.
4. Items arrive while you play. Checks are sent when you pick something up, beat a boss or talk to an NPC.

## Testing with Logic Test (alpha testers)
This alpha is tested with palex00's **Logic Test** world, which stops you exactly where the logic is wrong.
1. Download `logic_test.apworld` from the [Logic Test release](https://github.com/palex00/Archipelago/releases/tag/logic-test-0.4.0)
   and install it like the Well Dweller apworld.
2. Put two YAMLs in Archipelago's `Players` folder: your `Well Dweller.yaml` and `Logic Test.yaml` (both come
   with the release). Only one Well Dweller slot per seed.
3. Generate and host the seed as usual.
4. Start **Well Dweller Client** (connect as your Well Dweller slot) and **Logic Test Client** (Launcher, connect
   as the Logic Test slot) and play.
5. The Logic Test holds all your items and gives them out one sphere at a time. When you have collected every
   check of the current sphere, press **Open Sphere** in the Logic Test tab (or type `/proceed`) to receive the next
   sphere's items. `/status` shows how many checks of the sphere you still need, `/keys` lists where they are.
6. Two things to report:
   - **Stuck:** a check from `/keys` that you cannot reach with the items you have. That location's logic is too
     loose.
   - **"LOGIC LEAK: KEY_n received while on sphere m"** in the Logic Test Client: you reached a check earlier than
     the logic expects. Its logic is too strict; note what you used to get there.
7. Report in the Discord with the seed and these files:
   - Archipelago `logs` folder: the latest `Launcher_*.txt` (Logic Test Client), `WellDwellerClient_*.txt` and
     `Server_*.txt`.
   - Archipelago `output` folder: the seed's `AP_<seed>.zip` (it has the spoiler).
   - `<Well Dweller>\archipelago\`: `mod.log`, `logic_breaks.txt` and `currency_log.txt`.
   Anything else (bugs, ideas) also goes in the Discord.

## Client commands
- `/game_dir [path]` - show or set the game folder.
- `/claim` - bind the loaded save to your slot (for a save that was not started fresh).
- `/wd_status` - show what the game mod reports.
- `/resync` - send every check the game has reported again.
- `/goal` - mark your goal as completed by hand (all goals are normally detected automatically).
- `/why <part of a location name>` - is the location in logic, and which single item would put it in logic.
- `/logic` - per area: how many unchecked locations are in logic.
- `/breaklog on|off` - the local sequence-break log (default on): every check you get while it is out of logic is
  written to `<Well Dweller>\archipelago\logic_breaks.txt` (time, seed name, location, items you had). It is
  never sent anywhere.

## How it works
The mod and the client talk through text files in `<Well Dweller>\archipelago\`:
`items.txt` (written by the client), `checks.txt`, `state.txt` and `mod.log` (written by the mod).
Flags the game sets that are not mapped to locations yet are listed in `unknown.txt`.

## In-game HUD and map tracker
- Bottom left: the last 5 items you sent or received (with icons) and a "Checks: found / total" counter.
- Map tracker: the mod draws a marker on the map for every location, using the game's own art (vessel, lever,
  timer = time trial, spirit, workshop token, trinket, trinket slot, page, ability egg, pearl, elevator part,
  golden feather, "!" = boss, ring = combat room, "?" = other). Bright = in logic, faded = not in logic yet,
  very faint = already checked. Move the map so a marker sits under the cursor in the middle of the screen to see
  its location name(s) and status.
  The tracker starts off: press **F6** with the map open to switch it: all items -> all uncollected -> in logic
  only -> off (remembered per save). Shop and forge checks are not on the map.
- Looter's shop trinkets are checks: buying one sends its check and gives nothing; a trinket you received from the
  multiworld stays for sale in the shop until you bought it there. The shop window shows what each check gives
  the multiworld (item, player, progression/useful/filler/trap).

## Quality of life
- The opening cutscene in the Well is skipped (option `skip_intro`): a new game starts in the Night Garden.
- The whole map is revealed when a new save starts.
- Option `tent_unlocks`: vanilla (visit a tent to add it), all_unlocked, or shuffled (each tent is an item; a tent
  you find yourself is unlocked too). With all_unlocked or shuffled the logic uses Tent Travel to the tents you have (a tent counts as
  reaching its area; the Depths also need the Water Vessel).
  Queen's Castle tents always stay vanilla.
- The Looter's shop, the trinket workshop and Ilda's map station are available in the tents from the start.
- Ability tutorial rooms are skipped: picking up an ability egg returns you to the room you found it in.
- Shop checks come into logic once the areas you can reach give enough currency for that purchase and every
  cheaper one (estimated at 1x, divided by the Currency Multiplier). The multiplier applies to all currency,
  Currency items from the multiworld included. Option `shop_prices: randomized` gives every shop entry its own
  price between `shop_price_minimum` and `shop_price_maximum` (percent of vanilla). A purchase that would need
  more currency than the whole map gives (very high prices, low multiplier) only holds filler. Shop checks also
  wait for 2 movement abilities (Climb and Endless Climb count as two) and some of the map. Option `shop_progression` (affordable / all / none): by
  default only purchases needing less than about half of the map's currency can hold progression items.
- The mod writes the currency you earn in-game (at 1x, per room) to `archipelago\currency_log.txt`; F10 and
  Currency items are left out. Testers: please send this file along, it sets the shop logic estimates.
- Currency, filler and Death Link options: currency multiplier and Currency item size, extra copies of
  Trinket Points / Workshop Tokens / Oil Vials / Golden Feathers, filler shares for Currency / boons / traps,
  Death Link Amnesty (deaths before one is sent) and Death Wish (Death Links received before one kills you).
- Option `lever_items` (hard / long, Death's Door style): pulling a lever sends its check, its gate opens when
  the lever's item arrives (the room resets and puts you back where you stood if you pull a lever you don't have
  the item for). A lever opened by its item sends its own check when you first visit its room.
  The castle gate levers and the three levers that free Ilda's siblings always work as normal.
- Option `time_trial_time` (100-300%): more time for the time trials, handy when the logic sends you there
  before you have the abilities a trial was designed for.
- Forge checks: each trinket's forge price goes up with every upgrade you buy for it, and a trinket at its
  highest level can't be forged again (the upgrades themselves come from the multiworld).
- Test helpers: **F10** adds 10,000 currency; **F7** writes a snapshot of menu/map values (f7_dump_N.txt) for bug reports;
  **F8** starts/stops a movement recording (move_N.csv) for logic reports.
- The Aurie/YYToolkit console window is hidden a few seconds after the game starts (it only shows engine
  debug output); press **F9** to show or hide it.
- Press **F3** inside a tent to go back to the tent's exit (the shop ledges need Climb or Slingshot to leave).
  Tent Travel is unlocked from the start by default for the same reason.
