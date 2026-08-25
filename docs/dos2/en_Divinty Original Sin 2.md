# Divinity Orignial Sin 2

This is for Definitive Edition, classic will not work.

## What does randomization do to this game?

All quest completions and hostile enemies killed will have a randomized reward.

## What is the goal when randomized

There are several goals to choose from that fall into two main categories, beating an act or completing an act hit list.

These goals ask you to beat its corresponding act:
- Escape Reaper's Eye - beat act 1
- Leave Reaper's Coast - beat act 2
- Escape The Nameless Isle - beat act 3
- Defeat Braccus Rex - beat act 4, and thus the game

The hit list goals ask you to kill a list of bosses throughout the game before winning. The hits are configurable and contain bosses up to the goals corresponding act.

## What items and locations get shuffled?

The locations include all hostile enemies killed, and every quest completion that is found in the journal.

The items that get shuffled consist of:
- Gold
- Special Arrows
- Scrolls
- Grenades
- Runes
- Skillbooks
- Weapons
- Gear
- Level Ups
- Attribute Points
- Combat Ability Points
- Civil Ability Points
- Talent Points
- Max Source Points
- Purging Wand
- Source Amulet
- Scroll of Atonement

To integrate reliance on the multiworld, exp and source points have been removed from the game. Levels and max source points will have to be obtained from AP items.

## Act Keys

These are keys that are needed to leave their corresponding act. The number of these that are added to the item pool (and thus how many you need to leave an act) are set in the yaml. These keys will stop you when:
- Attempting to board the Lady Vengeance in Reaper's Eye
- Attempting to leave for The Nameless Isle in Reaper's Coast
- Attempting to enter the Arena of the One in The Nameless Isle
- Attempting to enter the room with Lucian in Arx

These keys will be found in your inventory to help you keep track of how many you have. The physical keys are not needed to progress, the mod will keep track of how many you have, do not worry if you lose them.

## Region Barriers

These are large barriers that block off certain parts of the map until their respective unlock is acquired. You can enable/disable these in the yaml.

## Level Teleport

This is an item that allows you to return to previous regions you have visited. Waypoints from older regions will be restored, and the map will be as you left it. You can obtain this item by enabling it in the yaml.

!!!WARNING!!!

This item is extremely buggy, this item should not be used if you do not want your run to prematurely end. Use with caution, or to screw around.
Most of this items' problems are solved by reloading to a save before you used it, it is recommended that you do this each time you use it.
Do NOT use on act 2 goals, as you will goal as soon as Powerful Awakening is complete, which this item prematurely completes.

The known issues:
- Global characters (characters that appear in more than one level, think Malady or Gareth) will not return to previous acts and anything relating to them cannot be completed in this state.
  - They also tend not to recover even if you return to your current act.
- Powerful Awakening and Hammerfall will complete prematurely, as the only condition for their completion is leaving Reaper's Coast/Arx, which is technically what you are doing.
  - This will goal on act 2 goals.
- Leaving the room with Lucian will permanently give you the Revered buff (which is kinda cool, could be a feature instead of a bug).
- Various scripted events (such as Atusa being purged at the entrance to Fort Joy Ghetto) will continue without the player (only important in the act you left)
- The Merryweather is in shambles.

## Random Class

A new class is included simply named "Random". This class will start with three random skills, a random race skill, and a random origin source skill. This class can be given to origin party members
by saying you're interested in someone with some randomness when recruiting them. If you do this outside of Reaper's Eye, they will be given five random skills instead of three.
The pool for the random skill are all the starter skills for each school (the ones that only need one point in their respective attribute to use, there is 4 for each school). This is recommended
for functioning builds, as most of these skills are cornerstones for most setups. You can change this in the yaml however by enabling the extended random class pool.
This allows all non-source skills to be in the possible pool, which will usually give you far worse setups, but is way funnier.
You will be automatically given the required stats to cast all spells you receive. On the extended class pool, this usually makes it so you start with a lot of extra combat ability points.
You will not be given skills with contradicting weapons, nor will you be given incarnate infusions without the incarnate itself.

## The Journal

The journal will be populated with quests that represent all the non-containersanity locations in the Archipelago. These will be persistent, so completing one and loading an older save will still show this quest as completed.
Use this both as a checklist as well as a resource to determine whether a specific enemy or quest is a check or not.
There is a known bug with the journal, as completing a quest will move them to the archived part of the journal with no description while keeping them in the active part as well. This is purely visual and
refreshing the journal by either setting a quest as active/inactive, clicking the show on map button on a quest with a map marker, or save and loading will correct this.
Unfortunately this seems to happen very often.

