# Elden Ring Nightreign

Elden Ring Nightreign is a co-op roguelike action game from FromSoftware.
Location checks are &quot;defeat Nightlord X&quot; (or, with bosses_with_characters set
to boss_and_character, &quot;defeat Nightlord X as character Y&quot;), detected via
read-only game memory polling. With the gate_boss_access option enabled,
every Nightlord other than the chosen starting_boss is gated behind
receiving that Nightlord&#x27;s Access item - written into the running game
process where the game supports it (all but Tricephalos, which has no
gating flag and is tracked overlay-side only); otherwise received items
are flavorful and have no in-game effect. The gate_character_access option works the same way
for playable characters instead of Nightlords - every character other than the chosen
starting_character is gated behind receiving that character&#x27;s Character Access item, and with
bosses_with_characters set to boss_and_character, a win as a not-yet-unlocked character also
doesn&#x27;t send its check. Each Everdark Sovereign is its own separate entry in
included_nightlords (e.g. &quot;Everdark Tricephalos&quot;, excluded by default) - defeating one is a
separate, optional location, never required for the goal, since Everdark availability depends
on an external weekly rotation this world can&#x27;t unlock or guarantee (see Options.py&#x27;s
IncludedNightlords disclaimer). Everdark Sovereigns are treated as entirely separate bosses
from their base Nightlord: with gate_boss_access on, an Everdark location is gated behind its
own &quot;Everdark X Access&quot; item, independent of whether the base Nightlord&#x27;s own Access item has
been received.


## Downloads
- <a href="https://github.com/jacksonstubblefield/nightreign-ap/releases/download/v0.3.3/nightreign.apworld">Latest Version (0.3.2r2)</a>
- <a href="downloads.html">View all versions</a>

## Game Information

## Setup Guide
- <a href="setup_en">English</a>

## Other Documentation files
- <a href="en_Nightreign">en_Nightreign</a>
- <a href="roadmap">roadmap</a>
