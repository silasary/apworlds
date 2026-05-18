# Undertale 2

## What items and locations are randomized?
Any item pickup, party member recruit, unique boss drop, shop equipment, and NPC gifts are locations by default.  Additionally, fishing missions, enemy cards (checked by using the card in your inventory), and aquarium donations can be locations depending on yaml settings.

Shop locations will have a seperate "AP Shop" menu to send those checks out.  Shop equipment will become purchaseable from their original shop locations after recieving it's corresponding item (For example, you will be able to buy more paper hats from the ruins shop once you recieve it from the apworld).

## What is the goal condition?
Goal can be determined by your yaml settings.  Current goal options are:
- `Fake Ending` - Triggered upon going through the border and seeing the credits

Locations only accessible post goal will be automatically excluded.

## What other changes are made to the base game?
Added a few new NPCs to allow for backtracking, namely:
- An NPC now appears in the Archives pit to allow you to go back to the Ruins before getting the library key
- Truckfreak now shows up in the prison and will let you return to the prison after it blows up
Due to the new backtrack path to the prison, homer guards and prison ticks now have their cards in their drop table again.  Additionally, you will be able to bring the rest of your party to the first half of the prison.

Aquarium donations no longer have to be done in order, it will instead automatically take any fish that still need to be donated out of your inventory.

If `shuffle_relax` is enabled, you will need an additional `Relax Pass` to fight the next relax boss.

Character swap orbs start unlocked from the beginning, instead of unlocking just before Cirno.

Gilded☆Bingus in the Ruins Lake has it's encounter chance dropped from 1/100 -> 1/20.

P Capsules are now non consumable

## Is there a tracker?
[Universal Tracker](https://github.com/FarisTheAncient/Archipelago/releases/latest) is supported and has an embedded map tracker available.

## Where can I play the original game?
You can find it on it's [itch.io page](https://pep.itch.io/undertale-2)