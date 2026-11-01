# Star Ocean: The Second Story

Star Ocean: The Second Story is a PlayStation RPG (the North American, European, French and
German releases) following Claude
and Rena across the planet Expel and the forgotten world of Energy Nede. This world is played
through Shattered Stars, a from-scratch port that reads your own disc images at run time;
there is no ROM or game data bundled with it.

## What does randomization do to this game?

Every chest and every gift site (a scene, a Private Action, a prize table — anything that
hands you an item or Fol outside a chest) holds an item from the multiworld instead of its
original contents. The story's own key items are never touched: they are script flags, not
objects, so the story always goes on no matter what you find.

On top of that baseline, six more kinds of locations can be turned on:
- defeating a boss,
- a party member joining you,
- the first time an enemy type drops anything in a random encounter,
- buying a slot at a shop for the first time,
- making an item with Item Creation for the first time (craftsanity),
- a killer move reaching a new proficiency level.

## What is the goal?

The goal is always beating Indalecio, the final boss, in Fienal (in hub mode too, once Fienal
is open: see "Hub mode" below). The `goal` option picks which version of him counts:

- **`indalecio`** (the default; `final_boss` still works): either version of the fight. This is
  how the game normally ends.
- **`indalecio_limiter_off`**: only the harder version, with his limiter off. In the original you
  get it by meeting Filia in Clik early in the story (a Private Action that's easy to miss) and
  meeting her again near the end. Here the Clik meeting is done for you; after you've saved at
  the Final Save Point in Fienal, enter Central City as a Private Action (from the world map)
  and walk into City Hall, where Filia's scene takes the limiter off (and gives you Israfil's
  Tear). The way from the Final Save Point to Indalecio stays shut until then ("Talk to Filia
  in Central City first").
- **`indalecio_limiter_off_and_iseria_queen`**: as above, and you must defeat the Iseria Queen
  first. She has no fixed battle: she's summoned by the song "The Evil Melody", which you
  compose with the Silver Trumpet that G-Celesta gives you at the bottom of the Cave of Trials,
  and play with a Conductor's Baton through a party member at Musical level 10 with the Pitch
  and Sense of Rhythm talents. So this goal means clearing the Cave of Trials, whether or not
  `cave_of_trials` adds its locations to your world. The Silver Trumpet can't be sold until the
  song is composed, so you can't lose it by accident. The way to Indalecio stays shut until
  she's beaten ("Defeat the Iseria Queen first").

If `cave_of_trials` is on, the Cave of Trials becomes available after that late-game save
point as extra, very hard optional content with its own chests, gifts and boss fights. It
doesn't change the goal.

## What items can you find?

- **Equipment and consumables.** Most of what you find is an ordinary game item — weapons,
  armor, accessories, recovery items, and so on. The game's own classification decides whether
  a given item is *useful* (worth watching for) or plain *filler*; weapons, armor and a few
  other strong item ranges count as useful, everything else as filler. The filler item's name
  is **Blueberry**.
- **Fol.** Many gift sites and some chests give Fol bundles instead of an item. These are
  filler.
- **Characters**, if `character_items` is on. Instead of joining you at their story scene, a
  party member arrives as an item — see "Who can join your party?" below. A character is
  usually just *useful*; with `killer_move_progression: any`, a member whose killer moves hold
  progression items is a progression item too, since you need them to reach those checks.
- **Traps**, if `traps` is above 0%. A share of the filler pool becomes one of five traps
  instead:
  - **Ambush Trap** — your next free step on a map with random encounters starts a forced
    battle.
  - **Fol Loss Trap** — you lose 10% of your current Fol.
  - **Poison Trap** — poisons your active party.
  - **Paralysis Trap** — paralyzes one active party member.
  - **Stone Trap** — turns one active party member to stone.
- **Area keys**, if `world_mode` is `open_world`. Thirty-five keys, each named after an area
  ("Salva Pass", "Fienal Pass", and so on), unlock that area's entrances on the world map. These
  are progression items and are placed in the multiworld like any other progression item. You
  start with the Arlia Pass and the Fun City Pass, and with the North City Pass and the Noel's
  House Pass too unless `expel_teleporter` and `expel_progression` are both on.
- **Dungeon keys**, if `world_mode` is `hub`. One per dungeon ("Salva Drift Key", "Field of
  Power Key", and so on, up to 18), each unlocking every door into its dungeon. Progression
  items. See "Hub mode" below.

## What locations exist?

Chests and gift sites always exist as locations: 308 chests and 101 gift sites (75 of the
chests and 3 of the gifts are in the Cave of Trials, which only appears with
`cave_of_trials`). Six more kinds exist only with their own option:

| Kind | Count | Option |
|---|---|---|
| Boss fights | 41 (13 in the Cave of Trials) | `boss_checks` (on by default) |
| Party members joining | 18 (21 in open world with `character_items`) | `character_items` |
| An enemy type's first drop | 89 | `enemy_dropsanity: first_drop` |
| Shop slots | up to 550 (98 of them sell something no other shop does) | `shuffle_shops: specials` or `full` |
| Items made with Item Creation | 553 | `craftsanity` |
| Killer-move proficiency levels | 133 | `killer_move_checks` |

Shop slots never hold progression items, in any mode — a price can run into the tens of
thousands of Fol, so nothing the story needs is ever gated behind a purchase. In the shop's list
a slot still to check has the Archipelago logo after its name. Buy it (any number of copies) and
you get what you bought, and the slot's check too: its item comes to you or goes to its player.
After that it is an ordinary entry.

**Enemy drops** may hold progression items (`drop_progression: allow`, the default), must get
them first where the odds are fair (`force`), or never hold them (`never`). Whatever you
choose, a drop only holds progression when its enemy can always be met again in random
encounters from the point the logic expects you to get it, and only when it drops at least once
in 64 kills without any Luck: enemies that need a lucky party to drop at all (Magius, Ericodus,
Shout, Starguarder, the slimes and others) never hold anything important. With
`encounter_rate: 0` no drop holds progression. `force` fills the drops that come about once in
13 kills or better. Turn `area_keys_in_drops` off to keep every area key out of the drops, so
no area ever waits on one fight's drop.

**Craftsanity** makes each distinct item Item Creation can produce (cooking, compounding,
metalwork, customizing, art, authoring, alchemy, machinery and the super specialties Master
Chef, Publishing, Blacksmith and Reverse Side) a location, checked the first time you make it,
whatever recipe you used. You keep the item you made, and the location's item comes on top. These
locations never hold progression items. A few results only certain members can make (each
member's own Customize weapons, Leon's rare books), and the portraits and Publishing's books
are each about one member, who must be in your party; those hold only filler unless that member
is sure to be in your party. With `no_fail_crafting` on, Item Creation never fails by chance.

**Killer-move checks** make each proficiency level of each killer move a location: Claude,
Bowman, Dias, Precis, Ashton, Opera, Ernest and Chisato, 69 moves. A level is checked when the
member has used the move often enough (most moves level up at 100 to 300 uses; the moves that
count in small steps get three checks, at 100, 200 and 300 uses). By default
(`killer_move_progression: never`) they hold no progression items; `hero` lets the story
route's hero's moves hold them (Claude's; Rena has no killer moves), `any` every member the
logic can count on (the hero, the starting character, and members who join through their
character item, in which case that character becomes a progression item). Moves learned by
level 30 are expected from the disc switch, the rest from the Final Save Point (on a hell seed,
all of them from the Fun City arena: see "Hell seeds" below). A member who may never join your
party has no killer-move checks; one who only joins by your choice in the story holds only
filler there.

**Skillsanity** turns skills, killer moves and spells into items:
- `skills_only`: buying a set at a skill guild doesn't teach its skills any more; it's one check
  per skill in the set ("Skill Guild: Sensibility 2 (1 of 4)"). Each skill is an item ("Skill:
  Perseverance"): once you have it, any member can learn it with SP on the Skills page, as
  buying its set used to allow. Members keep the skills they join with. With the Cave of Trials
  on, its Level 11 prize (Float) is a check too. Item Creation needs its specialty's skills, so
  with craftsanity a craft may wait for the right skill items (Rena joins with Cooking's).
- `special_only`: every member knows the first killer move or spell of their list from the start
  (Claude's Air Slash, Rena's Heal...); every other one is an item ("Claude: Shooting Stars"), and
  each place it was learned is a check instead: a level ("Claude Lv 7: Shooting Stars"), Precis's
  and Opera's machines (using the Holoprojector and the other five; the arena's Private Action
  for Holo-holograph), and the Cave of Trials' learn chests. A member who joins past a level gets
  that level's checks at once. A move you receive before its member joins is waiting for them.
  With killer-move checks, a move's levels need the move.
- `insanity`: both.
- Guild checks and learn levels may hold progression items (keys, characters, other worlds'
  progression), like any other check that's in reach, unless `encounter_rate` is 0 (no battles:
  no Fol and no levels; but see "Hell seeds" below). A guild check is expected once one of its set's guilds is in reach: the
  cheaper sets (up to 1600 Fol) right away, the 2700-4500 Fol sets once you've finished Hilton and
  the Hoffmann Ruins (in story mode from the disc switch, in hub mode once Fienal opens). With
  `expel_progression` off, only the guilds on Energy Nede count. A learn level counts as killer
  moves do: up to level 30 from the disc switch, the rest from the Final Save Point (hub mode:
  from the start, the rest once Fienal opens), and only for members the logic can count on; a
  member who joins through their character item needs it first. Precis's and Opera's machines,
  the Cave of Trials' learn chests and Float never hold progression, and shops never do.
- With shop slots on, `skillsanity_shop_share` (default 10 %) puts some of your skill and move items
  in your shops, sold as themselves with the Archipelago mark: a move for its learn level x 100 Fol
  (an item-taught one 5000, a Cave of Trials prize 8000), a skill for its set's price divided by
  the set's size (Perseverance: 1600 / 4 = 400), Float 900. You buy one; that's the slot's check.

**Hell seeds.** `encounter_rate: 0` (no random battles) together with `killer_move_checks`, or
with `skillsanity` `special_only` or `insanity` (learn levels), makes a **hell seed**: a game
where the grind is meant to be preposterously hard. With no random battles, the only fights you
can train in are the **Fun City Fighting Arena**'s (the desk in Fun City: Duel, Bullying, Team
and Survival; any member in your party may enter). On a hell seed:
- the arena is **free** (registering normally costs 2,000 Fol); every fight still pays its EXP
  and Fol, and killer-move uses count there as in any battle;
- killer-move levels, learn levels and skill guild checks are expected from the arena and may
  hold progression items: in story mode from the disc switch, in open world once you've finished
  the Cave of Red Crystal (with the Fun City Pass, which you start with), in hub mode from the
  start. A key you need may well sit behind a long stretch of arena fights;
- the setup program warns you when you choose the seed ("Hell Seed: no random battles. ...",
  Shattered Stars 0.02.51 and later), and the game logs the same line.
`encounter_rate: 0` without those options is an ordinary seed: the arena's fee stays, and guild
checks and drops hold no progression.

**Some locations can be missed for good**, and the `missable_locations` option decides what
happens to them:
- a scene closed by a chapter window, or a town that's changed too much to visit (by default,
  `exclude`, these still exist but hold only filler; `include` treats them as ordinary
  locations you must not be late for);
- anything that depends on a choice that rules out another location — an optional party
  member's own scene, a Private Action, a side quest, a fight the story lets you lose, a join
  site, or a location that exists only in Claude's or only in Rena's game when `story_route` is
  `any` — always holds only filler, regardless of the option, because two such locations can
  rule each other out;
- `remove` leaves every missable location out of the world entirely, items and all — except
  join sites, which stay, because they're how party members join when `character_items` is on.

## Hub mode

With `world_mode: hub` you don't play the story at all. New Game drops you into the world as it
stands after the Final Save Point in Fienal — with every chest still closed and every story boss
still waiting — and the whole game is open around you:

- **Both worlds, every town, from the start.** Energy Nede by the Synard, Expel through the old
  man in Fun City's arena or Virtual Expel's Synard. Nothing ever closes behind you: the story's
  clock is held at its last chapter, so there is no disc switch, no voyage and no way to miss
  anything for good.
- **One key per dungeon.** Towns are always open; each dungeon (Salva Drift, Cross Cave, the
  Mars dungeon, Zand's Mansion, the Sanctuary of Linga, Hoffmann Ruins, the Lacour Front Line,
  Eluria Tower, the Mountain Palace, Lasguss Mountain, the Cave of Trials, the Synard Plant, the
  Cave of Red Crystal, the four Fields, Mihne Cavern) stays locked until its key arrives. A
  dungeon gets a key only when something in it counts for your world; one with nothing in it
  is simply open.
- **The bosses wait in their dungeons** and play their original scenes when you walk in: Alen-Tax
  in Salva Drift, the Cross Cave guardians, Varmillion (Claude's game) or Azamgil (Rena's) in the
  Mars dungeon, Visseyer, Harfainx, Shin at the Front Line and in Eluria Tower, Berle in Eluria
  Tower and in Armlock, the Synard, Arcmene, the four Fields' guardians, Bark, Marsilio in the
  arena, Shigeo, and the three Fienal pairs. Each one is fought whenever you like, in any order,
  as soon as you have its dungeon's key (Berle in Armlock, Shigeo and Marsilio stand in towns
  and need none). Beating one is a location (`boss_checks`).
