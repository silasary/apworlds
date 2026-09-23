# US PS2 native patches

The client installs these RAM patches for **SCUS-97615** through PINE. It checks
the game's instruction signatures before writing, verifies the results, and
rolls back a failed installation. The ISO is unchanged.

| Feature | Behavior |
| --- | --- |
| Weapon/gadget vendor | Base purchases record an AP location without granting the vanilla item. Purchase availability uses the check journal, independently of AP ownership. Native ammo purchases remain intact. |
| Titan vendor offers | Record a separate check without granting a native weapon level. The client supplies progression eligibility. |
| Pokitaru ship | Removes the Ryllus prerequisite from ship initialization. New seeds have separate Pokitaru and Ryllus infobots; the default start supplies Pokitaru's only. |
| Starting planet | Patches the frontend's fresh-save destination and both hard-coded New Game exits before gameplay. Existing saves retain their destination; no Pokitaru arrival redirect is used. |
| Ship destinations | Dreamtime requires the Outpost Omega unlock; Inside Clank uses its native unlock flag. The Outpost destinations are labeled MOO1 and MOO2 and travel to Omega 1 and Omega 2 respectively. Both use the Outpost infobot unlock. |
| Armour pickups | Physical pickup visibility uses checked locations, independently of AP armour ownership. Collection records the location without equipping or granting the vanilla armour. The story-tier spawn restriction is bypassed before objects initialize. |
| Sprout-o-Matic | Its Ryllus handoff records a physical check, skips the native grant/forced equip, and preserves object removal and sound. Receiving Sprout through AP does not hide its unchecked pickup. |
| Item receipts | A dedicated timed HUD renderer displays purple item names, red trap names, and green senders. It never activates a prompt or consumes Triangle. Receipts queue during menus and loading. |
| Connection warning | A separate red HUD message says `DISCONNECTED FROM ARCHIPELAGO` and `Reconnect the AP client`. It stays visible while disconnected and clears when the authenticated AP connection returns. |

The Shrink Ray handoff remains tracked by Kalidon's mission event, which is
independent of inventory ownership. Challenge rewards retain their existing
event checks. The separate mod vendor retains its existing client logic.

Installation happens after relocation, before the level thread initializes
objects. Attaching to an already-running level causes one reload. Subsequent
level loads reinstall the patches. The client releases the loader barrier on
normal shutdown, cancellation, and recoverable PINE failures.

The connection warning uses its own heartbeat, separate from timed item messages.
AP disconnects set it offline on the next client poll. If PINE or the client
process disappears, the game detects the missing heartbeat after 180 HUD frames
(about three seconds at 60 FPS) and keeps drawing the warning without IPC.
Reconnecting refreshes the heartbeat and clears it. No prompt or input state is
changed. The warning is installed where the native small-prompt HUD renderer is
configured; it does not draw over loading screens or other screens that stop
that renderer. Outpost Omega 1 currently has no configured small-prompt renderer.
Loading another level after closing the client can discard the RAM patch; with
the client still running, level loads reinstall it even while AP is offline.
Automated MIPS tests cover timeout, persistence, reconnection, and simultaneous
item/skin hooks. Live visual verification remains pending.

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

The ship destination patch rebuilds the list each time the menu opens. Omega 1
and Omega 2 are labeled MOO1 and MOO2 and share the native Outpost map icon and information; their row metadata
selects level 6 or 23 at confirmation. The current-level check runs after that
selection, allowing travel between the two Outpost areas. It does not change
planet unlock flags, mission progress, or the ISO.

Ship menu signature/install/restore checks cover twelve saved US snapshots.
Instruction execution tests cover locked destinations, both Omega rows, travel
selection, same-level cancellation, signature rejection, and failed-install
rollback. Live menu rendering and arrivals still need an in-game check.


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


## Trash Ratchet, skin application, and Inside Clank exits

Trash Ratchet is included in the native skin menu and the client unlock mask.
The native menu's special exclusion of model 6 is removed. Saved skin ids
and model ids differ; the client maps between them before applying a skin.

Use `/skin trash` (or `/skin 3`) in the client to switch without opening the
skin menu. Other choices are default, pirate, godzilla, swim, kanga, and hiro.
The starting-skin option uses the same application path. Requests wait for
gameplay, then run the native load/apply routines on the game thread before
HUD rendering. A request cannot run while a menu or level load is pending.
Selecting a skin in the game menu also retains that choice for the next planet.

Inside Clank ship-menu travel now marks a voluntary departure. The departure
completion check returns false for that route, so owning Quodrona cannot
trigger the completion cinematic. Normal scripted exits retain the original
mission evaluator. The patch does not modify Quodrona ownership or mission
save bits; its marker is reset when the level patches are installed again.

Signature checks and combined install/restore checks passed against ten retail
planet snapshots. Instruction-execution tests cover all seven skin mappings,
menu/loading deferral, one-shot application, empty notification queues,
voluntary versus scripted exits, and rollback. The direct Pirate model swap
was verified live; departure cinematic verification remains pending.

## Multiplayer skins in single-player

The US skin menu includes the seven single-player choices and thirteen red
multiplayer skins. Blue variants are excluded. Multiplayer selections use ids
7–19 and are available without multiplayer unlocks. Client commands include
`/skin qwark`, `/skin tuxedo`, and `/skin low_rider`.

Multiplayer models contain placeholder highest-detail geometry. The patch
copies their next-detail command stream and translates its reduced bone
references to Ratchet's full animation skeleton, preserving the original
skeleton and lower-detail streams. This corrects the cube model and misplaced
arms seen with direct multiplayer asset loading.

Menu storage and conversion code occupy reserved space in the existing hero
allocation. Primary model reads are bounded below that space, and the native
texture offset is preserved. The runtime installs the extension when the hero
buffer is allocated and retains the ordinary skin callback otherwise.
Multiplayer application always rereads its assets: a level reload can retain
the loaded skin id while rebuilding descriptors with empty size caches.
Skipping that read passed a zero texture size to the renderer and could cover
the screen with a texture sheet. Single-player skins retain their native cache.

Install/restore checks cover ten retail planet snapshots; instruction tests
cover all thirteen multiplayer geometry conversions. Tuxedo's corrected limbs
were confirmed live by the player. The red-only menu was applied through
PyPINE on Dayni Moon. Live testing of every skin and transitions between
planets remains outstanding.
