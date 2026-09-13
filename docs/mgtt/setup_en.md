# Mario Golf: Toadstool Tour Setup

This guide describes the 1.0 setup. Use a fresh or dedicated copied
Dolphin memory card. The recommended YAML keeps experimental features outside
the room and the MGTT client warns when a generated slot enables them.

## Requirements

- Archipelago 0.6.7.
- A legally dumped, exact NTSC-U disc image (`GFTE01`).
- Official Dolphin.
- Python 3.10 or newer for the patch/build scripts and client dependencies.

## Install or build the APWorld

Remove every older MGTT APWorld, install the current package, and completely
restart Archipelago Launcher. A developer can rebuild the same package locally
with:

```sh
python3 tools/build_apworld.py
```

Start with `MGTT_1.0_Recommended.yaml`. It uses four starting golfers, one wood,
one iron, and one wedge per golfer, per-character putter ranges, vanilla spin,
and verified 1P/2P Ring Attack. `MGTT_One_Club_Per_Golfer.yaml` is the harder
alternative. Optional Coin Attack, Speed Golf, practice/challenge, Congo
Canopy, per-course Character Match, shuffled-spin, and 3P/4P Ring Attack
settings are available for testing but produce an explicit client warning.

## Create the patched copy

The patcher verifies the full ISO and `main.dol`, refuses unknown revisions,
and will not overwrite its input:

```sh
python3 tools/patch_iso.py "/path/to/Mario Golf - Toadstool Tour (USA).iso" \
  "/path/to/MGTT-Archipelago.iso"
```

Keep the source and patched ISO private. Neither may be redistributed.

## Configure Dolphin on macOS

The client uses Dolphin's built-in PowerPC GDB server on macOS. Close Dolphin,
open the active Dolphin User folder's `Config/Dolphin.ini`, and add:

```ini
[General]
GDBPort = 55000
```

If `[General]` already exists, add only the `GDBPort` line to that section.
Launch the patched game. It may initially appear paused while waiting for the
bridge. Then launch **Mario Golf: Toadstool Tour Client** from Archipelago and
connect with the generated slot name.

If the GDB bridge exits or disconnects, stop and restart emulation before
relaunching the client; Dolphin's GDB listener is one connection per boot.

## Configure Dolphin on Windows or Linux

Install the bridge dependency:

```sh
python -m pip install -r mgtt/requirements.txt
```

Start the patched game, launch **Mario Golf: Toadstool Tour Client**, and
connect with the generated slot name. The automatic backend uses
`dolphin-memory-engine` on these platforms.

Opening an Archipelago connection link for an MGTT slot should launch that same
client automatically. Version 0.7.2 accepts the positional link format emitted
by Archipelago 0.6.7 and transfers the embedded slot name/password into the
login. Version 0.7.3 also loads the built-in GFTE01 address map directly from
the installed APWorld ZIP on Windows. Version 0.7.4 releases a stale
`dolphin-memory-engine` attachment before retrying and distinguishes a
not-yet-running/wrong Dolphin process from an unpatched retail ISO. If startup
fails, a visible error dialog
points to the Archipelago log
folder instead of allowing the child process to disappear silently.

The supported clean ISO is GFTE01, 1,459,978,240 bytes, with SHA-256
`08a1f0c1f7336418fa814a19907f2094d81062d5e7636ab096a43c41132410f0`.
Do not use a different region or revision.

On Windows, verify the image with `Get-FileHash -Algorithm SHA256`. Close all
Dolphin instances, start only the verified patched image, wait until emulation
begins, and then launch the MGTT client.

To use Dolphin GDB explicitly instead, configure the same `GDBPort` setting and
launch the client with `--dolphin-backend gdb`.

## Current behavior

