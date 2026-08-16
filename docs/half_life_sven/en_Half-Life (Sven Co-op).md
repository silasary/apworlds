# Half-Life (Sven Co-op)

## What is this game?

Half-Life's campaign, as rebuilt for co-op play inside Sven Co-op. Sven Co-op
ships the whole 1998 campaign — Black Mesa Inbound through Nihilanth — recombined
into 35 larger maps across 18 missions, played co-operatively. It ships three
more the same way: Opposing Force, Blue Shift and They Hunger, all reachable from
the same campaign portal, and any of them can be part of a seed.

## A note on multiplayer

Sven Co-op is a multiplayer game, and its versions of these campaigns are built
to be played co-operatively. Some of what they ask of you is there on purpose to
keep it that way.

This randomizer is made for co-op lobbies. We do not endorse using it, or any
convenience it adds, to work around Sven Co-op's multiplayer design or to treat
these campaigns as free single-player games. Play it with other people. If you
want Half-Life on its own, buy Half-Life.

## Where is the options page?

The [player options page](../player-options) lets you configure your game.

## Which campaigns can be in a seed?

Sven Co-op ships four single-player conversions and the campaign portal fronts
all of them, so a YAML picks any combination of Half-Life, Opposing Force, Blue
Shift and They Hunger. Half-Life alone is the default.

Enable several and they run in parallel rather than in sequence: each hands you
one of its own missions at the start, each has its own "how many missions open my
finale" setting, and the seed is won only when every campaign's finale is done.
Their weapons go into one pool, so Opposing Force's displacer and They Hunger's
tommy gun turn up in Black Mesa and the Tau cannon turns up in theirs.

## What is Suspension?

An arcade map Sven Co-op ships alongside the campaigns, and an optional extra in
a seed: `suspension: true`. It is one map rather than a campaign — a class-based
squad retaking a suspension bridge in eight sections, against waves that scale
with how many players are in the lobby.

Three things become checks. Each of the eight sections, per difficulty. Clearing
a run, credited to whichever class you spent most of it as. And the medal at the
end, scored on the team's total deaths: platinum for a flawless run down to n00b,
with `suspension_required_award` deciding how far up the ladder goes. Medals
always roll down, so a platinum run sends every lesser medal too and nobody has
to die on purpose.

Difficulty is the lobby's shared ticket pool — 50 on easy down to a single ticket
on insane — and `Progressive Suspension Difficulty` items open the tiers in
order, so a fresh seed can only vote easy. Seven of the eight classes are items.
The eighth, the Juggernaut, is not: the map opens it once a run has been cleared
with each of the other seven, exactly as it does outside a randomiser.

Suspension's goal is a run cleared with **every one of the eight classes at your
capped difficulty** — so the Juggernaut is the last of them, and the cap is what
the goal is measured at. `suspension_goal_requires_award` adds the medal to that:
off, the deaths do not matter; on, each of those clears has to earn
`suspension_required_award` as well. Reaching it does not win the seed on its
own — every campaign in the YAML still has to be finished too.

`suspension_classanity` turns each section into a check *per class*, which is
lobby-scale: eight players on eight different classes clear eight classes' worth
in one run, where a solo player would need eight runs.

Section 4 is a tank, and only the Grenadier, the Pointman and the Engineer can
get anything that hurts it — the bridge's explosives crates equip those three
and nobody else. So every check from the tank onward, along with the clears and
the medals, is in logic behind holding one of those three classes. The sections
before it are open to any class, the detonation pack in section 3 included:
that one is a map item anybody can pick up and carry.

There is no hub console for it. Type `!warp suspension`.

## What does randomization do to this game?

The Sven Co-op campaign portal becomes a hub. Every mission is sealed until its
unlock item arrives from the multiworld, and each campaign in the seed begins
with exactly one random mission open — so no two runs start in the same place.

Every weapon except the one you start with is also an item. Weapons lying in the
levels can still be walked over (that is what sends the check), but Gordon will
not pick one up until the multiworld has granted it, and the campaign's own
per-map loadouts are stripped to match. A shotgun found in Office Complex is
worth nothing until somebody, somewhere, sends you the Shotgun.

That starting weapon is the crowbar unless `random_starting_weapon` is on, in
which case it is any melee weapon your campaigns could hand out — Opposing
Force's pipe wrench or combat knife, They Hunger's spanner. It replaces the
crowbar outright, so a wrench start means the crowbars in the levels are refused
like everything else — until the Crowbar item arrives, because it is in the pool
like any other weapon the seed did not start you with.

A campaign's final mission is not unlocked by an item at all. Nihilanth opens once
you have completed a configurable number of other Half-Life missions, and every
other campaign's finale works the same way off its own count.

