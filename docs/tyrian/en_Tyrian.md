# Tyrian

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a
config file.

## What does randomization do to this game?

All weapons in the game are randomly shuffled throughout the world, and all levels except the first level of the first
episode are locked behind items that you need to collect. You will need to build up enough weaponry and power to take
on the boss at the end of each episode in order to complete the game.

Optionally, other minor things such as Twiddles (Street Fighter-esque input codes) can be randomized, and some
additional options to make the game more difficult for a player familiar with the game are available as well.

## What is a "location" in this game?

Every data cube, front/rear weapon power up, or secret level orb that can appear inside of a level (regardless of the
game mode the original item was present in) is a location that can contain an item. Some additional enemies have also
been converted into locations to better balance out the game; it is recommended to enable the "Archipelago Radar"
option to highlight any enemy that contains an Archipelago item.

All levels by default will also contain a shop, with additional Archipelago items available to purchase with the
credits you've earned by playing through the game.

## Which items can be in another player's world?

All items that can be shuffled (front and rear weapons, sidekicks, special weapons, generators, armor and shield
powerups, etc.) may also be placed in another player's world.

## What does another world's item look like in Tyrian?

While in the middle of a level, all items appear as a stylized Archipelago icon, with advancement items containing a
chevron in the corner.

While in a shop, unless you have chosen to hide this information, the item's full name will be shown; the original
icon for that item will also be shown if it is an item for a Tyrian world.

## When the player receives an item, what happens?

You will be informed immediately of received items by the display on the bottom of the screen, even in the middle of a
level. For most items you will need to wait until the end of the level to select them, however some items (e.g. Armor
Up, Shield Up, Generators) will take effect immediately.

## What is the difference between Tyrian and Tyrian 2000?

The primary difference between the two versions of the game is that Tyrian 2000 adds an additional fifth episode, and
a few additional weapons to collect. All of these can be randomized as well, provided you select the option to "Enable
Tyrian 2000 Support".

However, Tyrian 2000 also contains some additional level design and balance changes (e.g. the Plasma Storm nerf).
These have been preserved wherever possible, as long as they do not affect logic. Changes that do affect logic are
ported back to Tyrian 2.1 to ensure consistent logic between the two versions.

Tyrian 2000 data files can be used to play games designed for both Tyrian 2.1 and Tyrian 2000; it's a matter of
personal preference if you prefer the balance and level design changes that Tyrian 2000 introduced.

## I'm missing a location in a level, what gives?

Some location require obscure knowledge or unusual behaviors in order to reach and obtain them. In lower logic
difficulties, these locations are usually excluded by default. For a full list of these locations and how to obtain
them, check the list of [Excluded and Commonly Missed Locations](/tutorial/Tyrian/locations/en).

(If you're looking at this page through GitHub,
[use this link instead](https://github.com/KScl/TyrianAPWorld/blob/main/docs/locations_en.md).)

