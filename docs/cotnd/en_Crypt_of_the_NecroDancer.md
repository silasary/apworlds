# Crypt of the NecroDancer

## Where is the options page?

The [player options page for this game](../player-options) contains all the options you need to configure and export a config file.

Crypt of the NecroDancer is not yet part of the official Archipelago suite, so that page only exists on a website that has this APWorld installed. If you are generating locally, use the "Generate Template Options" button in the Archipelago Launcher or the Options Creator once you have the APWorld installed. A template YAML is also attached to each release.

## What do I need to play?

The **Synchrony** expansion is required, as Archipelago Redux is a **Synchrony** mod. Leaving **Synchrony** out of your `dlc` option only keeps its *content* out of the multiworld; you still need the expansion to play at all.

**Amplified**, **Hatsune Miku**, and **Shovel Knight** are optional DLCs. **Amplified** adds Zone 5, Nocturna, and the No Return, Hard, Phasing, Randomizer, and Mystery extra modes; without it, Zone 5 drops out of progression entirely. The **Hatsune Miku** and **Shovel Knight** DLCs just add their characters and checks.

## What does randomization do to this game?

Crypt of the NecroDancer, by virtue of being a roguelike, is already quite randomized. This Archipelago implementation sets up a progression system for the player to work towards when playing in their multiworld by establishing goals and limiting unlocked items, characters, and zones.

### AP runs and the AP Lobby

The mod leaves the vanilla lobby alone and adds its own "AP Lobby". Stepping onto the AP Zones trap in the AP Lobby starts **AP Zones Mode**, the main run type: a descent through every zone you've unlocked, with the character you picked. There are also separate zones traps alongside **AP Zones Mode**. The victory trigger, if set to either **Ensemble** or **Boss Rush**, will also appear in the AP Lobby as a separate, locked option until the goal is completed. Shops in the AP Lobby sell multiworld checks instead of vanilla unlocks, character selection only offers characters you've received, and the NPC rooms stay locked until their item turns up. Anything you unlock there is unlocked for all future runs.

### What sends checks

In regards to this progression system, the following aspects of Crypt of the NecroDancer have been modified to send out checks on completion:

- Purchasing items in the lobby shops with diamonds
- Completing floors and zones as each character
- Completing All Zones Mode as each character
- Completing various Extra Modes as each character
- Freeing caged NPCs in zones via collecting golden/glass keys in runs
- Completing tutorial levels, including "Bomb Lore", "Trap Lore", "Dragon Lore", and "How to Get Away with Murder"
- Activating shrines for the first time mid-run
- Collecting certain items mid-run, whether generated on the floor, in shops, in chests, or in chestlike objects (e.g., barrels, crates, gargoyles)

All of these checks are configurable in the options for this "randomizer", with the defaults being lobby shop purchases, floor/zone completion, tutorial level completion, and mid-run item collection.

## What is the goal of Crypt of the NecroDancer in Archipelago?

Your goal is set in the YAML and defaults to **Story**, the one closest to the original game. Every "X" below is configurable.

- **Story**: beat the story bosses in AP runs: Dead Ringer and The NecroDancer as Cadence, The NecroDancer as Melody, and The Golden Lute as Aria. With Amplified, Frankensteinway and The Conductor as Nocturna are required as well.
- **All Zones**: clear All Zones Mode with X characters (default 6).
- **Zones**: clear X zones (default 24).
- **Golden Lute Shards**: collect X shards (default 10), shuffled into the multiworld.

### The victory trigger

Meeting your goal doesn't mean you've achieved victory by default. The **Victory Trigger** setting adds one last step, and defaults to **Ensemble**:

- **Disabled**: you win as soon as the goal is met.
- **Ensemble**: clear an AP Ensemble run with the characters you've unlocked.
- **Boss Rush**: beat four zone bosses and four story bosses in sequence, or five and five with Amplified, The first boss room opens with a Red, Black, and Purple chest, and a shop exists midway into the run.
- **Expensive Purchase**: buy one very expensive item in the AP Lobby, at a diamond price you set.

