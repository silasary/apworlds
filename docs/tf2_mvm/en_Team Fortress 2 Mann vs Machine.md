# Team Fortress 2 Mann vs Machine

## What does randomization do to this game?

Mann vs Machine is the co-operative mode of Team Fortress 2. Six players
defend a hatch against waves of robots. Between waves, the players buy
upgrades.

A run uses some of the missions. Each wave the team clears is a check. Each
mission the team clears is a check. The first tank and the first giant of each
mission are checks too.

You do not start with the full game:

- The nine classes are items.
- The three weapon slots are items. A locked slot is empty.
- The ticket that opens a mission is an item.
- Weapon buffs, cash bundles and traps fill the rest.

Each difficulty tier asks for more classes and slots than the tier below it.

## What is the goal?

The seed sets one of two goals:

- **Final Boss**: the run marks the hardest mission it drew. Clear it to win.
- **Missionsanity**: clear a share of the missions, in any order.

`medal_on_clear` puts an Australium Medal on every mission clear. The goal
then counts the medals you hold, so a `!collect` from another player cannot
finish your run for you.

## Which items can be in another player's world?

All of them: the mission tickets, the classes, the weapon slots, the weapon
buffs, the cash bundles and the traps. Only the Australium Medals stay in your
own world.

A trap has a bad effect. `trap_percentage` decides how many the run holds,
one percent by default. The one trap so far soaks the whole team in Jarate for
ten seconds. A trap that arrives between waves waits for the next one.

## What does another world's item look like in Mann vs Machine?

The server writes the item in the chat. There is no model for it, and the
plugin never stops a wave to show one.

## Do I need to install anything?

No. The randomizer stays on the server. Connect with a normal Team Fortress 2
client.

The host installs the server. Read the setup guide.

## One slot for the whole server

One Archipelago slot covers the whole server. Everybody on it shares the same
classes, slots and missions.

Valve balances Mann vs Machine for a team of six. With one slot per player,
one player has no primary weapon and another has no melee weapon.
