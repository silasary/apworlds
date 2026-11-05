# Hub ownership before mailbox delivery

A new `ReceivedItems` entry can arrive during the awaited location polls between
Hub ownership synchronization and mailbox delivery. On the previous client, the
new Hub item could therefore reach the native item handler while its ownership
bit was absent. Native synchronization could then mistake the resulting door
state for a physical Big Switch activation.

Hub offers now acknowledge a fresh complete ownership-mask write separately,
then guard delivery against that mask and an empty mailbox. The client checks
server socket, emulator stream, authenticated identity, receipt index and
selected receipt before offering and again before attaching pending state.
Unknown reconnect history defers delivery. Other item delivery remains unchanged.

Separate acknowledgement matters: the existing connectors can continue a batch
after an error. This change prevents a failed ownership write from being followed
by a Hub offer. It does not introduce general transaction rollback for connector
guard-read errors or errors in the final mailbox-data writes. A lost offer reply
still requires existing mailbox readback/reconciliation; it is not safe to assume
the offer never executed.

The interleaving tests exercise the actual client and protocol wrappers with a
controlled transport. They cover late receipts, partial/lost mask writes, changed
socket/stream/identity/receipt, unknown history, failed guards, retry recovery,
and lost offer acknowledgement. These controlled scheduling tests are distinct
from ordinary gameplay acceptance.

Earlier fresh authored-seed QA on the published baseline reached both Hub items,
traversed 192→801→592, reconnected to the server, and recovered native gate state
after a cold emulator restart before connector replay. An unexpected physical
switch report occurred during room-192 arrival. The delivery-order defect is
independently reproducible, but the precise cause of that original live event
was not recorded and remains unconfirmed.

No item IDs, native payload, configuration ABI, mailbox offsets, or native save
format change. Authored placements and read-only instrumentation are test setup,
not arbitrary-seed coverage. The reverse logical route and 11 other disputed
pairs remain unproven; Carrot alias and Moonlight RIGHT proof remain open. All
v0.4.1 limitations and partial security coverage remain applicable. This is a
draft testing update, not a release or a claim that live signing/protections exist.

## Fresh receipt verification of the client fix

A new authored seed (input `202610270932`, generated `07995310673587376825`)
started from an empty native save on stock mGBA Qt 0.10.5. Normal controller
input reached the tutorial chest and room 192; there were normal deaths and
respawns, with no item injection or game-memory edits. Read-only telemetry
observed mask `0x220` while slot 7 was still closed at frame 88793, then item
`3860049` applied and slot 7 opened at frame 88794. Physical-switch flags remained
zero and no Big Switch check was sent. The normal 192→801 return also passed.

The emulator connection had already closed more than 70 seconds before the
final deliberate server reconnect attempt. That attempt reopened the server
connection but remained awaiting emulator authentication. The baseline has the
same timeout/closed symptom class, but the unrecovered transport loss is not
causally attributed to either the fix or a specific inherited defect. It is a verification gap, not a pass;
the earlier baseline cold-save/reconnect evidence is not automatically repeated
acceptance of this client change. Existing stock Qt/shared-transport limitations
remain separate from the proven ownership-ordering fix.
