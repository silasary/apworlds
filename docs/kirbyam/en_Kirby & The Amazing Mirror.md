\# Kirby \& The Amazing Mirror



## Where is the options page?



- As this is a custom AP world you will need to first install Kirby & The Amazing Mirror's apworld, then run the Archipelago launcher and open Options Creator. Select Kirby & The Amazing Mirror and your options and then choose your save destination.
- If you prefer to setup your options via a standard yaml file, you will need to first install Kirby & The Amazing Mirror's apworld, run the Archipelago launcher, and select the Generate Template Options. A file explorer will open which you can then locate the Kirby & The Amazing Mirror yaml file to edit.



## What does randomization do to this game?



- Progression & useful items which the player would normally acquire throughout the game have been moved around. (Mirror Shards, Maps, Vitality, Sound Player)
- Normal copy ability enemies can be randomized to give a different copy ability. When using `shuffled` mode, a spoiler log includes the enemy to ability assignments.
- Enemies which typically do not give abilities can be randomized to give abilities.
- Minny can be kept vanilla with the `ability_randomization_minny` toggle while still randomizing other enemy ability sources.
- Enemies that cannot be swallowed are excluded from the enemy copy-ability randomization pool.
- The chance for an enemy to not have a copy ability can be controlled via the `ability_randomization_no_ability_weight`
- Ability statues (sometimes called ability trophies or ability stands) have a dedicated boolean toggle (`ability_randomization_statues`). With the toggle off, statues retain their vanilla abilities. In `shuffled` mode, each statue keeps one seed-deterministic assignment, which appears in the spoiler log. In `completely_random` mode, a regular statue makes a fresh draw every time its grant is triggered; independent draws may still repeat by chance. Statue draws use the configured ability whitelist, respect `ability_randomization_minny`, and remove gated abilities until their AP unlock items are received. Statues always draw an ability when at least one eligible ability remains and intentionally ignore `ability_randomization_no_ability_weight`, `ability_randomization_passive_enemies`, `ability_randomization_minibosses`, and `ability_randomization_boss_spawns`. The Master Sword stand is not treated as a regular randomized statue.
- All 25 AP ability items are listed in `data/items.json` with stable item IDs, labels, classifications, and tags for trackers. Beam, Burning, Cutter, Mini, Stone, and Wheel are guaranteed starting items. `Ability Gating` defaults on under `Make the game harder`; when enabled, the other 19 ability items enter the pool and unlock their matching abilities when received. With gating off, those unlock items are omitted from the pool. `data/abilities.json` retains the runtime IDs and gating policy. Receiving an ability item grants ownership, not an immediate ability change.



## What items and locations get randomized?



Locations in which items can be found:
- All Big Chests
- All Mirror Shards
- All Rooms (Optional, not enabled by default)
- All Levers
- All Big Switches
Items that can be shuffled:
- All Mirror Shards
- All Maps
- All Vitality
- Sound Player
- All consumable items (Small Food, Energy Drink, Hunk of Meat, Cell Phone Battery, Max Tomato, Invincibility Candy)


## Common Item/Location Options

KirbyAM supports the standard Archipelago common options for item and location control:

- `local_items`: force selected item names/groups to stay in your world.
- `non_local_items`: force selected item names/groups out of your world.
- `start_inventory`: begin with selected items precollected.
- `start_hints`: begin with hints for selected item names/groups.
- `start_location_hints`: begin with hints for selected location names.
- `exclude_locations`: remove selected locations from placement.
- `priority_locations`: bias selected locations toward important item placement.
- `item_links`: configure linked/shared item pools across players.
- `plando_items`: explicitly plan item placement.

Use exact item/location names from this world (or the item groups listed above) when configuring these fields.



## What other changes are made to the game?



- There is an optional setting to enable one-life mode (no_extra_lives). If you die you are instantly sent back to the Hub, and any 1Ups you receive will be immediately removed.
- For a fixed one-hit challenge, set `minimum_health: 1` and `maximum_health: 1`. This removes Vitality Counters and healing filler from the pool. For a one-hit start with four upgrades, use `minimum_health: 1` and `maximum_health: 5`.
- Filler items use weighted generation rather than equal odds. Current whole-number weights are: Cell Phone Battery 25, Energy Drink 17, 1 Up 15, Max Tomato 15, Small Food 14, Hunk of Meat 9, Invincibility Candy 5.
- Goal modes:
  - `dark_mind`: Defeat Dark Mind to complete the seed.
  - `defeat_any_area_boss`: Defeat any one `* - Boss Defeat` location (Mustard Mountain, Moonlight Mansion, Candy Constellation, Olive Ocean, Peppermint Palace, Cabbage Cavern, Carrot Castle, or Radish Ruins). In this mode, collecting all Mirror Shards is not required by the goal mode itself.
    - Candy Constellation's Master Hand + Crazy Hand fight is treated as one pooled boss target (`BOSS_DEFEAT_3`).
  - `defeat_area_boss`: Defeat the area boss selected by `configured_area_boss`. The default is Master Hand + Crazy Hand (`BOSS_DEFEAT_3`). Set `configured_area_boss` to `random` to have Archipelago choose one of the eight area bosses during option parsing. The old name `defeat_configured_area_boss` remains accepted as a compatibility alias. Replace the removed `defeat_random_hidden_area_boss` with `goal: defeat_area_boss` plus `configured_area_boss: random`.

