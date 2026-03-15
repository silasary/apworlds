## Super shortterm
- fix deathlink
- Kill player if not in allowed world, skipp deathlink
- Read location doc to find commands like for early / late items
  - placed_locked_item
- For killing ask ai again
- For death link in pipe: find player life counter: could poberbly check on_worldmap / worldmap_postion
  - For killing ask ai again
- Simplify item and location name

## Playtest
- Unlock powerups ( what happens when have powerup and get new one)
  - doesnt work
- Test if savefile works
- Recive deathlink
- Playtest red switch



## Thoguhts / decisions
- Maybe make items worth 3 starcoins and then fill upp the rest with trash? Don't want to many useless checks
- Why do I get bounded packets like every 30 sec? probably nothing to worry about
- Could make most starcoins local



## Bugs to fix
- Send world 1-1 starcoins on load
  - problem self.status
- deathlink trigger when in pipe
- Sometimes invisible on worldmap
- World unlock only works on savefile2
- Code cant kill player
- Only groundpound as move is locked
- Marios animation start from back of world
- Unlock new move/powerup requies restart client
- Peach castle doesnt set powerup



## Short term
- Compile and send out alpha version to playtest
- set upp gidha project (problem with jdk)
- Make player start in their starter world
- Make level completion real checks but preplace them
  - porberbly shouldnt do or ok if not added to item pool?
    - Make client have a save file of completed levels (so can overwrite)
- Set swimspeed and yoshispeed = 0
- Ask discord for help finding which text to edit for custom names in starcoin field
- Fix how levels organized so that if levels parallell logic doesnt require earlier
- Add spin as check
- fix other movment randos
- Uppdate self.connectionstatus to be more accurate


Tracker
- Set map page index so autoupdate depending area
- Add images for power ups and moves
- Set upp counter for # starcoins recived
- Make show list avalibe starcoins / level






## Mid term
- When game in good state, do a continuous single player play through to get a feel for the game
- Implement graphics for Hintmovie shop
- Create documentation for how to install
- Randomiz starting world
- Create functions that called at start/end of level instead of continuously? (to optimize code)
- Implement so that option file does something
- Found where to add ctx.username = yaml\[playername\]
- Try change hm menu to show which movies unlocks which items 
  - Look at source code, se if easy hm menu to modify (only 4 strings that are reused for each coin, not helpful)
- Get playtest data on what doesnt work on eu version

## Features
- Disable unlock of final level until defeated x other worlds or have y starcoins
- Save toad / kill world enemy= hint
- Disable swim, Yoshi
- Force Mushroom generate early
- Secret exit location and logic (make so unlock send location but doesnt unlock canon)
- Prioritice Castle and Tower defeath to have high quality items
- Disable pipes and door
- Read player info from player.yaml
- Setting for rom file path and if should auto open / close
- CHEATS
  - Double jump
  - Auto collect checkpoint
  - Start with powerup
- Option to make # nummbre of worlds / all worlds beeten to be able to acces bowser
- p-switch rando
- Randomize toadhouses
- Finding toad in level gives hint
- TRAPS
  - Loose powerup curreny
  - Add the gomba trap
  - loose powerup in inventory
- Disable 8-7 / make requier 82

## Enging
- Write geco code parser
- Write powerpc parser
- Features from geko
  - Speedtrap
  - fall damage
- make it load from symbols in address map


## Long term
- Add support for other roms
- Difficult logic
- multiplayer suport
- Diffrent savefiles
- Implement "cheats" in item pool to make easier
- Shrink Trap (revert to a no-powerup state) 
- Time Travel Trap (removes half of the levels time, or just runs it at double speed.)
- non ap rando (enemy, level, enterence)
- Expand and complete trackern
- Find GOOD memory address repository
- Work on setting up patcher (do we need one?)

