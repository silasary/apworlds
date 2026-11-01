# Astral Ascent – Archipelago setup (v0.2.0, game version 2.6.4)

## What you need
- Astral Ascent (Epic or Steam), Windows.
- Archipelago 0.6.7 or newer.

## Playing a seed
1. Install `astral_ascent.apworld` (double-click it).
2. On your room's page, click **Connect** next to your slot and choose **Astral Ascent Client**
   (or open the Archipelago Launcher → Astral Ascent Client and type `/connect <address>` and your slot name).
3. That's it. The client then:
   - finds the game (Epic or Steam),
   - picks a free save slot for this seed, starting in the Garden with the tutorial done, every shop and NPC
     open (Arsenal, Barbecue, Poetic Peddler, Zim-Zim, Sire Bapy, Papa Yalee, Oloon) and the whole XP track
     revealed: every spell, aura and Zim-Zim upgrade is in the shops from the start. Your other slots are
     never touched and your save file is backed up first.
   - and starts the game. If Epic or Steam asks which save to keep, choose the **local** one. Load the slot
     the client names, talk to Sova and play. Keep the client window open.

Coming back later: connect again and the client starts the game with the same slot. If the game is
already running when you connect, the client asks you to quit it once so it can check the save.
All three slots in use? The client asks you to pick one with `/newslot 1|2|3 overwrite`.

## In-game overlay
While you play, the top-right corner of the game keeps the 8 most recent messages: what you receive and
send, hints about your items, other players finishing their goal; plus a line with how many checks are in
logic right now. It only shows
while the game is the active window (it needs the game's default borderless fullscreen or windowed mode).
Turn it off or on with `/overlay off` / `/overlay on`.

## Options
The options come in the same sections in the Options Creator and the YAML template. Every option's description
says how many checks or items it adds.

### Goal
*Goal*: beat the final boss, or a Destiny Level (*Goal Destiny Level*). *Unique Heroes Required*: how many
different heroes must reach it (Ayla and Kiran start unlocked; Calie and Octave are items).

### Logic
Everything up to and including the World 1 boss is in logic from the start, as are the Barbecue aura checks.
Deeper areas expect a share of your upgrade items (spells, Zim-Zim tiers, weapons, passives), set by *Logic
Difficulty* (Normal shown; Easy expects 25% more, Hard 40% less):

| Area | Upgrade items expected |
|---|---|
| World 1 | none |
| World 2 / 3 / 4 | 10% / 20% / 30% |
| Final boss | 40% |
| Destiny Level n | 40% + 4% per level, up to 80% |

Checks belong to an area: rooms, bosses and lost Yalees to their world; Void and Yalee shop milestones are spread
evenly over Worlds 1-4; Sire Bapy tier 1 is expected around World 2, tier 2 World 3, tier 3 World 4, higher tiers
at the final boss (achievements for one world start in that world); Merchant spells and Zim-Zim tiers (Checks
mode) by Sun Piece budget, cheapest first: about 1,500 Sun Pieces up to World 1, 5,000 World 2, 15,000 World 3,
35,000 World 4, 75,000 the final boss, the rest spread over the Destiny Levels (times the currency multiplier).

### Items
| | Items | Checks | Vanilla |
|---|---|---|---|
| **Spells** (default: items) | One item per spell (72), in random order. The Merchant's spells can't be bought. | Every spell bought is a check, per Merchant tab ("Merchant: Ayla Spell 3"). | Normal game, not in the multiworld. |
| **Zim-Zim Upgrades** (default: checks) | Progressive items, one tier per copy (98). Zim-Zim's upgrades can't be bought. | Every tier bought is a check. | Normal game, not in the multiworld. |

Prices out of reach are set by the client in the game's files and your seed's save slot; `/files restore` puts
the files back. *Weapon Items* and *Passive Items*: on = items, off = all unlocked from the start. Heroes always
come from the multiworld; *Include DLC Heroes* adds Yamat and Arven (only if you own the DLC).

Receiving an item never sends a check: checks come from what you do. When you own every tier of a Zim-Zim
upgrade, the checks left there are sent for you.

### Run Checks
- *Room Checks*: clearing each room of a run (11 per world, 1 in the final world, 45 in all); drip = each room as
  you clear it, bulk = a world's rooms when you beat its boss.
- *Boss Checks*: each world's boss and the final boss (any of a world's three bosses counts): room (one check
  each), bonus (one extra each) or weighted (World 1 boss +1 extra ... final boss +5).
- *Lost Yalee Checks*: the 20 lost Yalees you save in runs (5 per world, held hostage or hidden in pots).
- *Void Boss Checks* / *Void Bosses per Check*: Astral Void milestones (every n Void bosses, repeats count).