Ensemble and Boss Rush both need every zone unlocked first.

### What happens when I die?

Nothing but the run. Every character, item, shrine, NPC, and zone key you've received stays unlocked and is waiting the next time you venture into a run. You only lose what you picked up off the floor during that run.

## Can you play multiplayer?

Yes, you can have a single multiplayer instance as one world in the multiworld. All the players involved need to have the Archipelago mod, but only the host needs to configure the Archipelago options. When someone finds an item for your world, all connected players will receive a copy of the item. This includes traps, which many of the traps can be quite detrimental on their own.

When a check is completed related to floor, zone, or All Zones mode completion, all connected player characters will send out their respective checks. This means that a group who completed Floor 2 of Zone 1 as Cadence and Aria will complete the *"Cadence - Zone 1 - Floor 2"* and *"Aria - Zone 1 - Floor 2"* checks.

DeathLink, if enabled, will trigger by default when all players die in the run. This can be changed to each player dying in the run as well in the YAML.

## What Crypt of the NecroDancer items can appear in other players' worlds?

Nearly everything the lobby would normally hand you is an item in the multiworld instead:

- **Characters**: every playable character, including the DLC cast. You can't pick a character until its item shows up.
- **Equipment**: weapons, rings, scrolls, armor, shovels, headwear, footwear, torches, shields, and spells.
- **Actions**: food, potions, drums, throwing stars, and familiars.
- **Misc**: charms, heart containers, the Compass, the Backpack, and other oddities.
- **Shrines**: a shrine won't show up in your runs until you've received it.
- **Weapon materials**: Blood, Glass, Gold, Obsidian, Onyx, and Titanium. Same deal as shrines: no material, no weapons made of it.
- **NPCs**: Merlin, the Codex, the Janitor, the Diamond Dealer, and the Hintmaster. Each one unlocks the matching room in the AP Lobby.
- **Zone access**: keys to the zones, either one progressive item or a separate key per zone.
- **Extra modes**: No Return, Hard, Phasing, Randomizer, Mystery, No Beat, Double Tempo, and Low Percent, each unlocked on its own.
- **Upgrades**: permanent health, extra starting potions, a coin multiplier, shop restocks, extra chests per zone, the Character Room Key, and Golden Lute Shards. Most of the help can be turned down or off at the AP Lobby if you'd rather do without it.
- **Character-specific buffs**: one per character, to take the edge off the harder ones.
- **Filler**: diamonds, gold, bombs, grenades, full heals, and other temporary items.
- **Traps**: anything from mildly annoying to genuinely nasty. All of them are listed in `traps.md`, alongside this page.

## When the player receives an item, what happens?

Items show up right away, wherever you are when in a run. If you have the chat enabled, the item will also be recorded in the chat. This goes both ways; completing a check will report what you sent in the chat. In regards to item specifics:

- Ordinary items land on the floor next to you, ready to pick up. A weapon that arrives halfway through Zone 3 is spawned immediately. An item received on floor completion will spawn on the next floor in the next floor's starting room. An item acquired in the lobby will not spawn.
  - Unlocked items apply the moment they arrive and stay in consideration for item generation from then on.
- Traps that arrive while you're in the lobby wait until you're back in a run.

## What does another world's item look like in Crypt of the NecroDancer?

Items will show up as the Archipelago logo in Crypt of the NecroDancer, albeit changed depending on their item classification and more saturated to fit the CotND sprite theming. Filler items are grayscale, progression items have a yellow arrow pointing upwards in their bottom right, and trap items are miscolored.

## Is Archipelago Redux compatible with other Crypt of the NecroDancer mods?

Most Crypt of the NecroDancer mods should work with Archipelago Redux (the CotND AP mod), however mods that drastically change level/item generation will likely interfere with location accessibility. Additionally, any non-vanilla/DLC characters being played as will not send character-specific checks. Most common mods, however, should work just fine with Archipelago Redux. Do note that modded items will not spawn "naturally" in AP runs considering item generation logic has been changed to look at the AP item bank, not default item pools.