- **Shigeo and Marsilio ask first.** Both wait in Fun City, on your way between the two worlds
  and in the arena you'll want for training, so neither is forced on you:
  - Your first step into Shigeo's street on each visit to Fun City asks "Face Shigeo now?". Yes
    plays his scene and fight; No lets you walk through the street (to the arena and the old
    man's way to Expel) without him, and he won't ask again until you've been out on the world
    map: to face him later, leave Fun City for the world map and come back in.
  - The arena's receptionist offers "Face Marsilio." next to "Register.", and the arena's back
    door asks "Face Marsilio now?" (once per visit, like Shigeo; the receptionist always offers). Yes takes you to his scene; there the Clerk adds "Leave the
    arena." to his menu if you'd rather go back. **The arena itself can be used for training at
    any time**: "Register." gives the ordinary ranking battles, Marsilio or not.
  - Saying No (or leaving) changes nothing: he stays unbeaten and you're asked again on your next
    visit. Loading a save asks again too.
- **Fienal opens on `fienal_requirement`:** the four Fields' bosses and Berle in Armlock (the
  default), the four Fields' bosses only, or every boss outside Fienal. Fienal's entrance tells
  you which one is still missing ("Defeat Lover first"). Fienal has no key of its own. Your goal
  (`goal`, as above) is behind it; with a limiter-off goal, Filia is waiting in Central City City
  Hall from the start, and the Iseria Queen needs the Cave of Trials Key.
