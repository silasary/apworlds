# Secret Agent Clank AP test build

Use the USA PS2 game (`SCUS-97623`) with PCSX2 PINE enabled on port 28011.
Only one PINE client can connect at a time; close research probes before launching the AP client.

## Start a test

1. Generate a **new seed** with this source folder. Native mission titles and their case assignments changed, and all 27 Alien Codes and three keycards now have locations. Old seeds are not compatible with the corrected catalog.
2. Use a fresh save, or restore your pre-test save. The research save now has the Chalice collected, so it would immediately satisfy that goal. Jet Boots remain granted at your request; the three temporary keycards were restored to absent.
3. Leave the game at its **main menu**, launch **Secret Agent Clank Client**, connect to the server and slot, and connect PINE. Wait for `New saves will start in <case>. Ready to create a new save.`, then create a new save. Each newly generated seed chooses a random case belonging to an enabled character and grants its Case File. The choice stays fixed for that seed and is restored by Universal Tracker. Loading an existing save keeps its saved destination. If connecting after entering gameplay, use the **in-game level reset once** when asked; do not load a savestate for this reset.
4. Look for `Native pickup/vendor hooks installed before module ... startup.` Subsequent level transitions and full resets install the hooks automatically. There is no opt-in command; disabling native interception is rejected.
5. Test an AP item received before its native pickup, a vendor purchase without receiving its item, and completion of separate cases in a shared module. Purchases and pickups should report checks independently of AP item ownership.

To launch from the repository root with its Python environment:

```powershell
.\.venv\Scripts\python.exe -B -m worlds.secret_agent_clank.client --connect localhost:38281 --name YOUR_SLOT
```

## Goals

- `goal: alien_codes` works with `all_alien_codes` on or off. The client reads all 27 native collection bits and sends AP goal status when all are collected.
- `goal: chalice_of_power` works with `all_keycards` on or off. Collect the red, blue, and yellow cards, enter High Impact Treehouse, open the keycard door, and **pick up the Chalice**. Cards alone or an open door do not complete the goal.
- Treehouse access is exposed when the native three-card set is complete. Fully close/reopen Case Files if it was already open when access changed.
- Therm-Optic Shades received from AP now use the native sunglasses slot (25), just as Black Out Pen uses slot 17.

## Validation and limits

Live testing verified Tie-a-Rang spawning when owned before level initialization, independent pickup/vendor checks for Tie-a-Rang and Agency PDA, Treehouse card unlocking, and the Chalice collection flag changing from 0 to 1. Alien Code storage is decoded from the game's getter/setter and total-count routines; individual code title/order mappings still need gameplay spot checks.

The automatic lifecycle passed replay checks on four RAM captures, including Treehouse's vendor-only module. A connected AP-server end-to-end session is still required. Per-case gameplay rules are left for your manual edits. Other scaffold features, including unmapped individual challenges, skill points, cutscenes, traps, and some placeholder gadgets, are not certified by these tests; successful generation does not establish full-game playability.

Keep the client running while playing. Normal shutdown and recoverable errors release the resident loader barrier. A killed process or broken PINE connection can prevent cleanup; restart the game if loading remains held. Savestates can overwrite hooks and are not supported as a substitute for a native reset in the test workflow.


Titanium bolts now have 23 individual, always-on locations, named
`Operative: Case: Titanium Bolt N` (N is the native pickup ID). Generate a
new seed to include them; old seeds contain none. The reader uses persistent
collection flags, so spending bolts does not undo checks. Existing collected
flags are reported on connection unless AP already knows the check. Detailed
access requirements remain in the manually maintained rules.

Each AP Bolts item adds 20% of the current in-game balance, rounded down.
Queued rewards compound individually; a zero balance receives zero. Rewards
wait until level startup is complete. The client records delivered rewards
in `.client_state/` inside the SAC folder, separately per seed/team/slot,
so reconnecting or restarting the client does not replay them. Keep this
folder with your game save; loading an older game save does not roll back
the delivery journal. Existing seeds can use this bolt reward fix.

All Keycards and All Alien Codes only add optional AP reward locations. They do not change the selected goal.


Progressive Wrench is off by default; enable it via the Progressive Wrench
option. It requires a new seed. Five copies are generated when both it and
Ratchet are enabled: normal wrench, Fire-Bomb, Triple Wave, Crystalix, and
Wild Burst. Tier zero blocks Ratchet's wrench input; the first copy restores
all standard wrench attacks together. Later copies cumulatively unlock
native mods for selection in the wrench menu. Other characters' attacks
and weapon damage are unchanged. Gameplay rules for the new item are
left for manual editing. The no-wrench state was tested live in Max-Security Cells: wrench attacks were blocked while movement and shooting worked. All four input masks were then restored and verified. Native mod unlocks still need live verification.


