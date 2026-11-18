# Shape of Dreams

## What does randomization do to this game?

In vanilla Shape of Dreams, the in-game achievement system is used to unlock Travelers, Memories, Essences and Lucid Dream run modifiers.
In Archipelago those 93 unlocks are shuffled into the multiworld as items. Achievements, world clears and lizard
shop souvenirs, Jonas's Wares, shrine uses, quest completions and artifact hand-ins become the checks that send
items to you and to the other players. You start with 2 random Travelers.

Your normal save is never touched. Each seed is played on its own game profile, which you will need to bind to your
slot the first time you connect.

## Where are the checks (locations)?

There are 302 locations by default. Here are the different categories of checks.

- **Achievements (93):** completing achievements. You do not get the usual unlock for the achievement.
  That unlock is an item somewhere in the multiworld.
- **World clears (135):** clearing worlds 1 to 5 as each of the 9 Travelers, on Deep Sleep, Ominous Dream and
  Nightmare. Winning through any ending clears all worlds. Clearing a world on a harder difficulty also sends
  that world's checks for the easier difficulties. Nap has no checks, and the worlds of later loops send nothing.
- **Souvenirs (17):** buying souvenirs from the lizard shop. You keep the souvenir.
- **Shrines (9):** your first use of Pot of Greed, Maw of Doom, Hatred, Paradox, Mirror of Remorse,
  Destiny, Entanglement, Altar of Cleansing and Ascension. Another player's use does not count for you.
- **Quests (6):** your first completion of Stray Memory, Star Seeker's Journal, Fragment of Radiance, Call of the
  Ravenous, Consort of Night and Hunted by Obliviax.
- **Artifacts (12):** handing artifacts in to the Dream Teller.
- **Jonas's Wares (30 by default):** buying unique added wares from Jonas. Each Jonas shop offers one random item.
  This only works in solo or hosted games, so you should turn these off if you will be joining another player's lobby.

Deep Sleep world clears are **priority locations**, so they tend to hold progression items. Achievements can hold anything.
Souvenirs and artifacts are always excluded because they are very RNG dependent, so they only hold filler or traps.

### Customizing your checks

You can exclude checks so they only hold filler or traps, or prioritize checks so they tend to hold progression.
Exclusions take precedence over priorities.

| If you want to… | What to change |
|---|---|
| Avoid Nightmare runs | Exclude Nightmare world clears |
| Avoid achievements that need specific Memories | Exclude Build-Dependent Achievements |
| Focus on world clears | Exclude Achievements |
| Skip a Traveler | Exclude that Traveler's checks and lower the number of Travelers needed for your goal |
| Favor a Traveler | Prioritize that Traveler's checks |

