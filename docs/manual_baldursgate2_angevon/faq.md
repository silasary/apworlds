## FAQ for common issues using Baldur's Gate 2 manual

## Should I start a new BG2 save file to play this?
Yes.

## How do you progress the game in this manual?

Areas in the game are locked by “unlock” items created by the manual system. For example, you can’t go to the Graveyard District until you’ve received “Graveyard District Unlock.” These items are not actual in-game items; keep an eye on the received items side of the Manual Client to see which area unlocks you have received from the multiworld.
Note: Irenicus’s Dungeon doesn’t have an associated unlock.

## What are the recommeneded yaml options?
The default yaml options are the recommended options. If you'd like to tweak these options, please note:<br/>
The "progressive_equipment" option is generally meant to be used with Item Randomizer mod from the Gibberlings 3 website.<br/>
The "equipment" option is NOT meant for use with Item Randomizer (because in this case, the multiworld does the randomizing for you instead!).<br/>
You CAN combine the two but may have issues with too many items, and not enough locations when generating.<br/>
Generally speaking, more included chapters will add more items and locations and make for a longer game.

## What loot can I pick up in the game?

Generally, non-magical equipment, ammunition, gems, gold, potions, and scrolls are free for all. Pick them up as you see fit. Key items and magical equipment depend on your "Ways to play this manual" choice in the [readme](../README.md).

## How do I know what I've received since I last played?

There are a couple of ways. You can type /received in the Archipelago tab of the Manual Client to see a full list of everything received in order from first to latest. Or, if the multiworld was hosted on archipelago.gg, go to the room page. Open the tracker for the BG2 slot. The tracker page has a big table showing all the items received. You can sort the columns. Sort "Last Order Received" to see what you've received in order. At the end of a session, note the number in this column so you can remember where it stopped at for your next session.

## When can I move onto Chapter 3?

The logic expects you to complete one of the main sidequests and earn one Quest Complete Token. You should have earned enough money by then to pay the fee, or be able to earn it.

<b>You may receive locations from the multiworld for chapters you haven't reached yet (e.g. Brynnlaw, Underdark). DON'T GO THERE BEFORE COMPLETING THE MAIN STORY TO GET THERE. Completing plot out of order will cause bugs.</b>

## I’ve received a region unlock, but it's greyed out and “unavailable” on the world map! Or not on the world map at all!

In the normal game, for some areas outside of the big city, you have to visit the City Gates and exit from the gate to un-grey them.<br/>
For areas like Windspear Hills, you'll need to unlock the area as normal (ie. Talk to Jierdan, Nalia, Delon, etc. and get the quest).<br/>
To prevent script/quest bugs, you won't logically be expected to go to Druid Grove before Trademeet, or Temple Ruins before Umar Hills, etc. (Do so at your own risk!)

