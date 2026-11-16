# The Bazaar

## What does randomization do to this game?

You start with one hero. Every other hero, plus a set of locked cards, merchants and events, is shuffled into the
multiworld. Until you receive a hero you may not play them, until you receive a locked card you may not buy it, and
until you receive a locked merchant or event you may not use it.

The game itself is never modified. The client reads the log file the game writes on your PC and, read-only, a
little of the game's memory (your run's screen and the cards on offer, to put padlocks on locked ones). Locks are
enforced by you (honor system), with the client warning you when you break one.

## What are the checks?

Per hero, for each day from 1 up to `max_day` (default 13, at most 16):

- **Reach Day N**.
- **Day N PvP Win** (`pvp_win_checks`): win the PvP fight at the end of the day.
- **Day N Monster (Rarity)** (`monster_checks`): one check per rarity that day's hour-3 monsters can have -
  day 1 up to Silver, day 2 up to Gold, days 3-5 up to Diamond, day 6+ up to Legendary.
  Beating a monster sends its rarity and every rarity below it for that day. Monsters from events don't count.
  `max_monster_tier` caps the highest rarity with a check (default Diamond, so no Legendary monster checks).
  `monster_rarities` keeps the day's **top three** rarities (default), **all** of them (Hardcore) or the **bottom
  three** (Casual): with top three, a Bronze monster on day 3 or later sends nothing.

Plus **10 Wins** with each hero. Getting 10 wins sends every check that hero has left: every day, PvP and monster
check, even a monster you skipped or lost to earlier in that run.