Item receipts use the game's timed one-liner HUD: `Received ITEM` /
`from PLAYER`, with purple items, red traps, and a green sender name.
Messages queue, wait while menus or native hints are active, and expire
after 240 game updates. No pause or input state is changed. Long names
are truncated to fit the native 256-byte buffer; unsupported glyphs use
`?`. Initial inventory synchronization is not replayed as notifications.
The filled background and both end brackets are disabled. Position, size, lifetime, and native palette choices
can be adjusted in core/notifications.py. The native box, colors, and uninterrupted controls were confirmed live; the background was subsequently disabled at user request.

Progressive Weapons is optional and requires a new seed. With it enabled,
the first copy grants V1 and each later copy adds one level. Base-game seeds
cap at V4; NG+1 and NG+2 cap at V8, with the fifth copy granting Titan V5.
RYNO always caps at V4. The 15 weapons with native level definitions use
this system; single-level tools keep their individual unlocks. Combat weapon
XP is disabled while AP controls levels. With the option off, combat leveling
works normally.

NG+ seeds add 14 shared `Vendor: <weapon>` purchase locations, excluding
RYNO. They are recorded independently of base-weapon purchases and ownership.
NG+ 0 generates no Titan locations and explicitly skips both native Titan
offer lists at the loader gate. NG+ 1 and 2 enable Titan purchase checks.
New seeds include 16 Ratchet weapon-mod purchase checks and matching unlock
items; NG+ 1 and 2 also include three Clank mods. Disabled characters' mods
are excluded, as are mod checks when no vendor case exists. Buying a mod marks
its location without granting its effect. Receiving its AP item installs it
without completing the purchase check or granting the underlying weapon.
The purchase remains offered if its AP mod was received first. Existing seeds
retain their old vanilla mod behavior; generate a new seed for mod checks.
Unchecked Titan offers use the V4 definition for their native price and icon,
so receiving a Titan early does not remove its purchase location. These offers
do not require the gameplay weapon to reach V4 first. With Progressive Weapons
off, an owned weapon automatically advances from V4 to Titan V5 in NG+,
then combat XP advances it to V8. No purchase or separate Titan Upgrade item
is required. With it on, the fifth progressive copy provides V5 instead.
Titan location logic requires access to the original weapon's purchase/pickup
check and at least one reachable vendor. It does not require receiving that
weapon's AP item. Edit `VENDOR_REQUIREMENTS` in `rules/vendor_access.py` to set
each case's vendor item requirements. Case access is included automatically;
use `False_()` for cases without vendors. Current `True_()` entries are editable
defaults, not verified routes. Shared requirements also apply to ordinary vendor
locations, preserving their existing per-location rules. Generate a new seed
after changing these rules. The client applies the selected NG+ count to the
native replay field when gameplay is ready.

Weapon XP Multiplier, Health XP Multiplier and Bolt Multiplier accept integer
values from 1 to 10, default 1. They scale positive native gains, preserving
deductions. Weapon XP scaling is inactive with Progressive Weapons enabled.
AP Bolts items still grant 20% of the current balance without an additional
multiplier. Treehouse installs the bolt hook only because it has no combat XP
sources. Restart the client and reset the level in-game to install changed hooks.

Progressive NG+ needs enough checks for its larger item pool. Generation reports
the exact shortage; enable more optional locations if needed. Enabling all
location categories fits every weapon progression mode. Unit tests cover tier
caps, emitted native routines, purchase separation and multiplier arithmetic;
combined patches were checked against four captured modules. Live Titan purchase
and multiplier validation are still pending.

Starting Weapons and Starting Gadgets now select distinct random items at seed generation and precollect them through AP. Generate a new seed to use these settings. Progressive starting weapons grant one copy/V1 and remove that copy from the pool; freed checks receive filler. Disabled characters receive no starting equipment.

Access items follow the enabled case regions. The first case of an enabled
character is precollected, together with its required planet/character access;
Qwark-only seeds start with Larger Than Life. Progressive Planet retains the
game's global order and precollects the copies needed to reach that start.
Ratchet Pack is excluded when Ratchet is disabled. Generate a new seed after
changing character settings. Special Missions remain included as before.

Mission-end automatic next-planet travel is redirected to the native end-of-level map. This includes Ratchet's results-screen Continue action and its post-movie callback, which bypassed the original shared-helper patch. Manual Case Files selection and reset handling are unchanged. Restart the client and reset in-game to install changed hooks; existing seeds can use them. The combined patches have been validated against nine captures, including Showers and Spaceship Graveyard. Live mission-completion validation of the revised patch is pending.

Vendor-only modules such as Spaceship Graveyard use additional verified storage
in retail debug-print stubs when the vendor hook area fills up. These stubs
already return without printing; only their redundant stack spills are bypassed.
This preserves native combat XP and supports all three gain multipliers alongside
NG+ Titan purchase hooks. Unknown stub code is rejected before installation.

At the title menu, the client prints `[SAC] Start a new game` once per visit,
including before connecting to AP. It suppresses the in-level reset prompt there.
The detector uses the settled resident loader target; the previous level ID can
remain in memory at the title screen. New Game loading still arms the mandatory
gameplay hooks when the AP inventory is available.
