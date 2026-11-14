# Rainbow Route East physical-switch reachability

## Reproduction and correction

On main `6ae78a5b`, Rainbow Route East Big Switch (location 3960411, transport
bit 11) belonged to Rainbow Route East's hub (`ROOM_1_HUB_1`, native190).
Reaching that endpoint made the check reachable even with no Moonlight Mansion
Area Key and no reachable Moonlight rooms. That hub contains the map chest.

PR #1045 by BlameMateo corrects the physical parent to Moonlight Mansion Room9
(`ROOM_2_09`, native711) and its map tag to `MAP_MOONLIGHT_MANSION`. The room is
independently corroborated by [WiKirby's Room9 description](https://wikirby.com/wiki/Moonlight_Mansion_-_Room_9):
it explicitly contains the Big Switch unlocking Rainbow Route Hub1. The switch
is in the third stacked section, before the route continues to Room10 and the
boss. The existing native-room map joins Room9 to completion/object index75.

This consolidation retains Mateo's authored correction and adds regression
coverage, updates the serialized map-tag snapshot, and relocates the historical
area-summary event to Moonlight. PR #1046's inferred Room10 placement was wrong
and is superseded, not included as an alternative.

The check inherits real Room9 traversal. No new key-only rule or Hub Connection
requirement is added: overland access remains valid, and disabling Area Keys
still removes the key requirement. Existing Room9-to-Room10 capability logic
remains unchanged.

## Compatibility

No location IDs, bits, item IDs, Hub contract mappings, protocol versions, saves,
client polling, ROM payload or binary patch change. The display name continues
to identify the unlocked shortcut, while the map tag identifies its physical
area. Historical native door enum names and endpoint rooms do not identify the
activating switch's position. Their naming divergence is outside this fix.

New generation and trackers loading the corrected world data use this graph.
Already generated placements are not repaired retroactively by updating a client;
assess an existing seed separately before promising that it becomes beatable.

## Verification scope

The original false-positive fails in all four RoomSanity/ability-gating modes.
The corrected tests cover negative no-key reachability, positive overland and
Moonlight shortcut routes, Area Keys enabled/disabled, and a blocked Room9
entrance despite owning the key. Numeric transport identity is pinned.

Room9 is source-corroborated, not merely inferred from 'before the boss'. No
original-ROM object extraction or fresh emulator traversal was performed during
this fix. Those are distinct from the executable APWorld graph regressions.
