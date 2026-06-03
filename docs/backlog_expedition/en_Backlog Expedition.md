# Backlog Expedition

## What is Backlog Expedition?

Backlog Expedition *(BEx)* is a custom meta-game where your backlog becomes an explorable world.

You are Logmundr, a small Viking on a quest to raid an entire archipelago for treasure. To access each island, you must collect runes. Every island represents a game, divided into multiple parts *(sessions, chapters, levels etc.)* based on what it takes to beat it. These will become your locations to be found on each island. Once that game is beaten, the treasure of that Island is found!

Additionally, you can choose to add other custom objectives to the islands, as well as create medley islands that replace a single game with these custom objectives.

- Up to 400 custom locations possible.
- 5 types of custom locations. *(Prioritized and Randomized Backlog, as well as Prioritized, Limited and Repeatable Locations)*.
  - Games put in Prioritized Backlog will each be placed on their own island, and have the amount of locations present as defined in your YAML.
  - Games put in Randomized Backlog will likewise each be placed on their own island, but only however a certain amount of these games will show up in your world, defined in your YAML.
  - Extra locations put in as Prioritized will appear randomly on each island, and will only show up the amount of times defined in your YAML.
  - Extra locations put in as Limited will likewise appear randomly on each island. They will only show up the amount of times defined in your YAML, but are not guaranteed to show up.
  - Extra locations put in as Repeatable will also appear randomly on each island, but can show up as many times as needed to fill up the islands depending on your YAML settings.
- Medley Islands will appear if the amount of islands in your slot, defined in your YAML, is bigger than the amount of backlog games put in your YAML.
- The amount of runes required to unlock islands are defined in your YAML.
- If a Backlog game is bigger than the allowed amount of locations on an island, all parts will still all be included. *(up to a maximum of 20)*.
- You goal the game by collecting the amount of treasure defined in your YAML.
- Use the optional Hint Shop to spend your trash on random location hints in your slot!
  - Each hint costs 5% of your total trash items in your slot.
  - It is completely random which type of hint you will receive.
 
*Disclaimer. Since you are beating full games using BEx, it is not recommended to bring it to syncs*

## Terms used in BEx explained
### Backlog
The meaning of Backlog in the context of BEx is a list of games (or other media) you own or have access to, and have yet to, and want to, play or experience.

### Islands
Islands are the areas you will open throughout your world, with new locations and objectives for you to complete, generated depending on the info you put into your YAML.

### Runes
Runes are your progression items, that are required to unlock new islands. You choose how many runes you wish to require for each island with the Runes per Island option.

### Treasures
Treasures are what's needed to goal your slot. You set how many treasures you want to require getting before goaling in your Beaten to Goal option.
You get one treasure for each island in your world, by finishing the game chosen for that island.
If the island is a medley island, everything on that island becomes required to get the treasure.

### Medley Islands
A medley island is an Island where doing everything on it is required to get the treasure of that Island. These are created whenever you have an island that can't or won't be filled with a Backlog game from either of the two Backlog options. For example, if you had 2 games put into Prioritized Backlog, 0 in Randomized Backlog, but asked the Generation to create 5 Islands in your world, you'd end up with 3 medley islands, consisting of locations from all the three Location options.

## Setting up your YAML

### Attention!
Please note that options should never be deleted from the YAML!
If options are deleted, you risk your seed generating with default YAML options, including example games.
If you don't need certain options, please leave them empty or at 0 to make sure this does not happen.

### Common ways of adding full games to your YAML
The most common way to add a game to your YAML would be to add it to the __Prioritized Backlog option__ like so:
```
prioritized_backlog:
  [
    {'name': 'Complete a chapter of Celeste', 'count': 9}
  ]
```
This option makes sure that this game WILL show up at some point during your Async, and will be available in it's entirety on one island.

Another option is to use the __Randomized Backlog option__, where you put games in that you want to be randomized. If you for example were interested in 10 different games, but only had space for 5 in your YAML due to some restriction, you'd put them here like so:
```
randomized_backlog:
  [
    {'name': 'Complete a chapter of Celeste', 'count': 9},
    {'name': 'Complete an area of Hollow Knight', 'count': 12},
    {'name': 'Finish a kingdom in Super Mario Odyssey', 'count': 15}, 
    {'name': 'Beat a boss in Cuphead', 'count': 19}
  ]
```
Other than being randomly picked, they function the exact same way as games put into the __Prioritized Backlog option__.
To choose how many you want to be picked out, you set that number in your __Randomized Backlog Amount option__.