### Hub Checks
- *Aura Checks*: every aura collected at Barbecue is a check (44, all on display from the start).
- *Yalee Shop Checks* / *Yalee Shop Purchases per Check*: milestones for colours bought at Oloon.

### Destiny Checks
*Destiny Check Levels*: Destiny Levels 1 up to this one each have 5 checks: a World 1, 2, 3 and 4 boss and the
final boss at that level.

### Sire Bapy
Reaching an achievement tier is a check, **sent as soon as you reach it**: you don't have to leave your run and
claim the reward first. *Sire Bapy Checks* picks a preset:

| Preset | Tiers | About |
|---|---|---|
| Off | none | 0 checks |
| Light (default) | tier 1 of everything | 70 checks |
| Standard | tiers 1-2 | 125 checks |
| Full | every tier, long grinds included | 210 checks |
| Custom | the highest tier per category, below | |

Custom categories (each 0 = none up to its highest tier): Combat, Challenges, World Feats, Builds, Exploration,
Shops & NPCs, Heroes, Destiny. *Sire Bapy Min Tier* skips the lower tiers in every category. Tiers above *Sire
Bapy Progression Max Tier* (default 2) never hold heroes or upgrades, so long grinds never block you.

### Filler
Every check needs an item. After heroes, upgrades and the *Destiny Fragment Bundles*, the free slots are filled
with duplicates first (see Duplicates), then by the **filler shares**: *Filler: Sun Pieces / Yalee Tickets /
Destiny Fragments / Boons / Traps %*. **Make the five add up to 100.** 0 turns a kind off. Sun Pieces only count
when there's a shop to spend them in (Spells or Zim-Zim not on Items). *Currency Multiplier* multiplies the Sun
Pieces and Yalee Tickets you pick up or receive.

Sun Pieces, Yalee Tickets and Destiny Fragments arrive immediately. **Boons** and **traps** work on your current
run; received outside a run, they wait for the next one (`/status` shows how many are waiting). Choose which ones
can appear with the *Boons* and *Traps* options:

| Boons | | Traps | |
|---|---|---|---|
| Keys | +2 keys | Thief | lose half your Quartz and a key |
| Stars | +5 stars | Bruise | lose 25% of your current HP (never lethal) |
| Quartz | +50 Quartz | Drain | mana to 0 |
| Heal | +30% of max HP | | |
| Max HP | +20 max HP for the run | | |
| Mana | mana refilled | | |
| Level Up | one level's worth of XP (you level up on your next XP gain) | | |
| Stat Stone | +1 to a stat stone (strength, armor, critical, speed) you already have this run; with none yet, it waits for your first | | |

### Duplicates
The number is how many EXTRA copies per category, e.g. `Ayla Spells: 1` = each of Ayla's 15 spells twice; 0 or
no entry = none. Only categories that are items in your seed count; for logic only the first copy of an item
counts (a Zim-Zim copy is one more tier, as in game), and copies are cut at random if there isn't room.
**Duplicates go before the filler shares: with many of them, little or no room is left for boons, traps and
other filler.**

### Too many items?
Generation prints a summary per player (checks by source, items by kind, how the free slots were filled). With
more items than checks, generation adds checks for you, in this order: Void Boss Checks (up to 100), Yalee Shop
Checks, then one more Sire Bapy tier in every category, and prints a big warning saying what it added. Only if
that still isn't enough does it stop with an error. To choose yourself, add checks or set Spells/Zim-Zim to
Checks or Vanilla. (The DLC heroes add 32 items.)

## Steam
Steam works the same as Epic. The Steam version may be a slightly different build: the client then
looks up where the game keeps Sun Pieces and Yalee Tickets when you enter the hub, and says so once.

## Commands
`/play` (set up and start the game again) · `/overlay on|off` · `/status` · `/deliver` (search the game's memory
again, if an unlock doesn't show up) · `/newslot 1|2|3 [overwrite]` and `/prepare` (game closed; manual slot
setup) · `/files status|restore` (the game files the client changes: spell and Zim-Zim prices; `restore` puts the originals back, with the game closed)

## Known limitations (v0.2.0)
- Currency items received while you're at the main menu may be lost: stay in the Garden or a run.
- A boon or trap that arrives on the death screen still counts for that (finished) run.
- Boons and traps are for player 1 (no co-op support).
- Heroes you haven't received yet can still unlock through the game's own events if you reach
  World 3/4; the client locks them again.
- Locking a weapon you have equipped leaves it equipped (only matters for slots with earlier progress).
- To play Astral Ascent normally again after a seed: `/files restore` (or verify the game files in Epic / Steam).
