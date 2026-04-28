# Rain World mod compatibility

The majority of Remix mods will work with the Randomizer mod and Archipelago,
but there are a few exceptions and caveats.
Generally, mods that may be problems are:
- those which move objects or events around, even if not randomly.
  - This includes some custom slugcat mods, which may have their own alternate settings files for regions and rooms.
- those which change existing connections between rooms or regions.

Compatibility may change over time.
Incompatible mods may be supported in future versions.
Mods not listed here are probably compatible.

| Mod                                | Compatibility | Notes                                                                                                                      |
|------------------------------------|---------------|----------------------------------------------------------------------------------------------------------------------------|
| Expedition (Downpour)              | N/A           | Archipelago does not work in Expedition mode, but simply having the mod enabled is fine.                                   |
| More Slugcats Expansion (Downpour) | Full          | Make sure that the `Game state` setting in your player YAML file matches whether you have More Slugcats Expansion enabled. |
| The Watcher                        | N/A           | Archipelago does not currently work in Watcher's campaign, but simply having hte mod enabled is fine.                      |
| Echo Room Randomizer               | Incompatible  |                                                                                                                            |
| Enemy Randomizer                   | Weak          | Food quest and passage check logic relies on knowing where creatures can be found.                                         |
| Gate Karma Randomizer              | Incompatible  |                                                                                                                            |
| Item Randomizer                    | Incompatible  |                                                                                                                            |
| Iterator Room Randomizer           | Incompatible  |                                                                                                                            |
| Lizard Randomizer                  | Incompatible  |                                                                                                                            |
| Region Randomizer                  | Incompatible  |                                                                                                                            |
| Room Randomizer                    | Weak          | Certain intra-region logic is broken, regardless of settings.  It may or may not cause a softlock.                         |
| Slugcat Randomizer                 | Weak          | Some checks can only be done by certain slugcats.                                                                          |

