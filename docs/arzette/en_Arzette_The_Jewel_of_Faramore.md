# Arzette Archipelago randomizer

## Differences

Due to the way the game is coded, and the nature of the need for randomization and unpredictability, the modded game behaves slightly differently than the base, unmodified game. Here are some of the differences.

- All items are "dropped" by NPCs, including those that were previously granted in cutscenes. Arzette will need to collect all items with her smart sword instead of relying on them being passively given to her.
    - This includes NPC quest rewards, rocks, and jewel shards after defeating bosses.
    - The capacity upgrades are represented by the heads of the NPC that hands them out.
    - The Fort Dungeon Key and the Ogre Hair can be notoriously hard to see depending on the background where they spawn.

- To defeat Daimur, five jewel shards are required to be collected, in addition to collecting Purple Magic/The Sword of Faramore.

- Bombs have been added as a specific unlockable item, associated to a new location at the very start of Forest. Any bombs collected before unlocking them will be lost.

- All keys are non-fungible (unique). They technically are in the vanilla game, but there is no actual way of knowing which one you collect except by going to the appropriate level and look for it in the bottom right corner - and test the specific door if there are multiple keys in the level. A modification of the key sprites has been done to accomodate this. Here are the acronym for the keys
    - FT: Faramore Town
    - DF: Durridin Forest
    - AD: Anju Desert
    - CC: Creece Canyon
    - NS: Norin Swamp
    - CH: Chillinax Peaks
    - BC: Boanjale Crypts
    - BB: Badonc Beach
    - RR: Ryha River
    - LH: Lichen Hills
    - FF: Fort Findula
    - DC: Dennys Castle

- All items in the trading sequence can be held simultaneously. This is not the case in the vanilla game. However, the trading quest menu will be glitched, so one has to remember which item have been collected - unless using the "vanilla", "random_start" or "excluded" option for trading_sequence in the yaml.

- NPC requirements are local. For example, normally, Cypress needs 3 plants to give the Lamp Oil Upgrade in Faramore. If Cypress' randomized location is now in Caves, then he will be there, but still ask for 3 plants to give an item.

- NPC requirements have been locked behind an appropriate order activation. For example, if you already have rocks before talking to Faramore Munhum, the rock quest will still be activated appropriately instead of being already completed. If you already have the Sacred Oil and Chains before talking to Alven, he will give you his first item (Fort Findula Dungeon Key in vanilla) before the Chainsword reward. If you already have 250 souls, Zazie will still ask for Sacred Oil before activating the souls quest, and so on.

- Some spawn locations for items are slightly modified to accommodate different item sizes.

- Bonus scrolls do not despawn, and can be replayed infinitely. Yes, this includes the "Collect Rubies" ones.

- All quests and NPC spawning rules (except for the rock quest) are already activated.
    - Dewey does not need Purple Magic to be talked to
    - Fairy does not need the switches to be hit to spawn
    - Faramore Munhum will spawn without having to collect the Rope and unlock Swamp
    - Faramore Kari will spawn without having to collect the Bomb Gauntlet and unlock Castle
    - Faramore Frich will spawn without giving Sawmp Frich the Golden Fly and unlocking Volcano
    - Faramore Barnabuss will spawn without having to collect Griffin Boots and unlock Hills
    - Faramore Cypress will spawn without having to collect Lantern and unlock Swamp
    - Crowdee will spawn without having to defeat Cornrad

## Known bugs

- The game cannot load if the connection information is wrong. You need to manually edit or delete the `apconfig.txt` file from the save folder to fix this.

- Changing the connection information from within the game by pressing Y needs a reboot.

- Connecting to another player from the same seed will not reset the save file.

- The names of received items in the client's messages are sometimes not exactly the same as the real item's name.

- Entering a Bonus Scroll from another level, and then Save & Exit to Map allows you to enter the level the vanilla Bonus Scroll is from, even if it isn't unlocked.

- The Power Pendant, Reflector Ring, the Chainsword trading sequence items (and possibly some others) might not be rendered in the inventory because of conflicts with the other items that can spawn in that inventory slot.

- The pillars to spawn the Fairy in the Desert cannot be activated, since the Fairy location is already spawned.

- Killing Beeves with the Chainsword will make the Jewel Shard spawn on the other side of the room.

- The Hills barn will show a beacon light emanate from it if the Hills beacon is activated, no matter where that Hills beacon was.

- Any bonus scroll will show as already completed with their spawned item present if its specific rubies reward was already received elsewhere.

## Game info

Some game information might not be known from all players, but are expected to be known.

- You can press Start to Save and exit to map at any time. It is possible to get stuck in a few levels, so you might need to leave that way.

- You need to press L to switch between Red and Blue magic. This is easy to forget.

- You can kill magic-colored Poultures (the flying pterodactyl-like enemies) with the Fatal Flute.

