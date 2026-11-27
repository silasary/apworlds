# TOEM: A Photo Adventure

"Set off on a delightful expedition and use your photographic eye to uncover the mysteries of the magical TOEM in this hand-drawn adventure game. Chat with quirky characters, solve their problems by snapping neat photos, and make your way through a relaxing landscape!"

## Quick links

- [Setup](https://github.com/bbernardoni/Archipelago/blob/toem/worlds/toem/docs/setup_en.md)
- [Releases page](https://github.com/bbernardoni/Archipelago.TOEM/releases/latest)
- [Poptracker README](https://github.com/culk/toem-poptracker-pack/blob/main/README.md)
- [Poptracker latest release](https://github.com/culk/toem-poptracker-pack/releases/latest)

## What does randomization do to this game?

Stamps and compendium photos are always randomized. Items, cassettes, and achievements can also be randomized via options (only items are randomized in the default yaml). Achievements are only location checks and add filler compendium photo items to the item pool to compensate.

Basic items such as the camera, backpack, cassette player, and community card are not randomized.

By default stamps are progressive where any stamp item will give you a stamp for the earliest region that still needs stamps for the bus ticket. Turning this off will make each stamp item specific to a region. The number of stamps required to move on is customizable for each region. Additionally, the honk attachment can be added to `early_items` which forces it to be in some player's sphere one. The Basto gate can be forced open to allow exploring Basto with only docks access and the Viking express ticket instead of also requiring the water popper attachment. These options can be tweaked to help avoid the player being BK'ed when in a multiworld with games that have a lot of checks.

There also is an option to randomize entrances within each region.

## What is the goal?

The default goal is to Experience TOEM and beat the base game. If the free Basto DLC is included via an option the goal is changed to the Basto bonfire event.

## How do I get ...

#### Award Mask

The award mask is an easter egg item available on a dresser in the player's room where you start the game. To obtain it, use the honk attachment on it several times.

#### Royal Crown

The royal crown is another easter egg item available in the castle in Basto. Behind the back right pillar is a photo frame. Place a picture of the Tato King from the secret cave in the frame. The back left pillar will slide to reveal a dig spot. Use your pickaxe to reveal the royal crown.

#### Cassettes

Some of the cassettes have non obvious unlock conditions. See this spreadsheet for how to get each cassette: https://docs.google.com/spreadsheets/d/1-RYTs-YwsuBCH8Exyu0xYj01RmYb77aYgL2zsQODs5w/edit?usp=drivesdk

### Hard logic

The following are things that show in UT's "glitched logic". They are not expected to progress in the randomizer but indicate it is possible to do out of logic. A lot of them are only relevant when entrances are randomized as that can make the intended way to complete a location impossible without a randomized item.

#### Photo / water popper snipes

Many of the hard logic locations are accomplished through finding a non-obvious angle to take a photo or shoot the water popper from a different part of the room than intended. Usually this is because some item or unreachable entrance is needed to access the intended place to take the photo. Those include:

- Sero compendium - Sero can be photographed from the skeleton house balcony
- Tato fly compendium - Tato fly can be photographed from the ground behind the skeleton house
- Fia / Fräs compendium - The cats from the docks can both be photographed from both sides of the dock
- Balloon animal (for photo quest) - The balloon animal can be photographed from the top area without climbing boots
- Hedgehog compendium - The hedgehog can be photographed from the top area without the climbing boots
- Asteroid quest - The asteroid can be photographed from the top area without climbing boots
- Meteopal compendium - The meteopal can be photographed from the top area without the climbing boots
- Snowball quest - The snowball can be photographed from the ground without the climbing boots
- Fluff ball compendium - The fluff ball can be photographed from the top area without the climbing boots
- Owl compendium - The owl can be photographed from the middle area without the climbing boots
- Dry season quest (bus stop plant) - The bus stop plant can be watered from the top of the basto gate. Not relevant until full game entrance randomizer since the bus stop is always arrived at from the bottom
- Water strider compendium (lily pad area) - The water strider can be photographed from the right area
- Bad hair day quest - The mermaid can be hit with the water popper attachment from the bottom area
- Bat quest / compendium (bonfire area bat) - The bat in the bonfire area can be photographed / hit with the water popper attachment from the bottom area
- Drill mole compendium - The drill mole can be photographed from the bottom area
- Night lizard compendium - The night lizard can be photographed from the bottom area

#### Missable locations

Several locations are intentionally out of logic because they are missable. Usually, they are possible by taking a photo before an animal disappears. These include:

- Seagull compendium (non obvious locations) - The seagulls outside the hydroplant attacking the raft operator can be photographed before honking at them. The seagulls guarding the sandwich can be photographed before honking at them. Not relevant until full game entrance randomizer since the seagulls are available from the bus stop.
- Mouse compendium - The mice in the cafe can be photographed before honking at them
- Goat compendium - The goat can be photographed before it goes to the frozen pond if the frozen pond is inaccessible

#### The monsters quest without the tripod and honk attachment

Most of shots can be done without the tripod by just barely peaking your head out. The Kiiruberg monster is a bit special. The only way I've found is to wedge yourself in the block at the top left of the screen. The collision is weird there and once inside the block it breaks line of sight and the monster will appear. See here for a video demo: https://youtu.be/uAQE5K1xZ2c

#### The broken dreams quest without day access

If you can only access the lily pad area during the night, it is possible to wake up the monkey with either the honk or water popper attachment.