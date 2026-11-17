# Spec: in-game description status lines

Feature slug: `description-status`. Vocabulary is `CONTEXT.md` (**checked**, **unlocked**,
**researched**, **active**). Colouring an unchecked location by its item's classification is
ADR-0006; read it before changing that behaviour.

## Problem Statement

Playing a seed, there is no way to tell from inside the game what Archipelago thinks of anything on
screen. Hovering a technology says what it does in vanilla terms and nothing about whether
researching it still checks a location, whether its item has arrived, or whether its effect is
doing anything. The same is true of every unit and building.

This bites hardest on a repeat play or a later scenario, where a technology the player checked
hours ago looks identical to one they have never touched, and a technology they hold the item for
looks identical to one they do not. The player ends up guessing, or alt-tabbing to the tracker, or
researching things for no benefit because Must Research behaviour is silently waiting on something.
Villager professions are worse again: there are twenty-four of them, they are checked by accident
as often as on purpose, and nothing in the game names them at all.

## Solution

Every unit, technology and building that this seed made into a location carries a short status line
at the top of its in-game description, above the vanilla text, which stays intact.

The line reads the location's state first and the effect's state second. An unchecked location is
coloured by the classification of the item waiting there — progression purple, useful blue, filler
cyan — so the player can see which of their locations are worth reaching without spending a hint.
The item is never named, and a trap wears one of those same three colours so it cannot be told from
a genuine item of that class.

Villager professions appear as a row of twelve icons on the Villager's own description, each in
colour once that job is checked and greyscale until then, so the player can see at a glance which
professions are left.

## User Stories

1. As a player, I want to see whether a technology's location is already checked, so that I do not
   waste resources researching something that gives me nothing new.
2. As a player, I want to see whether the item for a technology has arrived, so that I know whether
   researching it will actually do anything.
3. As a player, I want to see whether a technology's effect is currently applied, so that I can tell
   a working upgrade from an inert one.
4. As a player on a repeat scenario, I want a technology I checked in an earlier scenario to still
   read as checked, so that my progress is visible wherever I am in the campaign.
5. As a player under Must Research behaviour, I want to be told that a held item is waiting on me to
   research it, so that I know the next action is mine rather than the server's.
6. As a player under Instant behaviour, I want to see that an effect is already live before I have
   checked the location, so that I understand why my units got stronger.
7. As a player, I want a technology with no effect to read as active, so that I do not hunt for a
   missing item that does not exist.
8. As a player, I want to see whether a building's location is checked, so that I know whether
   putting another one up is worth the wood.
9. As a player, I want to see whether a unit's location is checked, so that I know whether training
   one still progresses the seed.
10. As a player, I want to see whether an age advance is still an unchecked location, so that I know
    whether reaching the next age pays me anything.
11. As a player, I want the colour of an unchecked location to tell me the class of item waiting
    there, so that I can prioritise routes without spending hints.
12. As a player, I want traps disguised among the ordinary classification colours, so that the
    feature does not hand me a trap-avoidance tool.
13. As a player, I want a trap's disguise colour to be identical every time I look at it, so that a
    flicker between sessions does not give it away.
14. As a player, I want the status line never to name the item at a location, so that the hint
    system still has a job.
15. As a player, I want vanilla description text left intact beneath the status line, so that I can
    still read what the thing actually does.
16. As a player, I want objects this seed did not make into locations to carry no status line at
    all, so that a bare tooltip tells me Archipelago does not care about it.
17. As a player with Buildsanity partially enabled, I want buildings outside the shuffled categories
    to carry no status line, so that the decoration matches the seed rather than the game's internal
    registration.
18. As a player, I want the twelve villager professions shown as icons on the Villager, so that I
    can see what is left without memorising a list of job names.
19. As a player, I want a profession icon in colour once checked and greyscale until then, so that
    the row reads at a glance.
20. As a player, I want a profession to count as checked only when both the male and female
    locations are checked, so that the row does not claim a job is finished when half of it is not.
21. As a player, I want the profession row to show only the jobs this seed uses, so that a job the
    seed never generated is not shown as permanently outstanding.
22. As a player who advances an age, I want the status lines to still be there afterwards, so that
    the feature does not quietly stop working mid-game.
23. As a player who saves and reloads, I want the status lines to still be there, so that I can
    trust what I am reading.
24. As a player who reconnects mid-session, I want the status lines to be correct once the client
    has caught up, so that a disconnect does not leave me misinformed.
25. As a player, I want the status line to show no colour rather than a wrong colour in the moment
    before the client has scouted, so that I am never shown something false.
