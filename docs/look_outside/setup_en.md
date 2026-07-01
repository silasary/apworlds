# Overview

See the latest release [here!](https://github.com/Turese/LOArchipelagoPlugins/releases) 

Make sure you have archipelago installed before you start playing.

This game uses archipelago version 0.6.7

# Setting up archipelago

As this game is not part of the core archipelago package, the apworld file will need to be installed in order to play.

Consult [the official archipelago setup guide](https://archipelago.gg/tutorial/Archipelago/setup_en) for information on downloading archipelago and [playing with custom worlds](https://archipelago.gg/tutorial/Archipelago/setup_en#playing-with-custom-worlds).

# Setting up Player options

These are the various player options you can select in the archipelago options creator:

### Include Arms

Player can decide if the player character start with both arms, left arm, right arm, or with no arms at all. The arms they didn't start with will be available as item drops in the multiworld.

### Include Friendly Fire

If disabled, locations will not be rewarded for killing characters that are not hostile to the player. If enabled, single character that it is possible to select "attack" as their option will be included as a location.

### Include Rat Friendly Fire

Friendly fire for rats. If disabled, locations will not be rewarded for killing hostile rats that become friendly when the player or any of their party members wears the rusty crown.

### Include Rusty Crown

If enabled, locations will be rewarded for the two gifts it is possible to get from rats when the rusty crown is worn.

### Include Test Gear

If enabled, the testsword and testarmor, both original and mkII, will be added to the item pool. Note: these items give massive attack and defense buffs to the point it makes most fights trivial.

### Include Nestor Quest

If enabled, locations for helping Rafta write a letter, as well as killing all of Nestor's body parts and the worms that spawn from them will be enabled. Note: the game has been modified so worm enemies will still spawn even if their corresponding body part has been killed. If this option is disabled, the Love Letter, Stationery, and Pen items will be removed from the item pool, making this quest impossible to complete.

### Include Shades

#### Large Shades

If this option is selected, then locations will be rewarded for defeating the five boss shades on each floor that spawn on high danger levels. Interacting with the secret door under the stairwell will tell the player which shades they have not yet defeated.

#### Large Shades and Spider

If this option is selected, then locations will be rewarded for defeating the five boss shades on each floor that spawn on high danger levels, as well as venturing into the secret room under the stairs and defeating the Spider. 

#### Large Shades, Spider, and Crawling Shade

If this option is selected, then locations will be rewarded for defeating the five boss shades on each floor that spawn on high danger levels, as well as venturing into the secret room under the stairs and defeating the Spider, and defeating the Crawling Shade enemy that chases the player in the corridor before they meet the Spider.

### Include Mask Locations

This controls whether locations in areas specific to the Mask ending are randomized: Glitch world, the entirety of floor 4, the basement pit, and the landlord's hidden room.

### Include Roommate Quests

This controls whether locations in areas specific to the roommate's sidequests are randomized. This includes: Hellen's plant watering quest, Leigh's cell phone quest, and Dan's NeoDuo quest.

### Include Game Skills

If enabled, the skills rewarded for completing video games will be randomized, and a location will be granted after playing each video game at least once. If disabled, each game skill will be rewarded after only one play of its respective video game.

### Starting Games

Which video games the player starts with.

#### Random 3

The player starts with 3 random video games

#### Vanilla

The player starts with the same 3 video games they would start with in the main game: Madwheels 97, Super Jump Lad, and Myrmidon.

### Death Link

Enables death link. If the player gets a game over, then it will trigger a game over for any other player who is currently online that also has death link enabled, and vice versa.

### Rat Baby Name

Picks what name the Rat Baby party member will have. The player will not get the opportunity to change this in-game. The default name is "Rat."

### Allow Killing Shopkeepers

If this is enabled, then the player will be able to kill Mutt and Eugene whenever they want to steal their stock. If this is disabled, the option to attack them will disabled in-game. Nestor is still attackable when killing Eugene, but Eugene will survive the encounter.

### Randomize Door Encounters

If this is enabled, locations will be enabled for gifts and combat rewards granted from killing shopkeepers. If disabled, item rewards from door encounters will still be disabled.

Note: door shopkeepers are unaffected by this option. They still have their regular stock, though the Gamer will never sell video games and the Mystery Trader will never sell the key to the boss rush arena or any special currencies besides black ooze.

## Goals

One YAML option allows the player to select their goal.

The game has been modified to encourage the player to do everything they need to get access locations in one save file. If the player selected the yaml option to set the goal to multiple endings, then all of those endings must be achieved on the same save file. The player can check their progress towards their goal with an event in the third floor stairwell.

The different goal options are as follows:

### Any partial ritual ending

Give any astronomer the correct offering, and defeat them on the roof. This goal is also rewarded when any other form of perfect or imperfect ritual goal is awarded.

### Any perfect ritual ending

Give each astronomer the correct offering, and defeat them on the roof. This goal is rewarded once the player kills the Exalted Four. If this is not the only ending the player set as their goal, and the player goes on afterwards this the get the True Final ending, then it will be counted as a separate ending. This goal is also rewarded when the player achieves the Promise ending.

### Screaming Sky

Give each astronomer the correct offering, and flee from them once they become the Exalted Four.

### Promise

Give each astronomer the correct offering, and enter Apartment 35 to give Sybil her telescope and reignite her memories. Meet them on the roof and tell them about her to get this ending.

### Mask

Assemble the four strange offerings and give them to the astronomers. Defeat all four of them individually on the roof, and meet the masked shadow in the ritual circle.

Note: if this ending is chosen as a goal, then each of the astronomer roof boss fights will be included as a location.

### XIN-AMON

Give Jasper, Aster, and Aurelius the correct offerings, and give Beryl a guinea pig. Defeat XIN-AMON on the roof after it mutates.

### Unity

Use the small red key to open the secret room in apartment 12, and read the note on the table. The door will not open while Sybil is alive.

### True Final

Learn Rush Braver's forbidden technique Meteor Strike and use it against the Visitor after defeating the Exalted Four. Win the ensuing fight.

### All roof endings

Get each of these endings on one save file:

- Flawed ritual
- Perfect ritual (Truth and Denial are counted as the same. See "Any perfect ritual ending" above for clarification)
- Screaming Sky
- Promise
- Mask
- XIN-AMON
- Eternal fate (lose to XIN-AMON)
- True Final Ending

### All endings

Get each of these endings on one save file:

- Flawed ritual
- Perfect ritual (Truth and Denial are counted as the same. See "Any perfect ritual ending" above for clarification)
- Screaming Sky
- Promise
- Mask
- XIN-AMON
- Eternal fate (lose to XIN-AMON)
- True Final Ending
- Unity
- Words of Power (accept Wilhelmena's offer in the crossword dungeon)
- No Going Back (exit the apartment once 15 days have passed)

Note: Failed Ritual, as a distinct ending from Flawed Ritual, is not needed for any goals.

# Installing the game client

The randomizer makes use of rpgmaker's plugins systems to connect to archipelago and randomize items.

### RPGmodder install

`LOAPClient.zip` has been optimized to be installed by [Zorkats' RPGModder](https://github.com/Zorkats/RPGModder). 

Download the RPGModder and follow the linked instructions, to install the mod and patch it over your copy of Look Outside

If the patch worked, booting up the game should show a new `Archipelago` menu option on the title screen.

Note: if you're having trouble getting the game to patch, ensure that your clean install of look outside does **not** include a folder titled "Mods". Make sure you re-run the Safe State Initialization process of RPGmodder after you remove the folder.

### Manual install

** WARNING: SAVE FILES MADE WITH THIS MOD MAY BE INCOMPATIBLE WITH A NON-MODDED VERSION OF THE GAME, AND MAY CAUSE CRASHES AFTER THE MOD IS UNINSTALLED **

This mod can also be installed without RPGModder

1. Unzip `LOAPClient.zip`. You should have a folder titled `Look Outside`
2. Drag this folder over your Look Outside installation. This can be found at `\SteamLibrary\steamapps\common\Look Outside`
3. Add this text to the second to last line on the bottom of `\SteamLibrary\steamapps\common\Look Outside\js\plugins.js:`
    - It should be placed after everything in that file except for the `];` denoting the end of the object.

```
    ,{
      "name": "archipelago",
      "status": true,
      "description": "Archipelago.js build for Look Outside client",
      "parameters": {}
    },
    {
      "name": "LocationIds",
      "status": true,
      "description": "global variable mapping of all location ids",
      "parameters": {}
    },
    {
      "name": "NormalizeDifficulty",
      "status": true,
      "description": "Make the same locations available in all difficulties",
      "parameters": {}
    },
    {
      "name": "BackInTime",
      "status": true,
      "description": "Back in time: speak to the calendar to get the option to travel through time!",
      "parameters": {}
    },
    {
      "name": "BlackoutLamp",
      "status": true,
      "description": "If player interacts with the lamp after unlocking elevator, they can toggle blackout",
      "parameters": {}
    },
    {
      "name": "GoalChecker",
      "status": true,
      "description": "event in stairwell allowing player to check goal",
      "parameters": {}
    },
    {
      "name": "ShopHelpers",
      "status": true,
      "description": "helper function for overriding merchants and vending machines",
      "parameters": {}
    },
    {
      "name": "DoorHelpers",
      "status": true,
      "description": "Helper functions for tracking door encounter locations",
      "parameters": {}
    },
    {
      "name": "ToothHelpers",
      "status": true,
      "description": "helper functions for overriding tooth family events",
      "parameters": {}
    },
    {
      "name": "ItemImages",
      "status": true,
      "description": "Manages overworld item image overrides",
      "parameters": {}
    },
    {
      "name": "EventLogicUpdates",
      "status": true,
      "description": "Updates unique event logic",
      "parameters": {}
    },
    {
      "name": "MassEventUpdates",
      "status": true,
      "description": "Bulk operations on game events",
      "parameters": {}
    },
    {
      "name": "GoHome",
      "status": true,
      "description": "Menu option that sends you back to Apartment 33",
      "parameters": {}
    },
    {
      "name": "InsertAPItems",
      "status": true,
      "description": "Insert AP Items: Insert any item to players inventory by AP ID",
      "parameters": {}
    },
    {
      "name": "LookOutsideAPClient",
      "status": true,
      "description": "Archipelago Client for Look Outside",
      "parameters": {}
    },
    {
      "name": "ConnectionStatus",
      "status": true,
      "description": "connection status display",
      "parameters": {}
    },
    {
      "name": "MainMenuAPOptions",
      "status": true,
      "description": "New option in main menu to input AP room, player, password",
      "parameters": {}
    },
    {
      "name": "MassEventUpdates",
      "status": true,
      "description": "Updates overworld generic drops to have archipelago-specific text and images",
      "parameters": {}
    },
    {
      "name": "NormalizeDifficulty",
      "status": true,
      "description": "Make the same locations available in all difficulties",
      "parameters": {}
    },
    {
      "name": "ShopHelpers",
      "status": true,
      "description": "Helpers for updating the vending machines",
      "parameters": {}
    },
    {
      "name": "ToothHelpers",
      "status": true,
      "description": "Helpers for updating the tooth family events",
      "parameters": {}
    },
    {
      "name": "Unarmed",
      "status": true,
      "description": "Unarmed and Dangerous: Play as Sam with no arms!",
      "parameters": {}
    }
  ```

## Connecting to archipelago

If the game client is installed properly the main menu will have a new option titled `Archipelago`

This option will also be available in-game.

In order to connect to archipelago and start getting items, you will need to enter some information in this menu.

### Slot name

This will be the name you specified when setting up your game options

### Server

The server your game is hosted on. If your game is being hosted locally, you can enter this string to connect

`localhost`

Otherwise, the information you enter will typically be in the format:

`archipelago.gg:ROOMID`

### Password

The password for your room. If one was not specified on creation, this field can be left blank.

### Connection status

If all goes well, your game should automatically connect on updating your information in the Archipelago menu. Connection status will display in the top left corner. If connection fails, or you are disconnected from a play session, you can make another connection attempt by clicking on the connection status message.
