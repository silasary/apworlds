# Rusted Moss

## What does randomization do to this game?
The location of items and abilities are randomized. The ability to teleport is granted to the player at the start, and the player can open the pause menu and press F5 to teleport to the first teleporter. The Maya boss fight in the Factory Roof which teleports to the player to the Snowy Outpost upon defeat is always there so the player can get teleported to the Snowy Outpost again. Some blocks which block the entrance to the Bonnie fight after it has been completed have been removed.

## What Rusted Moss items are randomized?
* Content that was added in the Major Content Update is not yet supported (the new trinkets and grappling hook reset on kill upgrade)
* Abilities such as the grappling hook, the grappling hook pull upgrade, the infinite use grappling hook, charge jump, grenade
   * The grappling hook items are treated as progressive upgrades, the first you receive will let you use the grappling hook, the second will let you use the upgraded grappling hook, and the third will let you use the infinite grappling hook.
* Titania Pieces
* HP, MP, and TP upgrades
* Fae Silver
* Flags
* Weapons
* Trinkets

## What does another world's item look like in Rusted Moss?
Most locations in Rusted Moss have been replaced by an image of the archipelago logo. Some locations are sent automatically depending on the gamestate and may appear as if they were obtained normally.

## Known Limitations and Issues
* Many of the yaml settings are drastically underused with some only being considered in one or two rooms.
* The damage boost yaml options could potentially create an unbeatable seed because the logic makes no consideration for the player health needed to traverse consecutive rooms. I think this is extremely unlikely to happen based on how little those skips are required.
* No check for if the player has the TP to equip all required trinkets for logic is in place.
* Logic for combat arenas was always assumed to be doable based on room traversal alone, no accounting for the difficulty of the encounter was considered. This ties back to the hard combat yaml option being underused.
* Logic for bosses is similarly lacking, it does include loose logic for what would be required to do the fight hitless, but for some of the later bosses this is an unreasonable expectation to make of the player.
* Logic heavily relies on the player quick switching between weapons using the number keys to stack knockback. Logic that has this expectation should probably be put behind another yaml option to allow players on controller or players who are not comfortable with quick switching to generate beatable seeds.