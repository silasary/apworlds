# TFT Archipelago

## What is this game?

Teamfight Tactics (TFT) is Riot Games' online auto battler. TFT cannot be modded, so TFT Archipelago is played
with a companion app for Windows. The app is your Archipelago client: it tracks your matches, shows what you
have unlocked, and enforces a set of restrictions that your Archipelago items lift over time.

TFT Archipelago is a community project. It is not affiliated with or endorsed by Riot Games.

## What does randomization do to this game?

You start a run with almost nothing unlocked:

- no shop rerolls, no XP buys and no augment rerolls;
- only the middle augment of each augment choice;
- shop slots 4 and 5 are locked, so you can only buy from the first three.

Items from the multiworld lift these restrictions step by step. Your checks are goals you reach in normal
TFT matches, for example "Reach Top 4 with 7 Blossom active".

## What items can I receive?

| Item | Effect |
|------|--------|
| Progressive Reroll | +1 shop reroll per round (unlimited after 10) |
| Progressive XP Buy | +1 XP buy per round (unlimited after 10) |
| Progressive Augment Reroll | +1 augment reroll per match (unlimited after 9) |
| Augment Slot Left / Augment Slot Right | You may pick that augment |
| Shop Slot 4 Unlock / Shop Slot 5 Unlock | You may buy from that shop slot |
| Progressive Major Check Unlock | Opens one more major check |

Leftover locations hold one-time items (Bonus Reroll, Bonus XP Buy, Bonus Augment Reroll, Free Augment Pick,
Shop Slot Pass), which each allow one action beyond your current limit. If the player options enable traps,
some locations hold traps instead, which add a short extra restriction such as no shop rerolls for a round.

## What are the locations?

There are 172 checks, generated from the current TFT set:

- **Major checks** (33): a trait at a high breakpoint or a 5-cost champion on your final board, for example
  "Reach Top 4 with Alune on your board". They need a Top 4 finish (a victory in Tocker's Trials). Only a few
  majors are open at the start; each Progressive Major Check Unlock opens one more.
- **Minor checks** (139): "Field a 2-Star X" and "Field a 3-Star X" for every champion, plus checks such as
  "Have 5 Traits active", "Reach 80 gold", "Reach level 8", "Eliminate a player" and "Reach Stage 5". They are
  completed during the match and need no Top 4.

3-Star checks for 4- and 5-cost champions never hold an item you need to progress.

Normal, Ranked and Tocker's Trials matches count. Other modes, such as Double Up, complete no checks.

## What is the goal?

Complete the number of major checks set by `goal_checks` in your player options (default 10).

## How are the restrictions enforced?

The app never touches the game, its memory or its input. It reads the TFT window and the game's own files and
places small click blockers over locked buttons such as reroll, XP or a locked shop slot.

Hotkeys still reach the game, so TFT Archipelago also works on trust: if you go over a limit anyway (and have
no matching one-time item), the app shows a rule violation banner and the rest of that match sends no checks.
Your next match starts valid again. The app keeps a screenshot of every violation so a mistaken one can be
reviewed and overridden.

## Which TFT set is supported?

The checks are built from the champions and traits of one TFT set (currently Set 18). When a new set comes out,
a new APWorld version with new checks is released. Seeds generated with an older APWorld cannot be played with
checks from a newer set.

## What does another world's item look like in TFT?

Items for other players are not shown in the game. The app's desktop window lists your checks and the items
you received and sent.
