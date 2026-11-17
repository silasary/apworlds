---
status: accepted
---

# A location reaches the base only through its price

Playtest #05 found ages in logic with an unpaid Town Center. The obvious fix was to make the age
advance ask `has_base()` directly. Instead, no location (age, tech, unit, building) and no
prerequisite asks for a base itself. A location pays its price through the easy sources
(`economy.can_pay`), and the base sits on the gathering side of those sources, so a location reaches
the base only by paying for something gathered. The reason is direction: the base (a Town Center
and villagers to train; the Houses left it for housing in #43) is to stop being the only way to have
an economy. Later work adds routes
to the easy sources that don't go through a base, and a location gated directly on `has_base()`
would have to be unpicked one rule at a time.

## Considered Options

- **`has_base()` in the age advance.** This was chosen first during #05's grilling and then reversed.
  It closed the gap just as well (every age to advance into costs food), but it tied ages to the base for
  good.
- ~~**A paid Town Center (`has_tc`) in the advance.** Rejected: it paid for the Town Center but skipped
  the base's other requirements, such as Joan 3's ground across the water.~~ Reversed by #42: the
  advance asks for a Town Center standing or paid for by the Town Center items, and nothing of the
  ground. A Town Center goes up on home ground even where the base needs ground across the water,
  so Joan 3's ground is not the advance's to ask. `has_base()` in the advance stays rejected.

## Consequences

- ~~Prerequisites stay structural.~~ Reversed by #32: nothing is ever asked unpaid. `has_reached`
  is still the structural question, but no rule asks it without the age's price beside it. An age
  has one **age price**, the same as a location and as a prerequisite: Feudal is *some* food or the
  Feudal Age Food seed item, Castle is food at scale and *some* gold, Imperial is food and gold at
  scale. An age the scenario starts in or past is free. Inside the economy the price is paid
  through a route's needs or a bank, never through an easy source, so the economy still never asks
  itself. A test walks every rule of two maximal worlds and fails on a structural form with no
  payment beside it.
- Buildings have the same paid and structural pair as ages, techs and units (#17):
  `has_building_structurally` (standing or buildable) never pays, and `has_building` (standing or
  paid for) does. A paid form pays for every building it leans on. A structural form, and every
  question inside the economy (dropsites, market), pays for nothing by itself, which keeps the easy
  sources from asking themselves; since #32 each one is paired with a payment where it is asked.
- A defence is never free, and pays for itself where it is asked (#23). A standing defence opens no
  gate: what it guards is already the base tier. A built defence (a wall with a tower, a
  strongpoint, a Dock holding a shoreline, more Town Centers) asks for *some* of each resource it
  costs, read off `Age2BuildingData.cost`, in the same expression that asks whether P1 can build it
  at all. That is not a price in ADR-0002's sense — a price is an easy source — and it is not a
  bank. A Mill holding a shoreline beside a defence is built the same way, free where it stands.
  A second Town Center has two rules (#40), and neither asks the Town Center items, which paid
  for the base's own: as a defence (the strongpoint and the shoreline) it pays *some* of its
  cost and the Castle price out of the ungated routes; as a camp it is its own route version,
  paid through that route's needs. A Castle-age strongpoint pays the Castle price out of the
  ungated routes too. The base's own Town Center is no strongpoint. The Castle is the
  exception (#42): as a defence it asks easy stone, read from the ungated routes, so it no longer
  opens wood, gold or food at scale off *some* stone. The stone routes at scale alone also take a
  Castle paid for by *some* stone, so stone still buys the Castle that holds it. The gate keeps
  no parameter: the exception sits on the stone routes, not in the defence.
- **Only ground worked at scale has to be held** (#23). A route of *some* takes what it needs off
  open ground and comes home, so it asks no gate; a route at scale has to hold the ground, so it
  does. This is what lets a resource pay for its own defence — *some* stone off open ground buys
  the wall that holds the same ground at scale — and it is why the gates need no parameter.
- Guarding boats is the same, not a price and not free (#21, amended by #23). The structural form
  of fielding pays for nothing, so the navy that guards the afloat and shoreline tiers is fielded
  structurally and pays for *some* of each line's own wood and gold in the same expression.
- Holding open ground with an army is the same (#29). Any land military line P1 can train holds
  open ground at scale, for every resource there, beside a built defence, paying *some* of the
  line's own cost in the same expression. The base is still asked. A starting or granted army
  holds nothing: it is the scenario's own plan, not a garrison. An army does not hold a shoreline.
- The buildings an economy route stands on are funded from outside the economy (#24), because a
  route's needs are its operating input, never its capital. A building which can open an economy
  from nothing - the Lumber Camp, Mule Cart, Dock and Market - is funded by a seed item, in the
  shape of the Town Center items. One which cannot - the Mining Camp, Mill, Folwark and Monastery -
  is funded by *some* of its cost: its route needs *some* wood, which the fixpoint takes from a
  different route. A standing one is free, and the Town Center branch of a dropsite carries no
  funding, so each villager route of *some* is one route per dropsite, and one per funding state
  of that dropsite (#30): a route's needs are flat and the fixpoint reads them without a state, so
  "free where it stands, charged where it is built" cannot be one route with a conditional need.
  A funded camp is therefore two routes, standing and built, whose leaves are the two halves of
  `has_building_structurally`. A seed item is pooled only
  where a route that would otherwise fund itself needs it; where it is not, the building falls
  back to the second kind, so a Dock with partner trade off is funded like a Mill.
- The Town Center is paid for by the base, never by an easy source. A standing one is free; a built
  one is paid for by the Town Center items, which the location reaches through its own price.
- A banked pile (`HasResourceAmount`) never pays for a building. It counts the Town Center items,
  which the base has already spent, and it can't add up two buildings. Banks pay only for one-off
  seeds such as a Fishing Ship or a trade seed. The one exception is the Mule Cart's food (#24):
  its seed item carries the wood, and a food need would make its hunt route need what it yields.
  The cog route's wood bank excludes the Dock's seed item, which is already buying that Dock.
- ~~The structural advance asks for a Town Center structurally, because an age is researched there. The
  base arrives through the age's food cost.~~ Reversed by #42: since #38 Feudal costs *some* food,
  which reaches no base. Reaching an age pays for the advance into it: a Town Center and the age-up
  requirement of the age before, each standing or paid for, and the advance into the age before.
  Every rule that asks an age asks this paid advance (`can_advance`); the structural advance is
  left only as the scenario questions' answer. Inside the economy the advance is capital, funded from outside it: a
  standing building is free, a Town Center is paid for by the Town Center items, an age-up building
  by its seed item where one is pooled or else by a `wood: some` need, and a Castle by easy stone.
  The never-bare walk counts the advance as part of what an age, and a question standing on one,
  costs.
- Trade Cogs are a deliberate non-base economy (#19): cogs to a trade partner's dock bring in easy
  wood and gold with no base. A route to an easy source that reaches no base is not automatically a
  gap. ADR-0003 generalises this: the base is one economy route's economy seed, not the gathering
  side as a whole.
- Follow-ups that apply this: #17 (paying for the buildings a location leans on), #18 (the direct
  `has_base()` left in military and in the defeat rules), #19 (cog trade), #30 (the funded camps
  that went on charging for a standing one).
