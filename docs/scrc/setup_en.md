# AP Stars combined candidate — native playthrough acceptance pending

**Client v0.75.4 / APWorld v0.28.0** uses schema 19 / campaign-mapping schema 1.
Use a fresh v0.28 seed and fresh native save for candidate testing. This implementation
has not been deployed; installed client v0.74.2 and the running test seed remain unchanged.
The published v0.26.0-dev release is a separate historical baseline.

Active totals: Normal 164 / Hard 222 / Expert 280 / Perfection 316.
All 66 AP Stars are active, with generated campaign gates and a Level 22 clear after
reaching the configured goal (1–66, default 50). An early boss clear followed by later
Star receipt does not win; another clear is required. Native result stars still report
performance checks and are never overwritten by AP Stars.

The 39 supplemental sources include Cell Tower Star Eater Fed and King Ferdinand
Unlocked. The six Bee/Devil completions remain separate binary checks. The user
confirmed 33 of the prior 37 checks; three Devil runs and the Certificate were skipped
and remain unverified. No replay of those skipped tests is required in this pass.

Normal has 152 modeled non-filler slots for 137 non-filler items (135 progression plus
two useful characters), not merely 164 raw checks. Existing item quantities and the
180-point Music Lab economy are unchanged. Native prerequisite closures are conservative
candidate rules; full native playthrough validation remains pending. The final world
passed a 48-case actual generation/playthrough matrix across four difficulties and
goals 1/25/50/66. A prior near-goal gate curve failed; the corrected curve caps entry
gates at half the goal while Victory still requires the full goal.

Detailed rules: `apworld/scrc/docs/ap-stars-logic.md`. Native acceptance, deployment
and release are separate steps. The older version/status sections below are historical
and do not override this candidate checkpoint.

---

# Super Crazy Rhythm Castle Archipelago setup — v0.26.0 candidate

Client v0.73.9 / APWorld v0.26.0 is an experimental prerelease; new quest features require manual gameplay acceptance. The exact top-level contract is slot-data schema 17 / campaign-mapping schema 1. Use a fresh v0.26 seed and a fresh native save. Broad campaign replay remains pending.

The [public installation guide](../../../docs/INSTALL.md) is the canonical setup flow. It covers trusted custom-world safety, BepInEx first launch, client configuration, APWorld installation, generation, hosting, updates, and uninstalling.

Developer setup summary:

1. Build the world from the repository root with `./tools/build-apworld.ps1`; it creates `dist/scrc.apworld`.
2. Install `scrc.apworld` through Archipelago Launcher's **Install APWorld** action (or double-click/drag it onto the launcher), then restart the Launcher.
3. In Archipelago Launcher, choose **Generate Template Options** to create templates in `<Archipelago>\Players\Templates`, or start with [SCRC-AreaRouting-PlantPipes.yaml](../../examples/SCRC-AreaRouting-PlantPipes.yaml). Copy the chosen YAML to `<Archipelago>\Players` as an uncompressed `.yaml`, edit its top-level `name:` to the intended slot name (the example starts as `name: Jack`), and use that exact name in the client's `Slot` setting.
4. Click **Generate** in the Launcher and host `<Archipelago>\output\AP_XXXXX.zip`. Older generated seeds retain their old slot data and datapackage.
5. After candidate build/review and approval for live testing, run RhythmCastleAP **v0.73.9** with `DirectStartAtPhoneHub=true`, `EnableAreaAccessPrototype=true`, and `PrototypeStartingArea=AP`; keep the retired `RandomizeEarlyProgression` prototype false.

## Music Lab Points

Ten 1-point items, three 10-point bundles, and seven 20-point large bundles replace 20 Stardust: 180 total points, with a 140-point final chest and 40 points of slack. The nine existing thresholds are 5/10/20/32/46/64/89/111/140. No point milestones or new chest locations are created; five cassette and two cartridge sources reuse those same chest checks.

Top-level schema 17 / campaign-mapping schema 1 is required for the full normal map. The retained Music Lab Point sub-contract uses point schema 1: exact names, IDs, values, counts, totals, cap, and threshold-to-location map must match. Compatible sessions show zero before history sync, then the weighted AP total (capped at 180), retaining it through temporary disconnects and rebuilding it on reconnect. Native medals never contribute. Recognized v0.22 seeds and non-AP play retain the native medal economy; malformed point contracts report incompatibility and keep the effective total at zero.

Only the existing managed score getter in the Music Lab hub (`GameRoom_Hub6`) substitutes AP totals; other rooms retain native/developer behavior. The diagnostic-first investigation rejected the generated chest hook and native detour. The candidate installs neither, writes no native medal/save state, and never forces a chest interaction. Test the display, every threshold below/at, each existing check exactly once, disconnect/reconnect, relaunch, native medal invariance, and both compatibility regressions before acceptance. Do not use Shift+F4 to supply points; compatible AP state takes precedence over that developer override.

## AP performance difficulty

Set `difficulty` in the YAML to one of `normal`, `hard`, `expert`, or `perfection`. It filters only existing AP campaign performance locations; native REG/PRO stays player-controlled.

| AP difficulty | Campaign tiers | Song medal tiers | Addressed locations |
| --- | --- | --- | ---: |
| Normal | Completion / 1-Star | Bronze | 125 |
| Hard | Add 2-Star | Add Silver | 183 |
| Expert | Add 3-Star | Add Gold | 241 |
| Perfection | Same campaign tiers as Expert | Add Platinum | 277 |

Inactive checks are absent from the seed, not filler. v0.26 maps all 22 normal identities, retains performance filtering and the full cassette source set, and has these location totals. Bee/Devil diagnostics are observation-only; special locations, AP Stars, Star gates, and Victory remain inactive. Level-22 2/3-Star checks remain filler-only; point chests may hold progression when their weighted AP-point rules give the solver a reachable chain.

v0.26.0 retains the experimental implementation for all 30 Music Lab cassette items and sources; many individual routes remain manual verification pending. Rebuild/replace the APWorld, restart Archipelago, and generate a fresh v0.26 seed. Client v0.73.9 enables cassette routing only when schema, count, item mappings, source mappings, and reused chest mappings match exactly; otherwise it logs the mismatch and leaves native cassette behavior enabled. This cassette fallback is separate from malformed point contracts, which fail closed at zero.

### Character quest items (v0.26)

Old Game Data and Car Battery are each randomized once as progression items. Their sources reuse the existing Music Lab 5-point and 20-point chest checks. Receiving them supplies the corresponding native bag item; their hand-ins send AP checks, and Meoo and Maniac are separate AP unlock items. The exact `character_quest_item_schema: 1` contract is opt-in under top-level schema 17. Generate a fresh v0.26 seed to use these items; retained older seeds cannot gain the new pool entries. Lobby item staging, AP Stars, Star gates, and Victory remain inactive.


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