### Using Archipelago's built-in `random` choice

`configured_area_boss` and `starting_kirby_color` are normal Archipelago `Choice` options. You can replace the entire generated weight mapping for either option with the scalar value `random`:

```yaml
configured_area_boss: random
starting_kirby_color: random
```

Archipelago resolves each `random` value to one concrete choice during option parsing. The generated weighted template lists only concrete choices, so `random` is documented in comments rather than appearing as another weighted sub-option.



### Custom health

`minimum_health` sets Kirby's starting HP capacity and `maximum_health` sets the
capacity after every Vitality Counter. Both accept whole numbers from 1 to 10.
The defaults are 6 and 10. Set both values together, for example:

```yaml
minimum_health: 8
maximum_health: 10
```

This starts with 8 HP and places two unique Vitality Counters, each adding 1 HP.
Equal values give a fixed capacity with no counters. The maximum must be at
least the minimum and at most 9 HP higher: there are nine unique counters.
Unsupported pairs fail generation with an explanation; they are not silently
changed. If using weighted/random values, every possible pair must satisfy
these constraints.

Minimum Health is a starting capacity, not a damage floor. Kirby can still
lose HP and die. Minimum/Maximum Health are now the only public health controls.
The old `one_hit_mode` selector is hidden from templates and option groups.

Older YAML files still work: `exclude_vitality_counters` (or `1`) converts to
`minimum_health: 1` / `maximum_health: 1`; `include_vitality_counters` (or `2`)
converts to `1` / `5`. Generation prints a migration warning and preserves the
old preset's precedence if custom bounds are also present. Replace that legacy
key with the displayed bounds. `off` leaves the custom bounds unchanged.
New seeds store only the resolved min/max values; existing seeds retain their
legacy client behavior. No item IDs or native save fields change.

Starting at 1 HP excludes Health Down Trap from the pool and suppresses its
native effect. Fixed 1/1 health also excludes healing filler. Other health
ranges retain their normal filler/trap policy. Newly generated ROMs embed the
resolved bounds for native health initialization; the connected client still
reconciles AP ownership after the tutorial. Fresh emulator acceptance remains
separate from generation and host-function tests.


## What does another world's item look like in Kirby \& The Amazing Mirror?



When you find an item that is not your own, you will be able to see what it was and who it was sent to in both Bizhawk and the Archipelago Bizhawk client. The sprite for the item will still appear, but you will need to receive it via Archipelago before it's usable. When collecting a mirror shard check, the cutscene will still play as if you've received the mirror shard, however it will not be given until you receive it properly via Archipelago.

If an item sends to your own slot, BizHawk shows one local confirmation line (`You found your <item>.`) instead of separate send and receive popups.



## When the player receives an item, what happens?



You will not see an indicator in the game, instead you'll see you received an item from the client window.



## Trackers



Currently a tracker is not available. Goal logic depends on the selected mode: either defeat Dark Mind, defeat any one area boss in `defeat_any_area_boss` mode, or defeat the selected `configured_area_boss` in `defeat_area_boss` mode.



\# Can I play offline?



Yes, the client and connector are only necessary for sending and receiving items. If you're playing a solo game, you
don't need to play online unless you want the rest of Archipelago's functionality (like hints). If
you're playing a multiworld game, the client will sync your game with the server the next time you connect.



## Acknowledgements



\[jiangzhengwenjz](https://github.com/jiangzhengwenjz) and other contributors — creators of the \[Kirby \& The Amazing Mirror disassembly](https://github.com/jiangzhengwenjz/katam), which was instrumental in understanding ROM internals for this integration.


## Starting ability unlocks

Beam, Burning, Cutter, Mini, Stone and Wheel are a fixed starting set. New seeds
precollect their AP unlock items, so they appear in starting inventory, received
history and trackers. An unlock grants permission to acquire the ability through
normal gameplay; it does not equip an ability. These six remain usable before
connecting to the server or receiving mailbox deliveries.

This fixed set is precollected with `ability_gating` both on and off. When gating
is off, all abilities remain usable and no ability unlocks enter the shuffled
pool. With gating on, the other unlocks retain their existing pool and gate rules.
The six starting items never consume location slots.

If `start_inventory` explicitly includes one of these six, its requested positive
count is retained and no automatic copy is added. Counts above one are redundant
ownership grants and never equip or stack an effect. Other explicit starting items
retain their usual behavior. There is no new starting-ability selection option.

Use a matching updated APWorld/client for new seeds. Existing seeds retain their
original inventory and gate policy; the client does not insert starting packets
into old histories. Reconnect/reset recovery rebuilds ownership from server history,
while the native bootstrap keeps the fixed starting permissions available offline.
The six useful items are tracked in CollectionState without adding traversal gates.

The unchanged native unlock handler and gate bootstrap are covered by host tests;
these tests are not emulator save/load acceptance. Fresh live acceptance of this
inventory representation remains pending.
