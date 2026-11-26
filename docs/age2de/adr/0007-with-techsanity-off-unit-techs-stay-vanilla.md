---
status: accepted
---

# With Techsanity off, unit techs stay vanilla

**This applies only under `unitsanity_items: upgrades`**, the one Unitsanity Items mode where a
unit's items are per tier. Under Unit Line and Buildings, a whole line shares one item, so its
tiers are never told apart by items and this decision does not arise.

When Techsanity shuffles a line's upgrade techs (`units` or `all`), each tier has two gates, and
both must be open: its upgrade tech (tech item unlocked and researched) and its own upgrade
tokens, so a Man-at-Arms needs a Sword and a Shield. While the tokens are missing, the tech stays
researchable and its effect waits.

When upgrade techs are not shuffled (`none` or `generic`), techs behave as vanilla, whatever
Unitsanity says: no tech is disabled and no effect waits. Every tier above 0 is then gated only by
its line head's tokens. Once a Militia can be trained, the vanilla upgrades make Man-at-Arms
through Champion reachable without a Sword or a Shield. This is deliberate, and logic, install and
pool all follow it.

## Considered Options

- **Gate each tier by its own tokens with Techsanity off** (DavidWever/home#155). Rejected: with no
  tech item to wait on, the only way to hold a tier back is to block or delay a vanilla tech, and
  Techsanity off means techs are left alone.

## Consequences

- Under `existing_techs: vanilla` with caveman off, the scenario is not moved back to the Dark Age,
  so the engine researches the upgrades below its opening age before `main()`. That start state
  stands, even with Techsanity on: those tiers are trainable out of logic, never locked away.
- In a scenario moved back to the Dark Age, an upgrade tech the start state grants waits for its
  tier's tokens like a researched one (DavidWever/home#147).
