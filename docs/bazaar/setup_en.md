# The Bazaar Setup Guide

## Required Software

- [The Bazaar](https://store.steampowered.com/app/1617400/The_Bazaar/) on Steam, or from the Tempo launcher
- [Archipelago](https://github.com/ArchipelagoMW/Archipelago/releases) 0.6.4 or newer
- `bazaar.apworld` from the [latest release](https://github.com/sfleming4587/BazaarArchipelago/releases/latest)

## Optional Software

- [Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases) works with this world too, if you
  like it better than the built-in tracker.

## Installation

1. Double-click `bazaar.apworld`, or open the Archipelago Launcher and pick **Install APWorld**.
2. Restart the Launcher. **The Bazaar Client** now shows up in its list.

That's it! Nothing gets installed into The Bazaar itself - the client reads the log file the game already writes,
and a little of the game's memory, read-only, for the padlocks on locked cards.

Playing through the Tempo launcher? It starts the game as administrator, so the first time the client sees the
game it asks Windows to restart itself as administrator too - say yes, and it comes back connected to your slot.
Without that it can't read the game, and locked cards get no padlocks.

In the game's settings, keep the display mode on **Fullscreen Window** (the default). The client's helpers are
their own windows on top of the game, and exclusive fullscreen would hide them.

## Configuring your YAML file

### What is a YAML and why do I need one?
Your YAML file holds your options for the game. See the
[basic multiworld setup guide](/tutorial/Archipelago/setup/en) to learn more.

### Where do I get a YAML?
Open the Launcher, click **Generate Template Options**, and edit `The Bazaar.yaml`. Under **Included Heroes
(Must own)**, tick each DLC hero you own (in the Options Creator or on a player options page they're simple on/off
switches). Vanessa, Pygmalien and Dooley are ticked already; untick any hero you want to sit out:

```yaml
The Bazaar:
  include_mak: true
  include_karnok: true
  heroes_required: 3
```

Prefer a ready-made setup? The Launcher's **Generate Template Options** also writes three presets to
`Players/Templates/Presets`: **The Bazaar - Casual**, **- Standard** and **- Hardcore**. Standard is simply the
defaults. Casual goes easy (1 hero to win, fewer locks, Lock Bypasses instead of traps); Hardcore goes all in (6
heroes if you have them, days up to 16, Legendary monsters, card packs locked, 10 Sell Traps with a day to sell, no
bypasses).

Looking for a relaxed game? **Duplicate All Cards (casual)** keeps the same number of checks but gives every locked
card a second copy in the multiworld, so there are about half as many locked cards and each one turns up sooner.

## Joining a game

1. Open **The Bazaar Client** from the Launcher and connect to the room.
2. Start The Bazaar - the order doesn't matter. The client finds `Player.log` on its own; if yours lives somewhere
   else, use `/logpath <path>` or set `bazaar_options.log_path` in `host.yaml`.
3. Pick a hero you've received and play! Checks are sent as you reach new days, win PvP fights, beat monsters and
   finish 10-win runs.

Handy commands: `/tracker` (opens the tracker), `/status`, `/locked [hero]` (with hints: where each locked card
is), `/where <card>` (your hint for a locked card, if you already have one), `/logpath`, `/deathlink` (turns DeathLink on or off until you close the client), and `/unblock` (emergency
only: shows what's blocking checks; `/unblock confirm` clears it if something broke).

## Your helpers while you play

The Archipelago client window keeps to your item history (what your checks found, sent and received) and replies
to your commands. Everything about your run shows up in small helper windows around the board instead (and in the
client's log file). If those can't open on your PC, the messages show in the client window as a fallback.

### Padlocks, the header and the notices

- **Padlocks:** every locked card you're offered - in a shop, a level-up, loot or an event's item choice - gets a
  red padlock right on the card, and so do the locked cards in your open stash. Clicks go straight through them,
  and they fade while you read a card's tooltip. Items handed to you with no choice get no padlock; if one of those
  is locked, just sell it. Cards the game makes for you (spawned or transformed) follow your **Created Items**
  option.
- **Notices (top right) - CHECKS ARE BLOCKED:** shown while you hold a locked card, miss a Sell Trap's deadline, play a locked hero or
  owe a DeathLink. It clears by itself once you sell the card (or press **Use Bypass** next to it); a locked hero
  or a DeathLink blocks the rest of that run. A run you started while the client was off or disconnected that was
  already holding a locked card has to be conceded (no DeathLink is sent for it).
- **DeathLink** (in the notices): time to concede your run. A DeathLink you survive (by default the first one in
  a run) shows a **DEATHLINK SURVIVED** pop-up instead, and you keep playing.
- **Header (top left):** during a run, your hero, day, goal progress and Lock Bypasses, with the Item Guide and
  Tracker buttons. It turns red while the client isn't connected to the multiworld.
- **Hero panel (main menu, centre):** every hero in your multiworld with their checks and cards unlocked, locked
  heroes padlocked, and a warning if the hero you picked - or Random - can land on one you can't play. It steps
  aside while any of the game's own screens is open, or the Tracker is over it.

The colour tells you how urgent it is: **red** = checks are blocked or a DeathLink arrived, **amber** = something to
act on (locked cards for sale, a Sell Trap, a locked hero picked), **dark** = just so you know, **green** = all good.

### Pop-ups (bottom right)

Short pop-ups (about 6 seconds each), as many as fit: **FOUND** for anything from your own world,
**RECEIVED ... from** with the player's name for anything from someone else (unlocks show the cards' pictures),
**SENT ... to** for an item one of your checks sends, a Sell Trap (with a flaming skull - you'll know it when you
see it) or Lock Bypass, **LOCK BYPASS USED** naming the card it let you keep, **SELL IT NOW** (or **SELL OR USE
BYPASS**) if you buy or get a locked card, and a note when the game was updated since the apworld was made. A red **CHECK NOT SENT** pop-up names any check the moment it's blocked.

### Item Guide

A window with pictures (courtesy of [Bazaar DB](https://bazaardb.gg)) of every card, each at its in-game size
(small = 1 slot wide, medium = 2, large = 3), with the locked ones greyed out behind a red X.

- Everything the chosen merchant could stock for your hero, in each card's rarity frame like in the game. The cards
  on screen right now (a shop, a level-up, loot or an event) are always in the list, and a card you buy stays there.
- **Search**, **Size**, **Rarity** and **Merchant** filters at the top; **Locked only** shows just the cards you may
  not buy - a great way to learn what they look like.
- Open it any time with the **Item Guide** button in the header (top left), not just in a shop; the same button or
  its **X** closes it. It fills the column left of the board, and it's a real window: drag it anywhere, even onto
  another monitor.
- The pictures come inside the apworld, so nothing is downloaded. The first time, they take a moment to get ready;
  until a card's picture is in, you'll see a "no picture" box of the card's size with its name under it.

Start the client with `--no-shop-guide` to turn it off completely.

### Tracker

Press **Tracker** in the header (top left) or type `/tracker`. You get a card for every hero, each with four squares:
reach day N (a sunrise), PvP win on day N (clashing swords), monster checks (a snake's head) and 10 wins (a
trophy). Under each hero's card: how many of its checks you've done, and how many of its cards you've unlocked.

- **Green:** something in it is in logic.
- **Yellow:** what's left is out of logic - doable, but logic expects more of that hero's cards first.
- **Red:** the hero is still locked.
- **Grey:** all done!

Hover a square to see its checks (square 3 shows a row per day, Bronze to Legendary); click to keep the list open,
click again to close it. Heroes that aren't in your seed are dimmed. It's a normal window, so a second monitor works
great.

### Where the helpers sit

The helpers live in the strips left and right of the board - never over the board and never over each other. They
only show while The Bazaar is the active window, never take the keyboard from the game, and stay see-through enough
to read item tooltips behind them. They follow the game window, so they fit any resolution (1080p, 1440p, 4K,
ultrawide), fullscreen window or windowed, on any monitor, and always stay fully on screen. Start the client with
`--no-overlay` to turn them off.

## Good to know

- Closed the game mid-run? Just resume the run - the client picks it right back up.
- Wifi dropped, or the client wasn't running? Keep playing. When the client reconnects it sends everything you
  earned in the meantime, even for runs that already ended (those don't send a late DeathLink). It can read back as
  far as the previous game session.