The window title now identifies the client as **Archipelago Mario Golf:
Toadstool Tour Client**. `/mgtt_status`, `/mgtt_inventory`,
`/mgtt_messages`, and `/mgtt_diagnostics <label>` report or export bridge,
inventory, popup-queue, and sanitized support state. Clear log
messages announce when the patched game connects to or disconnects from
Dolphin. Native Archipelago popups are disabled for 1.0 because
they share unsafe retail dialog state; item receipts and completed checks are
shown immediately in the MGTT client window. Every native golfer has one
progressive item name: the first received
copy grants the base golfer and the second grants the Star golfer. The bridge
synchronizes golfer/Star presentation, twelve independent Tournament course
permissions, the standard-club limiter,
putter/Approach shot type, global or per-golfer standard clubs, spin permission
masks, and progressive Power Shot capacity. Spin and zero-capacity Power
enforcement are not currently playable gates. It reports
retail tournament, Character Match, and 1P–4P Ring Attack records, plus live shot
and round results.

Enter `/clubs` to show the global standard-club inventory in the MGTT client
window. With per-character clubs, use `/clubs Mario` (or
another native golfer); omitting the name uses the active golfer when one is
known. Spaces, underscores, joined names, and unique short forms are accepted,
including `/clubs Diddy`, `/clubs Diddy_Kong`, and `/clubs DiddyKong`.
`shuffle_clubs: per_character` starts each golfer with one random standard club.
`shuffle_clubs: per_character_balanced` instead starts every golfer with one
random wood, one random iron, and one random wedge; the other ten clubs remain
independent Archipelago items for that golfer. Both choices use the same native
per-golfer bag enforcement.
The desktop answer is immediate. Native `/clubs` popups remain disabled with
the rest of the unsafe retail message bridge.

Receiving `Advance Tour Golfers - Neil & Ella` can create a byte-exact captured
transfer record only when both copies of a slot are blank. The 15 custom
club-set items update the managed Neil/Ella record. Genuine transferred
golfers are preserved byte-for-byte, mismatched primary/mirror copies are not
modified, and populated profiles are never automatically deleted. If every
slot is occupied or an existing transfer can bypass shuffled golfer access,
the client displays a one-time warning.

`advance_tour_golfer_stats` controls the driving-distance fields of AP-created
Neil/Ella records. `weak` gives Neil/Ella 205/200 yards, `standard` gives
305/300 and is the default, and `overpowered` gives 405/400. `random` selects
one of those complete pairs once during seed generation and serializes the
resolved choice, so reconnects cannot reroll it. This option never rewrites the
stats of genuine transferred golfers on an already populated card.

`shuffle_tournaments` places access to the six physical courses in the
multiworld. `starting_tournaments` is retained as the YAML key for
compatibility, but its display name is **Starting Regular Courses**: it chooses
how many random regular courses begin owned, from 1 through 6, and defaults to
one. A regular course item opens its corresponding course anywhere the game
uses course access, including regular Tournament, Star Tournament, and
Character Match. The
default `character_match_course_access: follow_tournament_items` follows those
items; the compatibility value `all_courses` precollects all six. The six old
`Tournament - <Star event>` item IDs remain readable for older rooms but are
retired from new generation. `Tournament and Star Tournament Modes` is a
single progression item covering both halves of the retail Tournament feature, and
the matching course item authorizes both versions with either a base or Star
golfer.

`starting_characters` accepts 1 through all 16 native golfers and defaults to
four. Per-character standard clubs are the intended/default club scope. Global
and vanilla club scopes remain available for compatibility and smaller rooms.
The default `ring_shot_player_counts: one_and_two_player` includes the verified
1P and 2P checks and raises the effective starting roster to at least four.
`single_player_only` keeps only 1P checks. The opt-in `all_player_counts` also
includes 3P and 4P checks and raises the effective starting roster to at least
four golfers. Player 1 uses the Archipelago club bag in multiplayer Ring
Attack; players 2–4 intentionally retain full retail bags for 1.0 stability.
The configured and effective counts are both recorded in slot data.

Per-character putter ranges are the default. Each supported golfer starts with
one random range and can receive the other two independently. `global` remains
available as a compatibility/fallback scope if controller testing uncovers a
blocking per-golfer issue.

When `shuffle_power_shots` is enabled, `starting_power_shot_capacity` accepts
1 through 9 and defaults to 6. Remaining progressive capacity copies are
placed until the player can reach 9. When shuffling is disabled, retail's
six-shot capacity is used. This configured capacity applies only to regular
Tournament, Star Tournament, and Stroke Play; Ring Attack and other modes keep
their native mode-specific Power Shot rules.

