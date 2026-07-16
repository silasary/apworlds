# Anno 1800

Game Page | [Setup](setup_en.md)<!--(/tutorial/Anno%201800/setup/en)--> | [Items](items_en.md)<!--(/tutorial/Anno%201800/items/en)--> | [Locations](locations_en.md)<!--(/tutorial/Anno%201800/locations/en)--> | [Roadmap](roadmap_en.md)<!--(/tutorial/Anno%201800/roadmap/en)-->

## What do I need to do to randomize Anno 1800?

See full instructions on [the setup page](setup_en.md)<!--(/tutorial/Anno%201800/setup/en)-->.

## Where is the options page?

The player options page for this game would usually contain all the options you need to configure and export a config
file. However, this is a custom apworld, so you'll have to either generate the templates yourself or use the template
file in the download. See the setup page for details.

## What does randomization do to this game?

In Anno 1800, the building, expedition and certain recipe unlocks are shuffled, causing them to be unlocked in a
non-standard order. Frequently, luxury goods will be available later than usual. You might even have to import goods
from other sessions that you'd usually have available on location!

Note: Ornaments are currently excluded.

## What's the goal?

By default, the goal is to reach 5000 investors, 1500 obreros, 6000 artistas, 750 technicians, 7000 scholars, 4000
tourists and 15 level 5 investor skyscrapers. This is, of course, configurable.

## What are locations?

Whenever you'd normally unlock a building in Anno 1800, you instead send a location check to the server. This often
means you send multiple checks at once at a certain population threshold, for example 5 checks at 100 farmers.

Also, any ship unlocks are also location checks, which can then be used to go on expeditions...

... And if they would unlock a new session, receiving them is also a location check. Expedition difficulty is taken
into account against your unlocked ships to check if you can complete it.

Certain recipe buildings also have location checks for their recipe unlocks (specifically Restaurant, Cafe, Bar and
The Iron Tower). These have various interesting requirements and become available with the Tourist Season DLC.
RNG-heavy recipe unlocks are excluded from having progression items.

For further information, check [the locations page](locations_en.md)<!--(/tutorial/Anno%201800/locations/en)-->.

## What about DLCs?

All DLCs are supported! You can select in your config, which you would like to activate for the randomization.

Docklands is strongly discouraged as it would render the randomizer pointless. There is an option to toggle its logic
(default: no Docklands logic), that allows you to add it to your game without the randomizer intending you to get half
of your goods via Docklands.

If you enable DLCs you didn't select in your config for your savegame, the buildings will unlock as they would
without mods. For example, the docklands complex will unlock at 250 artisans with Docklands turned off in the config,
but enabled in game.

## What about incidents?

Currently, availability of institutions is guaranteed by the end of the population that usually unlocks the incidents.
For example, a fire station is guaranteed before you need to reach workers as fires usually unlock at 150 farmers.
Additionally, incidents can only occur once you unlocked the respective institution - which does not necessarily mean
you have the materials to build said institution.

## What about NPCs?

Currently, NPCs are not supported and ignored. This means you can get steel beams or other goods before the randomizer
expects you to.

## What about socketed items?

Currently, socketed items are not supported and ignored. This means you can use alternate production items to acquire
goods before the randomizer expects you to.

There are exeptions for some specific recipe unlocks where the vanilla requirements for the items are assumed.

## The game shows (strange) unlock requirements. Why and what do they mean?

Anno 1800 automatically shows the player how to unlock revealed but locked buildings. This is not preventable without
breaking local (=serverless) play. It is planned to show these revealed buildings as proper hints to Archipelago at
some point. Strange requirements, like empty strings, "continue your journey", or populations from disabled DLCs occur
when the building unlock is not located locally or at a non-standard locations.

Similarly, some location names in Archipelago may still include names from disabled DLCs.

## I'm running out of money! Help!

Money can be pretty tight in this randomizer since you're never guaranteed to unlock luxury goods. There are however a
few ways to mitigate monetary issues:
* Turn off production you don't need - buildings still cost money if they can't produce due to a full storage
  * This is especially common with building materials
* Sell soap to Eli Bleakworth - each ton of soap generates a raw profit of 279 as he pays extra
  * You have to sell at his harbour - use a trade route for automation
* Produce ships and sell them to Sir Archibald Blake or Madame Kahina
  * You are guaranteed to unlock ships by the time you reach Artisans
  * Building and selling ships is always profitable as long as you have the spare workforce
  * Schooners equate to 1625 in raw profit - ~540 income per minute in continuous production
  * Larger ships are worth more
* If you have access to the DLC and unlocks, Tourists are a great source of income and can be built once you reach
Artisans and windows
