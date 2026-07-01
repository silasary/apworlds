# Divinity Orignial Sin 2

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

## Which items can be in another player's world?

All items listed in the above list.

## What does another world's item look like in Divinity?

No information will be presented in the game, the client is the only current way to see incoming and outgoing items.

## Is multiplayer supported?

Yes, as long as the host is the one with the Archipelago mod active and the one with the client connected. Other players playing the same game of Divinity do not need a .yaml, the game mod, nor the client.
Basically, have the host play like they're going to play a single player archipelago, and have the others join their game.

## What happens when I receive an item?

If it's an item, it will appear in the current controlled party members inventory. If it's the first of its type to be obtained, a pop up in the middle of the screen will show the item received.
If it's any of the stats, it will be given to each party member and can be spent when opening up the character menu. Level ups will make their usual effects and sounds but the rest will be silent, keep your eyes open!

## Whats this Archipelago Sync spell?

In the yaml, there is an option that determines when the game will sync with Archipelago. When the option "On Spell" is selected, the character you started as will learn the "Archipelago Sync" Spell.
This spell mimics the effects of the spell "Bless", but instead of blessing anything, you will receive all Archipelago items that are unclaimed. This spell has unlimited uses and uses no memory slot.

## This quest/enemy didn't send an item upon being checked, why?

Some quests are not included as locations. These quests in some manner are missable, such as companion quests or cross act quests such as Seeking Revenge. Enemies are in a similar situation. Some enemies that
have a route in which they do not become hostile tend to be exempt, while some have circumstances that they do not spawn. You can check locations in the client or spoiler log to check if a quest or enemy is included
to see if a check was truly not sent correctly.
If you believe you have a case that is an exception to these, please let Intaiachi know in the Discord to see if he can fix it for future releases.

## I see that I received an item, but its not in my inventory, why?

Items are sent to the currently controlled character, so if you swap control such as in combat, who is holding the item can be vague, so make sure to check all inventories.
If you checked and you didn't receive the item, let Intaiachi in the Discord know what item seemed not to work so he can fix it for future releases.

## The client doesn't say I'm sending anything, why?

You must open and connect the client to the multiworld before starting the game. You can stay on the main menu, but starting or loading a save without the client connected beforehand will not work.