Ring Attack also keeps its retail course progression. Clear all six levels on
the current course to reveal the next course. Physical AP course items do not
gate this menu; confirmed Ring Attack checks are restored into the native save
records so progress survives reconnects and golfer changes.

Generated worlds use Mulligans for otherwise-empty locations, up to a cap of
99. The supported 1.0 option catalog stays within that cap, so it generates no
`Nothing` items. There is no trap option in 1.0, and no trap can enter a
generated item pool.

The bundled `MGTT_Standard_Tour.yaml`, `MGTT_Short_Tour.yaml`, and
`MGTT_Complete_Tour.yaml` examples provide recommended, shorter, and maximal
starting points. They are ordinary YAMLs and can be copied and adjusted.

The `goal` choices are `all_tournaments`, `all_pro_character_matches`,
`all_single_player_ring_shots`, and `all_three`. All Tournaments requires first
place in every regular and Star Tournament. The Character Match goal requires
victories over all 16 native opponents on Pro difficulty. All Three combines
those two sets with all 36 one-player Ring Attack clears. Invitation letters
and retail Star awards are local vanilla behavior only. The historical
`all_star_characters` spelling remains a compatibility alias for the Pro-match
goal, and `bowser_championship` remains an alias for `all_tournaments`.

The client recognizes renamed transferred golfers from agreeing
primary/mirror records. The two roles participate in per-character standard
club and spin shuffling, and `/clubs Neil` or `/clubs Ella` reports their bags.
Names such as Joshy/Sally remain visible in-game and are shown beside the
mapped role. The native guard denies transferred-golfer cursor values 16/17
until the pair item is received without rewriting genuine records.

The client publishes compact roster/mode/difficulty permissions. 0.9.4's
generic widget patches did not intercept the real confirmation paths and were
removed. The development patch now guards the capture-verified character-grid
and main/Side Games confirmation instructions. It recognizes Putting Practice
and its three difficulty entries, suppresses A for locked selections, and plays
the retail unavailable sound. Replacement-ISO controller acceptance is still
pending. Doubles, Club Slots, and Training remain local in the current model;
Match Play and Skins Match are not Toadstool Tour modes.

`enable_debug_commands` defaults to false. The complete and expanded capture
profiles set it true to expose `/mgtt_debug_item` and `/mgtt_debug_check` in a
dedicated test room; those commands use real server ReceivedItems and
LocationChecks paths and permanently alter that room.

The same debug-only gate protects `/mgtt_debug_loadout <golfer>`. In a
per-character club room it requests all 13 clubs for that golfer; in a global
room it requests the global set. It also requests all putter ranges and
Approach Shot. Wait for the server's ReceivedItems messages before recording a
Character Match or other full-bag capture.

Unmapped contest and aggregate special-mode checks are kept out of the default
profile. Near-Pin uses its saved aggregate leaderboard and YAML distance
target. Coin Attack results feed seed-persistent cumulative counters;
practice/challenge and Congo Canopy score locations remain opt-in. The 1.0
supported boundary includes Birdie Challenge Front 9 and Congo Canopy Front 9;
the longer-round IDs remain reserved.

## Capture a diagnostic snapshot

Version 0.8.2 added a read-only calibration command for the remaining native
selectors and result fields. While the client says Dolphin is connected, leave
the game on the screen to capture and enter:

```text
/mgtt_capture near-pin-start
```

The client writes `MGTT-capture-...zip` to Archipelago's `logs` folder and
prints the exact path. The command reads emulated RAM only; it does not write
game memory or modify the memory card. Version 0.8.4 writes to a temporary file,
verifies every read length, records per-range SHA-256 hashes, and publishes the
ZIP only after it is complete. Use a short label and wait for the “saved to”
message before continuing.

Before each upload batch, also run `/mgtt_diagnostics batch-name`. It writes a
small JSON file beside the captures without the Archipelago server address or
password. If the client finds multiple MGTT APWorld archives in
`custom_worlds`, it prints a warning; remove the older copies and restart the
Launcher before testing.