## Traps

Traps can be enabled in the yaml and will replace a percentage of the filler items in the item pool. These traps will inflict a status effect on one or all party members (based off another yaml setting) for
either one turn (minor), two turns (moderate), or three turns (severe). The list of possible statues is as follows:
- Poison
- Burn
- Acid
- Bleeding
- Silence
- Knock Down
- Terror
- Blindness
- Smelly
- Infection
- Decay
- Ruptured Tendon
- Atrophy
- Necrofire
- Stun
- Freeze
- Chicken Form
- Cow Form
- Curse
- Cripple
- Disease
- Drunk
- Entangled
- Mark
- Pertrify
- Plague
- Remorse
- Shock
- Sleep
- Slow
- Suffocation
- Weakness
- Web

## The Forgotten and the Damned

This quest and its sub quests normally require a party member with the scholar tag to complete. This function has been removed, so you do not need the scholar tag to complete anything relating to this quest.

## Aren't there missables?

Yes, you can permanently miss certain checks. To alleviate this, you can load older saves. Any item received in the Archipelago after that save will be given to you, so going back to older saves shouldn't be too bad.
This also means you can go back to your current save after loading an old one to get a check you missed and continue as normal keeping whatever item you got from it.
Overall advice, SAVE FREQUENTLY.

## What does another world's item look like in Divinity?

No information will be presented in the game, the client is the only current way to see outgoing items.

## Is multiplayer supported?

Yes, as long as the host is the one with the Archipelago mod active and the one with the client connected. Other players playing the same game of Divinity do not need a .yaml, the game mod, nor the client.
Basically, have the host play like they're going to play a single player archipelago, and have the others join their game.

## What happens when I receive an item?

Everything will appear in the current controlled party members inventory with a notification pop up telling you what you have received. Stats will be given to every party member.
These are retained even when loading past saves.

## Whats this Archipelago Sync spell?

In the yaml, there is an option that determines when the game will sync with Archipelago. When the option "On Spell" is selected, the character you started as will learn the "Archipelago Sync" Spell.
This spell mimics the effects of the spell "Bless", but instead of blessing anything, you will receive all Archipelago items that are unclaimed. This spell has unlimited uses and uses no memory slot.

## This quest/enemy didn't send an item upon being checked, why?

Some quests are not included as locations. These quests in some manner are missable, such as companion quests or cross act quests such as Seeking Revenge. Enemies are in a similar situation. Some enemies that
have a route in which they do not become hostile tend to be exempt, while some have circumstances that they do not spawn. You can check locations in the client, spoiler log, or journal to check if a quest or enemy is included
to see if a check was truly not sent correctly.
If you believe you have a case that is an exception to these, please let Intaiachi know in the Discord to see if he can fix it for future releases.

## Universal Tracker says I've gotten all my checks, but I'm not stuck, why?

This game uses some soft logic to help make sure you are at a reasoable level before a certain task becomes logically avaliable. If you end up in that situation, that means that you are not high enough level
to be expected to complete anything more. Consider this a compliment for being good at the game.

## I see that I received an item, but its not in my inventory, why?

Items are sent to the currently controlled character, so if you swap control such as in combat, who is holding the item can be vague, so make sure to check all inventories.

Another common issue relates to the setup, where you are asked to select a certain directory. This directory must be agreed upon by the client and the game mod, so double check this directory is correct.
You can check this by going to the directory you set in the client and opening the file called "{seedname}apOut.json". If this file is empty when you should've sent out a check, the client has the wrong directory.
If you end up finding a folder with a file just called "apOut.json" and it does have some gibberish in it, that is the correct directory.
A common mistake is selecting the directory in a Documents folder in a different drive. If you have two Documents and it isn't working, try setting the directory to the other one.
Another common mistake is setting the directory to the Osiris Data in the "Divinity Original Sin 2" folder instead of "Divinity Original Sin 2 Definitive Edition".
You can change this directory in the host.yaml found in the root of your Archipelago install under "dos2.world_options".

If you checked and you didn't receive the item, let Intaiachi in the Discord know what item seemed not to work so he can fix it for future releases.

## The client doesn't say I'm sending anything, why?

You must open and connect the client to the multiworld before starting the game. You can stay on the main menu, but starting or loading a save without the client connected beforehand will not work.