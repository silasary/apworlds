# New Super Mario Bros. DS

This Archipelago world turns **New Super Mario Bros. DS** into a multiworld
randomizer. Clearing levels and finding secrets sends items to you or to other
players. In return, your own world access, abilities, Power-Ups, and Star Coins
may be found anywhere in the multiworld.

**[Roadmap](https://github.com/Lemix028/Archipelago-NewSuperMarioBrosDS/blob/nsmbds/worlds/nsmbds/docs/Roadmap.md)**

For installation and launch instructions, see the [Setup Guide](setup_en.md).

> **Alpha:** Crashes and fatal errors are considered unlikely. Known types of
> alpha issues include severe FPS drops in some levels, individual features or
> checks no longer working, and location or item tracking unexpectedly
> stopping. Seeds may also contain incorrect or missing logic requirements,
> especially around Power-Up Permits and locations that need a specific
> character form. If tracking stops, pause the game and verify the client and
> BizHawk Lua connection before continuing.

## What is randomized?

With the standard location settings, a seed includes:

- all 80 level goals;
- all 9 Castle boss defeats as separate checks;
- all 240 Star Coins;
- 34 Toad House rewards;
- 29 Red Coin Challenges;
- 51 hidden or flying 1-Up Blocks;
- 18 Secret Exits, including the special Mini-Mario exits in the World 2 and
  World 5 castles.

Most categories except level goals and Star Coins can be disabled in your
player options. **Star Coins are always included.** Picking up a Star Coin in a
level sends a check, while the Star Coin item found for you becomes currency
for overworld signs and may count toward your goal.

### Blocksanity

Blocksanity adds up to over 1,100 Coin and Power-Up Blocks as extra checks. It is
disabled by default because it greatly increases the size of the seed. A few special blocks are still missing, such as hanging blocks.

The flying-block room in World 6-2 contains 128 flying-block checks and can also be included. 
These checks never contain progression items for the local player, 
and at most 16 can be global checks for other players. The remaining checks contain local filler or traps.

## Goals

You can choose one of four victory conditions:

| Goal | How to win |
|---|---|
| Defeat Bowser | Defeat Bowser & Bowser Jr. in World 8-Bowser's Castle |
| Star Coin Hunt | Receive the chosen number of Star Coin items |
| World Tour | Defeat all 9 Castle bosses |
| Completionist | Defeat all 9 Castle bosses and receive the chosen number of Star Coin items |

Star Coins spent at signs still count toward Star Coin Hunt and Completionist.
Only your current spending balance goes down. The overview section in the client shows the total amount received so far.

## Progression items

### World Passes

The Desert, Isle, Jungle, Glacier, Mountain, Cloud, and Volcano Passes unlock
Worlds 2 through 8. A later world may therefore become available before you
finish every earlier level.

### Tower and Castle Keys

When enabled, every world has a Tower Key and a Castle Key. You must receive
the matching key before passing its locked route. This option can be disabled
for a more vanilla-like overworld.

### Star Coin gates

All gate modes use received Star Coin items as their currency. You can choose
how access to the overworld signs works:

- **Vanilla:** signs behave like the original game and cost Star Coins.
- **Progressive:** each Progressive Gate Pass unlocks the next sign in order;
  you also need the sign's Star Coin cost.
- **Individual:** every sign has its own named Gate Pass and still requires its
  Star Coin cost.

### Power-Up Permits

Permits can lock the use of Mushrooms, Fire Flowers, Blue Shells, Mini
Mushrooms, Mega Mushrooms, and the touchscreen reserve pocket. When a Permit
option is enabled, you must find that Permit before using the ability.
Power-Ups simply disappear when collected if you don't own the permit yet. 
Item-based Power-Ups are queued up until you unlock the permit.

## Items you can receive

| Item | What it does |
|---|---|
| Mushroom | Gives a Mushroom |
| Fire Flower | Gives a Fire Flower |
| Blue Shell | Gives a Blue Shell |
| Mini Mushroom | Gives a Mini Mushroom |
| Mega Mushroom | Gives a Mega Mushroom |
| Starman Buff | Grants 15 seconds of invincibility |
| 1-Up Mushroom | Adds one life |
| 3-Up Moon | Adds three lives |
| Coin Bundle | Adds 50 Coins |
| Time Capsule | Adds 30 seconds to the current level |
| Starman Lite | Grants five seconds of invincibility |
| Trap Shield | Blocks the next trap; several charges can be stored (Cyan Shield) |
| Small Care Package | Adds time, Coins, and one life |
| Life Insurance | Prevents the next death from consuming a life (Green Heart) |

If your reserve pocket is full, a received Power-Up waits until it can be
delivered. It is not lost.

## Item placement

1-Up Blocks and Blocksanity checks have three placement choices:

| Setting | What may be placed there |
|---|---|
| Excluded | Filler items and traps only |
| Non-Progression | Filler, repeatable Power-Ups, useful items, and traps |
| Progression | Any item, including important progression |

Blocksanity uses **Non-Progression** by default, so blocks may contain Power-Ups
without hiding required world access in one of hundreds of blocks. 1-Up Blocks
also use **Non-Progression** by default.

The Blocksanity global percentage controls how many of these checks may hold
items for other players. The remaining blocks contain local filler or traps.

## Traps

The trap percentage controls how often traps replace ordinary non-progression
items. Every trap can also be enabled or disabled separately.

| Trap | Effect |
|---|---|
| Super Speed | Makes Mario move much faster |
| Slowness | Makes Mario move more slowly |
| Slippery Gloves | Temporarily disables wall jumps |
| Ground Bound | Temporarily prevents jumping |
| Hyper Confusion | Reverses left and right |
| No Sprint | Temporarily disables sprinting |
| Button Swap | Swaps the jump and sprint buttons |
| Ice Shoes | Makes stopping and turning slippery |
| Heavy Mario | Lowers jumps and makes Mario fall faster |
| Can't Stop | Forces Mario to keep running |
| Sticky Buttons | Briefly keeps released directions held |
| Camera Drift | Pulls the camera to one side |
| Screen Flip | Turns both DS screens upside down |
| Drunk Camera | Makes the camera sway left and right |
| Boo Curse | Repeatedly reverses horizontal controls |
| I'm Stuck | Holds Mario in place for three seconds |
| Screen Tint | Covers the game with a colored tint |
| Retro Filter | Adds an old-screen color and scanline effect |
| Spotlight | Darkens everything outside a small visible area |
| Pixelation | Makes the game view appear pixelated |
| Ground Clap | Ground pounds damage Mario for a short time |
| Head Bonk | Hitting a block from below damages Mario |
| Bonk Trap | Immediately damages Mario |
| Coin Tax | Removes up to ten Coins |
| Time Drain | Removes 50 seconds from the level timer |
| Coin Thief | Removes all normal Coins |

Most timed traps last 15 seconds. The Spotlight lasts ten seconds and I'm Stuck
lasts three seconds. Bonk Trap can optionally be allowed to kill Small Mario.

## Death Link

Death Link shares deaths with other participating players. 
When enabled, your death can defeat them and their deaths can defeat you.  
Life Insurance prevents the next local death from consuming a life. 
The option Death Link: Trigger on Insured Deaths determines whether that insured death is still sent through Death Link. 
It is disabled by default.

## Character palettes

Mario and Luigi can each use their own color palette. The selected colors are
applied to the character (also the Power Ups) while playing levels; gameplay and abilities do not
change.

Available choices are Vanilla, Crimson, Emerald, Sapphire, Purple, Monochrome,
Pastel Rosa, Gold, Silver, Peach, Random Preset, and Crazy Random. **Random
Preset** chooses one of the prepared palettes for the seed. **Crazy Random**
randomizes every pixel.

## Client and emulator features

The NSMBDS Client can launch BizHawk, the patched ROM, and the included Lua
script for you. During play it shows received items,
checked locations, and notifications.

The patched game unlocks the native **SAVE** option in the World Map menu, so
you can save your current game at any time while on the World Map.

The emulator also displays an activity feed in the lower-left corner.
It shows checks and item transfers in real time, can be scrolled, and can be hidden with CTRL+SHIFT+H. Reconnecting may
restore older feed messages, but already used lives, Coins, Power-Ups, and traps
are not applied a second time.

### Hotkeys

 - Toggle Emulator Feed: `CTRL+SHIFT+H`

## Important player options

The generated YAML explains every available setting. These are the main groups
you will find there:

- **Goal:** victory condition and required Star Coin total.
- **Locations:** Red Coin Challenges, 1-Up Blocks, Secret Exits, Toad Houses,
  and Blocksanity.
- **Progression:** Star Coin gate mode, Tower/Castle Keys, and Power-Up Permits.
- **Filler:** choose which Power-Ups, lives, Coins, bonuses, and protection
  items may appear.
- **Traps:** set the overall percentage and toggle individual effects.
- **Multiplayer:** enable Death Link and its Life Insurance behavior.
- **Cosmetics:** select separate Mario and Luigi palettes.

Normal host safety limits allow up to 30% global Blocksanity checks and a 50%
trap rate. Higher values require the host to explicitly allow unsafe NSMBDS
options.

## Credits

- **xDesyyx** – Testing
- **Stigimon** – Testing
- **JunoWuno** – Ideas
