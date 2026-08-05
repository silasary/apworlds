# Release Checklist

## World package

- [ ] Build `nicktoons_bfvi.apworld` from the clean source folder.
- [ ] Verify `archipelago.json` advertises Archipelago 0.6.7.
- [ ] Verify the package contains `docs/setup_en.md` and all BizHawk client modules.
- [ ] Run the package through Archipelago generation with default options.
- [ ] Run the package with character and ability shuffling disabled.
- [ ] Run the package with `trap_chance: 100` and confirm the pool still contains the required secret hearts.
- [ ] Run an all-Rip-Zippers goal and confirm the completion condition is reachable.

## Emulator smoke test

- [ ] Load the USA ROM in BizHawk and validate the title `NICKTOONSBVI`.
- [ ] Confirm a stage-complete transition sends only that stage's Rip Zipper and earned heart checks.
- [ ] Confirm received items rebuild the four progression memory areas after reconnecting.
- [ ] Confirm final boss completion reports the selected goal.

## PopTracker

- [ ] Open the pack in PopTracker 0.26 or later.
- [ ] Confirm the Archipelago item and location IDs match the world package.
- [ ] Test the fixed 40/60/80 Secret Level thresholds.
