# New Super Mario Bros Wii

## What is goal
- To beat bowsers castle at world 8
- Bowsers castle is looked behind having a number of star coin items and beaten the last level in a number of worlds. (Configurable in player yaml)


## Items
- Progression / useful items
  - 17 World unlocks (are progressive, requires 2 to unlock whole world except world 9)
  - 231 Star coins: used for buying hint movies, unlocking world 9 levels and bowser 
  - Power-up unlocks (star counts as an ability)
  - Ability unlocks (previously movements)
    - Ground pound
    - Wall Jump
    - Crouch
    - Yoshi
    - Swim
    - Star
    - Climb
    - Carry
    - Spin Jump
    - Run
  - Level element unlocks
    - Pipe
    - Door
    - P-switch
    - ?-switch
    - !-Switch
    - Check Point
  - Hits to defeat a boss
  - Unlocking a secret exit
- Filler items
  - Inventory fill (one of every powerup)
  - 1ups 
  - Coin x01
  - Coin x10
  - Coin x50
  - Filler Power-up
  - Low Gravity
- Traps
  - Loose powerup trap
  - Goomba speed trap
  - Death trap
  - Time trap 
  - Robbery trap
  - Shrink trap
  - Literature trap
  - Throw trap 
  - Reverse Control trap
  - Movement lock trap
  - Slow Trap
  - Gravity trap


## Locations
- Completing normal levels (77)
- Collecting a star coin (231) 
- Buying hint movies (exists 65) Check this [Gamespot article](https://gamefaqs.gamespot.com/wii/960544-new-super-mario-bros-wii/faqs/58584) if you need help with unlocking them. e.g. Hintmovie01
- Completing towers, castles and secret exits that unlock cannons ( 8 towers, 8 castles and 8 secret exits) World1 tower, 1-3 Secret exit
- Getting powerups to inventory (from toad-houses or enemy ambushes) e.g. Inventory_powerup_001
- Unlocking secret exits

## General randomized things
- Level placements
- Music


## Options
Options are specific to generation and are changed each multiworld, this is not a comprehensive list.
- Starting world is selectable in option
- Most locations and items can be turned on/off in options
- You can select your requirement for reaching bowser in your goal
- You can select normal or hard rules, with normal being trivial to figure out and hard REQUIRING skips and trix. 
  - Normal rules is highly recommended
- You can also select if you want brining powerups from outside the level to be considered in logic.


## Deathlink
Deathlink is supported by the client. You can either enable it from your yaml or with the client command /togle_death_link.
Deathlink groups and deathlink amnesty is also supported, you can set them in the same way.


## Settings
Settings can be found in host.yaml in the `nsmbw_settings` category and are playthrough agnostic.
They mostly include auto open, load, etc, lots of file and folder paths and others.
Among them are alternative to the keyboard library for Linux, and which slot to use for clearing cache.


## Prominent commands
`/explain <location_name>`
- explains the logic for a location

`/debug`
- Prints lots of debug info.
- Please run this and send a [screenshot](https://screenshot.help/) of it before asking for help.

`/match_server_state`
- if your save file was somehow messed up will this fix it


## Known quirks / bugs / help with debug
- Making savestates is currently difficult depending on location. Do not close game or make savestates when you are in peach's castle or world 9.
- For some features (death link and move rando) the game will overwrite savestate 8 in dolphin. (It does this to clear the JIT cache).
- With movement rando on and not having the item climb will cause a soft lock if you encounter a ledge (like in 6-1). You are free from the softlock if you do /kill.
- Sometimes mario is invisible on the worldmap.
- Only save file 2 will work to play on.
- Known Issues for other game versions
  - None US2: Inventory powerups
  - EU1: Movement (dont turn on)
  - US1: Star and swim movement (add these to don't rando moves if you have movement rando on)
- On Linux you will need to give the client root access for it to properly access save states. You can also use Xdotools or Ydotools, selectable in `host.yaml`.
- Climb movement have issues, you can't leve vine without climb and through other ways can climb sometimes softlocks you. You solve this with the /kill command. 
- Deathlink problems:
  - If not received, try running `/kill`, if this does not work, make sure you have changed the dolphin settings in the set-up guide.
  - If not sending, try turing off your deathlink group and then toggle deathlink off and on again.
  - Run `/deathlink_debug` or `/debug` (0.3.0) to get information about its current state and post this information in the archipelago discord.
- Dolphin doesn't autostart: make sure dolphin is your default program for opening iso / wbfs files
- Music shuffle can cause crashes when you reach some parts of the game. To fix this deleate the `Sounds` directory from `Dolphin Emulator\Load\Riivolution\nsmbw_ap_<seedname>\Sounds` 
- If the client does not auto make savestates (This causes issues with deathlink, movement, etc): Make sure the dolphin settings are correct according to the set-up docs. If you use linux try switch the libraries used by changing the setting in host.yaml.


## FAQ
What is different from vanilla?  
- Can't unlock canons or secret exits
- The unlocks from world 9 requires starcoin items
- Peach's castle hint movie shop requires starcoin items
- You need world items to unlock both half of worlds

Multiplayer? <br>
&emsp; You can play NSMBW multiplay 2 ways:
  1) Same-slot co-op: Both connect to the same archipelago slot separately. This entails you play seperate levels but a level completed for you get marked for your friend. Run /change_collection_level 2 for a better experience
  2) Local/Dolphin net-play: Works, just connect your controllers and it should function. Might have small issues with deathlink and some movements.\

Tracker? <br>
&emsp; A basic implementation of Universal tracker, see setup_en.md for instructions. A pop tracker pack is in development.

Do I need a rivvolution patch? <br>
&emsp;Some settings require a riivolution patch, it should be auto generated and loaded when you first connect to the archipelago server. Otherwise it is not needed and all patching will be done from memory.

Do you support item/location groups?<br>
&emsp;yes, e.g. Powerups, Movement, Hintmovies, Starcoins, Starcoins_World1, Starcoins_World1_Level1, Level_completion_world1, Level_completion

Why are cannons locked?  <br>
&emsp;All secret are locked and turned into item/location pairs except cannons they just cann't be unlocked.

Which game versions are supported?<br>
&emsp;Game is developed on US rev2 of NSMBW. The client doesn't error out on other editions but some features will not work.<br>
&emsp;If you have another revision please report the problems you have in discord and mention your game revision.

I want to help with development, how do I start?<br>
&emsp; All help is appreciated, in coding, playtesting and logic. Begin by reading [dev_docs](../dev_files/dev_docs) and then contact `miiroun` on discord.

Why is a level in logic?<br>Run `/explain <levelname>` and `/explain_more <levelname>`.<br>
&emsp;This will give you the rule for the location, you can run `/unlocks` to get a list of active unlocks. 

Why does the client auto press hotkeys to save and load save states? <br>
&emsp;This is a solution to clear the JIT cache by making and loading a save state. If the specific keycombo causes issues you can change them in your game yaml and in host.yaml. <br>
&emsp;You can skip this if you enable use_riivolution in your yaml.

Can I run this randomizer on real hardware?<br>
&emsp;No, since most modifications are run through the external python client. There are no plans to implement this.<br>
&emsp;You are however encouraged to run the other nsmbw randomizers mentioned bellow, which works on hardware.

What does the star coin item do?<br>
&emsp;They can do up to 3 things depending on what you have enabled:
  1) Enables you to buy hint movies 
  2) Required to unlock world 9 levels 
  3) Required to unlock 8-C

