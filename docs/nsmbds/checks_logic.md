# New Super Mario Bros. DS - Checks & Logic Guide

This guide explains what to do for each kind of check, how to reach every level and Toad House, and which items open your paths. It also lists every Secret Exit and Advanced Location.

A **check** is a task that gives one randomized Archipelago item. The reward may be for you or another player. Each check gives its reward only once.

[Setup Guide](setup_en.md) - [Game Info](en_New%20Super%20Mario%20Bros.%20DS.md) - [Complete Check List](check_catalog.md)

*For version 0.5.3-unstable.*

## Find what you need

- [Check types](#check-types)
- [Winning your game](#winning-your-game)
- [Opening worlds](#opening-worlds)
- [Level paths and keys](#level-paths-and-keys)
- [All Toad Houses](#all-toad-houses)
- [All Star Coin signs](#all-star-coin-signs)
- [All Secret Exits and Warp Cannons](#all-secret-exits-and-warp-cannons)
- [All Red Coin Challenges](#all-red-coin-challenges)
- [All castle bosses](#all-castle-bosses)
- [Power-Ups and Permits](#power-ups-and-permits)
- [All Advanced Locations](#all-advanced-locations)
- [Block checks](#block-checks)
- [World 6-2 bonus room](#world-6-2-bonus-room)
- [Finding shuffled levels](#finding-shuffled-levels)
- [Choosing how much secret hunting is required](#choosing-how-much-secret-hunting-is-required)

## Check types

| Check type | How to complete it | Available checks | On by default? |
|---|---|---|---|
| Level Goal | Finish the level through its normal exit. | 80 | Always |
| Star Coin | Collect the numbered Star Coin in a level. | 240 | Always |
| Castle boss | Defeat the matching castle boss. | 9 | Always |
| Toad House | Finish a fixed Toad House on the world map. | 34 | Yes |
| Red Coin Challenge | Collect all eight red coins before the ring's timer runs out. | 30 | Yes |
| Secret Exit | Finish the level through its secret route. | 18 | No |
| 1-Up Block | Open the listed hidden or flying 1-Up Block. | 43, plus 8 in the World 6-2 bonus room | No |
| Blocksanity | Open a listed Coin or Power-Up Block. | 1,036, plus 120 in the World 6-2 bonus room | No |

There are **393 checks with the default settings**, or **1,618 with every check category and the bonus room enabled**. Star Coin signs and Warp Cannons open routes; they do not award separate checks.

Check names match the client and tracker. For example, `World 1-1 Goal` means finishing that level, and `World 1-1 Star Coin 3` means collecting its third Star Coin. A Toad House check also ends in `Goal`.

### Star Coin pickups and Star Coin currency

Picking up a Star Coin completes a randomized check. **Received Star Coin items** give you the currency used at world-map signs. The reward at a Star Coin check can be a different item entirely.

**Star Coin Tracking** controls when a pickup counts:

| Setting | What happens |
|---|---|
| Instant (default) | The check counts immediately, even if you die or leave the level. |
| After Level Completion | You must successfully finish the level to keep the pickup. |

Spent Star Coins still count toward your Star Coin goal and sign unlock requirements. The client shows your total received, amount spent, and available balance.

## Winning your game

| Goal | What you need to do |
|---|---|
| Defeat Bowser (default) | Defeat Bowser & Bowser Jr. in World 8-Bowser's Castle. |
| Star Coin Hunt | Receive the selected number of Star Coin items. |
| World Tour | Defeat all nine castle bosses. |
| Completionist | Defeat all nine castle bosses **and** receive the selected number of Star Coin items. |

**Required Star Coins** can be set from 30 to 240, with a default of 80. All 240 Star Coin checks remain available. Completionist does not require every check in the game.

## Opening worlds

World 1 is open at the start. A **World Pass** opens its matching world immediately. You can also open worlds by completing the routes below.

Normal castle routes always count. Mini-Mario castle routes and Warp Cannon routes count toward required progress when their separate logic settings are enabled.

| World | Pass | Normal route | Mini castle route | Cannon route |
|---|---|---|---|---|
| World 1 | Open at the start | - | - | - |
| World 2 | `Desert Pass` | Clear `World 1-Castle` | - | - |
| World 3 | `Isle Pass` | Clear `World 2-Castle` | - | - |
| World 4 | `Jungle Pass` | - | Use `World 2-Castle Secret Exit` | - |
| World 5 | `Glacier Pass` | Clear `World 3-Castle` **OR** Clear `World 4-Castle` | - | Use `World 1-Tower Secret Exit` **OR** Use `World 2-A Secret Exit` |
| World 6 | `Mountain Pass` | Clear `World 5-Castle` | - | Use `World 3-Ghost House Secret Exit` |
| World 7 | `Cloud Pass` | - | Use `World 5-Castle Secret Exit` | Use `World 4-Ghost House Secret Exit` |
| World 8 | `Volcano Pass` | Clear `World 6-Castle` **OR** Clear `World 7-Castle` | - | Use `World 5-Ghost House Secret Exit` |

Opening a world gives you access to its map. You still need to follow its level paths and unlock any signs, Towers, or Castles along the way.

## Level paths and keys

These tables show what opens each level entrance in the original map layout. **OR** means either route works; **AND** means you need both. “World access” means no earlier level clear is needed inside that world.

A **Goal** is the normal clear of the named level. A **Secret Exit** is its secret route. Earlier requirements still apply: to clear a Tower, you first need to reach it.

**Tower & Castle Keys** is on by default. Each Tower and Castle needs its own matching Key as well as its normal map route. With the setting off, ignore the Key column. Signs still need Star Coins.

<details>
<summary>World 1 - all level paths</summary>

| Entrance | How to open the route | Matching Key | Star Coin sign? |
|---|---|---|---|
| `World 1-1` | World access | - | - |
| `World 1-2` | Clear `World 1-1` | - | - |
| `World 1-3` | Clear `World 1-2` | - | - |
| `World 1-Tower` | Clear `World 1-3` **OR** Use `World 1-2 Secret Exit` | `Grassland Tower Key` | - |
| `World 1-4` | Clear `World 1-Tower` | - | - |
| `World 1-5` | Clear `World 1-4` | - | - |
| `World 1-A` | Clear `World 1-4` | - | Yes |
| `World 1-Castle` | Clear `World 1-5` **OR** Clear `World 1-A` | `Grassland Castle Key` | - |

</details>

<details>
<summary>World 2 - all level paths</summary>

| Entrance | How to open the route | Matching Key | Star Coin sign? |
|---|---|---|---|
| `World 2-1` | World access | - | - |
| `World 2-2` | Clear `World 2-1` | - | - |
| `World 2-3` | Clear `World 2-2` | - | - |
| `World 2-4` | Clear `World 2-3` | - | - |
| `World 2-Tower` | Clear `World 2-4` | `Desert Tower Key` | - |
| `World 2-5` | Clear `World 2-Tower` | - | - |
| `World 2-6` | Clear `World 2-5` **OR** Use `World 2-4 Secret Exit` | - | - |
| `World 2-A` | Use `World 2-3 Secret Exit` | - | - |
| `World 2-Castle` | Clear `World 2-6` **OR** Clear `World 2-A` | `Desert Castle Key` | - |

</details>

<details>
<summary>World 3 - all level paths</summary>

| Entrance | How to open the route | Matching Key | Star Coin sign? |
|---|---|---|---|
| `World 3-1` | World access | - | - |
| `World 3-A` | World access | - | Yes |
| `World 3-2` | Clear `World 3-1` **OR** Clear `World 3-A` | - | - |
| `World 3-Tower` | Clear `World 3-2` | `Tropical Tower Key` | - |
| `World 3-3` | Clear `World 3-Tower` | - | - |
| `World 3-Ghost House` | Clear `World 3-3` | - | - |
| `World 3-B` | Use `World 3-2 Secret Exit` | - | - |
| `World 3-C` | Clear `World 3-B` | - | - |
| `World 3-Castle` | Clear `World 3-Ghost House` **OR** Clear `World 3-C` | `Tropical Castle Key` | - |

</details>

<details>
<summary>World 4 - all level paths</summary>

| Entrance | How to open the route | Matching Key | Star Coin sign? |
|---|---|---|---|
| `World 4-1` | World access | - | - |
| `World 4-2` | Clear `World 4-1` | - | - |
| `World 4-3` | Clear `World 4-2` | - | - |
| `World 4-Tower` | Clear `World 4-3` **OR** Use `World 4-1 Secret Exit` | `Jungle Tower Key` | - |
| `World 4-A` | Clear `World 4-Tower` | - | Yes |
| `World 4-4` | Clear `World 4-Tower` | - | - |
| `World 4-Ghost House` | Clear `World 4-4` **OR** Clear `World 4-A` | - | - |
| `World 4-5` | Clear `World 4-Ghost House` | - | - |
| `World 4-6` | Clear `World 4-5` | - | - |
| `World 4-Castle` | Clear `World 4-6` | `Jungle Castle Key` | - |

</details>

<details>
<summary>World 5 - all level paths</summary>

| Entrance | How to open the route | Matching Key | Star Coin sign? |
|---|---|---|---|
| `World 5-1` | World access | - | - |
| `World 5-A` | Clear `World 5-1` | - | Yes |
| `World 5-2` | Clear `World 5-1` | - | - |
| `World 5-Tower` | Clear `World 5-2` **OR** Clear `World 5-A` | `Glacier Tower Key` | - |
| `World 5-3` | Clear `World 5-Tower` **OR** Use `World 5-2 Secret Exit` | - | - |
| `World 5-B` | Clear `World 5-Tower` | - | Yes |
| `World 5-C` | Clear `World 5-B` | - | - |
| `World 5-Ghost House` | Clear `World 5-3` | - | - |
| `World 5-4` | Clear `World 5-Ghost House` **OR** Clear `World 5-C` | - | - |
| `World 5-Castle` | Clear `World 5-4` **OR** Use `World 5-B Secret Exit` | `Glacier Castle Key` | - |

</details>

<details>
<summary>World 6 - all level paths</summary>

| Entrance | How to open the route | Matching Key | Star Coin sign? |
|---|---|---|---|
| `World 6-1` | World access | - | - |
| `World 6-A` | World access | - | Yes |
| `World 6-2` | Clear `World 6-1` **OR** Clear `World 6-A` | - | - |
| `World 6-Tower 1` | Clear `World 6-2` | `Mountain Tower 1 Key` | - |
| `World 6-3` | Clear `World 6-Tower 1` | - | - |
| `World 6-4` | Clear `World 6-3` | - | - |
| `World 6-Tower 2` | Clear `World 6-4` | `Mountain Tower 2 Key` | - |
| `World 6-5` | Clear `World 6-Tower 2` | - | - |
| `World 6-B` | Clear `World 6-Tower 2` | - | Yes |
| `World 6-6` | Clear `World 6-5` **OR** Clear `World 6-B` | - | - |
| `World 6-Castle` | Clear `World 6-6` | `Mountain Castle Key` | - |

</details>

<details>
<summary>World 7 - all level paths</summary>

| Entrance | How to open the route | Matching Key | Star Coin sign? |
|---|---|---|---|
| `World 7-1` | World access | - | - |
| `World 7-Ghost House` | Clear `World 7-1` | - | - |
| `World 7-2` | Clear `World 7-Ghost House` | - | - |
| `World 7-3` | Clear `World 7-2` | - | - |
| `World 7-Tower` | Clear `World 7-3` **OR** Use `World 7-Ghost House Secret Exit` | `Sky Tower Key` | - |
| `World 7-4` | Clear `World 7-Tower` | - | - |
| `World 7-5` | Clear `World 7-4` | - | - |
| `World 7-6` | Clear `World 7-5` | - | - |
| `World 7-A` | Use `World 7-5 Secret Exit` | - | - |
| `World 7-7` | Use `World 7-6 Secret Exit` | - | - |
| `World 7-Castle` | Use `World 7-4 Secret Exit` **OR** Clear `World 7-A` **OR** Clear `World 7-7` | `Sky Castle Key` | - |

</details>

<details>
<summary>World 8 - all level paths</summary>

| Entrance | How to open the route | Matching Key | Star Coin sign? |
|---|---|---|---|
| `World 8-1` | World access | - | - |
| `World 8-2` | Clear `World 8-1` | - | - |
| `World 8-Tower 1` | Clear `World 8-2` | `Volcano Tower 1 Key` | - |
| `World 8-3` | Clear `World 8-Tower 1` | - | - |
| `World 8-4` | Clear `World 8-3` | - | - |
| `World 8-Castle` | Clear `World 8-4` | `Volcano Castle Key` | - |
| `World 8-5` | Clear `World 8-Castle` | - | - |
| `World 8-6` | Clear `World 8-5` | - | - |
| `World 8-7` | Clear `World 8-6` | - | - |
| `World 8-8` | Clear `World 8-7` | - | - |
| `World 8-Tower 2` | Clear `World 8-8` | `Volcano Tower 2 Key` | - |
| `World 8-Bowser's Castle` | Clear `World 8-Tower 2` | `Volcano Bowser's Castle Key` | - |

</details>

Secret shortcuts can skip some normal clears when **Secret Exit Shortcut Logic** is enabled. With it off, required items stay out of optional secret-only branches. **The secret exit in World 7-6 is part of the regular forward path and remains required.**

If levels are shuffled, these are still the paths for the **map entrances**. See [Finding shuffled levels](#finding-shuffled-levels).

## All Toad Houses

Each of the **34 fixed Toad Houses** has one check when **Toad House Checks** is on. Finish the house to receive its randomized item. Temporary houses created by matching timer digits do not add checks.

| House color | Original house activity |
|---|---|
| Red | Power-Up reward. |
| Green | Extra-life minigame. |
| Orange | Mega Mushroom reward; also often called a yellow Toad House. |

The Archipelago reward is randomized for every color. Houses numbered “1”, “2”, or “3” use fixed names in the tracker; use the route below to identify the one you want.

### World 1 houses

| House | How to reach it | Own Star Coin sign? |
|---|---|---|
| `World 1 Green Toad House 1` | Clear `World 1-2` | Yes |
| `World 1 Green Toad House 2` | Clear `World 1-4` | Yes |
| `World 1 Orange Toad House` | Clear `World 1-Tower` | Yes |
| `World 1 Red Toad House 1` | Use `World 1-2 Secret Exit` | - |
| `World 1 Red Toad House 2` | Clear `World 1-A` | - |

### World 2 houses

| House | How to reach it | Own Star Coin sign? |
|---|---|---|
| `World 2 Red Toad House 1` | Clear `World 2-1` | Yes |
| `World 2 Red Toad House 2` | Use `World 2-4 Secret Exit` | - |
| `World 2 Red Toad House 3` | Clear `World 2-5` | Yes |
| `World 2 Orange Toad House` | Clear `World 2-3` | Yes |
| `World 2 Green Toad House` | Clear `World 2-Tower` | Yes |

### World 3 houses

| House | How to reach it | Own Star Coin sign? |
|---|---|---|
| `World 3 Red Toad House` | Clear `World 3-A` | - |
| `World 3 Orange Toad House` | Clear `World 3-Tower` | Yes |
| `World 3 Green Toad House` | Clear `World 3-B` | Yes |

### World 4 houses

| House | How to reach it | Own Star Coin sign? |
|---|---|---|
| `World 4 Red Toad House 1` | Clear `World 4-1` | Yes |
| `World 4 Green Toad House 1` | Use `World 4-1 Secret Exit` | - |
| `World 4 Orange Toad House` | Clear `World 4-A` **OR** Clear `World 4-4` | Yes |
| `World 4 Green Toad House 2` | Clear `World 4-Ghost House` | Yes |
| `World 4 Red Toad House 2` | Clear `World 4-5` | Yes |

### World 5 houses

| House | How to reach it | Own Star Coin sign? |
|---|---|---|
| `World 5 Red Toad House` | Use `World 5-Castle Secret Exit` | Yes |
| `World 5 Orange Toad House` | Clear `World 5-B` | Yes |
| `World 5 Green Toad House` | Clear `World 5-Ghost House` | Yes |

### World 6 houses

| House | How to reach it | Own Star Coin sign? |
|---|---|---|
| `World 6 Red Toad House 1` | Unlock the sign to `World 6-A` | - |
| `World 6 Green Toad House 1` | Clear `World 6-1` | Yes |
| `World 6 Orange Toad House` | Clear `World 6-Tower 1` | Yes |
| `World 6 Red Toad House 2` | Clear `World 6-3` | Yes |
| `World 6 Green Toad House 2` | Clear `World 6-Tower 2` **AND** Unlock the sign to `World 6 Red Toad House 2` | - |

### World 7 houses

| House | How to reach it | Own Star Coin sign? |
|---|---|---|
| `World 7 Orange Toad House` | World access | Yes |
| `World 7 Red Toad House` | Clear `World 7-Ghost House` | Yes |
| `World 7 Green Toad House 1` | Clear `World 7-2` | Yes |
| `World 7 Green Toad House 2` | Use `World 7-Ghost House Secret Exit` | - |
| `World 7 Green Toad House 3` | Use `World 7-4 Secret Exit` | - |

### World 8 houses

| House | How to reach it | Own Star Coin sign? |
|---|---|---|
| `World 8 Green Toad House` | Clear `World 8-3` | Yes |
| `World 8 Orange Toad House` | Clear `World 8-1` | Yes |
| `World 8 Red Toad House` | Clear `World 8-Tower 1` | Yes |

**Two unusual paths in World 6:** Red Toad House 1 requires the sign leading to World 6-A to be unlocked; you do not need to clear World 6-A first. Green Toad House 2 requires clearing Tower 2 and unlocking the sign to Red Toad House 2.

## All Star Coin signs

There are **32 signs** leading to side levels and Toad Houses. Opening a sign costs **3–5 available Star Coins**, depending on **Star Coin Gate Gap**. The default cost is five.

Each sign also has an unlock tier. Higher tiers need more **total received** Star Coins. For example, with a gap of five, tier 3 needs 15 total received coins and opening the sign spends five coins.

| Star Coin Gate Mode | What you need |
|---|---|
| No Keys (default) | Enough received Star Coins for the sign's tier, plus the coins to pay. |
| Progressive | Enough Star Coins and Progressive Gate Passes for the sign's tier. |
| Individual | Enough Star Coins and the matching named Gate Pass. |

No Keys and Individual modes shuffle the sign tiers for each seed. **The order below is the fixed tier order for Progressive mode only.** In Individual mode, the item is named after the destination: for example, `World 1-A Gate Pass`.

| Progressive tier | Destination | Earlier sign needed |
|---|---|---|
| 1 | `World 1 Green Toad House 1` | - |
| 2 | `World 1 Orange Toad House` | - |
| 3 | `World 1-A` | - |
| 4 | `World 1 Green Toad House 2` | - |
| 5 | `World 2 Red Toad House 1` | - |
| 6 | `World 2 Orange Toad House` | - |
| 7 | `World 2 Green Toad House` | - |
| 8 | `World 2 Red Toad House 3` | - |
| 9 | `World 3-A` | - |
| 10 | `World 3 Orange Toad House` | - |
| 11 | `World 3 Green Toad House` | - |
| 12 | `World 4 Red Toad House 1` | - |
| 13 | `World 4-A` | - |
| 14 | `World 4 Orange Toad House` | `World 4-A` |
| 15 | `World 4 Green Toad House 2` | - |
| 16 | `World 4 Red Toad House 2` | - |
| 17 | `World 5-A` | - |
| 18 | `World 5 Red Toad House` | - |
| 19 | `World 5-B` | - |
| 20 | `World 5 Orange Toad House` | - |
| 21 | `World 5 Green Toad House` | - |
| 22 | `World 6-A` | - |
| 23 | `World 6 Green Toad House 1` | - |
| 24 | `World 6 Orange Toad House` | - |
| 25 | `World 6 Red Toad House 2` | - |
| 26 | `World 6-B` | - |
| 27 | `World 7 Orange Toad House` | - |
| 28 | `World 7 Red Toad House` | - |
| 29 | `World 7 Green Toad House 1` | - |
| 30 | `World 8 Orange Toad House` | - |
| 31 | `World 8 Red Toad House` | - |
| 32 | `World 8 Green Toad House` | - |

The Orange Toad House sign in World 4 also needs the World 4-A sign unlocked. Reaching a sign can require earlier level clears; those are listed in the level and house tables.

## All Secret Exits and Warp Cannons

There are **18 Secret Exit checks**: 16 ordinary secret exits and two Mini-Mario castle routes. Worlds 6 and 8 have none.

**Secret Exit Checks** controls whether these exits award randomized items. Their logic settings separately control whether the game can expect you to use them for required progress. You can still use the physical routes with those settings off.

The table shows the paths each exit opens. A destination may still need its own Key or Star Coin sign. A listed Power-Up is the form needed for the route; you also need its Permit if that license is enabled.

| Secret Exit | Path it opens | Extra Power-Up needed | When it can be required |
|---|---|---|---|
| `World 1-2 Secret Exit` | World 1-Tower; World 1 Red Toad House 1 | No extra form | Secret Exit Shortcut Logic |
| `World 1-Tower Secret Exit` | Warp Cannon → World 5 | Shell Mario (Blue Shell) | Cannon Route Logic |
| `World 2-3 Secret Exit` | World 2-A | No extra form | Secret Exit Shortcut Logic |
| `World 2-4 Secret Exit` | World 2-6; World 2 Red Toad House 2 | Mini Mario | Secret Exit Shortcut Logic |
| `World 2-Castle Secret Exit` | Mini castle route → World 4 | Mini Mario | Secret Exit World Unlock Logic |
| `World 2-A Secret Exit` | Warp Cannon → World 5 | No extra form | Cannon Route Logic |
| `World 3-2 Secret Exit` | World 3-B → World 3-C | No extra form | Secret Exit Shortcut Logic |
| `World 3-Ghost House Secret Exit` | Warp Cannon → World 6 | No extra form | Cannon Route Logic |
| `World 4-1 Secret Exit` | World 4-Tower; World 4 Green Toad House 1 | No extra form | Secret Exit Shortcut Logic |
| `World 4-Ghost House Secret Exit` | Warp Cannon → World 7 | Mini Mario | Cannon Route Logic |
| `World 5-2 Secret Exit` | World 5-3 | No extra form | Secret Exit Shortcut Logic |
| `World 5-Ghost House Secret Exit` | Warp Cannon → World 8 | No extra form | Cannon Route Logic |
| `World 5-B Secret Exit` | World 5-Castle | Shell Mario (Blue Shell) | Secret Exit Shortcut Logic |
| `World 5-Castle Secret Exit` | Mini castle route → World 7; World 5 Red Toad House | Mini Mario | Secret Exit World Unlock Logic |
| `World 7-Ghost House Secret Exit` | World 7-Tower; World 7 Green Toad House 2 | No extra form | Secret Exit Shortcut Logic |
| `World 7-4 Secret Exit` | World 7-Castle; World 7 Green Toad House 3 | Mini Mario | Secret Exit Shortcut Logic |
| `World 7-5 Secret Exit` | World 7-A | No extra form | Secret Exit Shortcut Logic |
| `World 7-6 Secret Exit` | World 7-7 → World 7-Castle | Large Mario | Regular forward path |

### Which secret routes can be required?

| Setting | Routes it allows for required progress | Default |
|---|---|---|
| Secret Exit Shortcut Logic | Optional shortcuts and side branches within a world. | Off |
| Secret Exit World Unlock Logic | Mini-Mario castle routes from World 2 to 4 and World 5 to 7. | Off |
| Cannon Route Logic | The five Warp Cannon routes. | Off |

The World 2 cannon needs access to World 2-A, which is itself behind a secret exit. Both **Cannon Route Logic** and **Secret Exit Shortcut Logic** must be on for this route to count toward required progress.

**Mini castle exits:** Defeat the castle boss as Mini Mario to take the special route. A normal castle clear alone does not complete that Secret Exit check.

**World 7-6:** Its secret exit leads to World 7-7 and onward to the castle. This stays part of the regular route even when optional secret shortcuts are off.

## All Red Coin Challenges

Activate a red ring and collect all eight red coins before time runs out. There are **30 challenges in 28 levels**. World 3-1 and World 8-3 each have two separate checks.

| Level | Challenge names |
|---|---|
| `World 1-1` | `World 1-1 Red Coin Challenge` |
| `World 1-3` | `World 1-3 Red Coin Challenge` |
| `World 1-5` | `World 1-5 Red Coin Challenge` |
| `World 1-A` | `World 1-A Red Coin Challenge` |
| `World 2-Tower` | `World 2-Tower Red Coin Challenge` |
| `World 3-1` | `World 3-1 Red Coin Challenge 1`<br>`World 3-1 Red Coin Challenge 2` |
| `World 3-2` | `World 3-2 Red Coin Challenge` |
| `World 3-3` | `World 3-3 Red Coin Challenge` |
| `World 3-A` | `World 3-A Red Coin Challenge` |
| `World 4-2` | `World 4-2 Red Coin Challenge` |
| `World 4-3` | `World 4-3 Red Coin Challenge` |
| `World 4-Tower` | `World 4-Tower Red Coin Challenge` |
| `World 4-4` | `World 4-4 Red Coin Challenge` |
| `World 4-6` | `World 4-6 Red Coin Challenge` |
| `World 5-4` | `World 5-4 Red Coin Challenge` |
| `World 5-A` | `World 5-A Red Coin Challenge` |
| `World 6-2` | `World 6-2 Red Coin Challenge` |
| `World 6-3` | `World 6-3 Red Coin Challenge` |
| `World 6-5` | `World 6-5 Red Coin Challenge` |
| `World 6-6` | `World 6-6 Red Coin Challenge` |
| `World 7-1` | `World 7-1 Red Coin Challenge` |
| `World 7-2` | `World 7-2 Red Coin Challenge` |
| `World 7-3` | `World 7-3 Red Coin Challenge` |
| `World 7-4` | `World 7-4 Red Coin Challenge` |
| `World 7-7` | `World 7-7 Red Coin Challenge` |
| `World 8-3` | `World 8-3 Red Coin Challenge 1`<br>`World 8-3 Red Coin Challenge 2` |
| `World 8-7` | `World 8-7 Red Coin Challenge` |
| `World 8-Tower 2` | `World 8-Tower 2 Red Coin Challenge` |

You only need to complete the ring itself for its check. Each ring gives one reward, even if you repeat it.

## All castle bosses

Castle bosses award a check **in addition to the level's Goal check**. Towers have a level Goal but no separate boss check.

| Boss check | Finish that counts |
|---|---|
| `World 1-Castle Bowser Defeated` | `World 1-Castle Goal` |
| `World 2-Castle Mummipokey Defeated` | `World 2-Castle Goal` **OR** `World 2-Castle Secret Exit` |
| `World 3-Castle Cheepskipper Defeated` | `World 3-Castle Goal` |
| `World 4-Castle Mega Goomba Defeated` | `World 4-Castle Goal` |
| `World 5-Castle Petey Piranha Defeated` | `World 5-Castle Goal` **OR** `World 5-Castle Secret Exit` |
| `World 6-Castle Monty Tank Defeated` | `World 6-Castle Goal` |
| `World 7-Castle Lakithunder Defeated` | `World 7-Castle Goal` |
| `World 8-Castle Dry Bowser Defeated` | `World 8-Castle Goal` |
| `World 8-Bowser's Castle Bowser & Bowser Jr. Defeated` | `World 8-Bowser's Castle Goal` |

The Mini-Mario finishes in World 2 and World 5 also count as defeating their bosses. You do not need both the normal and Mini finish to receive the boss check.

## Power-Ups and Permits

A **Permit** lets you use a Power-Up type. It does not give you the Power-Up itself: you still need to find one in the game or receive one through Archipelago.

| Power-Up or feature | Needs its Permit by default? |
|---|---|
| Mini Mushroom | Yes |
| Blue Shell | Yes |
| Mega Mushroom | Yes |
| Fire Flower | Yes |
| Mushroom | No |
| Touchscreen Pocket | No |

Each license can be changed separately. Turning a license off lets you use that form normally without its Permit. Received Power-Ups wait in the client if their Permit is missing.

Some checks need a particular form. The complete list below shows those extra requirements. **“Large Mario”** means any of Mushroom, Fire Flower, Blue Shell, or Mega Mushroom; Mini Mario does not qualify. Ordinary Mushrooms are freely usable with the default settings.

<details>
<summary>World 1 - checks needing a Power-Up</summary>

| Check | Extra form needed |
|---|---|
| `World 1-1 Star Coin 3` | Large Mario |
| `World 1-Tower Secret Exit` | Shell Mario (Blue Shell) |
| `World 1-4 Star Coin 1` | Mini Mario |
| `World 1-4 Star Coin 2` | Large Mario |
| `World 1-4 1-Up Block` | Large Mario |
| `World 1-2 Blocksanity Block 7` | Large Mario |
| `World 1-2 Blocksanity Block 8` | Large Mario |
| `World 1-Tower Blocksanity Block 11` | Shell Mario (Blue Shell) |
| `World 1-Tower Blocksanity Block 12` | Shell Mario (Blue Shell) |
| `World 1-Tower Blocksanity Block 13` | Shell Mario (Blue Shell) |

</details>

<details>
<summary>World 2 - checks needing a Power-Up</summary>

| Check | Extra form needed |
|---|---|
| `World 2-2 Star Coin 2` | Large Mario |
| `World 2-4 Secret Exit` | Mini Mario |
| `World 2-Castle Star Coin 3` | Mini Mario |
| `World 2-Castle Secret Exit` | Mini Mario |
| `World 2-5 Blocksanity Block 4` | Large Mario |
| `World 2-5 Blocksanity Block 5` | Large Mario |
| `World 2-5 Blocksanity Block 7` | Large Mario |
| `World 2-5 Blocksanity Block 15` | Shell Mario (Blue Shell) |
| `World 2-5 Blocksanity Block 16` | Currently unreachable; not generated |
| `World 2-5 Blocksanity Block 18` | Shell Mario (Blue Shell) |
| `World 2-5 Blocksanity Block 19` | Currently unreachable; not generated |
| `World 2-Castle Blocksanity Block 13` | Mini Mario |
| `World 2-Castle Blocksanity Block 14` | Mini Mario |

</details>

<details>
<summary>World 3 - checks needing a Power-Up</summary>

| Check | Extra form needed |
|---|---|
| `World 3-A Star Coin 3` | Mini Mario |
| `World 3-Tower Star Coin 3` | Large Mario |
| `World 3-Ghost House Star Coin 3` | Shell Mario (Blue Shell) |
| `World 3-A Blocksanity Block 12` | Mini Mario |
| `World 3-A Blocksanity Block 13` | Mini Mario |

</details>

<details>
<summary>World 4 - checks needing a Power-Up</summary>

| Check | Extra form needed |
|---|---|
| `World 4-Ghost House Star Coin 3` | Mini Mario |
| `World 4-Ghost House Secret Exit` | Mini Mario |
| `World 4-4 Blocksanity Block 8` | Mini Mario |
| `World 4-5 Blocksanity Block 37` | Large Mario |

</details>

<details>
<summary>World 5 - checks needing a Power-Up</summary>

| Check | Extra form needed |
|---|---|
| `World 5-2 Star Coin 1` | Large Mario |
| `World 5-3 Star Coin 2` | Large Mario |
| `World 5-B Secret Exit` | Shell Mario (Blue Shell) |
| `World 5-C Star Coin 3` | Large Mario |
| `World 5-Castle Secret Exit` | Mini Mario |
| `World 5-2 Blocksanity Block 1` | Large Mario |
| `World 5-3 Blocksanity Block 4` | Mini Mario |
| `World 5-3 Blocksanity Block 5` | Mini Mario |
| `World 5-4 Blocksanity Block 2` | Large Mario |
| `World 5-A Blocksanity Block 4` | Large Mario |
| `World 5-C Blocksanity Block 1` | Large Mario |
| `World 5-C Blocksanity Block 2` | Large Mario |
| `World 5-C Blocksanity Block 3` | Large Mario |
| `World 5-C Blocksanity Block 4` | Large Mario |
| `World 5-C Blocksanity Block 5` | Large Mario |
| `World 5-C Blocksanity Block 6` | Large Mario |
| `World 5-C Blocksanity Block 7` | Large Mario |
| `World 5-C Blocksanity Block 8` | Large Mario |
| `World 5-C Blocksanity Block 9` | Large Mario |
| `World 5-C Blocksanity Block 10` | Large Mario |
| `World 5-C Blocksanity Block 11` | Large Mario |
| `World 5-C Blocksanity Block 12` | Large Mario |
| `World 5-C Blocksanity Block 13` | Large Mario |
| `World 5-C Blocksanity Block 14` | Large Mario |
| `World 5-C Blocksanity Block 15` | Large Mario |
| `World 5-C Blocksanity Block 16` | Large Mario |
| `World 5-C Blocksanity Block 20` | Large Mario |
| `World 5-C Blocksanity Block 22` | Large Mario |
| `World 5-C Blocksanity Block 25` | Shell Mario (Blue Shell) |
| `World 5-C Blocksanity Block 26` | Shell Mario (Blue Shell) |
| `World 5-C Blocksanity Block 31` | Shell Mario (Blue Shell) |
| `World 5-C Blocksanity Block 32` | Shell Mario (Blue Shell) |

</details>

<details>
<summary>World 6 - checks needing a Power-Up</summary>

| Check | Extra form needed |
|---|---|
| `World 6-Tower 2 Star Coin 2` | Large Mario |
| `World 6-6 Star Coin 1` | Large Mario |
| `World 6-1 Blocksanity Block 6` | Mini Mario |
| `World 6-6 Blocksanity Block 5` | Large Mario |
| `World 6-6 Blocksanity Block 6` | Large Mario |

</details>

<details>
<summary>World 7 - checks needing a Power-Up</summary>

| Check | Extra form needed |
|---|---|
| `World 7-2 Star Coin 1` | Large Mario |
| `World 7-3 Star Coin 3` | Large Mario |
| `World 7-4 Secret Exit` | Mini Mario |
| `World 7-5 Star Coin 2` | Mini Mario **AND** Mega Mario |
| `World 7-A Star Coin 3` | Mini Mario |
| `World 7-6 Star Coin 1` | Large Mario |
| `World 7-6 Secret Exit` | Large Mario |
| `World 7-4 Blocksanity Block 6` | Mini Mario |
| `World 7-4 Blocksanity Block 7` | Mini Mario |
| `World 7-4 Blocksanity Block 9` | Mini Mario |
| `World 7-5 Blocksanity Block 28` | Mini Mario |
| `World 7-4 Blocksanity Flying Block 1` | Mini Mario |

</details>

<details>
<summary>World 8 - checks needing a Power-Up</summary>

| Check | Extra form needed |
|---|---|
| `World 8-4 Star Coin 3` | Mini Mario |
| `World 8-6 Star Coin 2` | Large Mario |
| `World 8-8 Star Coin 2` | Mini Mario |
| `World 8-Bowser's Castle Star Coin 3` | Shell Mario (Blue Shell) |
| `World 8-2 Blocksanity Block 6` | Mini Mario |
| `World 8-4 Blocksanity Block 10` | Mini Mario |
| `World 8-4 Blocksanity Block 11` | Mini Mario |

</details>

**World 7-5 Star Coin 2 needs both Mini and Mega Mario:** Mini Mario enters the bonus room, and Mega Mario moves the pipe blocking the coin.

Checks without a listed extra form still need their world and level unlocked. A house reached through a Mini-only secret exit can therefore depend on Mini Mario even though the house itself needs no special form.

**Powerup Permit Placement: Early** makes the chosen enabled Permits available early in the game. They can still be placed in another player's world. The default selection is Mushroom, Fire Flower, and Touchscreen Pocket; licenses that are off are ignored.

## All Advanced Locations

**Advanced Locations** are checks marked as hidden or harder to reach. There are **116** in this version. This is a specific list; other secret exits and Power-Up checks are not automatically Advanced.

| Advanced Location Item Placement | What it means for you |
|---|---|
| Allow Progression (default) | These checks can hold items you need to move forward, if their other settings allow it. |
| Non-Progression | These checks stay in the game, but required items are kept out of them. |

The lists below contain every Advanced Location. “No extra form” means no special Power-Up is required at the check itself; you still need to reach its level or house.

<details>
<summary>World 1 - 3 Advanced Locations</summary>

| Check | Extra form or house route |
|---|---|
| `World 1-2 1-Up Block` | No extra form |
| `World 1-4 1-Up Block` | Large Mario |
| `World 1-Tower 1-Up Block` | No extra form |

</details>

<details>
<summary>World 2 - 15 Advanced Locations</summary>

| Check | Extra form or house route |
|---|---|
| `World 2-2 Star Coin 1` | No extra form |
| `World 2-Castle Secret Exit` | Mini Mario |
| `World 2-A Star Coin 3` | No extra form |
| `World 2-A Secret Exit` | No extra form |
| `World 2-A 1-Up Block` | No extra form |
| `World 2-3 Blocksanity Block 1` | No extra form |
| `World 2-3 Blocksanity Block 2` | No extra form |
| `World 2-A Blocksanity Block 5` | No extra form |
| `World 2-A Blocksanity Block 16` | No extra form |
| `World 2-A Blocksanity Block 17` | No extra form |
| `World 2-A Blocksanity Block 18` | No extra form |
| `World 2-A Blocksanity Block 19` | No extra form |
| `World 2-A Blocksanity Block 20` | No extra form |
| `World 2-A Blocksanity Block 21` | No extra form |
| `World 2-A Blocksanity Block 22` | No extra form |

</details>

<details>
<summary>World 3 - 4 Advanced Locations</summary>

| Check | Extra form or house route |
|---|---|
| `World 3-3 1-Up Block` | No extra form |
| `World 3-A 1-Up Block` | No extra form |
| `World 3-B Blocksanity Block 13` | No extra form |
| `World 3-C Blocksanity Block 6` | No extra form |

</details>

<details>
<summary>World 4 - 19 Advanced Locations</summary>

| Check | Extra form or house route |
|---|---|
| `World 4 Green Toad House 1 Goal` | Use `World 4-1 Secret Exit` |
| `World 4-1 1-Up Block` | No extra form |
| `World 4-3 1-Up Block 2` | No extra form |
| `World 4-6 1-Up Block 1` | No extra form |
| `World 4-4 Blocksanity Block 7` | No extra form |
| `World 4-5 Blocksanity Block 7` | No extra form |
| `World 4-5 Blocksanity Block 8` | No extra form |
| `World 4-5 Blocksanity Block 9` | No extra form |
| `World 4-5 Blocksanity Block 13` | No extra form |
| `World 4-5 Blocksanity Block 14` | No extra form |
| `World 4-5 Blocksanity Block 36` | No extra form |
| `World 4-5 Blocksanity Block 37` | Large Mario |
| `World 4-5 Blocksanity Block 57` | No extra form |
| `World 4-6 Blocksanity Block 8` | No extra form |
| `World 4-6 Blocksanity Block 9` | No extra form |
| `World 4-Ghost House Blocksanity Block 16` | No extra form |
| `World 4-Ghost House Blocksanity Block 17` | No extra form |
| `World 4-Ghost House Blocksanity Block 18` | No extra form |
| `World 4-Castle Blocksanity Block 5` | No extra form |

</details>

<details>
<summary>World 5 - 29 Advanced Locations</summary>

| Check | Extra form or house route |
|---|---|
| `World 5-Castle Star Coin 2` | No extra form |
| `World 5-Castle Star Coin 3` | No extra form |
| `World 5-Castle Secret Exit` | Mini Mario |
| `World 5-C 1-Up Block` | No extra form |
| `World 5-2 Blocksanity Block 1` | Large Mario |
| `World 5-3 Blocksanity Block 3` | No extra form |
| `World 5-C Blocksanity Block 1` | Large Mario |
| `World 5-C Blocksanity Block 2` | Large Mario |
| `World 5-C Blocksanity Block 3` | Large Mario |
| `World 5-C Blocksanity Block 4` | Large Mario |
| `World 5-C Blocksanity Block 5` | Large Mario |
| `World 5-C Blocksanity Block 6` | Large Mario |
| `World 5-C Blocksanity Block 7` | Large Mario |
| `World 5-C Blocksanity Block 8` | Large Mario |
| `World 5-C Blocksanity Block 9` | Large Mario |
| `World 5-C Blocksanity Block 10` | Large Mario |
| `World 5-C Blocksanity Block 11` | Large Mario |
| `World 5-C Blocksanity Block 12` | Large Mario |
| `World 5-C Blocksanity Block 13` | Large Mario |
| `World 5-C Blocksanity Block 14` | Large Mario |
| `World 5-C Blocksanity Block 15` | Large Mario |
| `World 5-C Blocksanity Block 16` | Large Mario |
| `World 5-C Blocksanity Block 20` | Large Mario |
| `World 5-C Blocksanity Block 25` | Shell Mario (Blue Shell) |
| `World 5-C Blocksanity Block 26` | Shell Mario (Blue Shell) |
| `World 5-C Blocksanity Block 31` | Shell Mario (Blue Shell) |
| `World 5-C Blocksanity Block 32` | Shell Mario (Blue Shell) |
| `World 5-Ghost House Blocksanity Block 24` | No extra form |
| `World 5-Castle Blocksanity Block 10` | No extra form |

</details>

<details>
<summary>World 6 - 30 Advanced Locations</summary>

| Check | Extra form or house route |
|---|---|
| `World 6-3 Star Coin 3` | No extra form |
| `World 6-Castle Star Coin 3` | No extra form |
| `World 6-2 1-Up Block` | No extra form |
| `World 6-5 1-Up Block` | No extra form |
| `World 6-6 1-Up Block` | No extra form |
| `World 6-A 1-Up Block` | No extra form |
| `World 6-Tower 1 1-Up Block 1` | No extra form |
| `World 6-Tower 1 1-Up Block 2` | No extra form |
| `World 6-2 Bonus Area Flying 1-Up Block 1` | No extra form |
| `World 6-2 Bonus Area Flying 1-Up Block 2` | No extra form |
| `World 6-2 Bonus Area Flying 1-Up Block 3` | No extra form |
| `World 6-2 Bonus Area Flying 1-Up Block 4` | No extra form |
| `World 6-2 Bonus Area Flying 1-Up Block 5` | No extra form |
| `World 6-2 Bonus Area Flying 1-Up Block 6` | No extra form |
| `World 6-2 Bonus Area Flying 1-Up Block 7` | No extra form |
| `World 6-2 Bonus Area Flying 1-Up Block 8` | No extra form |
| `World 6-1 Blocksanity Block 1` | No extra form |
| `World 6-2 Blocksanity Block 2` | No extra form |
| `World 6-2 Blocksanity Block 3` | No extra form |
| `World 6-2 Blocksanity Block 4` | No extra form |
| `World 6-4 Blocksanity Block 4` | No extra form |
| `World 6-6 Blocksanity Block 2` | No extra form |
| `World 6-6 Blocksanity Block 3` | No extra form |
| `World 6-A Blocksanity Block 5` | No extra form |
| `World 6-A Blocksanity Block 6` | No extra form |
| `World 6-B Blocksanity Block 4` | No extra form |
| `World 6-Tower 1 Blocksanity Block 1` | No extra form |
| `World 6-Tower 1 Blocksanity Block 2` | No extra form |
| `World 6-Tower 1 Blocksanity Block 3` | No extra form |
| `World 6-Tower 2 Blocksanity Block 3` | No extra form |

</details>

<details>
<summary>World 7 - 12 Advanced Locations</summary>

| Check | Extra form or house route |
|---|---|
| `World 7-Ghost House Secret Exit` | No extra form |
| `World 7 Green Toad House 2 Goal` | Use `World 7-Ghost House Secret Exit` |
| `World 7-7 1-Up Block` | No extra form |
| `World 7-A 1-Up Block 1` | No extra form |
| `World 7-3 Blocksanity Block 2` | No extra form |
| `World 7-4 Blocksanity Block 1` | No extra form |
| `World 7-4 Blocksanity Block 6` | Mini Mario |
| `World 7-4 Blocksanity Block 7` | Mini Mario |
| `World 7-4 Blocksanity Block 9` | Mini Mario |
| `World 7-A Blocksanity Block 3` | No extra form |
| `World 7-Castle Blocksanity Block 5` | No extra form |
| `World 7-4 Blocksanity Flying Block 1` | Mini Mario |

</details>

<details>
<summary>World 8 - 4 Advanced Locations</summary>

| Check | Extra form or house route |
|---|---|
| `World 8-1 Star Coin 1` | No extra form |
| `World 8-2 Star Coin 2` | No extra form |
| `World 8-Castle Star Coin 3` | No extra form |
| `World 8-5 Blocksanity Block 10` | No extra form |

</details>


## Block checks

**1-Up Block Checks** adds the listed hidden and flying 1-Up Blocks. **Blocksanity** adds the listed Coin and Power-Up Blocks. Both are off by default.

A block gives one check when opened. A block containing several coins still gives only one AP reward. Some special block types, including hanging blocks, are not included yet.

### Can blocks hold required items?

The two block categories have separate Item Placement settings:

| Setting | What can be inside |
|---|---|
| Excluded | Ordinary filler rewards and enabled traps. |
| Non-Progression (default) | Helpful rewards, filler, and enabled traps; no required items. |
| Progression | Required items are also allowed where the other settings permit them. |

**Blocksanity Global Check Percentage** controls how many block checks join the regular multiworld item pool. The others contain local filler or traps. Joining that pool allows rewards for other players; it does not guarantee a reward for someone else.

The default percentage is 30%, and the host may limit it. This setting covers Blocksanity and enabled World 6-2 bonus blocks; ordinary 1-Up checks outside that room keep their separate rules.

## World 6-2 bonus room

Enable **World 6-2 Bonus Area** together with the block category you want:

| Enabled settings | Extra checks |
|---|---|
| Bonus Area + Blocksanity | 120 flying Coin/Power-Up Blocks. |
| Bonus Area + 1-Up Block Checks | Eight flying 1-Up Blocks. |
| All three | All 128 bonus-room blocks. |

The bonus room contains ordinary filler and enabled traps. **It never holds required items.** At most 16 of its active checks can join the regular multiworld pool; the remaining checks contain local rewards.

## Finding shuffled levels

**Level Randomization** can keep the original layout, shuffle levels within each world, or shuffle them across all worlds. Compatible level types stay together. Bowser's Castle remains in place.

**Check names follow the original level content.** If the original World 3-3 moves, its third coin is still called `World 3-3 Star Coin 3`. Keys, signs, and map paths follow the entrance where that content was placed.

Use these commands in the client to find the level you need:

| Command | What it shows |
|---|---|
| `/level W3-3` | Where the original World 3-3 is located. |
| `/level World 3-3 Star Coin 3` | The entrance for that specific check. |
| `/level world 3` | What each entrance on the World 3 map contains. |
| `/level all` | Every level assignment. |

The Mini-Mario exits called `World 2-Castle Secret Exit` and `World 5-Castle Secret Exit` stay tied to those castle entrances. The World 6-2 bonus room travels with the original World 6-2 content.

## Choosing how much secret hunting is required

You can keep optional checks available while keeping required items out of them. Use **Non-Progression** for Advanced Locations, 1-Up Blocks, or Blocksanity if you want their rewards without needing them to unlock the next part of the game.

When optional secret-route logic is off, required items are also kept out of the corresponding secret checks and side branches. With **Secret Exit Shortcut Logic** off, that includes all checks in these places:

- `World 1 Red Toad House 1`
- `World 2 Red Toad House 2`
- `World 2-A`
- `World 3 Green Toad House`
- `World 3-B`
- `World 3-C`
- `World 4 Green Toad House 1`
- `World 7 Green Toad House 2`
- `World 7 Green Toad House 3`
- `World 7-A`

With **Secret Exit World Unlock Logic** off, the two Mini-Castle Secret Exit checks and World 5 Red Toad House cannot contain required items. With **Cannon Route Logic** off, the five cannon Secret Exit checks cannot contain required items.

These settings work together. Allowing required items in Advanced Locations does not override a block or secret-route restriction.