- **`hub_start`** picks where New Game puts you: Fun City (the default), Arlia, or `random_town`,
  any town of either world.
- **Party members are always items** (whatever `character_items` says): nobody joins through a
  story scene there. `starting_character`, `exclude_characters` and the bench work as in open
  world. With `story_route: any` both Claude and Rena are items too; the one you pick at New Game
  is already with you, so their item does nothing.

**What hub mode leaves out.** Everything the late game can't reach any more: the story's
scenes, the join scenes, the gifts of the story's earlier scenes (only the handful you can still
get after the Final Save Point stay), old Clik and its shops, Lacour's tournament and its war-time
shops, the fights the story lets you lose (Dias at the tournament, Shin on the ship, Marsilio's
first fight in Fienal, Zand) and the side quests' bosses the late game no longer offers (XINE in
Lasguss Mountain stays, and can hold anything). Two more places are not locations in hub mode:
the Portal of Sealing (its one chest, the Mind Ring) and the prize gift of Fun City's arena (the
arena itself stays open for training). What stays: the chests the game can still reach after
the Final Save Point (217, or 290 with the Cave of Trials; Eluria Tower's and the rooms of
Fienal's maze among them), 7 gifts (9 with the cave), the bosses above, and whatever else your
options add (shops, drops, crafts, killer moves) as far as the hub reaches them.

Progression items in hub mode go only into those chests and the boss fights (and, by
`drop_progression`, enemy drops; with skillsanity, guild checks and learn levels); never into
shops, gifts or crafts. Killer-move levels and learn levels past level 30, and the guild sets of
2700 Fol and up, are expected once Fienal is open.

## What does another player's item look like?

A chest or gift whose contents were sent to someone else's world still plays out the original
scene — the message window opens where the item would normally be named — but instead of
naming the real item, it says something like "Sent Hookshot to Alice." Your own items the game
hands you the same way read "Got Blueberries." (or whatever the item is). When you receive an
item from someone else's world, it arrives the next time you're free to walk around, with a
banner like "Received Revival Card from Alice."

## Who can join your party?

**The join level** (open world and hub mode): a member who joins takes the median level of the
party (the members in its eight places, the one joining left out; the bench doesn't count), up through the game's own level-ups or
down by the levels' average gains (never below Claude's or Rena's level-1 values); their gear and
SP stay as they come. A starting character joins at your hero's level, so at level 1 on New Game.
Story mode keeps every member's own join level.

With `character_items` on, Celine, Bowman, Precis, Ashton, Opera, Ernest, Chisato, Leon and
Dias become items instead of joining at their story scene; the scene where they'd normally
join for good becomes a location instead, holding that location's own shuffled item. A member
only actually joins once their item has arrived and there's room in the party.

Leon can only join as an item in Claude's game, and Dias only in Rena's — in the other
story_route's game, or with `story_route` set to `any`, neither of them is offered as an item
at all. Some members also compete for the same party slot: you'll get one of Bowman or Precis
(Precis rules Bowman out) and one of Ashton or Opera-with-Ernest (Ashton rules Opera out;
Ernest only comes along with Opera). Celine and Chisato always join if `character_items` is
on. Claude or Rena, Noel, and the current story_route's game always get these members through
the story as usual — they're never shuffled.

### In open world

With `world_mode: open_world`, the party rules are looser (story mode keeps the rules above):

- **No lockouts with `character_items`.** Any member but your story route's hero can be an
  item: the other hero (Rena in Claude's game, Claude in Rena's), Noel, Leon and Dias in either
  game, Bowman together with Precis, Ashton together with Opera and Ernest. With `story_route:
  any` both Claude and Rena join through the story, since you pick between them at New Game.
  With the bench (below, on by default) the pool holds every member you haven't excluded.
  Without it, the pool holds as many members as fit the party's 8 places with the hero and your
  starting character, picked at random when more are allowed. Members who aren't in the pool
  never join.
- **The bench** (`bench`, on by default; needs Shattered Stars 0.02.51). Besides the game's 8
  places (4 in front, 4 in reserve), the game keeps a bench of 4 more, so all 12 members fit and
  every one you haven't excluded is an item. A member who arrives with the 8 places full joins
  the bench. In the camp menu's **Party Order**, L1 / R1 flips the right-hand column between the
  reserve and the bench, and you swap anyone but the hero in and out, your first pick held
  across the flip. Benched members keep their equipment, levels and skills, and you can manage
  them in the camp menu, but they aren't in play until you bring them in: no Private Actions,
  specialties, field spells or Link Combos, inns don't heal them, and the endings don't count
  them. When the story needs a benched member for a fight they make alone (Claude in Shingo
  Forest in Rena's game, Dias or Claude at the Lacour tournament), they're lent for it and go
  back to the bench afterwards. Set `bench: false` for the classic 8 (and a seed that also plays
  on Shattered Stars 0.02.50).
- **`exclude_characters`** keeps the members you list out of the pool (without the bench, to make
  room for the ones you want). The hero can't be excluded.
- **A healer is guaranteed** without the bench. Rena and Noel are the only healers, so if neither
  would be in your party, one of them takes a random pool member's place, unless you've excluded
  both. With the bench both are in the pool unless you exclude them.
- **`starting_character`** puts a member of your choice in the party from the very start, as
  the leader: you walk around as them, and the story calls them by name where it would name
  the hero. The hero still stays in the party, right behind them: your starting member takes
  the first place in the party (the one you control in battle, first in every menu) and the hero
  the second. Whatever order you leave in the camp menu (Party Order, and Formation > Leader)
  comes back after a story scene shuffles the party, once the scene is over. `hero` (the
  default) means nobody extra. A member
  you name starts even if you've also excluded them. This works with or without
  `character_items`; without it, everyone else joins through the story as usual.
- **`starting_character: any` lets you choose at New Game.** After the hero select (or straight
  away, when `story_route` picks the hero), a character select in the style of the hero select
  shows all twelve members: move over their faces to see each one's picture and a short profile
  (the game's own race, occupation and favourite food, and a few lines about them; Claude and
  Rena keep their original bios). Members this world can't have in the party are dark and can't
  be picked (with the bench, only the ones you excluded). Picking the hero means nobody extra. Your pick then joins at the start and leads,
  exactly as a named member would, and their character item, when it arrives, finds them in
  the party already. With a named `starting_character` the same screen shows just that member,
  to confirm. (Want the generator to pick for you? Use `random`.)

## Where does Expel stand?

Expel is never permanently lost. In `open_world`, the old man in Fun City's arena (once you
reach that point in the story) can take you back to Expel at any time; in story mode, the same
character reopens it — Virtual Expel — once you've saved at the game's last save point. Two
design decisions follow from this:
- shops never hold progression items, in any mode, as above;
- with `expel_progression` off, no other player's progression items are placed in Expel (and a
  skillsanity guild check counts only through its set's guild on Energy Nede) — but
  this world's own area keys that the Expel story itself needs to reach the disc switch can
  still appear there, since the story picks them up on its own before Expel closes behind you.
  In `open_world` you then start with the North City Pass and the Noel's House Pass, the first
  passes Energy Nede's story needs: almost nothing there can be reached before them, and they
  can't wait in Expel either.

## DeathLink

With `death_link` on, your game is linked to every other DeathLink game in the multiworld: a
death in any of them knocks out your own party, and a Game Over in your game sends one to
everyone else.

A DeathLink is sent only on a real Game Over. Three of the story's fights let the party lose as
a scripted story beat instead — Shin on the ship to El, Dias at the Lacour Tournament of Arms,
and Marsilio's first fight in Fienal — and losing one of these never sends a DeathLink; a
DeathLink that arrives during one of them waits until you're back in normal play instead of
knocking out your party there and then. Shin's fight at the Lacour Front Line and Berle's in
Eluria Tower are different: they're timed endurance battles you must survive, not scripted
losses, so they send and receive DeathLink normally — a wipe there is a real Game Over.

The same fights count as boss checks even though you can't win them outright: a scripted-loss
fight's check counts when the fight ends, win or lose, and the two timed survival fights (Shin
at the Lacour Front Line, Berle in Eluria Tower) count when you survive until time runs out.
Running away from a fight never counts.

## Options

| Option | Choices | What it does |
|---|---|---|
| `goal` | `indalecio` (default; `final_boss` works too), `indalecio_limiter_off`, `indalecio_limiter_off_and_iseria_queen` | Which Indalecio counts, and whether the Iseria Queen must fall first — see "What is the goal?" above. |
| `world_mode` | `story` (default), `open_world`, `hub` | `open_world`: the 35 area keys lock the world map's entrances until you find them. `hub`: start after the Final Save Point with everything open, a key per dungeon and the bosses waiting — see "Hub mode" above. |
| `hub_start` | `fun_city` (default), `arlia`, `random_town` | Hub mode only: where New Game puts you; `random_town` is any town of either world. |
| `fienal_requirement` | `fields_and_berle` (default), `fields`, `all_bosses` | Hub mode only: the bosses that open Fienal (the four Fields' and Berle in Armlock; the Fields' only; every boss outside Fienal). |
| `expel_teleporter` | on (default), off | Open world only: from partway through the story, Fun City's arena takes you back to Expel. Off: Expel reopens only at the late-game save point, and until then it can only hold this world's own area keys (besides non-progression items); you also start with the North City Pass and the Noel's House Pass. |
| `shuffle_shops` | off (default), `specials`, `full` | Turns shop slots into locations: the first time you buy a slot's item you get what you buy, and the slot's check too. `specials` is the 98 slots selling something unique to that shop; `full` is every slot in every shop a script opens. Never progression. |
| `story_route` | `any` (default), `claude`, `rena` | Pick `claude` or `rena` to start that story and leave the other one's locations out entirely: New Game then skips the hero select and the naming screen (the hero keeps the default name; the camp menu's Status page can rename them). With `any`, both exist, but a location that belongs to only one game holds filler. In hub mode it also picks the hero's own boss (Varmillion or Azamgil). |
| `starting_character` | `hero` (default), `any`, `claude`, `rena`, `celine`, `bowman`, `dias`, `precis`, `ashton`, `leon`, `opera`, `ernest`, `noel`, `chisato` | Open world and hub mode (ignored in story mode): a member who joins at the start and leads the party, standing in for the hero on the field and in dialogue; the hero stays in the party. `hero`: nobody extra. `any`: you pick on a character select at New Game, among the members this world allows. See "In open world" above. |
| `exclude_characters` | a list of names, e.g. `["Bowman", "Leon"]` (default: none) | Open world with `character_items`, and hub mode: these members are never items, so they never join. The story route's hero can't be excluded. |
| `bench` | on (default), off | Open world with `character_items`, and hub mode: the party has 12 places, the game's 8 and a bench of 4, so every member you haven't excluded is an item, and Party Order swaps anyone but the hero between the party and the bench. Needs Shattered Stars 0.02.51; off keeps the classic 8. Ignored elsewhere. See "In open world" above. |
| `missable_locations` | `exclude` (default), `include`, `remove` | How locations that can be missed for good are treated — see above. |
| `expel_progression` | on (default), off | Off: keep other players' progression items out of Expel (this world's own Expel-story keys are the exception in open world, where you also start with the North City Pass and the Noel's House Pass). |
| `cave_of_trials` | off (default), on | Add the Cave of Trials, a very hard postgame dungeon, and its chests, gifts and bosses (in hub mode behind the Cave of Trials Key). |
| `boss_checks` | on (default), off | Defeating a boss (story, side quest or Cave of Trials) is a location. Indalecio is always the goal, never a location. |
| `character_items` | off (default), on | Party members join through items instead of their story scene — see "Who can join your party?" above (open world has no lockouts). Always on in hub mode. |
| `enemy_dropsanity` | off (default), `first_drop` | The first time each enemy type drops anything in a random encounter, that drop is a location. |
| `drop_progression` | `allow` (default), `force`, `never` | With `enemy_dropsanity`: whether drops may hold progression items; `force` fills the fair-odds drops with progression first. Never for enemies you can't meet again or that rarely drop — see "Enemy drops" above. |
| `area_keys_in_drops` | on (default), off | With `enemy_dropsanity`: off keeps every area key (yours and other Star Ocean players') out of your drops. |
| `craftsanity` | off (default), on | Each of the 553 items Item Creation can make is a location, checked the first time you make it. Never progression. |
| `no_fail_crafting` | off (default), on | Item Creation never fails by chance. |
| `killer_move_checks` | off (default), on | Each proficiency level of each killer move (133) is a location. |
| `killer_move_progression` | `never` (default), `hero`, `any` | With `killer_move_checks`: whose killer-move levels may hold progression items — see "Killer-move checks" above. |
| `skillsanity` | `none` (default), `skills_only`, `special_only`, `insanity` | Skills, and / or killer moves and spells, as items; guild purchases and learn points as checks — see "Skillsanity" above. |
| `skillsanity_shop_share` | 0-100 (default 10) | With `shuffle_shops` and skillsanity: the share of your skill and move items sold in your shops as themselves. |
| `traps` | 0-100 (default 0) | The percentage of this world's filler items replaced by traps. |
| `exp_multiplier`, `fol_multiplier` | 1-10 (default 1) | Multiplies the EXP or Fol a battle awards. |
| `encounter_rate` | 0-200% (default 100%) | How often random encounters occur. 0 turns them off; with `killer_move_checks` or learn levels (Skillsanity `special_only` / `insanity`) that makes a hell seed, trained in a free Fun City arena — see "Hell seeds" above. |
| `difficulty` | `earth` (default), `galaxy`, `universe`, `any` | The game's difficulty. New Game sets it and doesn't ask. `galaxy`: monsters have half again their HP and attack; `universe`: twice their HP and MP, two thirds more attack, more intelligence, accuracy and evasion. `any`: New Game asks, offering all three (normally that choice appears only once more than half of the Voice Collection has been heard). EXP, Fol, drops and encounters stay the same, so the logic is the same on every difficulty. |
| `death_link` | off (default), on | Standard DeathLink — see "DeathLink" above for the story's scripted-loss fights, which are the exception. |
