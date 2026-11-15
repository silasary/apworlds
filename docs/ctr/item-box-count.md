# Item Boxes per Track

`item_box_count` sets one maximum for the whole seed, from 0 to 50, default 15. Zero turns AP item boxes off. A track with reviewed placements uses every eligible spot when fewer than the requested count exist. Otherwise it picks that many spots from the seed. Shortcut Knowledge filters the pool first.

A track without placements uses its weapon crates, with at most 15 AP boxes. Counts below 15 reduce its seats too. Spot tracks never replace weapon crates. Full Adventure uses 15; Quick and Standard keep boxes off.

Old YAMLs still work: `box_locations: true` migrates to `item_box_count: 15`, and `false` to 0. Weighted switches keep their weights at 0 and 15. If both keys are in a YAML, the explicit `item_box_count` wins. New YAMLs should contain only `item_box_count`.

At 15 the pick uses the same seed key and algorithm as before. The wire keeps its existing `box_locations` envelope, with no new field or feature. Non-default positive counts add `content_plan.item_boxes.box_count`, `ctr_options.item_box_count` and the required feature `box_count_v1`. Older clients refuse those rooms. At zero the entire item-box record stays absent, as it did with the old switch off. Schema and location IDs stay unchanged.

Counts above 15 need larger reviewed spot pools to add boxes. This option ships no extra placements.
