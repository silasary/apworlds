# Tetris (Gameboy)

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a
config file.

## What items and locations get shuffled?

Location checks are all based on reaching specific score thresholds, based on your goal and location count yaml
options.

The primary progression item is Score Multiplier. These provide the score multiplication that, in a vanilla Tetris game,
would be based on your current level. Score Multiplier count is shown in-game in the "MULTI" box

Depending on your yaml options, there may be Speed Decrease and/or Speed Increase items, which permanently increase
or decrease the speed. Lower speed values mean a faster drop speed, as it is the number of frames between your piece
falling one line. The speed level is shown in-game in the "SPEED" box.

Additional items based on yaml options:

- Clear Random Line: chooses a random line to be treated as though it were filled, so that the next time you connect a
piece, that line will clear. Clear Random Line items will not trigger until all queued Garbage Lines have triggered.
- Garbage Line: A line of 9 blocks and one randomly placed hole rises from the bottom.
- Shuffle Garbage Line Hole: Reshuffles the location of the empty spot on future Garbage Lines.
- Random Inputs: For 1 Frame, 1 Second, 2 Seconds, or 3 Seconds, the game will ignore your inputs and generate random
inputs every frame for the specified amount of time.
- Active Piece Locks Instantly: Your active piece will instantly lock in place as though it had connected to pieces
below. Better hope your piece isn't up at the top of the game area when you get this one!
- Active Piece Gets Stuck in the Left/Right Wall: Your active piece is warped into the left or right wall and instantly
lock in place. Some tiles may end up hanging out into the game area.
- Active Piece is an Illusion: The next piece you connect is illusory. It will appear to connect but your future pieces
will pass right through it, and it will disappear next time you clear a line or a garbage line triggers. These will be
more troublesome if you are paying less attention to your incoming items!
- Show Next Piece, Hide Next Piece, Toggle Next Piece: Permanently show, hide, or toggle the Next Piece display.

## When the player receives an item, what happens?

The only things shown in-game are current Score Multiplier and current Speed. Otherwise, there is no in-game indication
that an item has been received. You will need to watch the client or web tracker to be sure you're aware of the items
you're receiving.

## Special Thanks to:

- [alexsteb](https://github.com/alexsteb) for his Tetris disassembly. While very incomplete, it
had enough comments and memory values mapped out to make my work significantly easier.