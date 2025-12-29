# Kirby Air Ride APWorld

- [Kirby Air Ride APWorld](#kirby-air-ride-apworld)
  - [What is this?](#what-is-this)
  - [Where do I get the apworld and yaml file?](#where-do-i-get-the-apworld-and-yaml-file)
  - [How do I set this up?](#how-do-i-set-this-up)
  - [What is the goal of Kirby Air Ride in Archipelago?](#what-is-the-goal-of-kirby-air-ride-in-archipelago)
    - [City Trial](#city-trial)
    - [Air Ride](#air-ride)
    - [Top Ride](#top-ride)
      - [Note:](#note)
  - [What does randomization do to this game? Which locations get shuffled?](#what-does-randomization-do-to-this-game-which-locations-get-shuffled)
  - [What does another world's item look like in Kirby Air Ride?](#what-does-another-worlds-item-look-like-in-kirby-air-ride)
  - [What happens when the player receives an item?](#what-happens-when-the-player-receives-an-item)
      - [Checkbox Filler Items](#checkbox-filler-items)
      - [Patch Cap Increase Items](#patch-cap-increase-items)
      - [Stadium Unlock Items](#stadium-unlock-items)
    - [EnergyLink](#energylink)
    - [Other features](#other-features)
      - [Server sync](#server-sync)
  - [I need help! What do I do?](#i-need-help-what-do-i-do)
  - [Known Issues](#known-issues)
  - [Planned Features](#planned-features)
  - [Contributing](#contributing)


## What is this?

This is an APWorld for the Archipelago multi-world, multi-game randomizer: [archipelago.gg](https://archipelago.gg/)

## Where do I get the apworld and yaml file?

You can get the apworld file and an example player configuration yaml in the [releases page.](https://github.com/DeDeDeK/KARchipelago/releases)

## How do I set this up?

Follow the [setup guide](https://github.com/DeDeDeK/KARchipelago/blob/main/worlds/kirby_air_ride/docs/setup_en.md).

## What is the goal of Kirby Air Ride in Archipelago?

Besides having fun being a part of a multiworld with friends, there are also a few pre-selected archipelago goals for the game that will result in a "game complete":

### City Trial
- Fill in over 100 Checklist Boxes!
  - in the base game, this allows you to unlock viewing the game's ending
- Fill in N Checklist Boxes!
  - fill in as many checklist boxes as you want, you can configure the number from 1-120.
- In one match, complete both Dragoon and Hydra!
  - this is the standard checkbox from the base game
- Stadium: VS. KING DEDEDE KO King Dedede in less than a minute!
- You can also specify the name of any checklist box to set that as your specific goal for City Trial.
- None
  - this disables City Trial from being a part of your world. No locations for City Trial will exist to be checked.

### Air Ride
- Fill in over 100 Checklist Boxes!
  - in the base game, this allows you to unlock viewing the game's ending
- Fill in N Checklist Boxes!
  - fill in as many checklist boxes as you want, you can configure the number from 1-120.
- You can also specify the name of any checklist box to set that as your specific goal for Air Ride.
- None
  - this disables Air Ride from being a part of your world. No locations for Air Ride will exist to be checked.

### Top Ride
- Fill in over 100 Checklist Boxes!
  - in the base game, this allows you to unlock viewing the game's ending
- Fill in N Checklist Boxes!
  - fill in as many checklist boxes as you want, you can configure the number from 1-120.
- You can also specify the name of any checklist box to set that as your specific goal for Top Ride.
- None
  - this disables Top Ride from being a part of your world. No locations for Top Ride will exist to be checked.

#### Note:
You can mix and match goals between all game modes. If there is a goal for multiple game modes, you can only complete your game by completing all goals.

## What does randomization do to this game? Which locations get shuffled?

Randomization affects which AP items you receive or send for unlocking a checkbox. It will also affect which stadiums you have available if you have progressive stadiums enabled. 

No locations are currently shuffled, so every checkbox in the game unlocks what it usually unlocks (with the exception of stadiums, which are ignored in favor of the AP item unlocks if they are enabled).

## What does another world's item look like in Kirby Air Ride?

There is no change in the graphical appearance of other's items. Completing checkboxes will earn whatever AP item is attached to that checkbox.

## What happens when the player receives an item?

Current items players are able to receive are:
- Patches (Top Speed Up, Boost Up, etc.)
- Trap Patches ("Top Speed Down, Boost Down, etc.)
- Permanent +1 Patch Increases
- "Effect" items
  - 1 HP Trap
  - Full Heal
- Checkbox filler items for each checklist
- Patch Cap Increase items
- Stadium unlock items

#### Checkbox Filler Items

Receiving a checkbox filler item for a given checklist will apply it immediately. Look to the side of the checklist
for the purple boxes. The game limits the number of these you can see at once to 5, but rest assured if you unlocked more than that, you have access to that amount and can keep using them as normal until they run out.

#### Patch Cap Increase Items

Receiving a patch cap increase item will increase the maximum cap on the number of patches you can have in City Trial. For instance, if you specified a starting cap of 5 in your yaml, this will increase it by one, to 6 for the rest of your entire AP run. This is for each patch type separately. So for instance, if you have a patch cap of 6 and collect 7 Top Speeds, you will lose one of those Top Speeds and be back to 6. 

#### Stadium Unlock Items

If you have progressive stadiums enabled, receiving a stadium unlock item will unlock that stadium in-game. You will always start with one random stadium unlock item in your starting inventory. If your goal is to beat King DeDeDe, you will not be able to start with that stadium unlocked. 


Any items will be applied immediately if the player is in City Trial when they are received, or they are applied at the beginning of the next City Trial run if they are not. Permanent patch increases are applied at the start of every City Trial run (after a few seconds have elapsed). 

NOTE: you must collect any patch in the city after receiving patch items for the stat increases/decreases to take effect. 

NOTE: There are currently no items that apply to Air Ride or Top Ride mode (other than checkbox fillers), but you can earn items for City Trial by completing Air Ride or Top Ride checkboxes.

### EnergyLink

If you have EnergyLink enabled in your yaml or if you enabled it in the client with `/energylink`, gathering patches (if you are below the max stat limit for that patch) in the City will add to the collective energy pool of the multiworld, as well as destroying objects (rocks, trees, coral, star pole, houses, etc.). You can spend this gathered energy to receive any (archipelago) item immediately! Use `/energylink_spend "Item Name" item_amount` in the Kirby Air Ride Client.

Each patch collected gives 1 energy, and each object destroyed gives .1 energy. Items by default cost 10 energy, and other items have costs of:

- All patches: 90,
- Checkbox fillers: 1500
- Patch Cap Increases: 1500
- Permanent Patch Increases: 200

For example, to buy 5 Top Speed Up patches (assuming you have 50 energy to spend):

`/energylink_spend "Top Speed Up" 5`

Spending energy on Permanent Patch increases and Patch Cap increases will also be persistent for the rest of your game. 

### Other features

#### Server sync 

The client will sync your completed AP checks to your in-game checklist every time you connect to the server. This means that if you: 

- lose your save file 
- are starting fresh and doing a same-slot co-op
- have had some of your checks collected by another player after finishing their game

Your game will always be in sync with what the server has.

**IMPORTANT:** Any checks that are synced from the server are initially only *visible* in the checklist. They need to be unlocked by entering any stadium or city trial, and then quitting (or finishing them normally). This will trigger the checkbox unlocking process for those checks. 


## I need help! What do I do?

Try the troubleshooting steps in the [setup guide](https://github.com/DeDeDeK/KARchipelago/blob/main/worlds/kirby_air_ride/docs/setup_en.md). 

If you are still stuck, please ask us over in the "Kirby Air Ride" discussion thread in the "future-game-design" channel in the Archipelago Discord server! [(Link)](https://discord.com/channels/731205301247803413/1291501105389502554)

## Known Issues

Known bugs and issues are tracked in the github issues [here.](https://github.com/DeDeDeK/KARchipelago/issues?q=is%3Aissue%20state%3Aopen%20label%3Abug)

Feel free to report any issues or suggest improvements either there or in the "Kirby Air Ride" discussion thread in the "future-game-design" channel in the Archipelago Discord server [(Link)](https://discord.com/channels/731205301247803413/1291501105389502554)

## Planned Features

Much of the planned features are gated by progress on modding the game itself or finding proper memory addresses, function locations, etc. within the game's memory. Contributions are very welcome!

You can see a current list of planned features and other requests [here.](https://github.com/DeDeDeK/KARchipelago/issues?q=is%3Aissue%20state%3Aopen%20label%3Aenhancement)

## Contributing

Feel free to [raise an issue](https://github.com/DeDeDeK/KARchipelago/issues) or [submit a PR](https://github.com/DeDeDeK/KARchipelago/pulls)! And you can always pop in the [discord channel](https://discord.com/channels/731205301247803413/1291501105389502554) to ask questions or collaborate! 