# Pokémon Ranger: Shadows of Almia

**NOTE** Currently this is a randomizer only. The archipelago connection is still being worked on.

## Where is the options page?

There is no options page.
You can generate a default YAML by opening `Archipelago Launcher`, and clicking
`Generate Template Options`. This then opens a folder where the YAML can be found
as `Pokemon Ranger Shadows of Almia.yaml`

## What does randomization do to this game?

Pokemon randomization can change the following.
- Wild encounters
  - Excluding Doduo and Staraptor
- Static encounters
  - Excluding boss encounters
- NPC Pokémon (WIP)
- Partners

Multiple algorithms are (not yet) possible for wild encounter randomization.
As a base this randomizer ensures the 
story is always beatable, by iterating over wild encounters
as they become accessible in the story and placing required field moves amongst all currently accessible spots.

Movement field moves such as swim, river flow or airlift have multiple copies placed such that moving back and forth over their terrain is always possible.

Quest required pokemon are placed across all potential spots.
Static encounters are filled such that they have a similar HP to their original counter part. Remaining wild spots are filled randomly, ensuring one of each species exists in the wild.

**NOTE** This rando spans the full story, the randomizer does **NOT** randomize postgame or ensure postgame quests are beatable.

## What items and locations get randomized?
Locations
 - Browser entry
 - Mission clear
 - Quest clear

Items
- Field move unlocks
- Level cap unlocks
- ...

## FAQ

- ***How do I set up this game?***
  <br>If you're new to setting up a custom apworld, type `&apworld` into the `#aginahbot-spam` channel on the 
      Discord server for more information.
  <br>Other than that, follow the [setup guide for this game.](setup_en.md)
- ***Why is there no Archipelago support yet***
  <br>I ended up making a randomizer along the way, and preferred to complete that first as a basis
- ***I want to contribute to development, how can I do that?***
  <br>Sounds great. Propose your ideas/changes in the game's channel and we can discuss there.

## Rom Changes
If you're interested in an incomplete list of things modified on this rom [see here](ROM%20changes.md)

### Known bugs

Certain maps have some bugged sprites, this is due to the games VRAM for entities being exceeded.
Maps such as Vien Forest's first room, the port in Puel Town and a couple others
suffer from this. Future changes will limit the unique entity count on these maps.

## Credits

I would like to thank several people for making this project possible.
Thank you happylappy and Chesyon for the large work put into dissassembling and their large knowledge on NDS modding.
Pokemonlover1234 for being there from the start, Lucarr10 for helping with sprites and other file formats
and everyone else who chimed in or helped test during development of the randomizer.
I'd also like to explicitly thank Fexean for creating almiascript years ago.