A solo seed needs at least 165 non-excluded locations with default Mastery settings. The
[example YAML](https://github.com/FruityShuffles/SoDArchipelago/blob/main/examples/Shape%20of%20Dreams.yaml)
lists the location groups, syntax and limits when changing Mastery settings.

## What items can I receive?

- **Progressive Traveler** (progression): unlocks the Traveler, then their three alternate Memories in Q, R, Identity order.
- **Memory / Essence / Lucid Dream unlocks** (useful): unlocks Memories and Essences for drops, and Lucid Dreams for selection in the lobby.
- **Mastery: \<Traveler\>** (useful): adds 5 mastery levels to that Traveler by default.
- **Stardust** (filler): adds Stardust to your profile.
- **Map Blessings and Treasures** (filler): adds map destinations or gives Treasure effects during runs, if enabled.
- **Curses** (trap): gives your Traveler a vanilla curse, if enabled.

With default settings the items give every Traveler 40 mastery and enough Stardust to buy every constellation
star, star slot and souvenir. The default pool has 34 progression, 131 useful and 137 filler items.

## What do I see when I send or receive an item?

A message feed in the top-left corner shows the items you receive and send, and who they came from or went to.
Unlocks and Mastery received during a run say `(next run)` and apply from your next run.

## What is the goal?

Win at your chosen difficulty or harder with the required number of different Travelers. Either ending counts:
the Pure White Dream or the Starless Path.

## Options

Use the [example YAML](https://github.com/FruityShuffles/SoDArchipelago/blob/main/examples/Shape%20of%20Dreams.yaml)
for the exact setting names, accepted values and defaults.

### Choosing your goal

You choose the difficulty and how many different Travelers must win. The default is Nightmare with all nine
Travelers. Lowering the goal does not remove checks, so also exclude the checks for difficulties or Travelers
you plan to skip.

### Mastery, Stardust and constellation growth

You can change the number of Mastery packs per Traveler and the levels each pack gives. The default is eight
packs of five levels, giving each Traveler 40 mastery: enough for their final story and access to the Starless Path.

Turning off passive mastery stops runs from earning mastery, so levels only come from Mastery items. Make sure
your packs supply at least 40 levels per Traveler if you want to reach the final stories through those items.
"The Road Not Taken" is excluded with passive mastery off. Mastery items are always useful.

You can also change the total Stardust supplied by items. It is divided across all Stardust packs, so adding
more packs makes each one smaller. Vanilla Stardust rewards are unchanged.

### Shuffled constellation requirements

Stars trade mastery requirements within the same Traveler (or the common stars) and category. This changes
which stars you can buy first. The highest requirements and Stardust prices are unchanged. Turn this off to
use the vanilla requirements.

### Jonas's Wares and the additional item slots

You can change how many wares Jonas offers across the seed, or turn them off. Wares and the 27 shrine, quest
and artifact checks add item slots. The in-run items and traps options determine what fills those slots.
Your unlock items and Mastery packs are unchanged.

| In-run items | Traps | Items added |
|---|---|---|
| Off | Off | Stardust |
| On | Off | Map Blessings and Treasures |
| Off | On | About 20% Curses; the rest Stardust |
| On | On | About 20% Curses; the rest Map Blessings and Treasures |

### Map Blessings and Treasures

These are received during a run and apply to everyone playing in the lobby.
If an item cannot apply yet, it waits for a suitable world or run. Pending items survive reconnects and restarts.

**Map Blessings** add a destination to an unvisited combat node. A marker and ping show where to go.
Rooms and shrines keep their vanilla effects, costs and rewards.

- **Room bonuses:** Pure Dream, Gold Everywhere, and Harder Fight, Better Reward.
- **Shrines:** Blessed Guidance, Pot of Greed, Maw of Doom, Hatred, Paradox, Mirror of Remorse, Destiny,
  Entanglement, Disintegration and Altar of Cleansing.
- **Other destinations:** Lizard Shop and Artifact.

If a blessing can't be meaningfully applied (because for example you're fighting a world boss), it will be saved for later until it can be applied.

**Treasures** give Jonas's Treasure effects for free.

| Treasure | Effect |
|---|---|
| Cloak of Guidance | Delays the next two Hunter advances |
| Clairvoyance | Reveals the world's map |
| Determination Shard | Absorbs a lethal hit and restores 25% health |
| Treasure Map | Starts a quest leading to a Hidden Stash |
| Totally Genuine Treasure Map | Starts a quest leading to a Hidden Stash, Gold Everywhere or an Ambush |

Like Map Blessings, Treasures wait until their effect can be meaningfully applied.

### Curse traps

Traps give your Traveler a random Mild, Potent or Intense curse from the vanilla Hatred shrine pool.
Traps wait in boss rooms until you leave. In co-op, curses apply only to the host's Traveler.

### Forced Lucid Dreams

You can force Evil and Chaotic dreams to stay on until you receive their Lucid Dream item. Those items become
progression. Once received, you can turn the dream off from the next lobby.

The [example YAML](https://github.com/FruityShuffles/SoDArchipelago/blob/main/examples/Shape%20of%20Dreams.yaml)
describes each dream's effect.

The host's forced dreams turn on automatically. If you join another player's lobby, make sure your own
still-forced dreams are enabled. Otherwise, world clears and wins will not count for you. Other checks still count.

### DeathLink

DeathLink shares knockdowns with players using it in other games. Your knockdown sends a DeathLink;
receiving one kills your Traveler. A Determination Shard can absorb it.

Joining players can send DeathLinks but cannot receive them. Turn this off if you will be joining another
player's lobby.

## Playing offline

You can play a bound profile offline with the items you have already received. Checks are saved and sent when
you reconnect. If the connection drops, the mod reconnects on its own.

## Co-op

Co-op works with players who are also playing Archipelago and with players who are not. While the mod is on, only PC
players can join your lobby.
If you will be joining another player's lobby, turn off Jonas's Wares, in-run items, traps and DeathLink.
You can still collect achievements, world clears, souvenirs, shrine, quest and artifact checks.