Your last option for adding a full game to your YAML, is to use the __Prioritized Locations option__.
In both of the previous options, once your game is unlocked, you will be able to play it from start to finish and send off your locations as you go. Sometimes you might not want that, for example if the game is meant to be played in short bursts. In these situations you can choose to add them to the Prioritized Locations like so:
```
prioritized_locations:
  [
    {'name': 'Beat a boss in Cuphead', 'count': 19}
  ]
```
This will make sure that all the locations needed to beat this game shows up in the Async, but they won't all show up at once, and will instead be spread across multiple islands where there's space.
The only thing to note about doing this, is that unless these locations are put on medley islands, they will not be required to goal your slot.

### Ways to deal with long games
So you have a game you want to include in your YAML, but it is *so long* that you'd find it too big to put in one island by itself.
You can deal with this issue two ways.
Your first option is to include this game in your __Prioritized Locations option__ as described above. This will make sure that the whole game will be included in the async, but instead of all being dumped at you at once, it will become a game that you continuously return to throughout the Async, by being randomly scattered across however many islands you choose to have in your yaml per your Islands option. This also allows you to have a much higher location count than 20! You can do this like so:
```
prioritized_locations:
  [
    {'name': 'Complete a shrine in Zelda: Breath of the Wild', 'count': 120}
  ]
```
This way, you could even choose to only play this game and make it required to goal, by including no games in the two Backlog options at all, so that it will be put on Medley islands, that are required to goal.

Another way to deal with long games is choosing to split it into multiple islands like so:
```
prioritized_backlog:
  [
    {'name': 'Complete a shrine in Zelda: Breath of the Wild', 'count': 20},
    {'name': 'Complete a shrine in Zelda: Breath of the Wild', 'count': 20},
    {'name': 'Complete a shrine in Zelda: Breath of the Wild', 'count': 20},
    {'name': 'Complete a shrine in Zelda: Breath of the Wild', 'count': 20},
    {'name': 'Complete a shrine in Zelda: Breath of the Wild', 'count': 20},
    {'name': 'Complete a shrine in Zelda: Breath of the Wild', 'count': 20}
  ]
```
It's no issue for BEx to handle inputs that are the exact same.
The thing to note here is to be aware that you might end up playing half a game in the beginning of the async, and then playing the other half a long time after in the end of the Async, so you have to be okay with that possibility.

### Extra locations and inspiration:
Which of the 3 options you choose for your extra locations, depends entirely on your preference. Do you want to guarantee that it will show up, Do you want to make sure only a certain amount will show up or do you want it to be completely random?

**Here are a couple of ideas for what you could put in here**
* Runs in runbased games like Roguelikes or Survivor likes
* Achievements in games you wish to 100% complete
* "Try this game" locations for games you don't want to commit to.
* "Beat this game" for very short games you don't necessarily want to give you treasure on an island
* Winning challenges, medals or stars in level based games
* Bite sized goals in ongoing long games/endless games like quests, dailies, ranked matches etc.

### Dealing with spoilers
Setting up a YAML that works well for a game can sometimes require extra research or advice from someone already familiar with it. But not everyone has that knowledge available — and some players prefer to avoid looking things up themselves to reduce the risk of spoilers.
To help with that, AsaraBaenre and I (Nikkilite) have created a community spreadsheet where anyone can share suggestions for how games can be divided. If that sounds useful to you, you can find it [here!](https://docs.google.com/spreadsheets/d/1StOhFUO3ix--mWpj-CoIzmT7p0GhiGwoAU4qsTIA4WM/edit?gid=0#gid=0)

## Notes on accountability
When playing backlog games, you are, unlike with regular archipelago games, playing games unknown to you.
There's a high chance you at some point will end up in a situation where a game is too difficult, a game is too boring, a game causes you physical or emotional distress, a game is longer than you thought it would be or you no longer have interest in a game you had initially picked. In these cases, i suggest you do what feels best, be it swapping the game out for something else or clicking the locations off regardless. Abandoning a game for whatever reason is a totally valid reason to click those locations. The game got off your backlog in the end either way, which is the goal!

Individual Async hosts can have different opinions on this, but overall this tool is meant to motivate you, not take away your energy. If you're in doubt, ask your host before choosing to bring BEx.

## Creativity!
This APWorld is obviously made with backlogging in mind, but there's no limits to how you can fill it up with other things, for example other types of backlogs like books, boardgames or shows, or even other things overall like crafting projects, miniature painting, school studying, coding, excercising, cleaning or cooking.
