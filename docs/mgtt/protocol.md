# Dolphin/PPC Protocol

The protocol block and notification ring occupy 0x620 bytes of emulated MEM1.
The address is revision-specific and comes from the selected JSON address map.

For the NTSC-U development build, the patcher reserves
`0x802D6800–0x802D6E1F` by splitting the retail CRT's BSS-clear range. The
protocol starts at `0x802D6800`; executable hook code lives separately in the
verified zero-filled text cave at `0x80128000`.

| Offset | Size | Owner | Meaning |
|---:|---:|---|---|
| `0x000` | 4 | game | ASCII `MGAP` |
| `0x004` | 2 | game | big-endian protocol version (`2`) |
| `0x006` | 1 | client | client-ready flag (`0`/`1`) |
| `0x007` | 1 | client | allowed spin values, bits 1–4 |
| `0x008` | 1 | client | allowed putter lengths, bits 0–2 |
| `0x009` | 1 | client | menu-gate flags: roster, modes, Putting difficulties |
| `0x00A` | 2 | client | big-endian 16-bit character-grid permission mask |
| `0x00C` | 2 | client | big-endian 11-bit shuffled-mode permission mask |
| `0x00E` | 1 | client | Putting Practice difficulty permissions, bits 0–2 |
| `0x00F` | 1 | reserved | former notification cooldown byte; retained for protocol-v2 layout stability |
| `0x010` | 40 | game | checked-location bitset, least-significant bit first |
| `0x036` | 1 | game | reserved high location bits reused for spin consumer target+outcome trace |
| `0x037` | 1 | game | reserved high location bits reused for zero-Power selection trace |
| `0x038` | 4 | game | active AP-created retail popup object pointer |
| `0x03C` | 1 | client | Advance Tour pair permission (`0`/`1`) |
| `0x03D` | 1 | game | native guard A-press trace sequence |
| `0x03E` | 1 | game | roster target+1 with `0x40` allowed / `0x80` denied |
| `0x03F` | 1 | game | mode target+1 with `0x40` allowed / `0x80` denied |
| `0x040` | 2 × 151 | client | big-endian counts for the legacy protocol item set |
| `0x16E` | 1 | game | focused native-hook profile identifier (`0` is Recovery) |
| `0x170` | 2 | client | big-endian AP Star-golfer permission mask in character-grid order |
| `0x172` | 1 | game | last confirmed top-level native mode plus one; zero means unseen |
| `0x173` | 1 | game | course target+1, optional `0x20` Star flag, and `0x40` allowed / `0x80` denied |
| `0x174` | 2 | client | 12-bit Tournament permission mask: six regular then six Star courses; new rooms mirror each physical-course item into both halves |
| `0x176` | 2 | client | retail-only Character Match Star/invitation shadow mask |
| `0x180` | 32 | client | NUL-padded seed-name fingerprint |
| `0x1A0` | 1 | client | capture-verified native Star Tournament reveal flag |
| `0x200` | 4 | client | notification write sequence |
| `0x204` | 4 | game | notification read sequence |
| `0x220` | 8 × 128 | shared | NUL-terminated ASCII notification ring |

Protocol item and location indices are `PROTOCOL_ITEM_NAMES` and
`PROTOCOL_LOCATION_NAMES` in `mgtt/data.py`. The C header generator prevents
manual index drift. Items added after v0.8.4, including the 234 per-character
standard clubs, are enforced by the desktop bridge directly from Archipelago
`ReceivedItems`. Locations added after v0.8.5, including Coin Attack and Speed
Golf, are derived and reported by the desktop client. Neither category expands
or overwrites the revision-locked protocol-v2 fields.

The protocol is state-based, not queue-based. Reconnecting rewrites the complete
received-item count table, making item delivery idempotent. The game hook must
derive unlock state from a count greater than zero and must never clear received
counts.

The desktop bridge treats each progressive native-golfer item count as a
two-stage value and publishes separate base and Star permission masks. The
separate Star mask is required because retail's save-backed Star mask also
drives the fixed Character Match invitation chain; out-of-sequence AP inventory
must not become retail match progress. The focused roster hook checks this
Star permission at character confirmation, while the client shadows retail's
invitation mask during Character Match. This still needs controller acceptance
at the final Star-availability consumer.

The menu permission fields are the contract for the replacement native gates.
The 0.9.4 confirmation sites were disproven generic widget handlers and have
been removed. August full-MEM1 captures identify the real character-grid cursor
and loaded-overlay A-button confirmation instruction, plus the common main-mode
and Side Games A handler. The development hook rejects locked golfers and
shuffled modes, recognizes Putting Practice code `0x0D` and its three
difficulty codes, and plays the retail unavailable sound. Controller acceptance
is pending. Doubles, Club Slots, and Training are deliberately always allowed
local entries. The full count table remains the contract for future gates.

The hook must set a location bit only after the associated accomplishment has
actually occurred. Bits are monotonic for the life of a seed.
The 40-byte field has capacity for 320 IDs and covers the 298 locations
published through v0.8.5 without overlapping the item table at `0x040`.

The notification producer writes the complete slot before advancing the write
sequence. The desktop submits messages only on a capture-verified live-hole
screen. The game records the AP-created retail popup slot at `0x038` and
advances the read sequence only after the native text constructor accepts the
message. While that exact scene remains active, the hook observes only the
slot's native state byte at `+0x26A`; state zero means retail has retired and
cleaned up the popup and the next message may begin. The hook never writes
through or destroys the popup object. It drops the protocol handle before any
menu/save transition, leaving retail as the sole owner. Byte `0x01` is
Toadstool Tour's line-break control code.
