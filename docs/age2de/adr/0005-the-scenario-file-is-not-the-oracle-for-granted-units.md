---
status: accepted
---

# The scenario file is not the oracle for what a trigger grants

Playtest #53 audited every `AP Give` trigger against `AUTHORED_TRIGGER_UNITS` and found a real gap,
which suggests the obvious guardrail: a test that reads the `AP_*.aoe2scenario` files and compares
what each trigger transfers with what the scenario's authored list declares. That test is not
written, and will not be. The pin stays `set(obtains_unit) == set(trigger_units)`: logic against the
authored list, never against the map.

The reason is re-tiering. A player's starting age grants the techs of the ages *before* it, so a
hand-over arrives at the source player's tier rather than the tier the object was placed at. Joan
6's Gaia starts Post-Imperial, so its Archer, Militia, Scout Cavalry and Knight reach P1 as
Arbalester, Champion, Hussar and Paladin. The map and the authored list disagree there by design,
in four rows, and a file-versus-list test reports four failures against correct code.

## Considered Options

- **Compare the files to the list, with Joan 6 exempted.** Rejected: an exemption for the one
  scenario where the check is hardest to reason about is a test that lies about what it covers, and
  the next Post-Imperial source silently joins the exemption rather than failing.
- **Model the tier arithmetic in the test, so Joan 6 passes honestly.** Rejected: it reimplements
  the game's tech tree in a test to check a list that changes when a scenario is re-saved, which is
  rarely. The cost sits on every run; the benefit arrives about once a campaign.
- **Pin the authored list with a snapshot and diff it on change.** Rejected as redundant: the list
  is already a hand-written file in version control, so a diff is what review sees anyway.

## Consequences

- The file audit is a one-off, re-run by hand when a scenario is re-saved, and it is recorded in the
  issue rather than in a test. #53's `2026-11-05` comment holds the current one: every `AP Give`
  trigger, its source, what it transfers once `object_type` is honoured, and its condition.
- A new hand-over reaching the game without reaching `AUTHORED_TRIGGER_UNITS` is caught by review and
  by playtesting, not by the suite. Connecting a campaign, or editing a scenario's `AP Give`
  triggers, includes re-running the audit.
- `set(obtains_unit) == set(trigger_units)` still carries its own weight: it catches a rule that
  names a unit the scenario does not grant, and a granted unit no rule authors, which is the
  direction that strands a seed.
