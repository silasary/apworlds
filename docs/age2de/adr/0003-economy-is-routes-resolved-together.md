---
status: accepted
---

# The economy is a set of routes, resolved together

Playtest #19 asked what the base pays for. The answer was nearly everything: every easy source
asked for a base, directly or through wood chopped with one, so the base was the economy. Instead,
the economy is a set of **economy routes**. Each has a producer, the resources it yields, a strength
(**some**, enough to pay an economy seed once, or **at scale**, enough to keep paying), and an
**economy seed**: the bundle it needs before it yields. The base is one route's economy seed, that
of villagers gathering at scale. An easy source is a route yielding at scale with its economy seed
met, and only an easy source pays a location's price (ADR-0002).

An economy seed's resources may come from **any** route already yielding them, at either strength,
so one route seeds the next: Lumberjacks with no base yield some wood, which seeds Trade Cogs, whose
wood at scale seeds Fishing Ships. Routes therefore ask one another in cycles (a cog yields the wood
a cog needs), which a chain of rules asking rules cannot express: `ScenarioQuestion` fails loudly on
a question that asks itself. So the routes of a scenario are worked out together, from the state:
start from the routes whose economy seeds are met without any route, and keep switching on any route
whose economy seed the running routes cover, until nothing changes.

## Considered Options

- **Economy seeds take only leaf gathering, banks and scenario grants.** No cycles, and plain rules
  suffice, but cog wood could never seed Fishing Ships.
- **Routes in an authored order, each seeded only by the layers below.** No cycles either, but the
  order has to be written and kept, and every new route has to find its place in it.

## Consequences

- The Trade Cog is the only route an economy seed of *some* can start, so it is the only way to an
  economy without a base. Every other at-scale route asks for a base or for wood at scale.
- Trade Carts and Trade Cogs are resource bootstraps: given wood at scale, carts turn some gold into
  gold at scale.
- A banked pile is *some* only for an economy seed whose authored amount it covers
  (`TRADE_SEED_*`).
- Relics yield only *some* gold.
- The villager count never matters: any villagers gather *some*; scale is the base's job. The base
  buys only the first villagers (#32): every route that asks for a base needs *some* food to keep
  training them. ~~And *some* wood for Houses where the civilisation builds them.~~ Replaced by
  #43: the room for them is housing, below.
- **Housing is a route resource, never an item resource** (#43). Every trained unit takes room, so
  a route whose producer is trained needs housing, at the two usual strengths: *some* for a few
  (Relics with no Monk standing), at scale for many (the villager routes at scale, Farmers, Fishing
  Ships, Fish Traps, Trade Carts, Trade Cogs). A producer already standing needs none. *Some*
  housing comes only from what a scenario grants. Housing at scale comes from a **Houses** route,
  which asks for the House as buildable and needs *some* wood, or from a civilisation that builds
  no Houses, for nothing. No item, bank or Market yields housing. The alternative was asking for a
  House and *some* wood inline on each route that trains, which is the same payment written once
  per route. It also left the House out of logic wherever a Town Center stood, because it only
  rode on building the base's Town Center. The Houses route reads no gate, so it is an ungated
  route: Farmers and the lumberjacks at scale stay ungated only if their housing does.
- **The base keeps the first villagers' cost, where housing left** (#44). The Villager Line and the
  villagers' food are a one-time opening cost, paid from outside the economy by a seed item, so they
  stay the base's; housing left because it recurs with every unit trained. What is left of the base
  is a Town Center standing or paid for, that cost, and the scenario's ground.
- Local start still aims for a base.
- **A tier gate is the one place the rejected "authored layers" option is used** (#23). A gate
  cannot ask the economy it sits inside: `_fortified` asking `has_some_source` resolves back into
  `ScenarioHasEconomyRoutes`, which fails loudly, exactly as this ADR describes. So a defence pays
  out of the **ungated routes** — every route whose leaf reads no gate: the routes of *some*,
  Farmers and Fish Traps, trade, the market, and what a scenario grants. One layer, hand-listed as
  its own composition of the route builders, memoised behind its own question. It is acyclic by
  construction, and a test pins that nothing in it reaches a gate, because the authored order this
  ADR rejected is only safe while someone keeps it. Everything above that layer still resolves
  together, as above. #32 moves "Lumberjacks with a Base" into the ungated routes: it was gated
  only because its camp could be a second Town Center, read through the defence rule. A second
  Town Center now has a camp rule paid through the route's needs and a defence rule paid from the
  ungated routes, so the lumberjacks read no gate. Ungated Farmers then have wood at scale wherever
  there is a base, which is what lets a second Town Center pay the Castle Age's food as a defence.
- **Route needs stay for economy seeds, not for defences** (#23). `EconomyRoute.needs` is how a
  route says what must already be yielding before it starts - Farmers and Fish Traps want wood at
  scale, Trade Cogs want some wood and some gold. #19 and #21 also used it to price the naval
  guard, which multiplied each route into one copy per cost group; #23 took that back out. A
  defence is not an economy seed: it is a condition on reaching a tier, and it pays where it is
  asked.