Mission 0, Black Mesa Inbound, has no console in the campaign portal — `!warp 0`
in Sven Co-op chat is the only way to travel there. It can be dropped from the
seed with `include_black_mesa_inbound: false`.

## What items and locations get shuffled?

**Items** — a mission unlock for every mission in the seed (17 for Half-Life, 9
for Opposing Force, 5 for Blue Shift, 2 for They Hunger), the weapons of every
campaign you enabled, and optionally the HEV suit and long jump module.
Everything else is filler: ammo caches, medkits and armour batteries.

Half-Life brings 14 weapons (the crowbar, Glock, .357, MP5, shotgun, crossbow,
RPG, Tau cannon, gluon gun, hivehand, satchel charges, tripmines, snarks, hand
grenades).
Opposing Force adds eight more: the desert eagle, SAW, sniper rifle, displacer,
spore launcher, barnacle grapple, pipe wrench and minigun. They Hunger adds nine
of its own, from the Colt 1911 and tommy gun to the tesla gun. Blue Shift adds
none — in Sven Co-op it uses Half-Life's, down to the crowbar.

They Hunger's are the one set that cannot travel. They are custom entities its
own maps register rather than weapons the game ships, so they exist only while
you are playing They Hunger: receive one elsewhere and it is handed to you the
moment you arrive in an episode.

`trap_percentage` turns some of that filler into traps. There are three. Like
DeathLink, they are the whole lobby's problem rather than one player's, and all
of them are nuisances rather than punishments — none can cost you a run:

- **Scientist Trap** — four scientists, one of each variant, appear around every
  player and start following them about.
- **Headcrab Trap** — four headcrabs each, same idea, considerably less friendly.
- **Butterfingers Trap** — everyone drops the weapon they are holding. The suit
  reissues it after thirty seconds if you cannot find it again.

**Locations** — 173 in Half-Life alone, 353 with all four campaigns:

- reaching each part of a mission (Surface Tension has five, Office Complex one)
- completing each mission
- reaching each weapon where its campaign would first have given it to you, the
  crowbar included
- using each health charger and HEV charge panel, 143 in all

Sven Co-op splits Half-Life's campaign into 35 maps across 18 missions, so
progress through a mission is itself the check. Every wall-mounted charger is a
check too, whether or not it still has juice in it — pressing use is enough. Set
`chargesanity: false` if you want a shorter run without them; that hits Half-Life
hardest, since it holds 107 of the 143 and They Hunger has three in total.

Weapon checks are pinned to where the original campaign hands each weapon over:
"First Shotgun" is the Office Complex shotgun, and no other shotgun in the game
will send it. You do not have to be allowed to keep the gun for the check to
count.

## Which items can be in another player's world?

Any of them.

## What does another world's item look like in Half-Life?

There is no world model for it. Collecting a location prints the check to chat,
and the item goes wherever the multiworld sends it.

## When the player receives an item, what happens?

Weapons and mission unlocks apply silently — the next time you spawn, or
immediately if you are already alive, your loadout is rebuilt to match what you
own. Filler is applied on the spot: health, armour, or a top-up of ammo for
whatever you are currently carrying.

The HEV suit is the exception worth knowing about. You always wear it, because in
GoldSrc the suit is what draws the weapon HUD and without it you cannot change
weapons at all. What the item grants is armour: until it arrives your armour is
held at zero, and batteries, wall chargers and armour filler all do nothing.

The long jump module is switched on and off directly, so a module lying in a
level is scenery until the item reaches you. Leave it out of the shuffle and it
goes back to being Half-Life's: you find it in Forget About Freeman, where the
campaign has always given it to you.

## What is the goal?

Kill Nihilanth. Its mission only opens once you have completed enough of the
others, so the run is a tour of Black Mesa rather than a beeline.

With several campaigns enabled it is every one of their finales, each behind its
own count. With Suspension enabled it is those plus one more: the bridge cleared
with each class in `suspension_goal_classes` — all eight by default — at the
hardest tier your YAML allows, and earning `suspension_required_award` too if
`suspension_goal_requires_award` is on.

## What happens when somebody dies?

With DeathLink on, a death is the whole lobby's: everyone gibs and one DeathLink
goes out to the multiworld. `lobby_death_link` separates those two halves, since
one player's mistake ending the round for seven others is not always what a
lobby wants:

- **on** — the default, and what DeathLink has always done here.
- **non_arcade** — the lobby gibs in the campaigns but never on Suspension,
  where a run is long and deaths are already the medal's business.
- **off** — nobody else dies for your death, and the DeathLink still goes out.

A DeathLink *arriving* from another world always takes the lobby, whatever this
is set to: being killed by it is what receiving one means. And with DeathLink
itself off, none of it happens — there is nothing for a wipe to be the point of.
`death_link_amnesty` is separate again, and forgives a number of deaths before
one is reported at all.