PvP wins are counted automatically: after a won fight the game's log always writes "Waiting for N exit tasks",
and never after a lost one (checked against a full run's answers).

## Logic

Logic only decides where items can be placed (in a tracker, out-of-logic checks show as "yellow", not
impossible); you can always try anything. It keeps important items off hard checks like a 10-win run.

- You can't get any check for a hero you haven't received. `early_hero_unlock` (off by default) puts a second
  hero's unlock among the checks you can do right away.
- Each hero (and the Common pool) keeps `starter_cards` Bronze cards (default 20) that are never locked.
- Days 1-7 only need the hero: every run reaches day 7, even with zero wins.
- Day 10 expects `logic_day_10_cards` (default 16) of that hero's own locked cards, and days 8-9 half as many.
  After day 10 the number climbs evenly up to `logic_last_day_cards` (default 28) on your last day (`max_day`),
  since late days are much harder. The 10-win check expects the last day's amount too. A day's PvP win is
  treated like the next day (winning is harder than just reaching it). Locked Common cards never count. A
  **pack counts as its 10 cards**.
- **10 wins** also needs **2 of that hero's packs** (or every pack the hero has, if your seed gives it fewer).
- Bronze, Silver and Gold monsters follow their day. Diamond and Legendary monsters also expect
  `logic_diamond_cards` / `logic_legendary_cards` (defaults 10 / 20) of the hero's locked cards.
- Legendary monsters also need **Legendary Items** (when your seed has it).
- **Power items** for late Diamond and Legendary monsters: the Expedition Tickets (3), Legendary Items (the first),
  Event Rarity Progression (the first 2) and **Level Up: Shiny!** - 7 with default settings. They start mattering on
  your seed's last day minus that number (day 6 by default: day 13 minus 7): that day a Legendary monster wants 1 power item, and each
  later day wants one more, so on the last day a Diamond monster wants them all; a Diamond monster wants one fewer
  than a Legendary on the same day. Never more than your seed has. Spare copies
  never count twice.
- PvP wins from day 8 need one **Event Rarity Progression**, and from day 14 two (when your seed has them).
  Legendary events are rare, so the second copy only matters on long runs.

## How many cards are locked?

`locked_cards_percent` (default 80) is the share of the checks left over - after hero, pack and group unlocks,
traps and bypasses - that hold a different locked card. The rest hold filler. A seed has **one copy of each unlock**:
no item is duplicated unless you ask for it. Copy counts you set yourself never change: you get exactly
`legendary_items` Legendary Items unlocks, one Expedition Tickets per ticket when they're progressive, and cards in
`duplicate_cards` keep their two copies. With `duplicate_all_cards` (casual mode) the percent doesn't apply: every
spare check holds a locked card, each with a second copy somewhere in the multiworld.

**Plentiful Items** (`plentiful_items`, off by default, on in the Casual preset) adds a second copy of every hero
unlock, pack and merchant/event unlock, and a second set of Expedition Tickets (any 3 of the 6 reach Tiny World).
Either copy unlocks it. The copies take checks that would otherwise hold locked cards, so you also get fewer locked
cards. Single cards, Legendary Items, Event Rarity Progression, Sell Traps, Trap Shields and Lock Bypasses keep their own counts.

## Locked merchants and events

`locked_encounters_percent` (default 25; 0 turns it off) of the merchants and events your heroes can meet get their
own unlock, **Merchant: X** or **Event: X** (one item covers every rarity version of it). `starter_merchants`
(default 5) merchants are never locked, so there's always somewhere to shop.

- **A locked merchant** (or an event that hands you items) can still be visited. Anything you take there counts as
  a locked card: sell it, receive the merchant's unlock, or use a Lock Bypass on it.
- **Any other locked event:** going in blocks checks for the rest of that run, unless you press **Use Bypass** next
  to it in the alert. Receiving its unlock clears the block too.
- **Event Rarity Progression** (`event_rarity_progression`, default 3 copies; 0 turns it off): until you find the
  first copy, Diamond merchants and events are locked; the second unlocks Legendary ones. Every copy past those two
  counts as a Lock Bypass. With `exempt_expeditions` (on by default) the expeditions and every event inside them are
  never locked this way; the tickets themselves still need their unlock (see below).
- **Only your choices count.** Monster fights, level-up rewards and events the game puts you in without a choice are
  never locked. If every event offered is locked, the least rare one is let through (a tie is picked at random, and a
  pop-up says which) - unless the screen also has an option that isn't an event.

Merchant and event unlocks are never needed by logic: there's always a way on. Event Rarity Progression is (see
[Logic](#logic)), so other games show it as an important item.

## What is the goal?

Get 10 wins with a number of different heroes (`heroes_required`, default 3, up to the number of heroes
you have enabled).

## What items can I receive?

- **Hero: X** - you may now play hero X.
- **Individual cards** - you may now buy that card. With `duplicate_cards` / `duplicate_all_cards` a card can
  have two copies in the multiworld; either one unlocks it.
- **Legendary Items** (`legendary_items`, default 1 copy) - unlocks every Legendary item. With more copies, the
  first one found unlocks them; the others are spares.
- **Expedition Tickets** - the expedition ticket cards, set by `expedition_ticket_unlocks`. **Progressive**
  (default): three Expedition Tickets items, each one unlocking the next ticket - Crash Site, then Temple, then Tiny
  World. **Separate**: Crash Site Ticket, Temple Expedition Ticket and Tiny World Ticket are each their own item.
  **Off**: the tickets are never locked.
- **Sizeinator** - `sizeinator_unlock` decides what unlocks it: the Tiny World Ticket (default, the easy way) or
  Legendary Items (hard).
- **Pack: X** (optional, `legacy_card_packs`) - one of the ten original hero expansions, such as Mysteries of the
  Deep or Dooltron. Unlocks all of its cards at once. Every pack has its own switch (`pack_dooley_dooltron` and so
  on), all on by default, so you can keep just the packs you like. Packs lock a lot more cards in total (10 per
  check), so turning on **Duplicate All Cards (casual)** as well is a good idea.
- **Pack: X** (on by default, `custom_card_packs`) - hand-made packs of about 10 strong cards from one build, three for
  each DLC hero plus one more for Mak and Dooley, such as Swarm Protocol (Stelle's drones), Seeing Red (Karnok's Rage)
  or Overclocked (Dooley's tech). They work just like the original packs, with a switch each, and never share a card
  with them.
- **Merchant: X** / **Event: X** - you may now use that merchant or event (see above).
- **Event Rarity Progression** - first Diamond, then Legendary merchants and events; extra copies are Lock Bypasses.
- **Sell Trap** / **Trap Shield** / **Lock Bypass** (see below).
- Filler items with no effect (only if the pool somehow runs out of anything else).

## Checks are blocked while you break a rule

The client refuses to send **any** check (days, PvP, monsters, 10 wins) while:

- you're playing a hero you haven't received - for the whole run;
- you're holding a locked card, or anything you took at a locked merchant - until the game's log shows you sold it,
  you receive its unlock, or you use a Lock Bypass on it;
- you went into a locked event - for the rest of that run, unless you receive its unlock or use a Lock Bypass on it;
- a Sell Trap's deadline has passed and you still hold its item - until you sell it;
- you've received a DeathLink - for the rest of that run, including the fight you're in;
- a run started while the client was off or disconnected was already holding a locked card when the client caught
  up - concede that run (no DeathLink is sent for it).

The notices box in the top-right corner says "CHECKS ARE BLOCKED ..." and why. Checks you miss this way can still be
earned in a later run.

## Sell Traps

The multiworld contains `sell_traps` Sell Traps (default 3; 0 turns them off). When you receive one, the client
picks a random item you're holding and gives you `sell_trap_days` days (default 2) to sell it: a trap on day 2 says
**before the end of day 3**. That day's PvP fight is the line, just like a locked card: still holding the item when it
starts loses the rest of the run - and **no Lock Bypass brings back a run lost to a Sell Trap**, you have to concede
it. Between that day's monster fight and its PvP fight the notice turns into the flaming warning. A trap that arrives
after the day's PvP fight counts from the next day (it's hour 1 of tomorrow), so it always gets its full days. If it
arrives while you're between runs or holding nothing it can pick, it's **dodged** and does nothing.

## Trap Shields

The multiworld contains `trap_shields` Trap Shields (default 3; 0 turns them off). A shield blocks the next trap you
receive after it, the moment that trap arrives; a trap you already had stays. A trap that would be dodged anyway
doesn't use a shield, and unused shields carry over to later runs. The shields you have show as stacked shield icons
next to your Lock Bypasses at the top of the overlay.

## Lock Bypasses

The friendly opposite of a Sell Trap: the multiworld contains `lock_bypasses` Lock Bypasses (default 5; 0 turns them
off). A bypass is for the moment you're holding a locked card: next to that card, the alert says **SELL OR USE
BYPASS** and has a **Use Bypass** button. Press it and the card is yours for the rest of the run - more copies of it
too, so you can upgrade it, and selling it and buying it back is fine. Checks unblock straight away. The card is
locked again when the run ends. The same button shows next to a locked event you went into: press it and that
event is allowed for the rest of the run.

A bypass is never used by itself, so buying a card you didn't realise was locked can't waste one - you decide.
Unused bypasses wait for later runs, and the header (top left) always shows how many you have. Like a trap, each bypass
takes the place of one locked card.

**Items the game makes for you follow the Created Items option.** These are cards spawned
by another card (selling Temporary Shelter gives you 2 Scrap) and cards transformed into another (a Reagent at
Alembic, Catalyst, Wink, Mandala, Assembly Line when a fight ends). Transforms a fight undoes never count, and
everything The Cult gives you is always free. Rewards the log names (such as Make a Wish) always count as held and must be sold.

- **Allowed** (Casual): every created card is yours to keep.
- **Special Cases** (default): only cards that are meant to be made are free - the first transform of one of Mak's
  Reagents (at Mandala too), everything Wink gives you, Soda and Vending Machine drinks, and items that always make
  the same card (Temporary Shelter or Salvage Yard's Scrap, Colossal Popsicle's Icicle, Froyo Cart's Sorbet, Chum's
  Piranha, Pasta Maker's Pasta). Anything else is judged like a card you took.
- **Locked** (Hardcore): a created card that's still locked blocks checks until you sell it, transform it again, or use a
  Lock Bypass on it.

The client spots created cards by watching your board and stash, so it needs the memory reader (and the Tempo
launcher's administrator rights, see the setup guide). If the reader is off, created cards are allowed.

## DeathLink

- A DeathLink is sent when you lose a run: your last PvP fight takes the last of your prestige. It goes out the
  moment that fight ends, not when you press Continue (if the client can't read the game's memory, it goes out on
  Continue instead). Losing a single fight never sends one.
- `death_link_on_concede`: conceding also sends a DeathLink (off by default). Conceding because you received a
  DeathLink never sends one.
- `death_links_before_concede`: how many DeathLinks you have to receive before you must concede (2 by default).
  The count starts over once one makes you concede. One that arrives while you're not in a run is dodged and
  doesn't count.
- `death_links_same_run`: those DeathLinks must all arrive during one run - the count starts over every run (on
  by default). Turn it off and they add up across runs.
- What everyone else reads depends on your hero and how far the run got (its wins - "with 5 wins", never a day), or whether you conceded -
  Vanessa players get thrown overboard, Mak players fumble their potions, and a run with no wins at all is
  trash. The Bazaar's a crazy place, right?

## Game updates

The apworld keeps working when The Bazaar is patched. The client warns once (in its window and above the game)
when it sees a newer game version, or a card, hero or monster the apworld doesn't know yet: new cards are never
locked, new heroes aren't part of the seed, and a new monster counts as Bronze. A newer apworld picks them up.

## Rules you enforce yourself

- Only play heroes you've received.
- Don't keep locked cards. Events, loot and level-ups can hand you one; that's fine, just sell it before
  your next fight. The client puts a padlock on each locked card you're offered (shops, level-ups, loot, events),
  and on each locked merchant or event on a choice screen, and
  pops up a warning whenever you end up with one anyway. The warning clears
  itself once you sell it. Use `/locked` to see what's locked.
- DeathLink: when someone else dies, concede your current run once the client's DEATHLINK notice tells you to
  (by default the second one you receive in a run).

## Is this allowed by Tempo?

Tempo's [Third-Party Plugin & Modding Policy](https://www.playthebazaar.com/mod-policy) expressly prohibits mods
that change gameplay, game speed or the flow of combat; calculate or simulate combat; interact with the game
without your input; or talk to the game's server. The client does none of those. It reads `Player.log`, and to put
padlocks on shop cards it also **reads the game's memory**: only your own run's current screen and the cards on
offer, read-only, with nothing written or injected and nothing about other players. Tempo's policy can change, so
check it yourself.