- You can kill magic-colored Boarfoons by reflecting their thrown daggers on them.

- To spawn the Rudy Races, you need to have a certain amount of Coins (1 for Forest, 5 for Peak and 10 for Hills) and then visit his cave in Faramore (wether he is in the cave or not). Visiting his cave between races is necessary to reset his spawn so he can spawn for the next race.

- Rocks cannot be collected with your sword unless you either talked to Faramore Munhum once, or you already have a rock in your inventory (received from someone else).

- You can break the big rock in Forest for the Golden Fly with the Bomb Gauntlet by standing on the right of it.

- The Hills Key is the only item that has a specific rule for spawning, mainly playing the Flute. This means that if a certain location is empty, it is probably the Hills Key, and you'll need to play the Flute to spawn it. You will need to know every location in the game to spot when a location is empty, and therefore, including it in the pool is its own option in the yaml. Note that the other explanation for an empty location could be the Shield Ring if you already have the Reflector ring to do the previously mentioned bug.

- Enabling the tricky jumps option in the yaml will mean that the following will be in logic:
    - You can jump on the Faramore shop's roof from the platform above the well with the Winged Belt to access the top left part of the town.
    - The Forest Rudy Race normally spawns a barrier on the left forbidding you from using the shortcut with the Griffin Boots. However, you can despawn it by entering and leaving the tree sub area on the right.
    - The Desert Key can be accessed from the right with the Griffin Boots, or the Winged Belt and Speedy Shoes combo.
    - The Desert Beacon can be accessed without breaking the barrier with a well executed double jump.
    - The Canyon Candle at the end of the first area can be accessed with a jump from a platform on the left with the Winged Belt and Speedy Shoes.
    - You can reach Odie's platform in Motte's house with a double jump and bypass the barrier.
    - The Swamp Bonus can be accessed without the Griffin Boots by jumping from the ladder with the Winged Belt and the Speedy Shoes.
    - You can get in the Swamp Empty house with a double jump and bypass the barrier.
    - You can destroy the barrier to access the Crypts Coin with the Double Wave or the Bomb Gauntlet, but you need to be in a *very* precise position.
    - You can technically avoid getting hit by all the enemies in the Volcano without any items.
    - You can collect the Volcano Coin with a well placed Backstep from one of the platform on the top left, or with the Winged Belt
    - The left pillar on the Beach for the Key to Tork's cabin can be hit with a Bomb, the Sword Wave or the Smart Gun from the leaf of the tree.
    - The right pillar on the Beach for the Key to Tork's cabin can be access by a well timed jump from the front of Tork's cabin, with the Speedy Shoes.
    - The Hills Bonus (the one where you start in the middle and need the double jump to get out to hit the targets) can be completed with either the Fatal Flute, or by hitting one target at a time from the middle with perfect accuracy and some luck with the target spawn timing.
    - Nodelki can be beaten with only the Winged Belt.

## Randomizer info

- Universal Tracker will list as collectable the items that spawn from others (quest items from NPCs and Bonus Scroll Rewards). You *will* need to remember where that spawner is, since the spawner (the NPC of the Bonus Scroll) location can be randomized.
    - If you cannot find a certain spawner (NPC or Bonus Scroll), use the `/get_logical_path` command followed by the location name to find in which level the spawner is.
    - Another way is to edit the `host.yaml` file in your Archipelago folder, search for the `universal_tracker` section and to set `include_region_name` to true, which will show the region for all the checks.
    - For quest needing multiple NPCs (Faramore Munhum for the rocks quest, Forest Cypress for the Citizenship papers), you will need to remember them. Make sure you talk to Munhum and Cypress as soon as you see them, it should avoid having to track them back.

- Universal Tracker will assume that every local item (except for beacons) are already collected. This will matter if you did not randomize the Hills Key, then as soon as you have access to the Music Shrine, Universal Tracker will list the location inside the Hills barn as collectable.

- You cannot randomize barrier types without also randomizing the coins location. This is because randomizing barrier types makes the Crypts coin location inaccessible (that particular barrier can only be broken by the flute and cannot be punched or hit).

- You need to shuffle at least one common item pool (npcs, bags, cadles, keys, coins or upgrades) if you want to shuffle beacons, since that beacon will need to spawn locally and needs at least one location to spawn in in every level.

The following limitations are due to the way the game is coded and would need refactoring to be lifted.

- Bonus Scrolls, NPCs and Beacons can be randomized, but they will always spawn in your own game world.
- Faramore NPCs that provide quests cannot be spawned from other objects (NPCs or Bonus scrolls).
- Frich, the Rudy Races, and Mortar (the shop) are not part of the randomization pool.
- Every bag, coin and candles are uniquely identified and not fungible.
- Beacons can only unlock levels and not items.