26. As a player who has not installed the UI mod, I want the feature to still work with its icons
    simply absent, so that the mod stays optional.
27. As a player, I want the mercenary seat buttons left alone, so that the names and pictures the
    queue puts there are not fought over.
28. As a maintainer, I want the game to learn the checked set when a scenario starts, so that the
    status lines are right from the first frame rather than after the first new check.
29. As a maintainer, I want classification fetched by scouting rather than baked into an installed
    file, so that the installed campaign does not become a plaintext spoiler.
30. As a maintainer, I want the string ids needed to read vanilla text baked at generation, so that
    the game is not relying on a runtime value that disagrees with the data.
31. As a maintainer, I want the description writer driven by the events that already know what
    changed, so that no sweep runs on a timer.
32. As a maintainer, I want the feature to add no new per-tick work, so that a long scenario does
    not degrade.

## Implementation Decisions

**Three seams, agreed with the maintainer.** The game context, the location handler, and the
install row generators. Nothing else gains a test boundary.

**The scout reply is the single oracle.** The client scouts its own locations at connect without
creating hints, and the reply decides both *which objects are decorated* and *what colour each
unchecked one takes*. A location absent from the reply gets no status line regardless of what the
game registered locally. This is what reconciles Buildsanity, where the game registers all
thirty-five buildings in every seed while the world creates locations only for shuffled categories.

**Classification travels on its own channel.** It writes a classification file beside the existing
startup files, following the shape the building, technology and unit handlers already use: a user
folder is set, a sync method is handed what it needs, and it writes a flat file of ints. The
channel is a second method on `LocationHandler` (09), which owns everything the client sends the
game about locations. It shares that class with the checked-locations writer but neither its file
nor its cadence: a scout-once table does not belong in a writer that runs every tick, and that
file's layout is already pinned by tests.

**The trap disguise colour is derived, never rolled.** It is a pure function of the seed and the
location id, yielding one of the three non-trap colours. Any implementation that reaches for a
random source at display time is a review finding.

**The game acks the checked-set read, and the client asks until it does.** Today the game only
ingests the checked-locations file when the ping says the game just sent locations, so a scenario
entered with no new checks never reads it and reports everything unchecked. Arming that read once
at connect is not enough: `MarkServerLocations` ends in `xsDisableSelf` and every scenario starts a
fresh XS context, so the read has to be asked for once per scenario; and `ConnectAP` does not
enable `ReadAP` until it has approved the first ping, so the flag in that ping goes into a file
nothing is reading yet. The game therefore reports the size of its last read back in the packet as
`CheckedLocationsCount`, taken from the reserved block, and the client holds the flag set while that
disagrees with the set it is writing. Connecting still arms it, so a reconnect asks again. Once the
two agree the asking stops, so the steady state adds no per-tick work. This is a correctness fix
the feature depends on, not a cosmetic change, and it is observable on its own.

**The install row generators carry the dat string id.** Reading vanilla description text in game
requires the extended tooltip id, which is the dat's name string id plus a fixed offset. The runtime
object attribute that looks like that id is not it — for the Villager it reports a different number
whose derived tooltip does not exist, and for Gaia objects it reports nothing. So the ids are baked
at generation and emitted per row, and the game never computes them.

**The writer runs at scenario init and on change, plus once per age advance.** The four sites that
already know which id changed drive the single-object rewrites. Age advance additionally clears
written descriptions in the running game, so the age module triggers a full re-apply. Save and load
do not clear them, so resume needs no hook. A full sweep is roughly four hundred objects against a
linear location lookup, so it belongs at init and on age advance only.

**Status line shape.** One line, prepended, with a newline after it and no marker. Two segments
joined by a dash, each independently coloured and each terminated, because a colour tag otherwise
bleeds into everything after it.

| checked | unlocked | active | first segment | second segment |
|---|---|---|---|---|
| ✖ | ✖ | ✖ | Unchecked, classification colour | Awaiting Item, red |
| ✖ | ✔ | ✖ | Unchecked, classification colour | Must Research, yellow |
| ✖ | ✔ | ✔ | Unchecked, classification colour | Active, green |
| ✔ | ✖ | ✖ | Checked, green | Awaiting Item, red |
| ✔ | ✔ | ✖ | Checked, green | Must Research, yellow |
| ✔ | ✔ | ✔ | Checked, green | Active, green |

Units, buildings and ages carry the first segment only. A technology with no effect reports Active,
because there is nothing to wait for. The first segment is preceded by a checked or unchecked mark,
currently the engine's own checkbox materials, standing in for an Age-styled Archipelago mark.

