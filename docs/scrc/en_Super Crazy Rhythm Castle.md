# Super Crazy Rhythm Castle

The experimental v0.26.0 candidate uses the native Hub6 phone bank as the Archipelago navigation hub, and **Roots Access is forced as the precollected starter** during the current Roots development phase. It retains experimental routing for all 30 Music Lab cassettes, with many individual routes still awaiting manual verification. Their source check sends once; the received cassette enters the native bag and must still be inserted normally. Five cassette rewards reuse the 32/64/89/111/140-point chest locations. A fresh v0.26 seed, fresh native save, and Client v0.73.9 are required for manual acceptance; this is an experimental prerelease with incomplete gameplay acceptance.

Five Game Garage cartridges remain randomized items and require their matching AP item. Vampire Killer is native and its Bronze/Silver/Gold/Platinum checks have no AP-item gate.

## Music Lab Points candidate

The pool contains 10 one-point items, 3 ten-point bundles, and 7 twenty-point large bundles: 180 points in 20 progression items replacing 20 Stardust. Nine existing chests require 5/10/20/32/46/64/89/111/140 AP points. The final threshold leaves 40 points of slack. No point milestone checks are added; existing cassette and Gradius Remix/Bloody Tears chest sources send only their existing location.

The exact schema-17/point-schema-1 contract is required. Before authoritative history sync the Music Lab total is zero; afterwards it is the weighted AP total capped at 180, retained during a temporary disconnect and rebuilt on reconnect/relaunch. Native medal results never add AP points or receive AP score writes. Recognized v0.22 seeds and non-AP play keep native scoring; malformed point contracts report incompatibility and stay at zero.

The existing managed getter substitutes AP points only in `GameRoom_Hub6`. No chest/native detour is installed and no chest is forced open. Live display, all nine below/at thresholds, exactly-once checks, persistence, compatibility, and native medal invariance remain required acceptance tests.

## AP performance difficulty

`difficulty` selects existing AP performance locations only; it does not change the player's native REG/PRO choice and does not create campaign checks or IDs.

| AP difficulty | Campaign tiers | Song medal tiers | Addressed locations |
| --- | --- | --- | ---: |
| Normal | Completion / 1-Star | Bronze | 125 |
| Hard | Completion / 1-Star + 2-Star | Bronze + Silver | 183 |
| Expert | Completion / 1-Star + 2-Star + 3-Star | Bronze + Silver + Gold | 241 |
| Perfection | Same campaign tiers as Expert | Bronze + Silver + Gold + Platinum | 277 |

Inactive checks are absent, not filler. This candidate retains the existing performance filters and location counts. Active Level-22 2/3-Star checks remain filler-only; Music Lab point chests may hold progression when weighted AP-point reachability proves a valid chain.

## Roots progression

Gecko's Roots reward is the AP location `Roots - Gecko's Weed Killer`, with randomized item `Weed Killer`.

Inside Level 3, Frog and Hippo's reward is now the AP location `Roots - Level 3 - Plant Pipes Pickup`, with randomized item `Plant Pipes`.

Logical split:

- Weed Killer is required to enter Level 3 and reach Frog/Hippo.
- Plant Pipes is **not** required for the Frog/Hippo check.
- Plant Pipes **is** required for `Level 3 - Completion`.
- If Plant Pipes is not owned after reaching Frog/Hippo, using the normal menu exit is intentional progression behavior.

Randomized AP-Star costs and the remaining vanilla-world item prerequisites are still under development.


## Quest checks candidate (v0.26)

A fresh v0.26 seed and fresh native save are required. Slot-data schema 17 keeps
character quest item schema 1 and adds quest checks schema 1. Plunger, Meoo, and
Maniac each appear once as useful AP items. Old Game Data and Car Battery are now
progression: their ordinary hand-ins send `Game Garage - Old Game Data Hand-In`
and `Lobby - Car Battery Hand-In`, which may contain progression. Those checks
require the input item, never the character reward. Existing Music Lab 5-point
and 20-point source checks retain their IDs and do not gain duplicate locations.

`Lobby - Plunger Pickup` is a Lobby check restricted to Stardust until its native
phone/button route is fully modeled. Plunger has no inferred Vault or cassette
gate. `Roots - Star Eater Fed` is also filler/trap-only: the native 3-star threshold
is unchanged, but native earned stars are not modeled by AP logic. Its logical
Roots reachability is therefore an approximation, never a progression route.
AP Stars, generated Star gates, and final Star Victory remain inactive.

Addressed totals are Normal 125 / Hard 183 / Expert 241 / Perfection 277; the pool
contains 71 non-Stardust items at every difficulty. Lobby letter/trumpet and
Demolition Certificate IDs remain reserved and inactive. This is a source/build
candidate pending targeted gameplay acceptance; no installation is implied.
