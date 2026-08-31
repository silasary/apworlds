# Mario Golf 64

## What does randomization do to this game?
Items which the player would normally acquire throughout the game have been moved around. Logic remains, so the game is always able to be completed, but because of the item shuffle, the player may need to access certain areas before they would in the vanilla game. Wind speed/direction and pin locations can also be randomized per shot.

Some Quality-of-Life features included are:
- Either save or randomize the current pin position and wind when creating a save file
- Select any unlocked character using certain button combination when resuming a save file
- Set the maximum wind speed per hole defined in player options

## What is the goal of Mario Golf 64 when randomized?
There are currently two possible victory conditions to goal Mario Golf 64:
- **__Win Mario Open by reaching a certain score.__** The basic idea of this is tournaments are gated behind tickets. These tickets are added to the item pool. You can then define how Mario Open is accessed by one of two ways:
  - Once you win enough tournaments, access to Mario Open is unlocked
  - The Mario Open ticket itself is added to the item pool, so it doesn't matter how many tournaments you win. You just need to find this item
- **__Collect a certain amount of gold trophies.__** This is basically the equivalent to a Triforce hunt. You will goal the moment the required amount of gold trophies is collected, no matter where you are or what you are doing in-game

## What game modes are available?
Currently, only tournament and ring shot modes are enabled. 2-4 players are not supported.

## What items and locations can get shuffled?
Locations in which items can be found:
- All Birdie Badges
- Bronze/Silver/Gold trophies
- Pars on each tournament hole (Parsanity)
- Ring Shot hole clears (Ringshotsanity)

Items that can be shuffled:
- Certain characters (Maple, Metal Mario). You start with peach
- Certain clubs (wedges, woods). You start with all your irons (2i-9i)
- Putter lengths (short, middle, long). Your starting putter is defined in player options
- All club abilities (approach shot, power shot)
- All tournament tickets
- All ring shot tickets

## What traps are added?
- Bad Lie Trap (simulates the next shot being hit from deep rough)
- Rain Trap (makes the current hole rainy)
- Hurricane Trap (sets the wind to 35mph for the next shot)
- Fast Meter Trap (makes the shot meter move twice as fast for the next shot)

## How does death link work?
Death links are sent when a ball is hit in the water or out-of-bounds. When death links are received, the next shot hit will be duffed ("Duffed it!").

## When the player receives an item, what happens?
Currently, there is no in-game notification system that tells the player that they have received an item. You can refer to the client by using the `/unlocked` command which tells you what do you have.

## Additional notes:
- If Ringshotsanity is enabled, Toad Highlands will always be your first available course. I wanted to make your starting ring shot course random, but due to limitations with how the menu worked, it was easiest to just make Toad Highlands the default.
- Once you unlock power shots, you have an infinite amount of them

### Logic
Right now, I only included Peach, Maple, and Metal Mario as playable characters. The reason for this is because I wanted to simplify the logic for now.

The logic for getting birdie badges is based on two assumptions:
- You can get a green-in-regulation with the current club/character combination
- You can one-putt from anywhere on the green with any putter
This logic starts to become fuzzier when you include wind (i.e. what happens if you have a strong headwind on a specific hole?), and the logic per hole assumes no wind, for simplicity's sake. So once you add every single character and every single club, the logic starts to grow exponentially more complicated. I highly recommend using the [PopTracker](https://github.com/PangaeaPanga/mario_golf_64_poptracker) to see what's in logic.

The logic for trophy scoring is a bit different than how it is displayed in-game. Even if the game tells you that you got a certain trophy, these are the actual thresholds for each tournament:
- Bronze trophies require **even par** or better
- Silver trophies require **-6** or better
- Gold trophy requirement is set in the YAML under **gold_trophy_difficulty** (default setting is -14)

Some of the logic for a few of the checks have special logic, outside of "can you reach this distance with these clubs":
- Both `Mario's Star Ring Shot 1 - Bloober Calamari Rings` and `Yoshi's Island Ring Shot 1 - Doughnut Hole` require approach shot because those greens are tiny
- `Mario Open - Gold Trophy` requires short putter because some of those greens are awful to putt with only a middle or long putter

I will probably create a spreadsheet that outlines all the logic at some point so people can build off of it.

### More information on some of the YAML settings
How the `limit_tournament_logic` setting works:
- `disabled`: progression items may appear in any course. This means that you may need to visit any tournament you have unlocked to progress your seed
- `limited`: progression items will only appear in required courses. The lua script will tell you exactly which courses the logic wants you to complete. However, if you have access to any other tournaments, you can still get a gold trophy by winning that tournament if you want to and are able to. You are just not required to. This option is also incompatible with Universal Tracker
- `required_courses_only`: Courses that are not required will be completely removed from the item pool

## Future roadmap
Not guaranteed to be added, but just ideas for the future:
- Switching setup from running a dedicated lua script to opening a patched ROM
- Having the user-defined score to win a gold trophy reflect accurately in-game (the score to win each tournament is different in the vanilla game)
- Implementing "fast travel" (allow players to select a specific hole to play which doesn't count towards the gross tournament score, similar to training mode)
- Adding every character to the item pool (Charactersanity). Currently, only Maple and Metal Mario are the only unlockable characters, with Peach being the starting character
- Adding individual clubs to the item pool (Clubsanity). Currently, only wedges and woods are the only unlockable clubs, with players starting with all irons
- Implementing a random starting course for Ringshotsanity
- Implementing logic for all individual character/club combinations
- Implementing logic for gold trophy difficulties
- Implementing logic for course difficulties
- Adding Checks for character match victories (Versussanity)
- Adding Checks for mini golf hole clears (Minigolfsanity)
- Adding Checks for landing in every bunker (Bunkersanity)
- Adding Checks for getting a green-in-regulation per hole (GIRsanity)
- Implementing hole shuffle (each individual hole of a tournament can be a completely random hole from any tournament)
- Implementing full Universal Tracker support
- Implementing death link send on double-bogey or worse and making it independently toggleable on/off from the normal death link
- Handling a queue of multiple traps