**Professions hang off the Villager.** Job variants are not trainable and have no description of
their own, so the row of twelve goes on the Villager's description. Each job shows a vanilla
material when checked and a mod-supplied greyscale material when not; the greyscale set ships in the
Ageipelago UI mod. A missing material renders as nothing, which is what keeps the mod optional.

**Ages keep the first segment only.** Their unlock state is driven by different machinery and their
effect state is something the resource bar already shouts.

## Testing Decisions

A good test here asserts on what leaves the module: the bytes of a written file, the rows handed to
the installer, the packet a context produced. None of them reach inside to check that a particular
helper was called, and none of them assert on text the game renders, because nothing in the test
suite can see a tooltip.

**The location handler (09).** Tested exactly as the unit handler is: construct it, point it at a
temporary folder, hand it what the channel under test takes, read the file back as little-endian
ints. For classification, cover a location of each class, a trap, an empty set, locations the
handler should ignore, and that the same seed and location id produce the same trap colour across
repeated calls and fresh handler instances. For the checked set, cover the writer and the
`CheckedLocationsCount` ack that 01 established. Prior art: `test_unit_handler.py`, `test_mercenary_handler.py`, `test_storage_handler.py`,
with `test_xsdat.py` for the file encoding.

**The install row generators.** Tested as the technology and unit catalogues are: build the table
and assert on the rows. Cover that every decorated row carries a string id, that the ids agree with
the generation-time source rather than being invented, and that a row the seed does not install
carries none. Prior art: `test_tech_data.py`, `test_unit_data.py`.

**The game context.** Tested by constructing the context directly, as the loop test does. Cover that
connecting requests a scout for the world's own locations without creating hints, that the
checked-set read is armed once on connect rather than only after the game sends locations, and that
a tick which raises still leaves the loop running. Prior art: `test_game_loop.py`,
`test_ping_packet.py`, `test_mercenary_ack.py`.

**The trap derivation gets no test file of its own.** It is exercised through the location
handler's classification channel (09), which is the seam that has a contract.

**The game half has no tests.** Tests in this repo must not read the Ageipelago checkout, so the XS
side is covered by the linter and by reading it. Run the linter from the xs folder against the entry
point, not against a library file alone.

Run what the pre-commit hook runs for the files touched, plus any test file the change touches. The
full world suite is the maintainer's to run.

## Out of Scope

- **Mercenary seat buttons.** Their names and icons are already rewritten whenever the queue
  changes; they are item deliveries rather than locations and there is no checked state to report.
- **The resource hover panel.** The "right-click to gather" hints are a table compiled into the
  executable and keyed by interaction type, referenced from nowhere in the shipped data. A modded
  strings file can replace one globally, but it cannot carry state and there is no runtime string
  setter. Gaia objects additionally reject description writes outright.
- **An Age-styled Archipelago checked mark.** The engine's checkbox materials stand in until the art
  exists. Swapping them is a material name change, not a design change.
- **Making the UI mod mandatory.** A missing material renders as nothing, so the mod stays optional
  and the feature degrades to text.
- **Changing what the hint system does.** This feature exposes classification deliberately; it does
  not alter hints, hint costs, or hint display.
- **Per-sex profession display.** A job is one icon covering both its locations.

## Further Notes

The engine behaviour below was measured across nine in-game spike runs rather than taken from
documentation, and several points contradict what the modding knowledge base implies. They are
recorded because they were expensive to establish and are not discoverable from the code.

- Two setters write description text, one for technologies and one for object types, and their
  argument orders are inconsistent with each other. The object setter returns true even when nothing
  is displayed, so its return value proves nothing.
- Gaia object types reject description writes and report no name id.
- A colour tag applies until an explicit default tag; leaving one open tints the vanilla text that
  follows. Colour tag names are case-insensitive.
- Icons are inlined by material name. They render from precached atlases, from an atlas marked as
  not cached, and from standalone textures. A material that does not exist renders as nothing,
  silently.
- Icons cannot be tinted. A colour tag before a material has no effect on either blend mode in use,
  so a second visual state needs a second texture, which is why the greyscale set exists.
- Atlas textures must be uncompressed. PNG works and uncompressed 32bpp DDS works; DXT1 and DXT5
  render corrupt, including a file whose format matched its vanilla counterpart exactly.
- Descriptions are cleared when an age advances and survive a save and reload.
- The extended tooltip string id is the dat name string id plus a fixed offset. This was derived
  from the data, not documented, and held for the large majority of checked objects with the
  remainder differing only cosmetically.
