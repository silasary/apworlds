# Scooby-Doo! Unmasked

Track Fred's cousin Jed through Chinatown, the Rock 'n' Roller Coaster theme
park, and the Natural History Museum. Collect clues, ingredients, trap pieces,
costume coins, mission clears, and solved mysteries while items arrive from
across the multiworld.

The optional `snack_sanity` setting adds 123 100-Scooby-Snack rewards
as individually identified locations. Breakable, loose, random, and
repeatable drops are never checks.

The optional `rat_sanity` setting adds 62 individually identified rat
holes that Scooby can block. AP deduplicates holes that respawn after an
overlay reload; generic rat generators and holes that cannot be blocked are
excluded.

Ten useful `Health Upgrade` items cover Scooby's vanilla health-medal
range from the starting 3 through the maximum of 13.

`Full Heal` restores Scooby to his current maximum health.

`Mubber Sync (Unstable)` and `Health Sync (Unstable)` are independent options
in the collapsed Shared Resources (Experimental) group. Participating
Unmasked players share Mubber spending
and pickups or one current and maximum health bar. Mubber Sync keeps each
player's personal world multipliers and adds 0.2x per participant to machine
prices without increasing Mubber Packs. Health Sync distributes ten Health
Upgrades across the whole group; Scare Trap, Ultimate Scare Trap, Full Heal,
native damage, and native healing affect every participant.

Trap quantity and mix are configurable separately. `trap_percentage` sets the
amount, while each trap weight sets its relative frequency and can disable
that trap with a value of zero. Ultimate Scare leaves Scooby at one health,
Reverse Controls inverts movement for ten seconds of controllable gameplay,
and UV returns Scooby to his base form without removing costume ownership.

The Defeat All 3 Bosses goal requires Zen Tuo's Dragon, Guitar Ghoul, and
Caveman to be defeated before entering Back to MFM. The All Trap Pieces goal
uses all nine received `Trap Piece` items instead of those three boss clears.
Both modes then clear Back to MFM and Movie Set / Pterodactyl. `Movie Set
Access` remains shuffled. The final tape also waits for the first tier of Kung
Fu, Bat, and Robin Hood because its three phases use all three costumes.

Opening leads to W5L0 rather than a mandatory first world hub. Chinatown, the
Theme Park, and the Museum are all immediately available from W5L0's Mystery
Machine; fresh seeds do not contain Hub Access items. Hub level entrances use
their native routes, while W5L0 is the place to travel between hubs.

The twelve ordinary missions unlock from their exact named investigation
clues after those received clues are used with Velma. Caveman uniquely needs
`Miniature Saturn`, `Metal Chain`, `Video Tape`, and `Camera Tripod`. Received items use only the clue name;
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

Physical trap pieces retain their normal game behavior while also reporting
checks. Received `Trap Piece` items only exist when the All Trap Pieces goal is
selected. They are kept separate from physical check bits and become
progression for that goal. An Unmasked Trap Piece can never be placed at a Back
to MFM location, including in multiworld seeds.
