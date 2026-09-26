# Playable Clank trap investigation

Status: investigation only. No Clank trap is registered or enabled yet.
The requested effect is Metalis's small playable Clank on any planet, followed
by restoration of Ratchet when the timer expires.

## Verified on 2026-09-23

The running game was PS2 US `SCUS-97615`. The user authorized forcing Metalis
for testing. Loading planet 4 through `NEW_PLANET_START_LOAD_ADDR` created both
Ratchet and Clank. Reads confirmed that the active character became Clank.
Visual verification was unavailable because PCSX2 computer-use access was not
approved. Movement/animation behavior has not been visually validated.

At the user's request, a subsequent live test travelled from Metalis while
Clank was active to Pokitaru (planet 1). After loading completed, the player
state was `0x00`, the active object matched the Ratchet object (`0x2E62B0` in
that session), and the Clank object pointer was zero. Clank does not persist
through normal travel to Pokitaru. State `0x21` was not forced on Pokitaru:
the verified initialization path would dereference the absent Clank object.

The following fields are relative to the player structure, whose base in the
tested US levels is `PLANET_ADDRESSES[planet].player_state - 0x100`:

| Offset | Interpretation | Evidence |
| --- | --- | --- |
| `0x100` | Current movement/controller state, 16 bits | Native dispatcher and live reads |
| `0x102` | Requested next state, 16 bits; `0xFFFF` means none | Native dispatcher consumes this field |
| `0x59C` | Active character object pointer | Matches Ratchet or Clank object in live reads |
| `0x5B0` | Ratchet object pointer | Ratchet initializer stores it |
| `0x5B4` | Playable Clank object pointer | `ClankPlr` initializer stores it |

Clank uses state `0x21`. Requesting it through `player + 0x102` selects the
native Clank initialization path. **This requires an existing valid Clank
object.** The routine dereferences the pointer at `player + 0x5B4` without a
null check. On live Outpost Omega, this pointer was zero.

Requesting state zero is **not** a complete undo: a live test changed the state
to zero while the active object remained Clank. The test was returned to state
`0x21`. A production trap needs the full Ratchet restoration path, not simply
a delayed write of zero.

## US Metalis executable evidence

Offsets below are raw offsets in the inspected `level_04.rel` SNR2 file, **not
absolute EE addresses**. Resolve and validate relocated code before use.

| File offset | Finding |
| --- | --- |
| `0x2380D0` | `ClankPlr` class name |
| `0x166540` | Class initializer, calls `0x3CBC0` |
| `0x3CBC0` | Wrapper passes the player structure to `0x3C790` |
| `0x3C790` | Stores the Clank object at player offset `0x5B4` |
| `0x40C0C` | Pending-state dispatcher; table at `0x227970` |
| `0x41C04` | State `0x21` initialization branch, calls `0x64C60` |
| `0x64C60` | Clank controller initialization |
| `0x64CB0` | Loads Clank object, then dereferences its `+0x54` data |
| `0x64CF4` | Loads Clank object and stores it as active at player `+0x59C` |

The controller prologue signature is:

```text
27BDFFD0 FFB00000 0080802D FFB10008 FFB20010 2404FFFF FFBF0018
```

This signature appears in all 20 inspected `level_*.rel` files. The `ClankPlr`
class declaration appears only in `level_02.rel` and `level_04.rel` in that set.
Presence of controller code does not establish that a level has Clank's object,
model, animation data, or textures ready to use.

On Metalis, Clank's model record and the backpack Clank model record point to
different geometry and animation data. Reusing the backpack object is not a
verified substitute for loading the playable character.

## Remaining implementation

1. Trace the native model/animation/texture loader and create a standalone Clank
   object on levels without `ClankPlr`. Use owned allocations and resolve the
   destination level's callbacks; pointers from Metalis do not survive travel.
2. Verify the complete reverse transition to Ratchet, retaining position,
   health, equipment and selected skin. State zero alone is insufficient.
3. Handle death, reload, travel, disconnect, natural Clank sections, and special
   gameplay modes without writing through stale object pointers.
4. Add `Trap: Clank` to `Rac5Traps` and append it to `TRAP_DURATIONS` only after
   the runtime works. Appending preserves existing trap item IDs, which are
   generated from the dictionary order. Defaults, weights and duration options
   already derive from this dictionary.
5. Test timer stacking and restoration, then verify actual movement and
   rendering on levels with and without a native Clank spawn and each supported
   game region. No EU/JP character-switch validation has been performed.
