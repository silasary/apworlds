---
status: accepted
---

# Client handlers take stream positions, never the spent record

Ticket 08 (`.scratch/item-delivery-cursor/issues/08`) made `StorageHandler` the one owner of the
spent record. The ticket's wording ("`ItemHandler` … marks the delivered one-shots in the record")
led to the record being passed into `ItemHandler`, then built inside it, with `ItemHandler`
decoding the mask itself. All of it was reversed. The rule that held instead: a handler is handed
decoded stream positions and hands positions back. Only `StorageHandler` reads or writes the record,
and only the context touches the server. This is the shape the mercenary path already had:
`try_sync_mercenaries` is handed spent items and never sees a bit.

The context does the ordering. Within one tick it asks the handler what was delivered, marks those
positions (`StorageHandler.mark_spent`), pushes the mask if it changed, and then hands the handler
the spent positions to write from (`spent_items()`, which is `StorageHandler.spent_indices`).
Marking and writing land in the same tick without either handler knowing about the other.

## Considered Options

- **Pass the record into `try_sync_items`.** This is the ticket's literal reading. It coupled the
  delivery code to storage, and the handler decoded `(mask >> index) & 1` itself.
- **Build `StorageHandler` inside `ItemHandler`, or inject it through the constructor.** Same
  coupling. It also gave the record a second path from the context, through
  `item_handler.storageHandler`.

## Consequences

- `StorageHandler.spent_indices` is the only decode of the mask. Anywhere else that writes
  `>> index` against the record is a review finding.
- A handler method that needs to know what is spent takes a `set[int]` of positions, or the items
  at them, never a `StorageHandler` and never the mask.
- Server pushes (`on_item_spent`) stay in the context, next to the mark that triggered them.
- A ticket that names which class does the work describes behaviour, not placement. Where it
  conflicts with this rule, the rule wins, and the conflict is raised.