I game over'ed and lost all progress, how do I get it back?.<br>
&emsp;You can run `/match_server_state` in the client to get back all your levels, depending on the collection state set in `host.yaml`.

What does the level names stand for? <br>
- 1-T = 1-Tower
- 2-C = 2-Castle
- 3-G = 3-Ghosthouse
- 4-A = 4-Airship

Are there bugs?<br>
&emsp;Expect bugs, it is still in development.<br>
&emsp;Report a bug either at the [github](https://github.com/Miiroun/Archipelago-NewSuperMarioBrosWii/issues) or in the NSMBW thread in the [AP discord](https://discord.com/channels/731205301247803413/1327187652864380948), make sure to mention your game revision.


## Debug tips
- Run `/debug` and post your logs in the archipelago discord thread for NSMBW<br>
- Restart launcher and computer after installing if the client doesn't show up in launcher or something doesn't work.<br>
- Update all relevant programs: NSMBW, archipelago, tracker, dolphin<br>
- Connect to the server from the client after you are on the world map in game if you have problems on the title screen.<br>
- If you can not solve your problem, run the debug launcher (found inside your archipelago directory) and send a screenshot of the client in the nsmbw thread in the archipelago discord server.


## Other NSMBW modding projects
I recommend looking into these nsmbw randomizers / mods if you enjoed this archipelago implementation.
- mkwcats pipe rando https://github.com/mkwcat/nsmbw-pipe-randomizer
- Hei's level rando https://hbrohei.github.io/NSMRWii/. Similar to ours but they have more features and config
- Newer Super Mario Bros Wii : the standard overhal mod https://newerteam.com/wii/. Greate recomendation if you want to try playing custom levels
- mkwcats 8 player mod https://github.com/mkwcat/nsmbw-project. For someone with friends plural and want CHAOS.
