# A Little to the Left

## Where is the options page?

The [player options page](../player-options) has all the settings you need to
configure and export a config file.

## What does randomization do to this game?

The run is shaped like the base campaign - a scrolling filmstrip of cards -
but it has no chapters, and most of the puzzles in it are **procedurally
generated**. Sixteen of the game's puzzles build a fresh layout from a seed, so
they are new even if you have finished the game. They are mixed with the
seasonal event puzzles from the Archive, and with hand-made campaign puzzles
where those are the only source of a mechanic.

Two things gate your progress:

- **Puzzle Packs** open the next block of puzzles on the track. Every block is
  the same size, the free opening included, and only the last is short - a run
  rarely divides evenly. **Puzzles Per Pack** sets it, five by default.
- **Abilities** unlock the mechanics themselves - swapping, stacking, rotating,
  nesting things in containers, and so on. Objects belonging to a mechanic you
  have not unlocked sit dimmed and cannot be moved.

Because abilities gate individual groups of objects rather than whole puzzles,
a puzzle can be **partly solved**. You tidy the parts you have the verbs for,
leave the rest, and come back when the missing ability arrives.

## What Archipelago items can appear in other players' worlds?

Puzzle Packs, the twelve mechanic abilities (thirteen with Seeing Stars, which
adds Distributing), the Credits, Skips, Hint Pages, Background Change Traps and
Background Reset Tokens. The cat trap is also shuffled out - it knocks your
arrangement over, costing you time but never progress.

**Background Change Trap** recolours every backdrop at once - the puzzle, the
pause screen and the level select track - drawing from the ten background
colours the game itself uses. It is the run's filler, and unlike most filler it
does something you can see the moment it arrives. It is called a trap because
the colour it lands on is chosen by how many you hold rather than by what is on
screen, so a puzzle can end up with pieces that are hard to pick out against
their own background.

A **Background Reset Token** undoes that, when you choose: the pause menu's
**Reset Background** entry spends one and puts every backdrop back to the
game's own colour, until the next Background Change Trap arrives. It never
happens by itself. **Background Change Trap Chance** and **Cat Trap Chance**
each set their trap's share of the filler, 15% by default; whatever filler is
left after the traps and the Hint Pages below is split evenly between more
Hint Pages and Background Reset Tokens.

Every puzzle in the game has a hint, and a default seed holds about 90 pages
across them. **Hint Coverage** decides how many are sure to get an item, and
defaults to 50%; half the leftover filler is Hint Pages too, so a seed usually
holds more. Turn it up if you would rather know every notepad in the run can
be opened.

A **Hint Page** uncovers one page of one puzzle's hint notepad. Most puzzles
have a one-page hint, but some run to five, and each page costs its own item.
At the default 50% coverage the seed is sure of an item for half the pages it
contains, and the leftover filler usually adds more - turn **Hint Coverage** up
to 100 if you want every hint in the run to be openable. Without the item the notepad still
opens; you just cannot erase the scribble covering the page.

## What is considered a location check?

Three kinds, and a fourth if you ask for it:

- **Solutions.** Many puzzles have more than one valid arrangement. Each
  distinct solution you find is its own check, named for its ending
  ("Spoons - Solution: Stacked"), and always the same check whichever order
  you find them in - generated puzzles too.
- **Parts.** On a puzzle made of several independent groups of objects, each
  group is its own check, collected as soon as that group is tidy - except a
  group that is an ending on its own (stacking the spoons), which is that
  ending's check. Medicine Cabinet's groups go by colour; Mirror's big items
  are a check and its little things are part of the Solution.
- **The credits.**
- **Achievements**, with the **Achievements** option on (off by default).
  The game's puzzle achievements - Exacting Eggs on Eggs, Draw Me A Rainbow
  on Junk Drawer, seven in the base game and seventeen with both DLCs - are
  checks when their puzzle is in the run, earned the way the game awards
  them. They are checks like any other: they can hold anything your run
  needs, a puzzle's star waits for them, and a Skip sends them. Steam
  achievements stay off either way.

A puzzle you clear with a Skip DOES count toward the goal, and a Skip
fills in every check on that puzzle, its achievements included - so a
skipped puzzle is beaten and all its stars light. The shortcut is bounded
by how many Skips the seed contains rather than forbidden.

Hint pages are not checks - they are things you spend items on, not places
items are found.

## When the player receives an item, what happens?

Packs reveal more cards on the level select. An ability takes effect
immediately: objects that were dimmed become movable, including on a puzzle you
already have open. Filler and traps apply the next time they can.

Hint Pages go into a pool you spend by erasing. The pause menu shows how many
you are holding beside the Hint entry.

Opening a notepad is always free, so you can check whether a hint exists and
how long it is before deciding to spend. The page itself tells you where you
stand - that rubbing it out will cost a Hint Page and how many you hold, or
that you have none, or that you already paid for this one and may read it
again for nothing. You are only charged once you actually erase the scribble,
and a page you have paid for stays free for the rest of the run.

A Background Change Trap repaints straight away, and the colour you end up
with depends only on how many you have been sent since your last Background
Reset Token - so it survives a reconnect rather than jumping to a new one every
time you log in. Tokens wait in the pause menu, beside **Reset Background**,
until you spend them.

## What is the victory condition?

Finish enough puzzles AND find the Credits item, then play the credits card.
Both are required: the item is shuffled into the multiworld like any other, so
it can turn up early or late, and meeting the count without it leaves the card
locked - as does holding it before the count is met.

Playing the card is what ends the run. Reaching the count does not finish it
on your behalf; you go to the card and watch the ending.

What "enough" means depends on the `goal` option:

- **Beat Levels** (the default) counts a puzzle once you have finished it any
  one way, and wants `levels_to_beat` of them (50 by default).
- **Collect Stars** counts stars - one for every solution found, the stars
  the level select counts in each pack's header - and wants
  `stars_to_collect` of them (65 by default). A puzzle with three solutions
  holds three stars. A default run of 70 puzzles holds about 91, so 65 is
  what beating 50 of them is worth.

A puzzle has more stars than it has finishes, which is why the two goals
have separate counts rather than sharing one number.
