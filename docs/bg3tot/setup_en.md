## BG3 Trials Setup

This world replaces the normal BG3 progression flow with a Trials of Tav focused Archipelago mode.

Checks come from Trials activity such as clears, kills, perfect clears, RogueScore milestones, and randomized tav shop purchases.

### Required Files

Install the generated AP world:

- `bg3tot.apworld`

Install this BG3 mod:

- `ArchipelagoToT.pak`

### BG3 Mod Manager Order

Enable:

1. `Archipelago - Trials of Tav`

After setting the order, save and export it to the game before launching.

### Archipelago Connection

Start `Baldur's Gate 3 - ToT Client` from the Archipelago Launcher first.

Then use the in-game `Archipelago Client` tab in the Trials GUI for:

1. room connection
2. disconnect
3. resync
4. log viewing

The in-game tab mirrors the standalone client status/log and can send those actions to it while the client is open.

### Goals

- `buy_ng_plus`
  Buy the local `NG+ / Quick Start` shop unlock.
- `clear_stages`
  Complete the configured number of Trials clears.
- `reach_rogue_score`
  Reach the configured RogueScore total.

### Key Options

- `death_link`
  Enables Archipelago DeathLink for this slot.
- `death_link_trigger`
  Choose whether local DeathLinks send on a full party wipe, any active party member death, or any active party member down.
- `death_link_punishment`
  Choose what happens when a DeathLink is received: wipe everyone, down or kill one party member, drain all resources from everyone or one random party member, remove only actions/bonus actions/movement from everyone or one random party member, or do nothing.
- `goal_ng_plus_fragment_gate_percent`
  Hides `NG+` until the chosen percentage of Shop Fragments has been collected. If Progressive Shop is disabled, this gate turns itself off.
- `goal_ng_plus_price`
  Local shop price for `NG+`.
- `clear_check_count`, `kill_check_count`, `perfect_check_count`, `roguescore_check_count`
  Total number of checks available from each activity group.
- `*_check_interval`
  How often each activity awards a check.
- `progressive_shop`
  Locks randomized AP shop checks behind progressive `Shop Fragment` items from the multiworld.
- `progressive_shop_unlock_rate`
  How much of the randomized AP shop each received `Shop Fragment` unlocks. Lower values create more fragments and more sections.
  The first `Shop Fragment` is forced into this slot's early local checks, and the first two checks in each shop section are treated as priority progression spots.
- `shop_check_count`
  Minimum number of catalog entries turned into AP shop checks. The world auto-expands this upward when needed so every configured non-filler unlock copy still appears in the randomized item pool.
- `shop_price_minimum`, `shop_price_maximum`
  Seeded random price range for AP shop entries, rounded to multiples of `10`.
- `vanilla_pixie_blessing_in_shop`
  Keeps Pixie Blessing as the normal local 30-cost shop unlock and removes it from the randomized AP shop pool.
- `permanent_buff_target`
  Character-bound useful AP unlocks can go to the receiving player, a random party member, or the whole party.
  Progression rewards keep their whole-party or global behavior, and the Roll Loot rewards ignore this setting.
- `traps_percentage`
  Percent of filler items that become traps.
- `enabled_traps`
  Trap types allowed in the filler pool.

### Shop Behavior

AP shop entries do not grant their original reward when purchased.

Instead:

1. Buying the entry sends a shop location check.
2. The original reward exists in the Archipelago item pool.
3. The reward is granted only when that AP item is received.

If `progressive_shop` is enabled:

1. The randomized AP shop is split into visible sections.
2. Each received `Shop Fragment` unlocks the next section.
3. Locked future sections stay hidden until their fragment is received.

`NG+ / Quick Start` remains a normal local shop unlock.
If `vanilla_pixie_blessing_in_shop` is enabled, `Pixie Blessing` also stays as its normal local shop unlock.

### DeathLink Behavior

If DeathLink is enabled:

1. Local Trials deaths send a DeathLink based on the selected trigger mode.
2. Received DeathLinks apply the configured punishment.
3. The default punishment wipes the active party, companions, and summons so the player reloads their most recent save.

### World Name

In Archipelago, this world appears as:

- `Baldur's Gate 3 - ToT`

This keeps it separate from the original BG3 Archipelago world.

### Validation

While playing, the merged mod writes progress to:

`%LOCALAPPDATA%\Larian Studios\Baldur's Gate 3\Script Extender\ap_out.json`

Working runs should produce entries like:

- `TOT-CLEAR-001`
- `TOT-KILLS-001`
- `TOT-PERFECT-001`
- `TOT-SHOP-001`
- `TOT-GOAL-001`
