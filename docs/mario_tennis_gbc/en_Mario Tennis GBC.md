# Mario Tennis GBC

## What does randomization do to this game?

Progress through the story is driven by items instead of wins:

- **Progressive Singles Pass / Doubles Pass:** each copy opens the next class of that arc: Senior, Varsity, the
  Island Open, then Peach's Castle. Junior is open from the start.
- **Drills:** progressive items open levels 2 and up of each Training Court drill. Level 1 is always open, and the
  levels are still played in order: each opens once the one before it is cleared.
- **Mini-games:** each Mario mini-game is an item (progressive: its copies open the cell and levels 2 and 3).
- **Equipment:** the six special rackets and two pairs of shoes.
- **Shots** (`shot_items`, off by default): Progressive Topspin, Slice and Flat Shot (the second copy adds the power
  shot, or for the flat shot the smash), Lob, Drop Shot, and Progressive Topspin, Slice and Flat Serve (the second
  copy adds the nice serve). You start with one random stroke and one random serve. A shot you don't have plays the
  first stroke or serve you do have, in topspin, slice, flat order. Only your own swings are affected. Logic expects
  more shots for each story class (3 for Senior, 5 Varsity, 8 Island Open, 11 Dream Match, the starting two included).
- **EXP Bundles** fill the rest.

## What is a location?

Every ranking-match and practice-match win, Island Open round and Dream Match; every drill clear; the swing contest's
two scores; and every mini-game level clear. Each class's practice match stays on offer, from the same player as in
the game, until you have won it.

## What is the goal?

Winning the Island Open final, winning the Dream Match, or checking every location, in each story arc you play.

## Received items

Passes, drills, mini-games and shots count as soon as they arrive, in story mode or not: a mini-game received from
the main menu opens on its grid right away (re-enter the grid if it is already on screen). Equipment is applied the
next time you are walking around in a story file. That is also when the short item messages show, unless
`item_messages` is off. Items found in your own world are given at once, offline too.

EXP Bundles are saved up on the story file. Open Char/Partner Data from the pause menu to receive them and level up
straight away; any still saved up are awarded the next time you continue that file.

## DeathLink

DeathLink has separate settings for what you send and what you receive, each `off`, `point`, `game` or `match`.

- **Sending:** a death goes out when you lose at least that much in a story or exhibition match, or Two-on-One: a
  point, a game, or the match. Losing a match point is still only one death. A failed mini-game or drill counts as a
  lost match, and a failed drill point as a lost point. Quitting doesn't count, and neither does a high-score run.
- **Receiving:** in a match, a death from another player costs you the current point, game or match. For a game or
  the match, the score jumps so that one point decides it; a game lost in a tiebreak also loses the set. Any death
  ends a mini-game or drill at once as failed; a high-score run already past its record ends as a high score. Outside
  a match, mini-game or drill, deaths are ignored, and they are never sent back out. If two carts play the same slot,
  each one's deaths reach the other.

The settings in your options are where you start. Change them while playing with the client commands
`/deathlink_send <off|point|game|match>` and `/deathlink_receive <off|point|game|match>`; with no argument they show
the current setting. Changes are kept on the server for your slot.
