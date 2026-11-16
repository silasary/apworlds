# AP_Bo

AP Bo is a stockpile card game against computer opponents, for Archipelago. Items unlock tables and make you
stronger; winning, finishing build piles and playing stockpile cards send checks.

- **Download:** [latest release](https://github.com/lighting8282/AP-Bo/releases/latest)
  (`apbo.apworld` and a template `AP_Bo.yaml`). Needs Archipelago 0.6.7 or newer.
- **Play in the browser:** https://lighting8282.github.io/AP-Bo/ (works on phones)

## The game

The deck has 162 cards: twelve each of 1-12, plus 18 wild Bo cards.

- **Build piles:** four shared piles, each built from 1 up to 12. A wild counts as
  whatever number the pile needs next. A pile that reaches 12 is set aside, and set-aside
  piles are shuffled back in when the deck runs out.
- **Your cards:** a stockpile with its top card face up; a hand, refilled at the start of
  each turn and again whenever you play it empty; and discard piles you can play from the top of.
- **Turns:** a turn ends when you discard a hand card onto one of your discard piles.
- **Winning:** the first player to play their last stockpile card wins.

## How to play it

- **Desktop client:** put `apbo.apworld` in `custom_worlds`, open **AP_Bo Client**
  from the Launcher, connect, and use the **AP Bo** tab.
- **Web client:** use the link above. *Just play* plays without a server.
  - It can only connect to secure (`wss://`) rooms, such as archipelago.gg. A room hosted
    on your own PC needs the desktop client or a locally served copy of the page.
  - It shares its save with the desktop client, so you can switch between them on one slot.

## Tables

Each table is unlocked by its own item.

| Table | Opponents | Stockpile size | Power needed to win (in logic) |
|---|---|---|---|
| 1 | 1 easy | 10 | 0 |
| 2 | 2 easy | 10 | 0 |
| 3 | 1 normal | 10 | 2 |
| 4 | 3 easy | 15 | 0 |
| 5 | 2 normal | 15 | 4 |
| 6 | 1 hard | 15 | 2 |
| 7 | 3 normal | 20 | 4 |
| 8 | 2 hard | 20 | 4 |
| 9 | 3 hard | 25 | 6 |
| 10 | 3 hard | 30 | 6 |

- **Opponent levels:**
  - **Easy** players play what fits and discard at random.
  - **Normal** players look a few moves ahead for a way to play their stockpile card.
  - **Hard** players look further ahead, save wilds, stack their discards in order, and
    avoid setting up the next player.
- **Starting tables:** you start with 1-3 of the easy tables (1, 2 and 4) unlocked,
  depending on `starting_tables`. Which ones is random.
- **Power** is how many power items you hold in total, of any kind. Logic only asks for a
  count, not specific items. The Dominant check at a table needs 2 more power than winning there.
- **Where the numbers come from:** win rates measured by simulation, with the computer
  playing your seat. With no items, Table 9 is about 22% and Table 10 about 27%; with every
  item, both are around 76-79%.

## Items

### Progression

| Item | Copies in pool (option) | Effect |
|---|---|---|
| Table 1-10 Unlocked | one each, minus your starting tables | Lets you sit at that table |
| Extra Discard Pile | 0-2 (default 2) | +1 discard pile. You start with 2; max 4. |
| Hand Size Upgrade | 0-2 (default 2) | +1 hand size. You start with 5; max 7. |
| Bo Card | 0-4 (default 3) | One wild dealt into your hand at the start of every game, on top of your hand size |
| Stockpile Shrink | 0-3 (default 3) | Your stockpile has 2 fewer cards, down to a minimum of 5. Opponents are unaffected. |
| AP Point | as many as the store needs | Spent in the store |

If the power-item options are set too low for logic to be beatable, generation raises them
automatically: to at least 8 power in total with `checks_per_table: 3`, otherwise at least 6.

### Filler (single-use, kept until you use them)

- **Mulligan:** redraw your opening hand, before your first move. Any wilds you hold are kept.
- **Spare Wild:** add a wild to your hand at any point on your turn.

### Traps

`trap_chance` (default 10%) is the chance of a trap replacing a filler item. Each trap hits
only your next game, then it is used up.

- **Stacked Stockpile:** +3 cards on your stockpile.
- **Locked Discard:** one of your discard piles is closed. It won't fire if you only have one pile.
- **Rival Wild:** every opponent starts with an extra wild.

## Locations

### Per table

Ten tables. `checks_per_table` sets how many of these each table has, in this order:

1. **Table N - Pile Completed:** play a 12 that finishes a build pile at that table. This
   counts mid-game, even if you lose.
2. **Table N - Won:** win at that table.
3. **Table N - Dominant:** win while every opponent still holds at least half their stockpile.

### Milestones

Twenty checks, counted across all tables, with no requirements:

- **Games Won:** 1, 2, 3, 5, 8, 12, 16, 20
- **Stockpile Cards Played:** 10, 25, 50, 100, 150, 200
- **Build Piles Completed:** 1, 3, 6, 10, 15, 25

### Store

Store Slot 1-8 (`store_slots`, 0-8, default 4), bought with AP Points.

- **Prices:** 1, 1, 1, 1, 2, 2, 3, 3.
- **When a slot opens:** once you have *received* as many points as the cheapest slots up to
  that one would cost (for example, Slot 5 opens at 6 points received). This means you can
  buy slots in any order.
- **Points in the pool:** the slots' total price plus 2 spare.

### Counts

The default settings give 44 locations (20 table checks, 20 milestones, 4 store slots). The
range is 30 (`checks_per_table: 1`, no store) to 58 (3 checks per table, 8 store slots).

Checks are sent the moment you earn them, including mid-game for piles and stockpile
milestones, not only when a game ends.

## Goals (`goal`)

- **table_ten** (default): win at Table 10.
- **all_tables:** win at all ten tables.
- **games_won:** win `games_to_win` games (3-20, default 10) at any tables.

## Options

| Option | Range | Default |
|---|---|---|
| goal | table_ten / all_tables / games_won | table_ten |
| games_to_win | 3-20 | 10 |
| starting_tables | 1-3 | 2 |
| checks_per_table | 1-3 | 2 |
| store_slots | 0-8 | 4 |
| discard_pile_items | 0-2 | 2 |
| hand_size_items | 0-2 | 2 |
| bo_card_items | 0-4 | 3 |
| stock_shrink_items | 0-3 | 3 |
| trap_chance | 0-100 | 10 |
| death_link | on/off | off |

Presets:

- **quick:** games_won goal with 5 wins, 1 check per table, 3 starting tables, 2 store slots, no traps.
- **marathon:** all tables, 3 checks per table, 1 starting table, 8 store slots, 30% traps.

## DeathLink

A death is a lost game. When someone else dies, your current game is forfeited; if you are
between games, nothing happens. When you lose a game, everyone linked dies. A game you lost
because of an incoming death does not send one back.

## Client features

Both the desktop client and the web client have these.

### Playing

- **Tap to play:** tap a card and the piles it fits light up; tap a pile to play there.
  Tapping the selected card again sends it to the first pile it fits.
- **Discard to end your turn:** select a hand card, then tap one of your discard piles.
- **Hint:** the suggested move is highlighted.
- **Undo:** works within your turn, but not past newly drawn cards or a discard.
- **Auto turn / Auto game:** the computer plays your turn, or the rest of the game.
- **Auto-stock:** plays a stockpile number card automatically whenever it fits. Wilds on your
  stockpile still wait for you.

### Screen and saves

- Each table button shows P / W / D marks for the checks you have done there.
- The log shows every opponent move. The web client's log also shows items sent and received in the room.
- Your stats are saved on the Archipelago server, so they carry over between sessions and
  between the desktop and web clients.

### Keyboard

1-9 select hand cards, S the stockpile, H hint, U or Ctrl+Z undo, A auto turn, Esc deselect.

---

AP Bo uses the rules of the card game Skip-Bo, a trademark of Mattel. This is an unofficial fan project, not affiliated with or endorsed by Mattel.