## I left Irenicus’s Dungeon too early! I missed some location checks! 
In fact, you might be expected to leave early. You’ll need to use the cheat console to MoveToArea back there and finish. The area code is AR0602. So you'd use<br/>
CLUAConsole:MovetoArea('AR0602')<br/>
or C:MovetoArea('AR0602') for enhanced edition (or just click it in the area list that pops up in the EE's cheat console menu).<br/>
Alternatively, the GO_AP mod menu has a teleport option.<br/>
To leave the dungeon, use the same command but 'AR0700' to go to Waukeen's Promenade. Area codes are included the name of the area unlock.

## I'm stuck or softlocked in Planar Sphere / Planar Prison / Chapter 4 / Chapter 5!
See the answer to the previous question. You can teleport in/out with the cheat console or GO_AP mod.

## How do I spawn the Unseeing Eye?

You need both Rift Device parts (MISC5A and MISC5B). When you enter the Pit of the Faithless, the parts will combine, and shortly after, it will spawn.

## I picked up Renfeld from the bandit ambush, but I don't have the Docks District Unlock yet to deliver him. HELP I don't want him to die while waiting for it!

You may encounter that bandit ambush before you receive the "Renfeld's Body" item from the multiworld. In this case, just go to the Docks district and deliver him out of logic if you want him to live. 

## I received Statuette of Lathander (MISC4X) / Necklace of Talos (MISC4Y) from the multiworld but "Deliver the necklace or statuette to Mae'Var" isn't highlighted green in the Manual Client.

The item requested by Mae'Var depends on your party reputation. Since we can't know what your reputation is, the logic 'expects' both. You only need the one he asks for. If you have it, go ahead and give it to him and mark the check as complete.

## I can't get the Trademeet Luraxxol vs. Alibakkar quests since I poisoned the druids at the Druid Grove.

Go ahead and mark those quest checks as complete.

## What do you mean by "violence is an alternative" or "if you chose violence"?

Some quest can be optionally "completed" by killing the NPCs involved. e.g. you can kill the Trademeet genies instead of finding their Ihtafeer. Violence tends to lock you out of quests and is not recommended. If you choose the path of violence, you should mark the checks as if you completed the quest without violence.

## Which key items have been added to the multiworld, and what are they used for?
Irenicus's Dungeon
- Jail Cell Key (MISC4B) - unlocks Jaheira's cell
- Activation Stone (MISC4A) - moves the golem to unlock the sewer area with the Otyugh
- Sewage Golem Key (MISC4O) - this is the key the golem uses to unlock the sewer area. You can receive the key instead and the not need the Activation Stone
- Air Elemental Statue (MISC4C) - allows you into the Elemental Plane of Air
- Portal Key (MISC4G) - allows you to go to the 2nd area of Irenicus's Dungeon
- Key to Frennedan's Room (MISC4P) - opens Frennedan's cell in the 2nd area of Irenicus's Dungeon

Slums Sewers
- Hand (MISC5S), The Lover's Ring (MISC5R), Shaman's Staff (MISC5T), Blood of Quallo's Friend (MISC5Q) are all used for the pipes puzzle

Docks
- Renfeld's Body (MISC5F), used to unlock Harper Hold quests
- Harper Amulet (MISC5E), used to go to the 2nd floor of Harper Hold
- Harper Bird (MISC5D), used for Xzar's quest
- Edwin's Documents (MISC4W), part of the Mae'var guildhall quests
- Mae'Var's Letter (MISC4V), part of the Mae'var guildhall quests
- Embarl's Dagger (MISC4U), part of the Mae'var guildhall quests
- Mae'Var's Strongbox Key (EDWINKEY), opens Mae'var's strongbox in his guildhall
- Statuette of Lathander (MISC4X) / Necklace of Talos (MISC4Y), part of the Mae'var guildhall quests 
- Letter of Transfer (MISC4T), part of the Mae'var guildhall quests

Graveyard District
- Piece of Red Cloth (MISC5N), for the buried alive quest
- Littleman The Stuffed Bear (MISC5L), for the child's ghost quest

de'Arnise Keep
- Keep Key (KEY10), used for many doors on the 2nd level

Bridge District
- Portal Gem (MISC6X), used to enter Planar Prison

Temple District
- Gaal's Key (KEY02), used to enter areas in the Cult of the Eyeless quest
- Rift Device Part (MISC5A) & Rift Device Part (MISC5B), required to defeat the Unseeing Eye (though if you're very strong you might be able to beat it without these)

Windspear Hills
- Acorns (MISC4N) - give these to the dryads for a check
- Chapel Key (KEY07) - opens some areas in the ruins
- Firkraag Prison Key (KEY09) - required to save the child from the cell
- Samia's Key (KEY21) - opens the tomb of King Strohm III
- Mask of King Strohm III (KEY20) - needed to see and defeat the invisible enemy in the tomb

Umar Hills
- Mimic's Blood (MISC6Y) - for Jermien's quest

Temple Ruins
- Amuana's Bones (MISC6Q) - to get past the fire room
- Shadow Prison Key (KEY22) - to unlock Mazzy's cell
- Symbol of Amaunator (Key23) - to get to the Shadow dragon*
- Shadow Dragon Wardstone (MISC6P) - to get past the Shadow dragon (but violence is an alternative)

*Only the Symbol of Amaunator exists instead of the 3 parts from the vanilla game, to reduce item bloat. Similarly, the Shadow Gems are not added, pick them up and use them as you find them.

Trademeet
- Ihtafeer's Head (MISC8K) - deliver this to the genies as a way to make them leave (but violence is an alternative)
- Trademeet Tomb Key (MISC8M) - to open the Trademeet tomb for Luraxxol / Alibakkar
- Mantle of Waukeen (MISC8L) - to finish the final Trademeet quest

Planar Sphere
- Valygar's Body or Valygar in party - to enter the sphere
- Golem Arm (MISC6K) & Golem Head (MISC6J) - to get past the golem chamber. Coal is not in the multiworld so pick it up as you find it.
- Demon Heart (MISC6M) - to return to Athkatla

Planar Prison
- Planar Prison Cell Key (KEY11), to free Haer'dalis and friends. 

Chapter 3
- Shadow Thief Cellar Key - used in the Shadow Thief base in the Docks to reach Aran Linvail. Both sides have this item.
- Smuggled Shipment - item requested by Bodhi when siding with her
- Shadow Thief Prison Key - opens a jail cell in the Shadow Thief base, when siding with Bodhi

Brynnlaw
- Galvena's Key - to access some areas of Galvena's Festhall
- Guild House Key - to access the lower areas of Galvena's Festhall
- Galvena's Medallion - an alternate way to get into Galvena's Festhall

Spellhold
- Minotaur Horn - need both to get to the apparition's tests
- Sapphire Stone, Opal Stone, Ruby Stone - use these on the portal to summon enemies for some checks  
- Hand of Dace, Kurtulmak's Crystal Shard - needed to get deeper into Spellhold
- Mind Flayer Painting, Troll Painting, Umberhulk Painting, Djinni Painting - opens some doors in Spellhold

City of Caverns
- Magical Rope - needed to leave for the Underdark
- Sekolah's Tooth - optionally used for quests, needed to speak with the rebels
- Rebel's Orb - optionally used for quests, needed to speak with the rebels
- Sahuagin Treasury Key - Opens the locked cache in the Royal Throne Room

Underdark
- Book of Rituals - needed for Vithal to do his rituals
- Light Gem - needed to reach Adalon
- Elder Brain Blood, Eyestalk of an Elder Orb, Kuo-toa's Blood - need one of the three for Ardulace

*Due to the time-locked nature of the Ust Natha quests, the Despana Treasury Key and Dragon Eggs are not in the multiworld so get them & use them the vanilla way.

Chapter 6
- Rhynn Lanthorn - to unlock chapter 7

Chapter 7
- Talisman of Rillifane, Golden Goblet of Life, Moonblade - put all 3 on the altar in the Temple of Rillifane to summon the avatar
- Stone Harp & Stone Horn - need these to interact with the statues in the palace to proceed to the Tree of Life

*the Tree's acorns are not in the multiworld so get them & use them the vanilla way.



