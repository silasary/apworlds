# The boss_logic option

`boss_logic` lets you tell the logic what you want to be carrying before it considers a story boss beatable. It only
restricts the logic: in the game you can fight with whatever you have. What it guarantees is that the seed never forces
you through a boss you are not equipped for by your own standard.

The eight Pseudoroids are fought twice, in their own area and in the boss rush at the end of the game, and the requirements
defined applies to both encounters. This means you will not be considered in "Go Mode" until you have the requirmements for each
individual boss, as well as what you've set up for the final boss, even if you have the 6 required models.

## Bosses

Use the boss name or its room code as the key.

| Boss | Room | Notes |
|---|---|---|
| Rayfly | B-2 | |
| Model Z | D-2 | |
| Hivolt | E-7 | Pseudoroid, Model HX |
| Lurerre | F-5 | Pseudoroid, Model LX |
| Fistleo | G-5 | Pseudoroid, Model FX |
| Purprill | H-4 | Pseudoroid, Model PX |
| Hurricaune | I-3 | Pseudoroid, Model HX |
| Leganchor | J-5 | Pseudoroid, Model LX |
| Flammole | K-4 | Pseudoroid, Model FX |
| Protectos | L-4 | Pseudoroid, Model PX |
| Prometheus | X-3 | |
| Pandora | M-3 | |
| Prometheus & Pandora | O-2 | |
| Serpent | D-5 | The gate to the final area follows `goal_requirements`; a requirement here is added on top |
| Omega Zero | N-1 | Not used at the moment as there's no checks behind Omega Zero |

Giga Aspis, the boss for the first mission, is not listed because the randomizer skips it.

"Any Model" is an implicit requirement already for every boss, so you're never expected to walk through a boss room without them

## Writing a requirement

A requirement is a text with these building blocks, combined with `&` (and), `|` (or) and parentheses.

| Write | Meaning |
|---|---|
| `X`, `ZX`, `HX`, `FX`, `LX`, `PX`, `OX` | you can use that model (for HX, FX, LX and PX: at least the first half) |
| `HX2`, or `Model HX (full)` | both halves of the progressive biometal, that is, its level 2 charge (same for `FX2`, `LX2`, `PX2`) |
| `ALL6` | the six main biometals (X, ZX, HX, FX, LX and PX) |
| `Life Up x2`, or `LIFEUP>=2` | at least that many Life Ups (1 to 4) |
| `Sub Tank x1`, or `SUBTANK>=1` | at least that many Sub Tanks (1 to 4) |
| `Absorber Chip`, and the other ITEM B chips by name | you have that chip |

A chip named in a requirement is promoted from useful to progression automatically, so the logic can place it where you can reach it. 

## Example

```yaml
boss_logic:
  Hivolt: "HX & Life Up x2"
  Flammole: "Model FX (full) & Absorber Chip"
  Serpent: "ALL6 & Sub Tank x2 & Life Up x4"
  Omega Zero: "OX | (ALL6 & SUBTANK>=2)"
```
