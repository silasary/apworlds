---
status: accepted
---

# Defeat rules live in the logic layer, keyed by Age2PlayerData

Partner trade needs to know when P1 can defeat one specific opponent, but "can P1 defeat this player"
existed only as local variables inside each scenario's rules, named `can_beat_*`, `can_kill_*` or
`can_defeat_*` and keyed by colour or faction. So every player of every connected scenario is a member
of `Age2PlayerData`, with its data hard-coded inline (slot, readable name, a fixed ally or enemy side,
and a trade access for its market and its dock: closed, open, or open once defeated), routed to
its scenario by `connections/ScenarioPlayers`. Each scenario's starting state
builds one defeat rule per opponent, keyed by those members, and the scenario's player logic
(`ScenarioPlayerLogic`, `scenario_logic.player_logic`) serves them through a cached `defeats(player)`
that both the victory rules and the trade logic read.

## Considered Options

- **Keep the rules in the rules layer and let trade reach into it.** Rejected: it inverts the
  dependency, which runs from rules to logic everywhere else, and trade is asked from inside the
  rules themselves.
- **Per-scenario booleans only (PR 19's shape), with trade opening once the scenario's victory rule
  is met.** Rejected: by then the scenario is won, and usability differs between opponents in the
  same scenario.
- **A player's side as a set, or stance changes during a scenario.** Rejected: every scenario was
  resolvable as one fixed side per player, and neutral or ignored players simply get no member.

## Consequences

- Partner trade never reads a defeat rule directly. A defeat asks for an army, the army asks the
  economy, and the economy asks trade, so any defeat that costs resources would loop back into the
  scenario's own economy questions, not only one that trades with its own player. Instead, at
  `allies_and_enemies`, each enemy whose market or dock opens once defeated gets an event location
  ("<scenario>: Can Defeat <player>") whose rule is `defeats(player)`, and trade asks for the event
  item. The sweep settles the cycle. A test builds every defeat and trade rule to guard this.
- The move must preserve behaviour: every location rule is snapshotted on `v0.3.0` before it and
  compared after each campaign moves; the snapshot is deleted once the move is complete.
- Trade usability lives only on the players; there are no scenario-level market or dock flags, and
  whether P1 has a trading ally is read straight off them. Trade access records judged usability, not
  whether the building exists; do not correct it from a scenario scan.
- Connecting a new campaign now includes adding its players to `Age2PlayerData`, routing them in
  `connections/ScenarioPlayers`, and writing their defeat rules, not just writing victory rules.
