# Scooby-Doo! Unmasked

Track Fred's cousin Jed through Chinatown, the Rock 'n' Roller Coaster theme
park, and the Natural History Museum. Collect clues, ingredients, trap pieces,
costume coins, mission clears, and solved mysteries while items arrive from
across the multiworld.

The optional `snack_sanity` setting adds 135 100-Scooby-Snack rewards
as individually identified locations. This includes deterministic boxes from
fixed breakables; loose snacks and random, repeatable drops are never checks.

The optional `rat_sanity` setting adds 62 individually identified rat
holes that Scooby can block. AP deduplicates holes that respawn after an
overlay reload; generic rat generators and holes that cannot be blocked are
excluded.

Ten `Progressive Health Upgrade` items cover Scooby's vanilla health-medal
range from the starting 3 through the maximum of 13.

Trap quantity and mix are configurable separately: `trap_percentage` sets the
amount, while `snack_trap_weight` and `scare_trap_weight` set relative trap
frequency and can disable either type with a value of zero.

The goal can be defeating the Pterodactyl normally or receiving all nine
randomized `Trap Piece` items before entering the final level. `Movie Set
Access` remains shuffled. Back to MFM can be cleared without it and returns to
W5L0; the Pterodactyl unlocks after that clear once Movie Set Access and the
selected goal requirements are present. The final tape also waits for the
first tier of Kung Fu, Bat, and Robin Hood because its three phases use all
three costumes.

Opening leads to W5L0 rather than a mandatory first world hub. Chinatown, the
Theme Park, and the Museum are all immediately available from its Mystery
Machine; fresh seeds do not contain Hub Access items. In a world hub, its own
MFM tape returns to W5L0, while either other MFM tape travels directly to that
hub.

The twelve ordinary missions unlock from their exact named investigation
clues after those received clues are used with Velma. Caveman uniquely needs
both `Video Tape` and `Camera Tripod`. Received items use only the clue name;
physical clue checks include their area, such as `Undersea Exhibit - Video
Tape`. Physical pickups cannot unlock a mission by themselves.

Optional DeathLink exchanges stable in-level health deaths with other enabled
players.
The embedded client's `/deathlink` command queues a local, non-broadcast test
of the same incoming-death path.

At W5L0, the front studio door redirects to Opening while `Back to MFM Access`
is missing, giving the player a route back to missed tutorial checks. Once that
item arrives, the same door enters Back to MFM (`W4L1`).

The embedded PCSX2 client supports the North American PlayStation 2 release
(`SLUS-21091`, CRC `FE0030D6`).

Physical trap pieces currently retain their normal game behavior while also
reporting checks. Received `Trap Piece` items are kept separate from those
physical check bits and become progression for the All Trap Pieces goal.
