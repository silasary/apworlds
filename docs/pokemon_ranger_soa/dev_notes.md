
NOP: E3A00000: mov r0, r0
copy paste: 0000A0E3


# Version

Development and testing was done on a decrypted rom
NTR-YP2E-USA
csr32: 5f520677


# ROM


ARM9 has an offset of 1FFC000 from its ram address



PokeID has a ROM address of 02BF1A00

letss try editing directluy in 02BF1A40 

# logic
    Vien forest can't be reached before starting mission 3 
    mission 3 complete screen is shown in the forest
    
    mission 3 has the burned area blocked before its complete, 
    and going up in vien forest is also blocked

    Mission 4, going up out of pueltown obviously blocked
    Completing the dim sum issues still won't open it up


Partner pokémon potential patch that you can get it with you:
around 0x020 15DA8, can't read in ghidra for some reason
Changing that to a 
LDRH R1, [R6, R4]
Hex: E19610B4
Little endian in ROM: B4 10 96 E1
will load the current slot 1 pokémon, copying it into after a screen
reload.
    
020 15D54

Figure out how to read the code in ghidra
figure out if the code is only used for recruiting the new
found Pokémon directly into party. If it is this is a usable entrypoint,
else this is not usable.

# trap ideas

## Bidoof Encounter trap

I have, so far found two (maybe three) potential ways to do this trap (for 1 bidoof so far):

- Detect when a battle starts, and if a bidoof trap (or other pokémon trap) is active, write the bidoof ID to 2 memory addresses. This seems to have a decent margin for the watching code to be "slow", so high chance this can work well
- Freeze those two values to bidoof (idk if this is possible yet, but i know bizhawks debugger supports it), and this WILL cause issues if the ram address is reused
- convert an action replay code that executes loading data at some point to replace more specific data at a different point

The following addresses need to be edited after the battle state gets set at: 
08A3B8	- Game State


22B508	b	h	0	Main RAM	pok 1 battle id 
<br>22B590	b	h	0	Main RAM	pok 1 capture id


# Species notes

The species ID list has 

    {
        "name": "Dummy",
        "label": "DUMMY",
        "species_id": 236,
        "browser_number": 236,
        "field_move": {
            "category": 0,
            "level": 0
        }
    },

This is not usable in the same way I am able to edit the ID of pokémon 1. 
This might become usable, but is highly to require specific scripts.

Wailord can not be loaded in that same way either. -> find a different entry point to load Pokémon
OR wailord also requires a different script to be loaded (look at encounter hacks)


# Prevent level up

There are two ways to prevent level up:
 - reduce the level cap and have the max level scripts loaded
- Force the following instructions to nop (at the start of battle)
  - x02 0160d4              Main RAM    nop to block stylus level up
  - x02 0160FC	d	h	0	Main RAM	no to block max health increasing on level up
  - x02 139638	d	h	0	Main RAM	nop to block current health increasing on level up, 
                                        gets flushed out after combat


# Party

 - changing (in this case addresses for party mon 3, 0BAEEC )   0BAEF4 from 01 to 02 
    makes the pokémon dissapear from your party, and show an empty spot. Changing it back to 01 makes
    it reapear again.

byte 9 determines if the pokémon takes up a slot in your inventory and if you can release it (07) seems to be used for partners
and 01 for normal pokémon. Other numbers also do things but it's kinda weird, 02 or something makes them share a spot??

 # something level up related
020af358 -> r0

02139C84 ldrb r1, [r6, #+0x18], when level < 99, r6 = 02 2F1634
				when level = 99, r6 = 02 2FA9B4


# field move

I was able to edit the field move for charmander through editing the table

each Pokémon uses 24 bytes, are they contigous??? idk, eek


# known crashes

 - Getting Rampardos early, and going down the ladder in cargo ship (likely due to npc following)


Advice from Mysteryem on field moves
If that's a big long list of different pokemon, you might want to look into a world.collect() override in the future, to collect a fake item into the state that signifies having a pokemon that can use a specific field move, so then the rule could be reduced to HAS_FIELD_MOVE_ITEM & HAS_POKEMON_THAT_CAN_USE_FIELD_MOVE, if collecting a pokemon event updates the state for whether you have access to a pokemon that can use a field move.

Pokemon FRLG uses this with its HM compatibility logic: https://github.com/vyneras/Archipelago/blob/36100eebc4b5fcc521ddd7f15ed20a1a24c74308/worlds/pokemon_frlg/__init__.py#L778-L796 https://github.com/vyneras/Archipelago/blob/36100eebc4b5fcc521ddd7f15ed20a1a24c74308/worlds/pokemon_frlg/rules.py#L136-L138

FRLG's way of handling HM compatibility, I think, is to place the pokemon events randomly, and then 'fix' the HM compatibility if HM users end up unreachable, forcing other, reachable, pokemon species to be able to learn the needed HM. edit: Yes, it's done in https://github.com/vyneras/Archipelago/blob/36100eebc4b5fcc521ddd7f15ed20a1a24c74308/worlds/pokemon_frlg/rules.py#L2492-L2532 


maps with 12 or more pokemon, unqiue species count:

m001_002: 8
m009_002: 9 unique pokemon
m009_003: 9
m009_004: 9
m009_008: 9
m009_013: 9
m009_014: 9
m009_015: 9
m009_016: 9
m010_003: 8
m011_003: 6
m015_004: 9
m016_002: 10
m016_003: 9
m020_002: 9
m020_013: 7
m021_001: 11
m022_001: 8
m026_001: 7
m029_006: 1 (many qwilfish)
m034_001: 7 unique


