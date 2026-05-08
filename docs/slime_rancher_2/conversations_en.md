# Slime Rancher 2 — CommStation Conversation Checks

## What are conversation checks?

When `conversation_checks` is set to `conditional` or `all`, CommStation calls from your
rancher neighbours become Archipelago location checks.  In vanilla, conversations deliver
gifts (gadget blueprints, decoration blueprints, or upgrade components) directly.
In Archipelago mode the gift is suppressed and replaced by an AP check — whatever the
server has placed at that location is sent to the appropriate player instead.

Conversations are triggered automatically when you open the CommStation; you do not
interact with an object in the world.  Some conversations appear immediately on your first
visit, while others require in-game time to pass or specific events to occur first.

---

## The `conversation_checks` option

### `none` (default)

No conversations are location checks.  All ranchers give their vanilla gifts directly and
no CommStation calls appear in the tracker.

### `conditional`

**10 conversations** with confirmed zone-access or sequential-chain unlock conditions are
added to the location pool.  These are the only conversations that have meaningful gameplay
gates, so they are safe for synchronous (real-time) multiworld games.

| Location Name | Debug Name | Trigger Condition |
|---|---|---|
| Viktor: Intro Call | `ViktorIntroCall` | Any Research Drone activated **or** 2+ in-game days in the Conservatory — gives Home Teleporter Yellow |
| Viktor: Radiant Projector Blueprint | `ViktorStoryCipher4` | Either the Flutter Gordo **or** the Boom Gordo has been burst |
| Mochi: Intro Call | `MochiIntroCall` | 1 in-game day after `ViktorIntroCall` fires |
| Ogden: Intro Call | `OgdenIntroCall` | 2 in-game days after `MochiIntroCall` fires |
| Thora: Intro Call | `ThoraIntroCall` | 3 in-game days after `OgdenIntroCall` fires |
| Thora: Gordo Snare Advanced | `ThoraGift2` | Available via Thora's gift sequence after her intro call |
| BOb: Intro Call | `BObGift1Intro` | Visited Ember Valley (2+ days ago) **and** Starlight Strand (2+ days ago) **and** `ThoraIntroCall` fired (1+ day ago) — no gift |
| BOb: Rainbow Lumps Blueprint | `BObGift2` | 1 in-game day after `BOb: Intro Call` fires |
| BOb: Yolky 1 | `BObYolky1` | 1 in-game day after `BOb: Rainbow Lumps Blueprint` fires |
| Mochi: Archive Key | `MochiStoryDrones3` | `MochiStoryDrones2` completed **and** both Grey Labyrinth gate Research Drones activated |

#### ViktorIntroCall — the chain anchor

`ViktorIntroCall` is the standalone call that starts the entire Mochi→Ogden→Thora intro
chain.  It fires when **either** of the following is true:

