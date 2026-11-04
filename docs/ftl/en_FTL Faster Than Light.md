# FTL: Faster Than Light

## Where is the options page?

FTL is not hosted on archipelago.gg, so there is no options page on the website. Make your YAML with
**ArchipelagoOptionsCreator** (in the Archipelago Launcher, once `ftl.apworld` is installed), or start from one of
the ready-made files in `presets.zip` on the
[releases page](https://github.com/TheLiloji/FTLArchipelago/releases/latest). Every option is explained in the
[options guide](https://github.com/TheLiloji/FTLArchipelago/blob/main/docs/wiki/Options.md).

## Status

The game joins a real multiworld on **Linux** and **Windows**. Hyperspace's Lua sandbox has no sockets, so the
connection goes through a small C++ module built into this project's Hyperspace library.
Without a server, a **solo mode** (a button on the main menu) hands out the items of a real generated seed, one
per check. The setup guide has the details.

## What is this?

FTL is a spaceship roguelike: you pick a ship, you fly eight sectors chased by a rebel fleet, and you either
destroy the Flagship or you die trying and start over. This world turns the parts of FTL that normally unlock
slowly over dozens of hours into Archipelago items, and the milestones of a run into checks.

The rules are enforced by the game itself: a Lua mod running under
[FTL: Hyperspace](https://github.com/FTL-Hyperspace/FTL-Hyperspace) locks the ships, caps the systems and
sends your checks while you play. See the setup guide for what to install.

## What does randomization do to this game?

Three things are taken away from you at the start and handed back as items.

**Ships.** Every cruiser and every alternate layout is locked. You begin with one ship of your choice (plus the
Kestrel, see below) and the hangar fills up as ship keys arrive. Type B and Type C layouts are items of their
own by default, so you no longer have to earn two achievements with a ship before you may fly its Type B.

**Excluded Ships and Layouts** leaves out the ships or layouts you never want: name a ship ("Engi Cruiser") or
a layout ("Engi Cruiser B"). Your first ship and the Kestrel A cannot be left out.

**Multiverse** (off by default) plays with FTL: Multiverse 5.5.1 instead: its ships replace the base game's, and
you start with the MV Kestrel Cruiser. Apply Multiverse's Data and Assets with the mod. Victory Layouts then
takes Multiverse's names, like "Union Cruiser B". Shop Weapons, Shop Drones and Shop Augments draw from Multiverse's
own catalogue (120 weapons, 25 drones and 22 augments for sale).
**Multiverse Achievement Checks** (off by default) adds 26 of Multiverse's achievements (Accomplishments and
Special Events) as checks. They only ever hold filler or traps.

**Layouts in the Seed** keeps 7 layouts by default, drawn at random among those Ship Layouts allows. Your first
ship and the Kestrel A are always in, and a Type B or C only comes with its ship's Type A. The others have no key
and no check.

**System blueprints.** A system your ship does not start with cannot be bought until its blueprint arrives:
stores refuse it, and if one sells it anyway the mod takes it back and refunds the scrap. A ship that starts
with a system keeps it: nothing is ever torn out of your hull. Turn System Blueprints off and every system is for
sale.

**Upgrade levels.** Each "Progressive" item raises how far one system may be upgraded, up to the vanilla
maximum. Scrap still has to be spent; the item only lifts the ceiling. With **Progressive Upgrades per Ship** each ship has its own
upgrades ("Kestrel Cruiser: Progressive Shields"), which only count aboard that ship. A blueprint opens level 1 only, so the
Progressive items alone take a system to its maximum. Turn Progressive System Upgrades off and systems upgrade
as in the base game.

**What the shops sell.** FTL has 74 weapons, drones and augments that a store can stock, and by default all of
them become items (Shop Weapons, Shop Drones and Shop Augments lower that per family). This one is worth
understanding before you set it, because it has two quite different modes:

- `rarity_boost`, the default: the item already exists in shops, and receiving it makes it noticeably more
  common. Each extra copy makes it more common still. Nothing is ever taken away from you.
- `locked`: the item is pulled out of every shop until you receive it. Harsher, and much more of a moment
  when it finally arrives - this is the mode where finding a Burst Laser II for sale means another world sent
  it to you.

Either way the change is **permanent**: a weapon you unlock stays unlocked for every future run. That is
deliberate. In a game where every run ends, an item that only gives you one copy of a weapon would evaporate
along with the run it arrived in. By default you also get handed one copy on the spot, once, so the gift is
not purely theoretical - turn Shop Item Delivery off for a longer, more deliberate seed. The copy is mounted
if a slot is free, and goes to the cargo hold otherwise.

Every weapon and drone exists **twice** in the item pool. The first copy unlocks it as described above. The
second puts it in the **Archipelago menu** that opens at the first beacon of every new run: there you take
one weapon, one drone and one crew member from everything you have collected, for that run only.

By default they come in **bundles**: a Weapon Bundle holds 3 weapons, a Drone Bundle 2 drones, an Augment
Bundle 3 augments, drawn at random for each seed. A bundle does what each of its items would do on its own.
It means fewer items for the same content, so the Archipelago shop stays reasonable. There a bundle shows as
an important package: it starts at 45 scrap and gets dearer faster than a useful item. Set a bundle size to 1 to get every item on its own.

**Crew members** are progressive items too (Crew Members, on by default), one per race. The first copy puts a
crew member of that race aboard your current run; the second adds the race to the Archipelago menu; the third
turns that menu entry into an expert with one skill mastered - a Human pilot, an Engi engineer, a Zoltan on
shields, a Mantis fighter, a Rock repairman and a Slug gunner. Lanius and Crystal stop at two copies.

On top of that, "Head Start" items give you one free level of a system, or one extra bar of reactor power, at
the beginning of *every future run*. This is what makes a roguelike work in an Archipelago: an item that
arrives during a run you are about to lose is not wasted, because it makes the next run start stronger.

Four options make received items count right away, all off by default:

- **Free Upgrades**: system levels you receive are installed for free, at once and at the start of every run,
  instead of only being for sale. Needs Progressive System Upgrades.
- **System Install**: a system whose blueprint you received comes aboard for free, at the start of every run
  (`run_start`) or also as soon as it arrives (`immediately`), if the ship has a room for it. Needs System
  Blueprints.
- **Run Start Scrap**: each new run starts with a percentage of all the scrap items you received.
- **Combat Checks per Ship**: with each ship, the first fights you win in a run send checks ("Kestrel
  Cruiser: Fight 1 won"). Those fights give less scrap (Combat Check Scrap, 50 % by default); missiles, fuel
  and drone parts stay.

## What is considered a check?

- **Sectors.** Reaching sector 1 to 8 with a given layout. Each layout has its own eight checks, so flying the
  Rock Cruiser B to sector 4 is not the same check as flying the Rock Cruiser A there. This is where most of
  the checks live. It can be cut down to the two sectors FTL itself celebrates (5 and 8), trimmed from the
  shallow end with Sectorsanity First Sector, or turned off.
- **Systems.** Off by default: most ships start with half of the systems, so those checks would go out on the
  first jump. Turned on (`first_install`), installing a system is a check, sixteen in all: the run where you
  finally buy Cloaking pays for itself. With `every_level`, each level of each system is its own check as well -
  sixty-eight in all, and every upgrade you buy sends something out.
  With **Systemsanity per Ship**, each ship has its own Install checks ("Kestrel Cruiser: Install Cloaking"),
  never for a system that ship can start with.
- **Crew.** The first time a Human, Engi, Zoltan, Mantis, Rock, Slug or Lanius joins your crew, from an
  event, a store or a rescue. The crew you start a run with does not count. Seven checks, on by default
  (Crew Checks).
- **Victories.** Destroying the Flagship with a given layout. One check per layout, always enabled.
  The victory also sends that layout's sector checks still due (Victory Collects the Layout, `sectors` by
  default; `everything` also sends its ship's achievements, system checks and fight checks).
- **Ship achievements.** The three achievements of each ship. FTL awards them to the ship and not to the
  layout, so earning one with Type A, B or C sends the same check.
- **General achievements.** Up to twenty-one of them, in widening tiers: the straightforward ones, then the
  run-long "going the distance" challenges, then the hardest one-off feats.
- **The Archipelago shop.** One beacon per sector, marked AP STORE on the map, sells goods for other players.
  Buying one sends it to its owner. The seed balances itself: at least twenty slots by default (Archipelago Shop Checks), and more when your options create more items than checks, so no item is ever left out; the other way round, filler makes up the difference (at least twenty, Minimum Filler). The bigger the shop, the more packages each AP STORE beacon offers: 3, 6, 9 or 12. A package marked
  **FOR YOU** holds one of your own items. A package that was already sent never comes back on the shelf.
  With **Archipelago Shop by Sector** (off by default) each package belongs to one sector, 1 to 7, and only
  that sector's beacon sells it: the logic counts it as deep as its sector.
  **Archipelago Shop per Ship** (off by default) also gives each package to one ship, or one layout: it is only
  sold while you fly that ship.
  Prices follow importance first, then depth: filler costs 10 to 25 scrap, useful items 30 to 65, and
  progression items 70 to 150, more in later sectors and the later they sit in the multiworld.

## Archives

A second currency: by default 12 Archipelago Archives are scattered through the multiworld, yours included, and
10 of them are needed (**Archives** and **Archives Required**, 0 turns them off). The two spare ones are slack you
never have to chase. Beating the
boss five times is no longer enough on its own - you also have to wait for, and trade for, the
pieces other people are sitting on.

Asking for every Archive that exists is the harshest setting: one Archive behind a long chain in
someone else's world gates your whole seed. Leaving a few spare is what keeps the hunt moving.

## What items can appear in other players' worlds?

All of them: ship keys, layout unlocks, system blueprints, progressive upgrades, head starts, reactor power,
shop unlocks (weapons, drones and augments), and filler (scrap, fuel, missiles, drone parts, hull repair, a
new crew member). Traps are off by default and can be enabled as a percentage of the filler.

## Death Link, Energy Link and Trap Link

All three are off by default.

**Death Link.** FTL has more than one kind of death, so you choose which ones count: losing the run, losing
any single crew member, or **both**, which is the default. Know what "both" means in practice: you lose crew
members far more often than you lose runs, so most of what you send will come from that half. If your
multiworld finds it too noisy, `ship_destroyed` is the quiet setting.

Deaths that come in a burst count once: when your last crew member dies and the run ends with them, the
others receive one death, not two. The same goes for several crew members lost within ten seconds.

Deaths you *receive* can never destroy your ship. Losing a run in FTL costs an hour, so a death link that
outright killed you would turn the multiworld into a punishment. Your hull is never taken below 1 and your
last crew member is never killed.

That said, the default effect is deliberately harsh: a **major incident** puts a breach *and* a fire in one
of your system rooms, and damages that system. It cannot destroy your ship, but a breach and a fire in your
shield room in the middle of a fight can absolutely lose you the run. Four milder effects are available if
that is not what you want (a crew member, hull damage, a fire, a boarding party), or `varied` to draw one.

If the effect you picked cannot apply - a lone survivor, a hull already at 1 - the mod falls back to a
*milder* one rather than letting the death pass unnoticed. A fallback never escalates.

**Energy Link.** A fuel reserve shared with every Energy Link player in the multiworld, whatever game they
play. Fuel is the one FTL resource whose absence does not kill you outright - it strands you, and being
stranded is one of the game's most frustrating deaths.

Your surplus fuel is deposited automatically at safe beacons, minus a 25% handling loss so the reserve cannot
be used as a personal vault. When you drop below three fuel, your ship asks the reserve for more, once per
beacon, so one desperate player cannot drain it. Note the asymmetry: you may deposit scrap, but you can only
ever withdraw fuel. Scrap is FTL's progression system, and pooling it would amount to letting another world
buy your upgrades.

**Trap Link.** Traps are shared with the other Trap Link players, so theirs reach you even if your own seed
contains no traps at all.

A trap sent by another game arrives under *that game's* name, which usually means nothing here - "Ice Trap",
"Banana Peel", "Reverse Controls". Rather than ignore what it cannot read, the mod matches on keywords: a
trap whose name mentions fire starts a fire, one that mentions a breach opens one, one that mentions ice
knocks out a system. Anything it still cannot place becomes one of FTL's own traps, drawn at random. You
signed up for something unpleasant; you get something unpleasant.

## What is the goal?

Destroy the Flagship with several **different layouts**. Two ways to say which:

- `victory_count`, the default: any number of layouts you like, five by default.
- `victory_selection`: a list of layouts you name yourself, and only those.

**Victory Difficulty** asks for those wins on Normal or Hard by default (Normal): an easier win still sends its
victory check, it just does not count towards the goal. **Archives** can add a second condition (see above).

A layout left out of the seed (Ship Layouts, Layouts in the Seed) cannot count towards either.

Nothing forces you to finish a run you are losing. Dying costs you the run, not your items, and the head
starts you have collected apply to the next one.

## How hard the logic is on you

Two families of options decide how much ship the generator assumes you have before it sends you deep.

**Sector Logic** counts blueprints without caring which: `relaxed` puts every sector in logic as soon as the
layout is, `standard` expects a couple of blueprints before the deep sectors, `strict` expects a real ship.

`power` looks at the ship instead: each check is judged on the ship that does it, from its real start. Sector 5
needs 2 shield layers, sector 8 also Weapon Control 5, the Flagship 3 layers, Weapon Control 6 and Engines 4.
So a Mantis B, which starts with 2 layers, meets sector 5 right away. A ship that starts without shields (the
Stealth Cruiser) may use Engines 5 in place of one layer, except for the Flagship. Victory Difficulty moves the
bar: `any` asks 2 layers for the Flagship, `hard` asks 4. It reads upgrade levels, so it matters most with
Progressive System Upgrades on; without them, levels are bought with scrap and only the Stealth's Shields
blueprint is waited for.

**The five per-system sliders** (Shields, Sensors, Medbay, Engines, Weapons) are the opposite: they name one
system each. Set to `required`, a ship whose starting layout includes that system is only in logic once you
hold its blueprint, which can leave several cruisers sitting in the hangar early on. A ship built without the
system is never affected, so the Stealth Cruiser, which has no shield system at all, stays available whatever
the Shields slider says. Engines and Weapon Control cannot gate anything, since every ship starts with both;
for those two the slider only decides how early the blueprint is placed.

One correction applies on top, and Et0san's Manual world makes it too: a blueprint that would lock a ship you
are given for free is handed to you at the start instead. Without it, setting several sliders to `required`
would leave you with nothing to fly and no seed to generate. Since the Kestrel A is always yours and carries
shields, sensors and a medbay, those three blueprints start in your inventory as things stand.

None of this changes what the game lets you do. It changes what the generator is willing to assume.

## FTL-specific things you should know

**The Kestrel Type A is always playable.** Hyperspace can unlock a vanilla ship but it cannot re-lock one, so
the Kestrel A that every FTL profile starts with stays available no matter what. Its key still exists as an
item for the sake of uniformity, and it is handed to you at the start of the seed, which is why the logic may
freely assume you own it. In practice: you are never stranded with nothing to fly.

**Only Archipelago unlocks ships.** FTL would unlock ships its own way (an event, an achievement): the mod
refuses those unlocks, and at the main menu it locks again any ship FTL unlocked before (an older version of the
mod could not). The one exception is Layout Unlocks set to vanilla, where a Type B or C earned through its ship's
achievements is kept, and becomes playable once the ship's key is in. If a ship you did not receive is playable
all the same, the hangar marks it NOT RECEIVED, and a run with it sends nothing, not even its victory.

**A separate profile is created.** The mod tells Hyperspace to keep its own profile file
(`hs_ap_prof.sav`) and to start it empty, which is the only way to have every ship locked at the beginning.
Your vanilla profile, your unlocks and your high scores are not touched. Achievements you earned years ago do
not count: a ship achievement check only fires when you earn it again. And because Hyperspace cannot re-lock a
ship, a new seed on an old profile would start with the previous seed's ships: the mod notices, refuses the seed
and offers to erase the Archipelago profile, keeping a dated copy next to it.

**Achievement checks arrive one jump late.** The mod reads your profile at every jump rather than watching for
the achievement popup, so a check is sent at the next jump after you earn it. It can also arrive during a run
that has nothing to do with it, which is normal.

**"Reach sector 1" costs you one jump.** The check is sent when you *arrive* somewhere, so starting a run and
quitting immediately sends nothing.

**Three general achievements are not earned inside a single run**: "Rule Ten: Greed is Eternal" (10,000 scrap
across all games), "Warlord" (1000 ships destroyed across all playthroughs) and "Your Own Fleet" (unlock every
Type A layout). They are off by default, and the first two may simply never happen on a short seed. Turn them
on only if you know what you are asking for.

**Traps cannot lose you a run on their own.** Every trap has a floor it will not cross: it never
takes your hull below 3, never leaves you with less than 2 fuel, never knocks a system out
entirely, and never pushes the rebel fleet more than six times in one run. If the effect you were
sent cannot apply, a gentler one takes its place — and if none can, the mod says so rather than
going quiet. Losing ninety minutes to an item somebody else found is not tension, it is just
bitterness.

**Traps wait for a safe beacon.** A fire or a hull breach is delivered at the next jump to a quiet beacon, not
in the middle of the Flagship fight. So does everything else you receive: scrap, a weapon, a new crew member.
An item that arrives mid-combat waits. Received deaths are the one exception - a death link that waited for a
quiet moment would not be a death link.

**A weapon arrives in your cargo hold, not in a slot.** You still have to equip it, and if your cargo is full
the mod holds the item and delivers it later rather than dropping it.

**Difficulty.** The logic does not care what you play on, unless Victory Difficulty asks for Normal or Hard
wins. One caveat: the "Federation Victory (Easy)" and "(Normal)" achievements depend on the difficulty you win
on, so if you enable the general achievements and only ever win on Hard, check that they have been awarded.

## Custom events and hints

Five encounters of the mod's own appear at beacons marked ARCHIPELAGO, each a choice with no way back:

- **A relay** carrying two packages for other worlds. Route one: its check is sent, for 15 scrap. If there is no
  package to route, the scrap is refunded.
- **Pirates holding a package**, preferably one for another player. Pay them 20 scrap, or fight them: win, and the
  package goes out for free on top of the usual loot.
- **A Zoltan checkpoint** asks for a tithe to the shared Energy Link reserve, or lets you draw fuel from it.
- **A Slug** sells a hint for 20 scrap: a real Archipelago hint about one of your unvisited locations, recorded on
  the server like any other. Without a server, or with nothing left to find, the scrap is refunded.
- **A surge from another world** you can absorb, or push back out as a trap on Trap Link.

**No branch ever locks a check away.** These encounters appear at random, so the generator cannot rely on them.

Every hint that concerns your world, whoever asked for it and however, appears in game and stays listed in the
dashboard (`TAB`) until the item is found.

## Playing in your own language

The mod speaks **English, French, Spanish, German, Italian and Portuguese**. By default it follows
whatever language FTL itself is set to; the `Mod Language` option overrides that.

What is *never* translated: item and location names. They are global identifiers shared with the
server, with the other players' clients and with every tracker, and translating them would break
hints between worlds. Only the sentences around them change language.

## Credits

The item list, the location list and the shape of the options come from the **FTL Manual world by
[Et0san](https://github.com/Et0san/Manual)** (MIT), specifically the *Manual FTL v1.0.0* release. The split
into ship keys, system blueprints, per-layout sector checks and achievement tiers is his design, and this
world reuses that **data** and that breakdown. None of his code is used here: the logic, the options and the
in-game mod were written from scratch against Hyperspace's Lua API. See `LICENSE.md` in this apworld for the
full notice.

Thanks also to the FTL: Hyperspace team, whose mod loader and Lua API make it possible to lock a ship or cap a
system without touching FTL's binary.
