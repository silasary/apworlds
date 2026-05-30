# Etrian Odyssey

## Warning

At the moment, this randomizer is still in active development, and so is susceptible to generation problems and logic bugs. Please make sure other players and the host are aware of the risks.

## What does randomization do to this game?

Randomization of Etrian Odyssey randomizes available character class and skills, along introducing a level cap 
and a floor limit that progressively increase. It shuffles treasure box content, Mission and Quest rewards 
along other locations.

## What is the goal of Etrian Odyssey when randomized?

The goal is to complete up to one stratum decided by the player. Completing a stratum is
defined by defeating its final floor boss. Note that any location on floors past the goal will not get shuffled.

At the moment, goal past stratum 3 are not recommended for sync sessions considering the length of the game.

## What items and locations get shuffled?

Items and Locations are not a one to one match in this game. The list of items and locations changes
based on the player yaml options. When generating, all necessary items will be first created, and every
remaining slot will be filled with random inventory consumables or money.

Here is the full list of possible Items:

- Consumables
- Money
- Key Items (Clear Key, Violet Key)
- Progressive Level Cap
- Progressive Floor Limit
- Class
- Skill (Either Individually or Grouped)

Here is the full list of possible Locations:

- Treasure Boxes
- Mission Clear
- Monster Codex entries
- Item Compendium entries

## Which items can be in another player's world?

Any items added to the item pool can be in another player world.

## What is different from vanilla?

- Shilleka's Good have a new menu action - `Receive Item`, which is used to get items obtained from other worlds and from non treasure box locations. See `What happens when I receive and item?` for more info.
- Resting Cost 1 level and a minimum level of 5, down from 10 and 30 respectively.
- Walking speed is faster in the labyrinth.
- Custom UI on the main menu to indicate the current level and floor cap. If those are not used it will show the vanilla cap (70 and 30).
- "Automatic Hold A" for faster battle speed. No need to hold A manually during battle to make it go faster.

Other changes are controlled by the player - see Options for more info.

## What does another world's item look like in Etrian Odyssey?

Items in Etrian Odyssey does not have any visual indicator. As such, the player will only see
a vague message about what they got (if at all). This .apworld is intended to be used along
a client or tracker to be fully aware of everything they get or find.

## What happens when I receive and item?

When the player receive an item, if it isn't an inventory item, the player will receive it
directly. There are no in-game indicator when this happens. The player can see at any time
what their current floor limit or level cap is on the top right screen of the main party menu.

For the reception of inventory items, the player must enter Shilleka's Good in Etria and use the
`Receive Item` option. This will add the items to the player inventory (so long they have space for it),
up to a queue of 20. If more than 20 items are to be received, the player must interact again with
the option. If your inventory is full, you will need to sell or discard some items.

Do note that items obtained from treasure box are added directly to the player inventory.

## There are too many settings! I don't know what to do!

This is fine! Here are some recommended settings and guidelines:

- Experience Modifier is recommended to be at least 500%
- Battle Logic should be set to Simplified. Only use the other ones if battle related shuffling are turned off.
- Level Cap Mode: Fixed Increased with value of 4 is the recommended setting.
- Floor Limit Mode: Fixed Increased with value of 1 or 2, depending on the stratum goal.
- Class Sanity Mode: Shuffle Availability is the recommended setting.
- Starting Class Count: 4 or 5 is a good value. Expect 2 or 1 to be extremely harsh.
- Skill Sanity Mode:
  - For stratum 1 and 2 goals, Shuffle Group is recommended. Shuffling Individually will usually result in a generation error unless starting_skill_item_count is set to a high value.
  - For stratum 3+, Shuffle Individually is recommended if you are very familliar with the game, otherwise Shuffle Group
- Shuffle Generic Stats Increase Skills: Enabling this makes early game much more difficult.
- Shuffle Mastery Skills: If you want a faster early game with Individual Skill Shuffling, turn this off.
- Shuffle Gathering Skills: If you are not very familliar with the game, this should be turned off. This is the primary method to farm money early game, and also the most reliable source of sustain items.
- Remove Skills Requirements: If you want a more unique experience, or a faster early game. Recommended only with Individual Skill Shuffling, but works with all.
- Starting Skill Item Count: This doesn't take into account the non shuffled skills. Not recommended with Group Shuffling. Recommended with Individual Shuffling to accelerate early game. Value of 5 to 10 is recommended if used.
- Codex Sanity: Recommended to enable.
- Compendium Sanity: Recommended if you are familliar with the game and don't mind having to look up where to obtain specific materials. Extremely recommended along individual skill shuffling.
- CompendiumSanity Include Conditional Drops: Only recommended if you are very familliar with the game. This doesn't add a lot of locations.
- Shop Unlock Material Cost Divider: QoL option to reduce grind. Recommended at least half since this game can be very grindy.
- Material Sell Value Multiplier: Recommended to set to between 5 to 10 if you want to remove any potential money grind.

## I found a bug!

Nice! First, make sure its a bug specific to the randomizer, then go to the dedicated etrian odyssey discord channel in the Archipelago discord and let us know about it. Alternatively, you can open an issue on this github repository, but please let me (TheMasterZelda) know in the discord channel as I am not monitoring the issues actively.