- You have activated any Research Drone (Gigi's journal drones)
- You have spent 2 or more in-game days in the Conservatory

`Viktor: Intro Call` **is** a location check in the `conditional` tier.  In vanilla it delivers
a Home Teleporter Yellow; in AP mode this becomes an AP check at that location.

---

### `all`

> ⚠️ **Recommended for async (asynchronous) games only.**
>
> Many conversations are gated behind real-world time delays of 1–3 in-game days each.
> The full chain of all ~120 conversations can take many play sessions to complete.
> In a synchronous game where other players are waiting on your checks, this mode is
> likely to become a bottleneck.  Use `conditional` for synchronous play.

Every CommStation conversation becomes a location check, roughly **120 locations** in
total across all ranchers.  This includes:

- All 8 conversations from the `conditional` tier (above)
- All functional gift conversations not gated by a specific condition
- All decoration blueprint gifts
- All story / lore / cipher conversations
- All deflect dialogue (conversations with no gift, triggered when all other calls are spent)

The full list is organised by rancher below.

---

## Full Conversation List (all tier)

> Conversations with a `*` are also included in the `conditional` tier.

### Viktor

| Location Name | Debug Name | Gift / Notes |
|---|---|---|
| Viktor: Intro Call `*` | `ViktorIntroCall` | Gift: Home Teleporter Yellow — starts the intro chain |
| Viktor: Teleporter Pink | `ViktorGift1_TeleporterPink` | Blueprint: Teleporter (Pink) |
| Viktor: Teleporter Blue | `ViktorGift2_TeleporterBlue` | Blueprint: Teleporter (Blue) |
| Viktor: Teleporter Grey | `ViktorGift3_TeleporterGrey` | Blueprint: Teleporter (Grey) |
| Viktor: Teleporter Violet | `ViktorGift4_TeleporterViolet` | Blueprint: Teleporter (Violet) |
| Viktor: Home Teleporter Blue | `ViktorGift_TeleporterHome1Blue` | Blueprint: Home Teleporter (Blue) |
| Viktor: Home Teleporter Red | `ViktorGift_TeleporterHome2Red` | Blueprint: Home Teleporter (Red) |
| Viktor: Home Teleporter Green | `ViktorGift_TeleporterHome3Green` | Blueprint: Home Teleporter (Green) |
| Viktor: Radiant Projector Blueprint `*` | `ViktorStoryCipher4` | Blueprint: Energy Beam Node — requires Flutter or Boom Gordo burst |
| Viktor: Gadget Introduction | `ViktorGift_GadgetIntro` | Blueprints: Med Station, Simple Table, Simple Chair |
| Viktor: Large Pinwheel Blueprint | `ViktorGift_PinwheelLarge` | Blueprint: Large Pinwheel (decoration) |
| Viktor: Small Pinwheel Blueprint | `ViktorGift_PinwheelSmall` | Blueprint: Small Pinwheel (decoration) |
| Viktor: Streamer Blueprint | `ViktorGift_StreamerSimple` | Blueprint: Streamer (decoration) |
| Viktor: Streamer Scarf Blueprint | `ViktorGift_StreamerScarf` | Blueprint: Streamer Scarf (decoration) |
| Viktor: Simple Flag Blueprint | `ViktorGift_FlagSimple` | Blueprint: Simple Flag (decoration) |
| Viktor: Wind Socks Blueprint | `ViktorGift_Windsocks` | Blueprint: Wind Socks (decoration) |
| Viktor: Attention Flag Blueprint | `ViktorGift_FlagAttention` | Blueprint: Attention Flag (decoration) |
| Viktor: Cautious Flag Blueprint | `ViktorGift_FlagCautious` | Blueprint: Cautious Flag (decoration) |
| Viktor: Curious Flag Blueprint | `ViktorGift_FlagCurious` | Blueprint: Curious Flag (decoration) |
| Viktor: Cipher 1 | `ViktorStoryCipher1` | No gift — lore / story |
| Viktor: Cipher 2 | `ViktorStoryCipher2` | No gift — lore / story |
| Viktor: Cipher 3 | `ViktorStoryCipher3` | No gift — lore / story |
| Viktor: Deflect 1 | `ViktorDeflect1` | No gift — deflect dialogue |
| Viktor: Deflect 2 | `ViktorDeflect2` | No gift — deflect dialogue |
| Viktor: Deflect 3 | `ViktorDeflect3` | No gift — deflect dialogue |

### Mochi

| Location Name | Debug Name | Gift / Notes |
|---|---|---|
| Mochi: Intro Call `*` | `MochiIntroCall` | No gift — story beat; 1 day after ViktorIntroCall |
| Mochi: Market Link | `MochiGift1` | Blueprint: Market Link |
| Mochi: Archive Key `*` | `MochiStoryDrones3` | Upgrade component: Archive Key Component — requires both labyrinth gate drones |
| Mochi: Root Arches Blueprint | `MochiGift3` | Blueprint: Root Arches (decoration) |
| Mochi: Violet Swirl Shroom Blueprint | `MochiGift4` | Blueprint: Violet Swirl Shroom (decoration) |
| Mochi: Short Pink Coral Columns Blueprint | `MochiGift6` | Blueprint: Short Pink Coral Columns (decoration) |
| Mochi: Ash Blooms Blueprint | `MochiGift7` | Blueprint: Ash Blooms (decoration) |
| Mochi: Tall Ashwood Blueprint | `MochiGift8` | Blueprint: Tall Ashwood (decoration) |
| Mochi: Short Red Ashwood Blueprint | `MochiGift9` | Blueprint: Short Red Ashwood (decoration) |
| Mochi: Rounded Magma Pool Blueprint | `MochiGift10` | Blueprint: Rounded Magma Pool (decoration) |
| Mochi: Pink Glow Shroom Blueprint | `MochiGiftRelocated1` | Blueprint: Pink Glow Shroom (decoration — fires when gadget not yet placed) |
| Mochi: Gnarled Ashwood Blueprint | `MochiGiftRelocated2` | Blueprint: Gnarled Ashwood (decoration — fires when gadget not yet placed) |
| Mochi: Azure Glow Shroom Blueprint | `MochiGiftRelocated3` | Blueprint: Azure Glow Shroom (decoration — fires when gadget not yet placed) |
| Mochi: Medium Red Ashwood Blueprint | `MochiGiftRelocated4` | Blueprint: Medium Red Ashwood (decoration — fires when gadget not yet placed) |
| Mochi: Drone Story 1 | `MochiStoryDrones1` | No gift — lore / story |
| Mochi: Drone Story 2 | `MochiStoryDrones2` | No gift — lore / story |
| Mochi: Deflect 1 | `MochiDeflect1` | No gift — deflect dialogue |
| Mochi: Deflect 2 | `MochiDeflect2` | No gift — deflect dialogue |
| Mochi: Deflect 3 | `MochiDeflect3` | No gift — deflect dialogue |

### Ogden

| Location Name | Debug Name | Gift / Notes |
|---|---|---|
| Ogden: Intro Call `*` | `OgdenIntroCall` | No gift — story beat; 2 days after MochiIntroCall |
| Ogden: Super Hydro Turret | `OgdenGift1` | Blueprint: Super Hydro Turret |
| Ogden: Portable Scare Slime | `OgdenGift3` | Blueprint: Portable Scare Slime |
| Ogden: Tall Emerald Cypress Blueprint | `OgdenGift4` | Blueprint: Tall Emerald Cypress (decoration) |
| Ogden: Emerald Shrubs Blueprint | `OgdenGift6` | Blueprint: Emerald Shrubs (decoration) |
| Ogden: Amber Shrubs Blueprint | `OgdenGift7` | Blueprint: Amber Shrubs (decoration) |
| Ogden: Ochre Poppies Blueprint | `OgdenGift8` | Blueprint: Ochre Poppies (decoration) |
| Ogden: Emerald Vine Trellis Blueprint | `OgdenGift9` | Blueprint: Emerald Vine Trellis (decoration) |
| Ogden: Pink Bonsai Blueprint | `OgdenGift10` | Blueprint: Pink Bonsai (decoration) |
| Ogden: Azure Shrubs Blueprint | `OgdenGiftRelocated1` | Blueprint: Azure Shrubs (decoration — fires when gadget not yet placed) |
| Ogden: Amber Cypress Blueprint | `OgdenGiftRelocated3` | Blueprint: Amber Cypress (decoration — fires when gadget not yet placed) |
| Ogden: Medium Pink Coral Columns Blueprint | `OgdenGiftRelocated4` | Blueprint: Medium Pink Coral Columns (decoration — fires when gadget not yet placed) |
| Ogden: Rainbow Story 1 | `OgdenStoryRainbow1` | No gift — lore / story |
| Ogden: Rainbow Story 2 | `OgdenStoryRainbow2` | No gift — lore / story; requires Starlight Strand visited |
| Ogden: Rainbow Story 3 | `OgdenStoryRainbow3` | No gift — lore / story |
| Ogden: Deflect 1 | `OgdenDeflect1` | No gift — deflect dialogue |
| Ogden: Deflect 2 | `OgdenDeflect2` | No gift — deflect dialogue |
| Ogden: Deflect 3 | `OgdenDeflect3` | No gift — deflect dialogue |

### Thora

| Location Name | Debug Name | Gift / Notes |
|---|---|---|
| Thora: Intro Call `*` | `ThoraIntroCall` | No gift — story beat; 3 days after OgdenIntroCall |
| Thora: Gordo Snare Advanced `*` | `ThoraGift2` | Blueprint: Gordo Snare Advanced |
| Thora: Pink Mangrove Blueprint | `ThoraGift1` | Blueprint: Pink Mangrove (decoration) |
| Thora: Rainbow Grass Blueprint | `ThoraGift3` | Blueprint: Rainbow Grass (decoration) |
| Thora: Pink Grass Blueprint | `ThoraGift4` | Blueprint: Pink Grass (decoration) |
| Thora: Amber Grass Blueprint | `ThoraGift5` | Blueprint: Amber Grass (decoration) |
| Thora: Short Palm Blueprint | `ThoraGift6` | Blueprint: Short Palm (decoration) |
| Thora: Green Grass Blueprint | `ThoraGift7` | Blueprint: Green Grass (decoration) |
| Thora: Red Grass Blueprint | `ThoraGift8` | Blueprint: Red Grass (decoration) |
| Thora: Goldpetal Flowers Blueprint | `ThoraGiftRelocated1` | Blueprint: Goldpetal Flowers (decoration — fires when gadget not yet placed) |
| Thora: Azure Grass Blueprint | `ThoraGiftRelocated2` | Blueprint: Azure Grass (decoration — fires when gadget not yet placed) |
| Thora: Cinder Spike Blossoms Blueprint | `ThoraGiftRelocated3` | Blueprint: Cinder Spike Blossoms (decoration — fires when gadget not yet placed) |
| Thora: Sunfire Daisies Blueprint | `ThoraGiftRelocated4` | Blueprint: Sunfire Daisies (decoration — fires when gadget not yet placed) |
| Thora: Big News 1 | `ThoraStoryBigNews1` | No gift — lore / story |
| Thora: Big News 2 | `ThoraStoryBigNews2` | No gift — lore / story |
| Thora: Big News 3 | `ThoraStoryBigNews3` | No gift — lore / story |
| Thora: Deflect 1 | `ThoraDeflect1` | No gift — deflect dialogue |
| Thora: Deflect 2 | `ThoraDeflect2` | No gift — deflect dialogue |
| Thora: Deflect 3 | `ThoraDeflect3` | No gift — deflect dialogue |

### BOb

| Location Name | Debug Name | Gift / Notes |
|---|---|---|
| BOb: Intro Call `*` | `BObGift1Intro` | Blueprint: Rainbow Mound — requires EV + Strand visited (2+ days) and ThoraIntroCall (1+ day) |
| BOb: Rainbow Lumps Blueprint `*` | `BObGift2` | Blueprint: Rainbow Lumps — 1 day after BOb: Intro Call |
| BOb: Yolky 1 `*` | `BObYolky1` | No gift — story call; 1 day after BOb's first gift fires |
| BOb: Thin Cave Pillar Blueprint | `BObGift3` | Blueprint: Thin Cave Pillar (decoration) |
| BOb: Rock Clump Blueprint | `BObGift4` | Blueprint: Rock Clump (decoration) |
| BOb: Short Magma Clump Blueprint | `BObGift6` | Blueprint: Short Magma Clump (decoration) |
| BOb: Rock Fragments Blueprint | `BObGiftRelocated1` | Blueprint: Rock Fragments (decoration — fires when gadget not yet placed) |
| BOb: Stalagmite Cluster Blueprint | `BObGiftRelocated2` | Blueprint: Stalagmite Cluster (decoration — fires when gadget not yet placed) |
| BOb: Rock Cluster Blueprint | `BObGiftRelocated3` | Blueprint: Rock Cluster (decoration — fires when gadget not yet placed) |
| BOb: Sharp Boulder Blueprint | `BObGiftRelocated4` | Blueprint: Sharp Boulder (decoration — fires when gadget not yet placed) |

### Gigi

All Gigi conversations occur in or around the Grey Labyrinth / Prismacore area.
These are triggered by entering specific locations or progressing the main story,
not by time delays.

| Location Name | Debug Name | Gift / Notes |
|---|---|---|
| Gigi: Intro | `GigiIntro` | No gift — introductory call |
| Gigi: Intro Alt | `GigiIntroAlt` | No gift — alternate intro call |
| Gigi: Hub | `GigiHub` | No gift — lore |
| Gigi: Shadow Plort | `GigiShadowPlort` | No gift — lore about Shadow Plorts |
| Gigi: Architecture | `GigiArchitecture` | No gift — lore |
| Gigi: Detector | `GigiDetector` | No gift — lore |
| Gigi: Detector Alt | `GigiDetectorAlt` | No gift — alternate lore |
| Gigi: Secret | `GigiSecret` | No gift — lore |
| Gigi: Dream World | `GigiDreamWorld` | No gift — lore |
| Gigi: Dream Gold | `GigiDreamGold` | No gift — lore |
| Gigi: End (Temp) | `GigiEndTemp` | No gift — temporary end-state dialogue |
| Gigi: Bad Connection | `GigiBadConnection` | No gift — lore |
| Gigi: Entering Terrarium | `GigiEnteringTerrarium` | No gift — location-triggered |
| Gigi: Miniature Museum | `GigiMiniatureMuseum` | No gift — location-triggered |
| Gigi: Outside Gold Room | `GigiOutsideGoldRoom` | No gift — location-triggered |
| Gigi: Alcove With Tree | `GigiAlcoveWithTree` | No gift — location-triggered |
| Gigi: Core Intro | `GigiCore_Intro` | No gift — Prismacore entry |
| Gigi: Rewards Kiosk | `GigiRewardsKiosk` | No gift — kiosk interaction |
| Gigi: Plort Reminder | `GigiRewardsKiosk_PlortReminder` | No gift — reminder |
| Gigi: Harmonizer Reminder | `GigiRewardsKiosk_HarmonizerReminder` | No gift — reminder |
| Gigi: Post-Game Dialog | `GigiRewardsKiosk_PostGameDialog` | No gift — post-story |
| Gigi: Boss Fight Prompt | `GigiRewardsKiosk_BossFightPrompt` | No gift — boss prompt |
| Gigi: Harmonizer Quest | `GigiCore_HarmonizerQuest` | No gift — quest beat |
| Gigi: Hydro Shower | `GigiCore_HydroShower` | No gift — puzzle hint |
| Gigi: Needs Water Tank | `GigiCore_NeedsWaterTank` | No gift — puzzle hint |
| Gigi: Start Fight | `GigiCore_StartFight` | No gift — boss encounter |
| Gigi: Start Fight Alt | `GigiCore_StartFightAlt` | No gift — boss encounter alternate |
| Gigi: Retry Fight | `GigiCore_RetryFight` | No gift — retry prompt |
| Gigi: Fight Complete | `GigiCore_FightComplete` | No gift — story beat |
| Gigi: Post Game | `GigiCore_PostGame` | No gift — post-game |

---

## How "GiftRelocated" Conversations Work

Some conversations are marked `GiftRelocated` (e.g. `BObGiftRelocated1`).  In vanilla,
these fire if a decoration gadget has already been placed in the world — the rancher
"moves" the gift to somewhere you can reach.  Their condition is `NONE_OF: gadget placed`,
meaning they only fire if you have **not** yet placed the gadget.

In Archipelago, blueprint gifts are suppressed (they become AP checks), so the
`NONE_OF: gadget placed` condition is always satisfied.  This means all Relocated
conversations will eventually fire normally as part of the gift sequence.

---

## In-Game Day Reference

In-game days in Slime Rancher 2 correspond roughly to real-world time spent playing.
Each in-game day is approximately the same as one continuous play session.
Most time-delayed conversations unlock after 1–3 in-game days, so the intro chain
(Mochi → Ogden → Thora) takes a minimum of **6 in-game days** from the time
`ViktorIntroCall` fires.
