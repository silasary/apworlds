# SM64: Spicy Mycena 64

SM64: Spicy Mycena 64 is a fork of the SM64EX Archipelago world with a different progression model. It is built around
unlocking level objects and castle features directly instead of collecting Archipelago Power Star items.

This page focuses on how it differs from the regular SM64EX APWorld.

## No Power Star Item Pool

Power Stars are still location checks. Collecting a star sends that location's item, just like other Archipelago
checks.

The difference is that this fork does not generate Power Star items as progression. Castle doors, MIPS, and other
progression gates are handled by dedicated items instead of AP star count.

The old 1-star and 3-star castle doors no longer require any stars. They are open from the start, matching this fork's
more open first-floor progression.

## Castle Progression

Spicy Mycena 64 replaces the old star-count castle doors with key-style progression:

- `Castle - Progressive MIPS`, `Unlock Tower of the Wing Cap`, `Unlock Big Boo's Haunt`, `Castle - Toads`,
`Castle - Cannon Unlock`, and `Castle - Yoshi` for
specific castle features.
- `Dark World Key` unlocks the old 8-star door.
- `Progressive Basement Key` unlocks the basement key door, and then the old 30-star door.
- `Progressive Upstairs Key` unlocks the second floor key door, then the old 50-star door, and then disables the
infinite stairs.
- `Progressive Key` in combined progressive key mode will provide the Dark World Key, then the two Progressive Basement
Keys, then the three Progressive Upstairs Keys.

Yoshi is also a location check in this fork. The `Castle - Yoshi` item enables the Yoshi encounter, and logic also
expects access to the castle roof cannon through `Castle - Cannon Unlock`.

## Level Feature Items

The regular SM64EX world mostly assumes vanilla level objects are present according to the selected star or act. This
fork removes that assumption. Many objects that used to depend on star-select state are now controlled by Archipelago
items.

Examples include:

- Bosses and races such as King Bob-omb, Koopa the Quick, Whomp King, Big Penguin, Klepto, and Ukiki.
- Bob-omb Buddies and cannon unlock flow.
- Jolly Roger Bay ship, Unagi, jet stream, and Dire, Dire Docks submarine or poles.
- Big Boo's Haunt staircase and merry-go-round.
- Arbitrary level elements such as Rainbow Ride carpets, Tiny-Huge Island warp pipes, Checkerboard Platforms, Purple
  Switches, Hazy Maze Cave's swimming beast, Shifting Sand Land's pyramid elevator, and Lethal Lava Land's rolling log.

These items are progression when logic can require the corresponding object.

## Cap Items

The fork supports two cap item modes:

- Global cap mode uses the normal `Wing Cap`, `Metal Cap`, and `Vanish Cap` items.
- Per-level cap mode replaces those with separate cap items for each relevant level, such as `Lethal Lava Land - Wing
  Cap` or `Vanish Cap Under the Moat - Vanish Cap`.

Logic resolves cap requirements according to the selected mode.

## Entrance Shuffle Differences

Wet-Dry World and Tick Tock Clock are split into multiple entrance variants for shuffle.

Wet-Dry World has three variants:

- Low water entry.
- Middle water entry.
- High water entry.

These are shuffled independently. A different destination can be assigned to each WDW painting height, and other castle
entrances can also lead to a specific WDW water-height variant. For example, one entrance might lead to WDW with low
water, while another leads to WDW with high water.

Tick Tock Clock has four variants:

- Stopped time.
- Slow time.
- Random time.
- Fast time.

These are also shuffled independently. Each clock-hand timing at the real TTC entrance is its own shuffled entrance, and
other castle entrances can lead directly to a specific TTC speed variant.

Unlike regular SM64EX, the visible Tick Tock Clock hands stay on the real TTC entrance. This means the real TTC entrance
still decides which TTC source variant you use based on the clock hands, even if those source variants lead to different
shuffled destinations.

## Goal

The goal is still to reach and clear the final Bowser stage according to the selected completion option.

## Cosmetic Options

Spicy Mycena 64 adds a Mario color palette option. The palette can recolor Mario's shirt, overalls, gloves, shoes,
skin, and hair with custom RGB values. This is cosmetic only and does not add item or location checks.
