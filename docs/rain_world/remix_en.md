# Remix settings for Rain World Randomizer

Rain World Remix must be enabled regardless of your settings.
More Slugcats Expansion (Downpour) and The Watcher must each be enabled
if the respective player YAML setting is enabled, and must be disabled if not.

The following Remix settings are **recommended**, but not required:
- Rain World Remix
  - **Key items on Passage:**  This makes the alternate victory conditions for Rivulet and Spearmaster easier.
  - **Key item tracking:**  This causes colored pearls to appear on the in-game map
  and respawns them if you lose them to a bottomless pit.
  Otherwise, it is possible to permanently lose a pearl for a campaign and softlock the multiworld.
  - **Monk extended breath:**  Some checks are significantly harder for Monk if this is disabled.
- More Slugcats Expansion
  - **Disable shelter failures:**  Checking this makes Rivulet's campaign significantly *more* difficult.
  Allowing precycle-only spawns also make some checks easier.

The following Remix settings are **ignored** because they are overridden by Randomizer:
- Rain World Remix
  - **Passage progress without Survivor:**  Overridden by the `Passage progress without Survivor` player YAML setting.
  See [the checks documentation](/tutorial/Rain%20World/remix/en#Passages) for details.
  - **Monk-style gates for all campaigns:**  Overriden by the `Gate behavior` player YAML setting.
  - **Hunter cycles** and **Hunter bonus cycles:**  Hunter's illness is absent while Randomizer is active.
