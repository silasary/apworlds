# <img src="../data/sprites/isles_of_sea_and_sky_obsidian.png" alt="" width="64"/>Alt Room Randomizer<img src="../data/sprites/isles_of_sea_and_sky_obsidian.png" alt="" width="64"/>


## Required Software

- Isles Of Sea And Sky from the [Steam page](https://store.steampowered.com/app/1233070/Isles_of_Sea_and_Sky/)
- Isles Of Sea And Sky [APWorld](https://github.com/Kim-Delicious/Archipelago_IslesOfSeaAndSky/releases)
- Archipelago from the [Archipelago Releases Page](https://github.com/ArchipelagoMW/Archipelago/releases)
- UndertaleModTool from [Its Releases Page](https://github.com/UnderminersTeam/UndertaleModTool/releases/tag/0.8.2.0)
- Import and Export Scripts in the APWorld

## Getting Started

- Open UndertaleModTool
- Using UMT, open required `data.win` from its install location.
- Pick which Room you want to make an Alternate version of.
- GO CRAZY! (but not too crazy as there's lots of bugs)
- Install community scripts for UMT
- Export all rooms
- Find your modified room and put it somewhere safe.
- Rename it using this convention: `rm_island_coord_author_number`, an example of this would be `rm_ancient_b3_kimdelicious_00`
- Move it/a copy into its corresponding folder location in 'Alt Rooms', the path should look something like this: `Alt Rooms/Ancient Isle/B3/rm_ancient_b3_kimdelicious_00.json`
- Play the game with the Alt Room Randomizer enabled!

## Share your work!

The main goal of this randomizer is to mix-n-match all the puzzle variations that the community makes,
and if you keep all the fun to yourself all us puzzle-heads will get tired of the same ol' room versions.
*Really this is just me being selfish.* Please send us your puzzles, I'm begging you!


## BEWARE

There's a bunch of quirks with the current implementation of both UMT, and the Alt Room Randomizer,
and some of them will break things. So here's your official forewarning.

- DO NOT CTRL-C, CTRL-V objects!
  - This copies the instance ID, which messes everything up even if you delete the object. As it stands, this requires a full restart of room-making. (Though you can export/import the tile layer without issue) 
  - **Instead**, just drag the obj from the list into the scene, and modify it manually to your specifications.


## FAQ

### General Qs

#### Why an 'Alt Room' Randomizer instead of an Entrance Rando?

In games like Elden Ring, and other open world games, a limitation on where the player can go
provides a lot of fun challenges, such as fighting bosses that might be overlooked using equipment, 
and items at times they normally wouldn't touch.

In Isles of Sea And Sky, most of the challenge is baked into the puzzles themselves rather than 
finding ways to get to them with fewer resources. While I'm certain there's some merit for an Entrance Rando for this 
game, I think there's more potential with Alternate Puzzles. With these we have a chance to provide way more
numerous, and interesting challenges to the player! 

Additionally, I just think it's fun to build puzzles, and that's especially true in a community. I 
like the idea of people sharing their work with each other, and that becomes even more exciting with a mix-n-match that 
provides novel combinations on every new playthrough!

### Development Qs

#### Objects will not load different creation code, or pre-creation code

This may be due to how UndertaleModTool work, or just a quirk of CicadaGames coding. 
Most objects in the game, when placed by the randomizer don't spawn with some code working. 

One example is `snake_block_180`, which does not spawn with the correct rotation, and needs to be
changed in the .json file manually.

Or perhaps the problem is with the export script itself, as pre_create_code always reads as `undefined`, in the .json
so if, for instance, you wanted to remove pre_create_code from an object, that would fail.


#### Some objects aren't spawning at all!

This is likely a bug, but I believe it pertains to how the randomizer is using instance IDs to
move preexisting objects around. (It works this way to preserve IDs for archipelago locations).

One workaround is to place multiple copies of the object in the same space.

