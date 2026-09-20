# US PS2 native patches

The client installs these RAM patches for **SCUS-97615** through PINE. It checks
the game's instruction signatures before writing, verifies the results, and
rolls back a failed installation. The ISO is unchanged.

| Feature | Behavior |
| --- | --- |
| Weapon/gadget vendor | Base purchases record an AP location without granting the vanilla item. Purchase availability uses the check journal, independently of AP ownership. Native ammo purchases remain intact. |
| Titan vendor offers | Record a separate check without granting a native weapon level. The client supplies progression eligibility. |
| Pokitaru ship | Removes the Ryllus prerequisite from ship initialization. New seeds have separate Pokitaru and Ryllus infobots; the default start supplies Pokitaru's only. |
| Armour pickups | Physical pickup visibility uses checked locations, independently of AP armour ownership. Collection records the location without equipping or granting the vanilla armour. The story-tier spawn restriction is bypassed before objects initialize. |
| Sprout-o-Matic | Its Ryllus handoff records a physical check, skips the native grant/forced equip, and preserves object removal and sound. Receiving Sprout through AP does not hide its unchecked pickup. |
| Item receipts | A dedicated timed HUD renderer displays purple item names, red trap names, and green senders. It never activates a prompt or consumes Triangle. Receipts queue during menus and loading. |

The Shrink Ray handoff remains tracked by Kalidon's mission event, which is
independent of inventory ownership. Challenge rewards retain their existing
event checks. The separate mod vendor retains its existing client logic.

Installation happens after relocation, before the level thread initializes
objects. Attaching to an already-running level causes one reload. Subsequent
level loads reinstall the patches. The client releases the loader barrier on
normal shutdown, cancellation, and recoverable PINE failures.

Generate a new seed to use the separate infobots. Old seeds with the combined
`Infobot: Pokitaru and Ryllus` retain their combined unlock behavior.

## Verification

- Live Pokitaru: ship present, Acid Bomb Glove purchase recorded by its native
  journal, and item message displayed while Triangle remained usable.
- Signature, install, and restore checks against saved memory for Pokitaru,
  Ryllus, Kalidon, Metalis, Dreamtime, Outpost Omega 2, Challax, Dayni Moon,
  Inside Clank, and Quodrona.
- Automated MIPS execution tests cover journal writes, already-owned pickups,
  branch delay slots, notification expiry, and the renderer's call targets.
- Automated tests cover rollback, signature rejection, colour formatting,
  same-planet rebinding, and independent infobot region access.

Armour and Sprout pickup behavior has automated instruction-level coverage;
their physical pickups still need a full in-game playthrough test. Titan offers
likewise still need a live purchase test.


## Shrink Ray puzzles

Locations now reads the US native little-endian completion bits (puzzle ids
0, 1, 4, 6, 7, 9, 10) and reports only the current planet's checks. The old
Kalidon extra address was a Clank challenge flag and is no longer read or written.
The existing Outpost bypass now uses bit 2, rather than Quodrona's bit 10.

Skip mode clears each loaded GrindrailLock's runtime interlock byte. Doors
then use their ordinary proximity/opening behavior, without Shrink Ray ownership
or activation. No code instructions or puzzle completion flags are changed.
Locations mode continues tracking genuine native completion bits.

The getter/class signature, object pointers, puzzle ids, and runtime backlinks
are validated before writes. Active puzzles are left alone until they finish.
Module loads discard old bindings. Disabling Skip restores unsolved interlocks;
already-open doors may need a level reload to close again.

Retail object fixtures cover both Kalidon doors, both Challax locks, Dayni Moon,
Inside Clank, and both Quodrona locks. Tests cover direct interlock writes,
unchanged save/code memory, active-puzzle deferral, stale-pointer rejection,
planet scope, and completion deduplication. Live door passage remains under test.


## Scouted weapon vendor display

On AP connection, the client scouts enabled vendor checks without creating
public hints. Base/gadget and Titan offers use separate keys, matching their
native purchase journals. The selected offer shows the reward item name
(orange for progression) and its recipient. Purchase confirmation also uses
the mapped name. The original bolt price and native purchase id are preserved.
Unscouted offers and ammo retain their original text.

The supplied images/icons/archipelago-icon.indices and .clut files replace a
compatible 32x32 UI texture while the weapon vendor is open. Only mapped AP
rows use that icon. Text reuses bounded native description storage; unusually
long names are truncated to fit. Text pointers, row icons, and pixel data are
restored when selection changes or the menu closes. No renderer code is changed.

Address resolution was checked against ten retail planet snapshots. Tests cover
AP recipient lookup, base/Titan separation, ammo preservation, purchase identity,
price preservation, and exact restoration of cosmetic changes. The separate
mod-vendor display is not changed by this weapon-vendor implementation.
Live visual verification of the icon and mapped text is still pending.

The display binding waits until the planet is ready before becoming active.
This preserves it through loader stage 5, which previously discarded the newly
prepared binding before it could update any vendor icons or text. A regression
test covers relocation, stage 5, and the first ready vendor poll. Display failures
are logged as warnings even when client debug messages are disabled.
