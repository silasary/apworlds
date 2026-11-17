---
status: accepted
---

# An unchecked location is coloured by its item's classification

In-game descriptions carry a status line, and an unchecked location takes its colour from the
classification of the item waiting there: progression `<Purple>`, useful `<Blue>`, filler
`<Cyan>`. The item is never named. A trap draws one of those same three colours, derived from the
seed and the location id so that it is stable across reconnects, reloads and sessions, and is
therefore indistinguishable from a genuine item of that class.

This is information Archipelago normally keeps behind a hint. A player hovering a build menu
learns which of their locations are worth reaching without spending a hint on any of them, and the
flow of a seed changes accordingly: routing decisions that used to cost hint currency become free.
That is the point rather than a side effect, and it is the whole reason this ADR exists.

Classification reaches the game through `LocationScouts` with `create_as_hint=0`, sent by the
client at connect. The reply is also the oracle for which locations exist in this seed at all, so
one mechanism answers both which objects are decorated and what colour each one takes. A location
absent from the reply gets no status line whatever the game has registered locally, which is what
keeps Buildsanity honest: the game registers all 35 buildings in every seed, while the apworld
creates locations only for the shuffled categories.

## Considered Options

- **No colour on unchecked locations.** A single colour for "unchecked" leaks nothing and needs no
  scouting. It also throws away the one piece of information that makes the status line worth
  hovering for, leaving a line that mostly repeats what the build menu already shows.
- **Bake classifications into `TechData.xs` at `/install`.** No scouting, no new channel. It also
  writes "which of my locations hold progression items" into a plaintext file next to the game,
  which is a worse leak than the one being chosen deliberately, and it cannot reflect a seed
  rolled after install.
- **Show the real trap colour.** Honest, and it makes traps free to avoid. Rejected because a trap
  the player can see is not a trap.
- **Roll the trap's disguise colour per render.** Cheapest to implement. The colour then changes
  between frames, which identifies every trap in the seed immediately.

## Consequences

- The age2de client gains a scouting step at connect. `CommonClient` already carries
  `locations_scouted` and `locations_info`; the world does not use them today.
- A new client to game channel carries per-location classification, alongside `buildings.xsdat`,
  `techs.xsdat` and `units.xsdat`.
- Colours are absent for the moment between connect and the scout reply. The status line renders
  uncoloured until then rather than guessing.
- A trap's disguise colour is a pure function of the seed and the location id. Any implementation
  that reaches for `random` at display time is a review finding.
- Hint-adjacent behaviour is now a product decision with a documented rationale. A future change
  that wants to hide classification again is reopening this ADR, not fixing an oversight.
