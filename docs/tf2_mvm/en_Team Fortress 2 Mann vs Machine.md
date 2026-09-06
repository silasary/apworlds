# Team Fortress 2 Mann vs Machine

## What does randomization do to this game?

Mann vs Machine is the co-operative mode of Team Fortress 2. Six players defend
a hatch against waves of robots. Between waves, the players buy upgrades.

A run uses some of the 29 Valve missions. Each wave that the team clears is a
check. Each mission that the team clears is a check.

You do not start with the full game. The mercenary classes are items. The
loadout slots are items. The ticket that opens a mission is also an item.

Each difficulty tier asks for more classes and more slots than the tier below
it. An Expert mission stays closed until the run gives you most of the classes.

## What is the goal?

The seed sets one of two goals:

- **Final Boss**: the run marks the most difficult mission that it drew. Clear
  that mission to win.
- **Missionsanity**: clear a part of the missions that the run drew, in any
  sequence.

## Which items can be in another player's world?

All of them: the mission tickets, the mercenary classes, the progressive weapon
slot, weapon buffs, cash bundles and traps.

A trap has a negative effect. `trap_percentage` decides how many the run holds,
and it is zero by default. The one that exists soaks the whole team in Jarate
for ten seconds. A trap that arrives between waves waits for the next one.

## What does another world's item look like in Mann vs Machine?

The server writes the item in the chat. There is no model for the item of
another player. The plugin does not stop a wave to show one.

## Do I need to install anything?

No. The randomizer stays on the server. A SourceMod plugin reads the game. A
bridge process speaks to the Archipelago server. Connect with a standard Team
Fortress 2 client.

The host does more work. Read the setup guide.

## A note on the slot

One Archipelago slot covers the whole server. All the players share the same
classes, slots and missions.

Valve balances Mann vs Machine for a team of six. One slot for each player
leaves one player without a primary weapon and another player without a melee
weapon.
